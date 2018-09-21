##创建数据库集群
```
pg_ctl init[db] [-s] [-D datadir] [-o initdb-options]
```
使用命令`initdb`可以创建一个数据库集群，一个数据库集群

- 是被单个服务器实例管理的数据库集合
- 对应一个目录
- 默认会创建两个数据库，template1和postgres

template1是后续所有创建的数据库的模板，修改template1的属性会影响这之后创建的新数据库

postgres是外部对数据库集群进行操作的

使用`-D`选项可以指定创建数据库集群的目录

##启动数据库服务器
```
pg_ctl start [-w] [-t seconds] [-s] [-D datadir] [-l filename] [-o options] [-p path] [-c]
```

##关闭数据库服务器
```
pg_ctl stop [-W] [-t seconds] [-s] [-D datadir] [-m s[mart] | f[ast] | i[mmediate] ]
```