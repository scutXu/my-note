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
文档的元素是最基本的选择器

```
h1 {color: red; font-size:14px;}

```

###分组

```
h2, p {color: gray;}
```

###类选择器
结合通配选择器，应用到所有class属性为"myclass"的元素

```
<p class="myclass">this is paragraph</p>
```
```
*.myclass {color: gray;}
```
结合元素选择器，应用到所有class属性为"myclass"的段落

```
<p class="myclass">this is paragraph</p>
```
```
p.myclass {color: gray;}
```
###id选择器
id选择器class选择器用法相同。区别在于元素的id是唯一的
### 属性选择器
### 后代选择器（派生选择器/上下文选择器）
应用到作为h1元素后代的任何em元素

```
<h1>this is heading<em>this is emphasized text</em></h1>
```
```
h1 em {color: gray;}
```