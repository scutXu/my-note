##描述符集操作##
```
void FD_ZERO(fd_set * fdset)
void FD_SET(int fd,fd_set * fdset)
void FD_CLR(int fd,fd_set * fdset)
int FD_ISSET(int fd,fd_set * fdset)
```
##select##
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
##描述符就绪条件##
- 可读
	- 接收缓冲区中的数据字节数 > 套接字接收缓冲区低水位标记的当前大小（SO_RCVLOWAT，对TCP和UDP默认为1），此时对套接字进行读操作（read，recvfrom）将返回一个 > 0 的值
	- 接受了FIN，此时对套接字进行读操作将返回0
	- 套接字有一个待处理错误，此时对套接字进行读操作将返回-1,且errno会被置为相应的错误码
	- 该套接字为监听套接字且已完成连接队列不为空，此时对套接字调用accept将得到一个连接套接字
- 可写
	
- 异常
	+ 带外数据到达