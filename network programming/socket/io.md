##read
```
ssize_t read (int fd,
			  void *buf, 
			  size_t nbytes)	//请求读取的字节数
			  
#return
0								//eof（FIN）
-1								//error
实际读取的字节数

#errno
EAGAIN/EWOULDBLOCK				//非阻塞模式下读取缓冲区中没有数据
ECONNRESET						//套接字已经接收到RST
```
- read函数一旦读取到数据就会返回，而不是等到读取到请求读取的字节数
- 在非阻塞模式下，若读取缓冲区中没有数据，read函数会立即返回-1，且errno会被设为EAGAIN或EWOULDBLOCK
##write
```
ssize_t write (int fd, 
			   const void *buf, 
			   size_t n)			//请求写入的数据大小
			   
#errno
EPIPE								//套接字已经接收到RST
```
- 在阻塞模式下，write函数会阻塞直到发送缓冲区剩余空间足够容纳所有的请求写入数据。而在非阻塞模式下，若发送缓冲区剩余空间不够大，write函数会写入一部分数据，并返回写入数据的字节数。若发送缓冲区剩余空间为0,write函数会返回0，且errno会被设为EAGAIN或EWOULDBLOCK
- 向一个已经写半关闭（发送了FIN）的远端套接字发送数据会导致远端服务器发送一个RST。当本地套接字接收RST后（RST的到达可以通过调用read得知），对其调用write函数会引发SIGPIPE信号，函数将返回-1,且errno会被置为EPIPE