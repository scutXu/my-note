##Eclipse##
新建一个项目
<!---->
	File | New | Project | Android | Android Application Project
输入项目属性
<!---->
	Application Name
	Project Name
	Package Name

	Minimum Required SDK
	Target SDK
	Compile With
	Theme
添加**C++**支持，会多出两个文件夹：**jni**和**obj**
<!---->
	右键项目 | Android Tools | Add Natie Support
在JAVA类中添加加载静态链接库的代码以及声明native函数
<!---->
	public class JavaClass {
		static {
			System.loadLibrary("module_name");	//module_name是Android.mk中的LOCAL_MODULE
		}
		public native int cppFunc();
	}
- 生成**JNI**头文件
<!---->
	Run | External Tools | External Tools Confiuratins | Program | New
<!---->
	loaction				=		${env_var:JAVA_HOME}\bin\javah.exe
	working directory		= 		${workspace_loc:/项目名/bin/classes}
	arguments				=		-d ${workspace_loc:/项目名/jni}
									-bootclasspath <android-sdk-location>/platforms/android-??/android.jar
									com.xx.xx.javaClassName
<!---->
	Refresh | Specify Resources | 选择jni文件夹
<!---->
	run
- 填充**cpp**文件
##Android Studio#
在java代码中添加native声明后编译得到.class文件
<!---->
	public native void func();
<!---->
	Build | Make Project

	# .class文件路径
	<Mudule路径>\build\intermediates\classes\debug
使用javah生成.h文件，可以把javah.exe的路径放入Path环境变量中
<!---->

	$ cd ...\src\main
	$ javah -d jni -classpath <android-sdk-location>\platforms\android-??\android.jar;..\..\build\intermediates\classes\debug com.XX.XX.javaClassName
<!---->
在**local.properties**添加**ndk**路径
<!---->
	ndk.dir = C\:\\...\\android-ndk-r10e
在**app**目录下的**build.gradle** 添加**c++** 模块声明
<!---->
	android {
		...
		defaultConfig {
			...
			ndk {
				moduleName "模块名"	#相当于Android.mk的LOCAL_MODULE
				#可添加依赖库引用等配置信息
			}
		}
	}
在以下路径添加 **.cpp** 文件
<!---->
	src/main/jni
编译.c / .cpp文件得到.lib文件
<!---->
	Build | Rebuild Project
在java代码中载入静态库
	static {
		System.loadLibrary("模块名");
	}
	