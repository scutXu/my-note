##语法

```
selector {
	property0: value0;
	property1: value1;
	...
}
```

##选择器

###元素选择器

```
h1 {color: red; font-size:14px;}

```

###分组（,）

```
h2, p {color: gray;}
```
###通配选择器（*）

```
* {color： red;}
```

###类选择器（.） + 通配选择器

```
<p class="myclass">...</p>
```
```
*.myclass {color: gray;}

.myclass {color: gray;} /*通配符可以缺省*/
```
###类选择器 + 元素选择器

```
<p class="myclass"></p>
```
```
p.myclass {color: gray;}
```
###多类选择器

```
<p class="myclass1 myclass2"></p>
```

```
.class1.class2 {color: red;}
```


###ID选择器 （#）

```
<p id="myID"></p>
```

```
*#myID {color: gray;}
p#myID {color: gray;}
#myID {color: gray;}
```

### 属性选择器 （[ ]）

```

```
### 后代选择器（ ）

```
<h1><em></em></h1>
```
```
h1 em {color: gray;}
h1 p.myclass em:horver {color: gray;} /*结合符可以连接任意类型的选择器*/
```
###子元素选择器（>）
###相邻兄弟选择器（+）
###伪类选择器（:）