###对象的可见性

function：函数内定义的局部对象
package：函数外定义的小写开头对象
all：函数外定义的大写开头对象

###声明变量

```
var name type = expression
name := expression			//类型自动推导
```
type或= expression可以单独省略，不可同时省略。

```
var i, j, k int
var b, f, s = true, 2.3, "four"
```
对于name := expression声明的变量，只要求:=操作符左边至少有一个变量是未被声明过的

```
in, err = os.Open(infile)
...
out, err = os.Create(outfile)
```