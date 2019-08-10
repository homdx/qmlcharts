FROM homdx/qt-android-docker

RUN mkdir /android-ndk-r20/sources/cxx-stl/gnu-libstdc++/4.9/libs/armeabi-v7a -pv && \
    echo wget https://github.com/urho3d/android-ndk/raw/master/sources/cxx-stl/gnu-libstdc%2B%2B/4.9/libs/armeabi-v7a/libgnustl_shared.so -O /android-ndk-r20/sources/cxx-stl/gnu-libstdc++/4.9/libs/armeabi-v7a/libgnustl_shared.so

RUN mkdir /app && cd app && export ANDROID_TARGET_SDK_VERSION=28 && \
    echo run && git clone https://github.com/homdx/qmlcharts && cd qmlcharts && cp -fv src/qmlcharts.pro.buildapk src/qmlchart.pro && cat src/qmlcharts* && cd src && build-android-gradle-project qmlchart.pro --debug && \
    echo 'fix missing libc++_shared.so' && cp -vf /android-ndk-r17c/sources/cxx-stl/llvm-libc++/libs/armeabi-v7a/libc++_shared.so android-build/libs/armeabi-v7a/ && \
    echo mkdir /android-ndk-r20/sources/cxx-stl/gnu-libstdc++/4.9/libs/armeabi-v7a -pv && \
    build-android-gradle-project qmlchart.pro --debug && \
    echo copy result apk && \
    cp -vf /app/qmlcharts/src/android-build/build/outputs/apk/debug/android-build-debug.apk /app

CMD tail -f /var/log/faillog
