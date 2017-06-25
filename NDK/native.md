在java代码中添加native声明后编译得到.class文件

```
public native void func();
```
```

Build | Make Project

# .class文件路径
<Mudule路径>\build\intermediates\classes\debug
```
使用javah生成.h文件，可以把javah.exe的路径放入Path环境变量中

```
$ cd ...\src\main
$ javah -d jni -classpath <android-sdk-location>\platforms\android-??\android.jar;..\..\build\intermediates\classes\debug com.XX.XX.javaClassName
```
	

