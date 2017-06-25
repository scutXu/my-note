#概述
###select
###pselect
###poll
###epoll
###kqueue
#select##

```
void FD_ZERO(fd_set * fdset)
void FD_SET(int fd,fd_set * fdset)
void FD_CLR(int fd,fd_set * fdset)
int FD_ISSET(int fd,fd_set * fdset)
```

```
#include  <sys/time.h>
struct timeval {
	long tv_sec;		//seconds
	long tv_usec;		//microseconds
}

#include <sys/select.h>
int select(int maxfdp1,							//最大描述符 + 1
		   fd_set * readset,
		   fd_set * writeset,
		   fd_set * exceptset,
		   const struct timeval * timeout)

#timeout
null		//永远等待
0			//不等待（轮询）
t			//等待时间t

#readset/writeset/exceptset
值-结果参数，select返回时被就绪的描述符对应的位被置为1

#return
所有描述符集中就绪的描述符数
```
###描述符就绪条件
- 可读
	- 接收缓冲区中的数据字节数 > 套接字接收缓冲区低水位标记的当前大小（SO_RCVLOWAT，对TCP和UDP默认为1），此时对套接字进行读操作（read，recvfrom）将返回一个 > 0 的值
	- 接受了FIN，此时对套接字进行读操作将返回0
	- 套接字有一个待处理错误，此时对套接字进行读操作将返回-1,且errno会被置为相应的错误码
	- 该套接字为监听套接字且已完成连接队列不为空，此时对套接字调用accept将得到一个连接套接字
- 可写
	- 发送缓冲区中的可用空间字节数 > 套接字发送缓冲区低水位标记的当前大小（SO_SNDLOWAT，对TCP和UDP默认为2048）
	
- 异常
	+ 带外数据到达
#pselect

```
#include <sys/select.h>
#include <signal.h>
#include <time.h>

struct timespec
{
    time_t tv_sec;		/* Seconds.  */
    long tv_nsec;	/* Nanoseconds.  */
};

int pselect(int maxfdp1, 
			fd_set *readfds,
		    fd_set * writefds,
		    fd_set * exceptfds,
		    const struct timespec * timeout,
		    const sigset_t * sigmask);			//执行期间屏蔽的信号集
```
pselect的实现可以理解为以下代码，且[ ]中的语句须是原子执行的。

```
int pselect(sigmask)
{
	[
		sigprocmask(SIG_SETMASK,sigmask,savemask);
		select();
	]
	sigprocmask(SIG_SETMASK,savemask,NULL);
}
```
#poll
#epoll
###创建epoll实例
```
#include <sys/epoll.h>

int epoll_create(int size);
#siz 从Linux2.6.8起，该参数被忽略，但必须传大于0的值

int epoll_create1(int flags);
#flag(bit mask)
0 					//相当于调用epoll_create
EPOLL_CLOEXEC		//


#return
epoll实例句柄
-1	//error

#errorn
EINVAL		//size或flags非法
EMFILE		//可创建的epoll实例达到了上限
```
###注册/修改/删除 描述符和事件
```
#include <sys/epoll.h>

typedef union epoll_data {
	void * ptr;
	int fd;
	uint32_t u32;
	uint64_t u64;
} epoll_data_t;

struct epoll_event {
	uint32_t events;	 /* Epoll events */
	epoll_data_t data;	/* User data variable */
};

#events(bit mask)
EPOLLIN
EPOLLOUT
...
//参考P144 poll的events

int epoll_ctl(int epfd, 
			  int op, 
			  int fd, 
			  struct epoll_event *event);

#op			  
EPOLL_CTL_ADD
EPOLL_CTL_MOD
EPOLL_CTL_DEL

#return
0
-1

#errno
```
###阻塞并等待IO事件
```
#include <sys/epoll.h>

int epoll_wait(int epfd, 
			   struct epoll_event *events,
			   int maxevents,
			   int timeout);
			   
int epoll_pwait(int epfd, 
				struct epoll_event *events,
				int maxevents,
				int timeout,
				const sigset_t *sigmask);
```
###关闭epoll实例
```
close
```


