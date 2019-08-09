FROM homdx/qt-android-docker

RUN mkdir /app && cd app && export ANDROID_TARGET_SDK_VERSION=28 && \
    echo run && git clone https://github.com/homdx/qmlcharts && cd qmlcharts && cp -fv src/qmlcharts.pro.buildapk src/qmlchart.pro && cat src/qmlcharts* && cd src && build-android-gradle-project qmlchart.pro --debug && \
    cp -vf /app/qmlcharts/src/android-build/build/outputs/apk/debug/android-build-debug.apk /app

CMD tail -f /var/log/faillog
