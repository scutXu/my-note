新建android项目，添加native支持

移除JAVA Build Path对src目录的引用，并从硬盘上删除该文件夹
<!---->
	Project Properties | Java | Build Path | Source
修改AndroidManifest.xml
<!---->
	android:theme = "@android:style/Theme.NoTitleBar.Fullscreen"
	<activity
		android:name = "android.app.NativeActivity"
		...
		<meta-data android:name="android.app.lib_name"
 				   android:value="???"/>
	</activity>
创建jni/main.cpp
<!---->
	#include <android/log.h>
	#include <android_native_app_glue.h>

	int32_t inputEventHandler(struct android_app* app,AInputEvent* event) {
		//deal with input event
	}
	void cmdEventHandler(struct android_app* app,int32_t cmd) {
		//deal with cmd
	}
	void android_main(android_app* pApplication) {
		app_dummy();													//一定要保留该语句

		__android_log_print(ANDROID_LOG_INFO,"myTag","hello%d",123);

		pApplication->onAppCmd = cmdEventHandler;
		pApplication->onInputEvent = inputEventHandler;

		int32_t result;
		int32_t events;
		android_poll_source * source;

		while(true) {
			result = ALooper_pollAll(-1,
								 	 NULL,
								 	 &events,
								 	 (void**)&source);
			if(result >=0) {
				if(source) {
					source->process(mApplication, source);
				}
				if(pApplication->destroyRequested) {
					return;
				}
			}	
		}
	}
修改jni/Android.mk
<!---->
	LOCAL_PATH := $(call my-dir)

	include $(CLEAR_VARS)								#模块开始，清理全局变量
	LS_CPP=$(subst $(1)/,,$(wildcard $(1)/*.cpp))		#自定义函数LS_CPP
	LOCAL_MODULE := ???									#模块名
	LOCAL_SRC_FILES := $(call LS_CPP,$(LOCAL_PATH))		#源文件
	LOCAL_LDLIBS := -landroid -llog						#依赖的链接库（无需编译）
	LOCAL_STATIC_LIBRARIES := android_native_app_glue	#依赖的模块（可能需要编译）
	include $(BUILD_SHARED_LIBRARY)						#模块结束，编译成动态链接库

	$(call import-module,android/native_app_glue)		#编译android_native_app_glue模块