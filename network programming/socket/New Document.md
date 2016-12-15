##socket
###签名
	#include <sys/socket.h>

	int socket (int __family,		//协议族（地址族）
			    int __type,			//套接字类型
				int __protocol);	//协议类型

	#family
	AF_INET				//IPv4协议
	AF_INET6
	AF_LOCAL
	AF_ROUTE
	AF_KEY

	#type
	SOCK_STREAM			//字节流套接字（TCP）
	SOCK_DGRAM			//数据报套接字（UDP）
	SOCK_SEQPACKET		//有序分组套接字
	SOCK_RAW			//原始套接字

	#protocol
	IPPROTO_TCP			//TCP传输协议
	IPPROTO_UDP			//UDP传输协议
	IPPROTO_SCTP		//SCTP传输协议
	0					//根据family和type自动判断

	#return
	套接字描述符
	-1					//error
###错误
	EACCES
	EAFNOSUPPORT
	EINVAL
	EMFILE
	ENOBUFS/ENOMEM
	EPROTONOSUPPORT
##connect
###签名
	#include <sys/socket.h>
	int connect (int sockfd,
				 const struct sockaddr *servaddr,		//服务器套接字地址
				 socklen_t addrlen);

	#return
	0					//sucess
	-1					//error
###错误
	ETIMEDOUT						SYN没有响应，目的ip地址不存在
	ECONNREFUSED					SYN响应是RST，目的端口没有进程在监听
	EHOSTUNREACH/ENETUNREACH
##listen
	int listen (int sockfd,			//监听套接字描述符
				int backlog);		//未完成连接队列和已完成连接队列总和的最大值
##accpet
	int accept (int sockfd,						//监听套接字描述符
				struct sockaddr *cliaddr,		//客户端地址
				socklen_t *addrlen);			//客户端地址长度

	#return
	连接套接字描述符
	-1