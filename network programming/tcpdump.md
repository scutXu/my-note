```
-i <网络接口>

tcpdump -i lo #抓取环回网络的数据包

#网络接口可以通过ifconfig查询
```

```
port <端口号>
src port <源端口号>
dst port <目标端口号>

tcpdump port 80
tcpdum src port 80 or 8080
```