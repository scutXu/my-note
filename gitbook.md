安装GitBook

```
$ npm install -g gitbook-cli
$ gitbook -V
```

新建书籍（手动创建的gitbook关联git比较麻烦，用GitBookEditor创建并关联，能自动生成.gitignore）

```
$ gitbook init
```

本地预览

```
$ gitbook serve
```

生成html

```
$ gitbook build
```

使用gh-pages部署

```
$ npm install -g gh-pages
$ gh-pages -d _book
```

或者手动操作

```
$ git checkout --orphan gh-pages
...
```

配置插件，在book.json添加。插件在[https://plugins.gitbook.com]()找

```
{
	"plugins": [
		"",
	],
	"pluginsConfig": {
		"": {
		}
	}
}
```

安装插件

```
$ gitbook install
```

常用插件

```
Expandable-chapters-small 
KaTex
```