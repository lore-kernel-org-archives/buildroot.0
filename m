From: Sagaert Johan <sagaert.johan@skynet.be>
Date: Thu, 8 Aug 2013 16:15:54 +0200
Subject: [Buildroot] qt 5.02 not building
In-Reply-To: <20130807234230.734f072b@skate>
References: <77698A93A9334B5FBD062F0FE17E67D4@JohanW7><20130807171137.3aa6865a@skate><07AC286795CB4F4B8C7523D9ECE6109A@JohanW7>
 <20130807234230.734f072b@skate>
Message-ID: <91A9FDC6CD334DBAB24B2E1604EF4F97@JohanW7>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 
Dear ;

I disabled directfb support, but there seem to be more issues to be resolved, the build still fails.
There seem to be issues with qtwebkit also.

Snip........
/home/buildroot12git/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-g++ -c -Wall -Wextra -Wreturn-type -fno-strict-aliasing
-Wchar-subscripts -Wformat-security -Wreturn-type -Wno-unused-parameter -Wno-sign-compare -Wno-switch -Wno-switch-enum -Wundef
-Wmissing-noreturn -Winit-self -pipe -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -pipe -Os
--sysroot=/home/buildroot12git/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot -Wno-c++0x-compat -ffunction-sections
-fdata-sections -O2 -O3 -fvisibility=hidden -fvisibility-inlines-hidden -pthread -pthread -pthread -pthread -pthread -pthread
-pthread -pthread -fno-exceptions -D_REENTRANT -fPIC -MD -DQT_NO_LIBUDEV -DQT_NO_XCB -DQT_BUILD_WEBKITWIDGETS_LIB -DQT_BUILDING_QT
-DQT_NO_CAST_TO_ASCII -DQT_ASCII_CAST_WARNINGS -DQT_MOC_COMPAT -DQT_USE_QSTRINGBUILDER -DQT_DEPRECATED_WARNINGS
-DQT_DISABLE_DEPRECATED_BEFORE=0x050000 -DBUILDING_QT__=1 -DNDEBUG -DENABLE_3D_RENDERING=1 -DENABLE_BLOB=1
-DENABLE_CHANNEL_MESSAGING=1 -DENABLE_CSS_BOX_DECORATION_BREAK=1 -DENABLE_CSS_COMPOSITING=1 -DENABLE_CSS_EXCLUSIONS=1
-DENABLE_CSS_FILTERS=1 -DENABLE_CSS_IMAGE_SET=1 -DENABLE_CSS_REGIONS=1 -DENABLE_CSS_STICKY_POSITION=1 -DENABLE_DATALIST_ELEMENT=1
-DENABLE_DETAILS_ELEMENT=1 -DENABLE_FAST_MOBILE_SCROLLING=1 -DENABLE_FILTERS=1 -DENABLE_FTPDIR=1 -DENABLE_GESTURE_EVENTS=1
-DENABLE_ICONDATABASE=1 -DENABLE_IFRAME_SEAMLESS=1 -DENABLE_INPUT_TYPE_COLOR=1 -DENABLE_INSPECTOR=1 -DENABLE_INSPECTOR_SERVER=1
-DENABLE_JAVASCRIPT_DEBUGGER=1 -DENABLE_LEGACY_NOTIFICATIONS=1 -DENABLE_LEGACY_VIEWPORT_ADAPTION=1 -DENABLE_LEGACY_VENDOR_PREFIXES=1
-DENABLE_METER_ELEMENT=1 -DENABLE_MHTML=1 -DENABLE_MUTATION_OBSERVERS=1 -DENABLE_NOTIFICATIONS=1 -DENABLE_PAGE_VISIBILITY_API=1
-DENABLE_PROGRESS_ELEMENT=1 -DENABLE_RESOLUTION_MEDIA_QUERY=1 -DENABLE_REQUEST_ANIMATION_FRAME=1 -DENABLE_SHARED_WORKERS=1
-DENABLE_SMOOTH_SCROLLING=1 -DENABLE_SQL_DATABASE=1 -DENABLE_SVG=1 -DENABLE_SVG_FONTS=1 -DENABLE_TOUCH_ADJUSTMENT=1
-DENABLE_TOUCH_EVENTS=1 -DENABLE_WEB_SOCKETS=1 -DENABLE_WEB_TIMING=1 -DENABLE_WORKERS=1 -DENABLE_XHR_TIMEOUT=1
-DWTF_USE_TILED_BACKING_STORE=1 -DHAVE_QTPRINTSUPPORT=1 -DHAVE_QSTYLE=1 -DHAVE_QTTESTLIB=1 -DWTF_USE_LIBXML2=1 -DWTF_USE_ZLIB=1
-DWTF_USE_LIBJPEG=1 -DWTF_USE_LIBPNG=1 -DHAVE_FONTCONFIG=1 -DPLUGIN_ARCHITECTURE_UNSUPPORTED=1 -DENABLE_VIDEO=1
-DWTF_USE_GSTREAMER=1 -DHAVE_SQLITE3=1 -DENABLE_GAMEPAD=1 -DENABLE_TOUCH_SLIDER=1 -DENABLE_ACCELERATED_2D_CANVAS=0
-DENABLE_ANIMATION_API=0 -DENABLE_BATTERY_STATUS=0 -DENABLE_CSP_NEXT=0 -DENABLE_CSS_GRID_LAYOUT=0 -DENABLE_CSS_HIERARCHIES=0
-DENABLE_CSS_IMAGE_ORIENTATION=0 -DENABLE_CSS_IMAGE_RESOLUTION=0 -DENABLE_CSS_SHADERS=0 -DENABLE_CSS_VARIABLES=0
-DENABLE_CSS3_BACKGROUND=0 -DENABLE_CSS3_CONDITIONAL_RULES=0 -DENABLE_CSS3_TEXT=0 -DENABLE_DASHBOARD_SUPPORT=0 -DENABLE_DATAGRID=0
-DENABLE_DATA_TRANSFER_ITEMS=0 -DENABLE_DEVICE_ORIENTATION=0 -DENABLE_DIRECTORY_UPLOAD=0 -DENABLE_DOWNLOAD_ATTRIBUTE=0
-DENABLE_FILE_SYSTEM=0 -DENABLE_FULLSCREEN_API=0 -DENABLE_GEOLOCATION=0 -DENABLE_HIGH_DPI_CANVAS=0 -DENABLE_INDEXED_DATABASE=0
-DENABLE_INPUT_SPEECH=0 -DENABLE_INPUT_TYPE_DATE=0 -DENABLE_INPUT_TYPE_DATETIME=0 -DENABLE_INPUT_TYPE_DATETIMELOCAL=0
-DENABLE_INPUT_TYPE_MONTH=0 -DENABLE_INPUT_TYPE_TIME=0 -DENABLE_INPUT_TYPE_WEEK=0 -DENABLE_LEGACY_CSS_VENDOR_PREFIXES=0
-DENABLE_LINK_PREFETCH=0 -DENABLE_LINK_PRERENDER=0 -DENABLE_MATHML=0 -DENABLE_MEDIA_SOURCE=0 -DENABLE_MEDIA_STATISTICS=0
-DENABLE_MEDIA_STREAM=0 -DENABLE_MICRODATA=0 -DENABLE_NAVIGATOR_CONTENT_UTILS=0 -DENABLE_NETSCAPE_PLUGIN_API=0
-DENABLE_NETWORK_INFO=0 -DENABLE_ORIENTATION_EVENTS=0 -DENABLE_PROXIMITY_EVENTS=0 -DENABLE_QUOTA=0 -DENABLE_SCRIPTED_SPEECH=0
-DENABLE_SHADOW_DOM=0 -DENABLE_STYLE_SCOPED=0 -DENABLE_SVG_DOM_OBJC_BINDINGS=0 -DENABLE_TEXT_AUTOSIZING=0
-DENABLE_TEXT_NOTIFICATIONS_ONLY=0 -DENABLE_TOUCH_ICON_LOADING=0 -DENABLE_VIBRATION=0 -DENABLE_VIDEO_TRACK=0 -DENABLE_WEBGL=0
-DENABLE_WEB_AUDIO=0 -DENABLE_XSLT=0 -DBUILDING_Qt5WebKitWidgets -DBUILDING_WEBKIT -DQT_ASCII_CAST_WARNINGS -DENABLE_GLIB_SUPPORT=1
-DENABLE_GLIB_SUPPORT=1 -DQT_NO_EXCEPTIONS -D_LARGEFILE64_SOURCE -D_LARGEFILE_SOURCE -DQT_NO_DEBUG -DQT_PRINTSUPPORT_LIB
-DQT_WEBKIT_LIB -DQT_WIDGETS_LIB -DQT_SQL_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB
-I/home/buildroot12git/output/host/usr/mkspecs/devices/linux-buildroot-g++ -I.
-I/home/buildroot12git/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include -IWebKit/qt/Api -IWebKit/qt/WidgetApi
-IWebKit/qt/WebCoreSupport -IWebKit/qt/WidgetSupport -IWTF/wtf/qt -I../include -I../include/QtWebKitWidgets
-I../include/QtWebKitWidgets/5.0.2 -I../include/QtWebKitWidgets/5.0.2/QtWebKitWidgets
-I/home/buildroot12git/output/build/qt5webkit-5.0.2/Source/qt/Api
-I/home/buildroot12git/output/build/qt5webkit-5.0.2/Source/qt/WebCoreSupport -I.
-I/home/buildroot12git/output/build/qt5webkit-5.0.2/Source/include
-I/home/buildroot12git/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include
-I/home/buildroot12git/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/QtScript -IWebCore
-IWebCore/Modules/filesystem -IWebCore/Modules/geolocation -IWebCore/Modules/indexeddb -IWebCore/Modules/navigatorcontentutils
-IWebCore/Modules/notifications -IWebCore/Modules/quota -IWebCore/Modules/webaudio -IWebCore/Modules/webdatabase
-IWebCore/Modules/websockets -IWebCore/accessibility -IWebCore/bindings -IWebCore/bindings/generic -IWebCore/bridge
-IWebCore/bridge/qt -IWebCore/css -IWebCore/dom -IWebCore/dom/default -IWebCore/editing -IWebCore/fileapi -IWebCore/history
-IWebCore/html -IWebCore/html/canvas -IWebCore/html/parser -IWebCore/html/shadow -IWebCore/html/track -IWebCore/inspector
-IWebCore/loader -IWebCore/loader/appcache -IWebCore/loader/archive -IWebCore/loader/cache -IWebCore/loader/icon -IWebCore/mathml
-IWebCore/page -IWebCore/page/animation -IWebCore/page/qt -IWebCore/page/scrolling -IWebCore/platform -IWebCore/platform/animation
-IWebCore/platform/audio -IWebCore/platform/graphics -IWebCore/platform/graphics/cpu/arm -IWebCore/platform/graphics/cpu/arm/filters
-IWebCore/platform/graphics/filters -IWebCore/platform/graphics/filters/texmap -IWebCore/platform/graphics/opengl
-IWebCore/platform/graphics/opentype -IWebCore/platform/graphics/qt -IWebCore/platform/graphics/surfaces
-IWebCore/platform/graphics/texmap -IWebCore/platform/graphics/transforms -IWebCore/platform/image-decoders
-IWebCore/platform/image-decoders/bmp -IWebCore/platform/image-decoders/ico -IWebCore/platform/image-decoders/gif
-IWebCore/platform/image-decoders/jpeg -IWebCore/platform/image-decoders/png -IWebCore/platform/image-decoders/webp
-IWebCore/platform/leveldb -IWebCore/platform/mock -IWebCore/platform/network -IWebCore/platform/network/qt -IWebCore/platform/qt
-IWebCore/platform/sql -IWebCore/platform/text -IWebCore/platform/text/transcoder -IWebCore/plugins -IWebCore/rendering
-IWebCore/rendering/mathml -IWebCore/rendering/style -IWebCore/rendering/svg -IWebCore/storage -IWebCore/svg -IWebCore/svg/animation
-IWebCore/svg/graphics -IWebCore/svg/graphics/filters -IWebCore/svg/properties -IWebCore/testing
-I/home/buildroot12git/output/build/qt5webkit-5.0.2/Source/WebCore/websockets -IWebCore/workers -IWebCore/xml -IWebCore/xml/parser
-IThirdParty -IWebCore/bridge/jsc -IWebCore/bindings/js -IWebCore/bridge/c -IWebCore/testing/js -IWebCore/generated
-IWebCore/platform/linux -IWebCore/Modules/gamepad -IWebCore/platform/graphics/gstreamer -IJavaScriptCore -I. -IWTF
-IJavaScriptCore/assembler -IJavaScriptCore/bytecode -IJavaScriptCore/bytecompiler -IJavaScriptCore/heap -IJavaScriptCore/dfg
-IJavaScriptCore/debugger -IJavaScriptCore/disassembler -IJavaScriptCore/interpreter -IJavaScriptCore/jit -IJavaScriptCore/llint
-IJavaScriptCore/parser -IJavaScriptCore/profiler -IJavaScriptCore/runtime -IJavaScriptCore/tools -IJavaScriptCore/yarr
-IJavaScriptCore/API -IJavaScriptCore/ForwardingHeaders -IJavaScriptCore/generated -IWTF
-I/home/buildroot12git/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/libxml2
-I/home/buildroot12git/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/glib-2.0
-I/home/buildroot12git/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/glib-2.0/include
-I/home/buildroot12git/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/gstreamer-0.10
-I/home/buildroot12git/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/QtPrintSupport -I../include/QtWebKit
-I/home/buildroot12git/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/QtWidgets
-I/home/buildroot12git/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/QtSql
-I/home/buildroot12git/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/QtNetwork
-I/home/buildroot12git/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/QtGui
-I/home/buildroot12git/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/QtGui/5.0.2
-I/home/buildroot12git/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/QtGui/5.0.2/QtGui
-I/home/buildroot12git/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/QtCore
-I/home/buildroot12git/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/QtCore/5.0.2
-I/home/buildroot12git/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/QtCore/5.0.2/QtCore
-I.moc/release-shared -o .obj/release-shared/.moc/release-shared/moc_QtFallbackWebPopup.o
.moc/release-shared/moc_QtFallbackWebPopup.cpp
/home/buildroot12git/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-g++ -c -Wall -Wextra -Wreturn-type -fno-strict-aliasing
-Wchar-subscripts -Wformat-security -Wreturn-type -Wno-unused-parameter -Wno-sign-compare -Wno-switch -Wno-switch-enum -Wundef
-Wmissing-noreturn -Winit-self -pipe -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -pipe -Os
--sysroot=/home/buildroot12git/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot -Wno-c++0x-compat -ffunction-sections
-fdata-sections -O2 -O3 -fvisibility=hidden -fvisibility-inlines-hidden -pthread -pthread -pthread -pthread -pthread -pthread
-pthread -pthread -fno-exceptions -D_REENTRANT -fPIC -MD -DQT_NO_LIBUDEV -DQT_NO_XCB -DQT_BUILD_WEBKITWIDGETS_LIB -DQT_BUILDING_QT
-DQT_NO_CAST_TO_ASCII -DQT_ASCII_CAST_WARNINGS -DQT_MOC_COMPAT -DQT_USE_QSTRINGBUILDER -DQT_DEPRECATED_WARNINGS
-DQT_DISABLE_DEPRECATED_BEFORE=0x050000 -DBUILDING_QT__=1 -DNDEBUG -DENABLE_3D_RENDERING=1 -DENABLE_BLOB=1
-DENABLE_CHANNEL_MESSAGING=1 -DENABLE_CSS_BOX_DECORATION_BREAK=1 -DENABLE_CSS_COMPOSITING=1 -DENABLE_CSS_EXCLUSIONS=1
-DENABLE_CSS_FILTERS=1 -DENABLE_CSS_IMAGE_SET=1 -DENABLE_CSS_REGIONS=1 -DENABLE_CSS_STICKY_POSITION=1 -DENABLE_DATALIST_ELEMENT=1
-DENABLE_DETAILS_ELEMENT=1 -DENABLE_FAST_MOBILE_SCROLLING=1 -DENABLE_FILTERS=1 -DENABLE_FTPDIR=1 -DENABLE_GESTURE_EVENTS=1
-DENABLE_ICONDATABASE=1 -DENABLE_IFRAME_SEAMLESS=1 -DENABLE_INPUT_TYPE_COLOR=1 -DENABLE_INSPECTOR=1 -DENABLE_INSPECTOR_SERVER=1
-DENABLE_JAVASCRIPT_DEBUGGER=1 -DENABLE_LEGACY_NOTIFICATIONS=1 -DENABLE_LEGACY_VIEWPORT_ADAPTION=1 -DENABLE_LEGACY_VENDOR_PREFIXES=1
-DENABLE_METER_ELEMENT=1 -DENABLE_MHTML=1 -DENABLE_MUTATION_OBSERVERS=1 -DENABLE_NOTIFICATIONS=1 -DENABLE_PAGE_VISIBILITY_API=1
-DENABLE_PROGRESS_ELEMENT=1 -DENABLE_RESOLUTION_MEDIA_QUERY=1 -DENABLE_REQUEST_ANIMATION_FRAME=1 -DENABLE_SHARED_WORKERS=1
-DENABLE_SMOOTH_SCROLLING=1 -DENABLE_SQL_DATABASE=1 -DENABLE_SVG=1 -DENABLE_SVG_FONTS=1 -DENABLE_TOUCH_ADJUSTMENT=1
-DENABLE_TOUCH_EVENTS=1 -DENABLE_WEB_SOCKETS=1 -DENABLE_WEB_TIMING=1 -DENABLE_WORKERS=1 -DENABLE_XHR_TIMEOUT=1
-DWTF_USE_TILED_BACKING_STORE=1 -DHAVE_QTPRINTSUPPORT=1 -DHAVE_QSTYLE=1 -DHAVE_QTTESTLIB=1 -DWTF_USE_LIBXML2=1 -DWTF_USE_ZLIB=1
-DWTF_USE_LIBJPEG=1 -DWTF_USE_LIBPNG=1 -DHAVE_FONTCONFIG=1 -DPLUGIN_ARCHITECTURE_UNSUPPORTED=1 -DENABLE_VIDEO=1
-DWTF_USE_GSTREAMER=1 -DHAVE_SQLITE3=1 -DENABLE_GAMEPAD=1 -DENABLE_TOUCH_SLIDER=1 -DENABLE_ACCELERATED_2D_CANVAS=0
-DENABLE_ANIMATION_API=0 -DENABLE_BATTERY_STATUS=0 -DENABLE_CSP_NEXT=0 -DENABLE_CSS_GRID_LAYOUT=0 -DENABLE_CSS_HIERARCHIES=0
-DENABLE_CSS_IMAGE_ORIENTATION=0 -DENABLE_CSS_IMAGE_RESOLUTION=0 -DENABLE_CSS_SHADERS=0 -DENABLE_CSS_VARIABLES=0
-DENABLE_CSS3_BACKGROUND=0 -DENABLE_CSS3_CONDITIONAL_RULES=0 -DENABLE_CSS3_TEXT=0 -DENABLE_DASHBOARD_SUPPORT=0 -DENABLE_DATAGRID=0
-DENABLE_DATA_TRANSFER_ITEMS=0 -DENABLE_DEVICE_ORIENTATION=0 -DENABLE_DIRECTORY_UPLOAD=0 -DENABLE_DOWNLOAD_ATTRIBUTE=0
-DENABLE_FILE_SYSTEM=0 -DENABLE_FULLSCREEN_API=0 -DENABLE_GEOLOCATION=0 -DENABLE_HIGH_DPI_CANVAS=0 -DENABLE_INDEXED_DATABASE=0
-DENABLE_INPUT_SPEECH=0 -DENABLE_INPUT_TYPE_DATE=0 -DENABLE_INPUT_TYPE_DATETIME=0 -DENABLE_INPUT_TYPE_DATETIMELOCAL=0
-DENABLE_INPUT_TYPE_MONTH=0 -DENABLE_INPUT_TYPE_TIME=0 -DENABLE_INPUT_TYPE_WEEK=0 -DENABLE_LEGACY_CSS_VENDOR_PREFIXES=0
-DENABLE_LINK_PREFETCH=0 -DENABLE_LINK_PRERENDER=0 -DENABLE_MATHML=0 -DENABLE_MEDIA_SOURCE=0 -DENABLE_MEDIA_STATISTICS=0
-DENABLE_MEDIA_STREAM=0 -DENABLE_MICRODATA=0 -DENABLE_NAVIGATOR_CONTENT_UTILS=0 -DENABLE_NETSCAPE_PLUGIN_API=0
-DENABLE_NETWORK_INFO=0 -DENABLE_ORIENTATION_EVENTS=0 -DENABLE_PROXIMITY_EVENTS=0 -DENABLE_QUOTA=0 -DENABLE_SCRIPTED_SPEECH=0
-DENABLE_SHADOW_DOM=0 -DENABLE_STYLE_SCOPED=0 -DENABLE_SVG_DOM_OBJC_BINDINGS=0 -DENABLE_TEXT_AUTOSIZING=0
-DENABLE_TEXT_NOTIFICATIONS_ONLY=0 -DENABLE_TOUCH_ICON_LOADING=0 -DENABLE_VIBRATION=0 -DENABLE_VIDEO_TRACK=0 -DENABLE_WEBGL=0
-DENABLE_WEB_AUDIO=0 -DENABLE_XSLT=0 -DBUILDING_Qt5WebKitWidgets -DBUILDING_WEBKIT -DQT_ASCII_CAST_WARNINGS -DENABLE_GLIB_SUPPORT=1
-DENABLE_GLIB_SUPPORT=1 -DQT_NO_EXCEPTIONS -D_LARGEFILE64_SOURCE -D_LARGEFILE_SOURCE -DQT_NO_DEBUG -DQT_PRINTSUPPORT_LIB
-DQT_WEBKIT_LIB -DQT_WIDGETS_LIB -DQT_SQL_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB
-I/home/buildroot12git/output/host/usr/mkspecs/devices/linux-buildroot-g++ -I.
-I/home/buildroot12git/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include -IWebKit/qt/Api -IWebKit/qt/WidgetApi
-IWebKit/qt/WebCoreSupport -IWebKit/qt/WidgetSupport -IWTF/wtf/qt -I../include -I../include/QtWebKitWidgets
-I../include/QtWebKitWidgets/5.0.2 -I../include/QtWebKitWidgets/5.0.2/QtWebKitWidgets
-I/home/buildroot12git/output/build/qt5webkit-5.0.2/Source/qt/Api
-I/home/buildroot12git/output/build/qt5webkit-5.0.2/Source/qt/WebCoreSupport -I.
-I/home/buildroot12git/output/build/qt5webkit-5.0.2/Source/include
-I/home/buildroot12git/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include
-I/home/buildroot12git/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/QtScript -IWebCore
-IWebCore/Modules/filesystem -IWebCore/Modules/geolocation -IWebCore/Modules/indexeddb -IWebCore/Modules/navigatorcontentutils
-IWebCore/Modules/notifications -IWebCore/Modules/quota -IWebCore/Modules/webaudio -IWebCore/Modules/webdatabase
-IWebCore/Modules/websockets -IWebCore/accessibility -IWebCore/bindings -IWebCore/bindings/generic -IWebCore/bridge
-IWebCore/bridge/qt -IWebCore/css -IWebCore/dom -IWebCore/dom/default -IWebCore/editing -IWebCore/fileapi -IWebCore/history
-IWebCore/html -IWebCore/html/canvas -IWebCore/html/parser -IWebCore/html/shadow -IWebCore/html/track -IWebCore/inspector
-IWebCore/loader -IWebCore/loader/appcache -IWebCore/loader/archive -IWebCore/loader/cache -IWebCore/loader/icon -IWebCore/mathml
-IWebCore/page -IWebCore/page/animation -IWebCore/page/qt -IWebCore/page/scrolling -IWebCore/platform -IWebCore/platform/animation
-IWebCore/platform/audio -IWebCore/platform/graphics -IWebCore/platform/graphics/cpu/arm -IWebCore/platform/graphics/cpu/arm/filters
-IWebCore/platform/graphics/filters -IWebCore/platform/graphics/filters/texmap -IWebCore/platform/graphics/opengl
-IWebCore/platform/graphics/opentype -IWebCore/platform/graphics/qt -IWebCore/platform/graphics/surfaces
-IWebCore/platform/graphics/texmap -IWebCore/platform/graphics/transforms -IWebCore/platform/image-decoders
-IWebCore/platform/image-decoders/bmp -IWebCore/platform/image-decoders/ico -IWebCore/platform/image-decoders/gif
-IWebCore/platform/image-decoders/jpeg -IWebCore/platform/image-decoders/png -IWebCore/platform/image-decoders/webp
-IWebCore/platform/leveldb -IWebCore/platform/mock -IWebCore/platform/network -IWebCore/platform/network/qt -IWebCore/platform/qt
-IWebCore/platform/sql -IWebCore/platform/text -IWebCore/platform/text/transcoder -IWebCore/plugins -IWebCore/rendering
-IWebCore/rendering/mathml -IWebCore/rendering/style -IWebCore/rendering/svg -IWebCore/storage -IWebCore/svg -IWebCore/svg/animation
-IWebCore/svg/graphics -IWebCore/svg/graphics/filters -IWebCore/svg/properties -IWebCore/testing
-I/home/buildroot12git/output/build/qt5webkit-5.0.2/Source/WebCore/websockets -IWebCore/workers -IWebCore/xml -IWebCore/xml/parser
-IThirdParty -IWebCore/bridge/jsc -IWebCore/bindings/js -IWebCore/bridge/c -IWebCore/testing/js -IWebCore/generated
-IWebCore/platform/linux -IWebCore/Modules/gamepad -IWebCore/platform/graphics/gstreamer -IJavaScriptCore -I. -IWTF
-IJavaScriptCore/assembler -IJavaScriptCore/bytecode -IJavaScriptCore/bytecompiler -IJavaScriptCore/heap -IJavaScriptCore/dfg
-IJavaScriptCore/debugger -IJavaScriptCore/disassembler -IJavaScriptCore/interpreter -IJavaScriptCore/jit -IJavaScriptCore/llint
-IJavaScriptCore/parser -IJavaScriptCore/profiler -IJavaScriptCore/runtime -IJavaScriptCore/tools -IJavaScriptCore/yarr
-IJavaScriptCore/API -IJavaScriptCore/ForwardingHeaders -IJavaScriptCore/generated -IWTF
-I/home/buildroot12git/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/libxml2
-I/home/buildroot12git/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/glib-2.0
-I/home/buildroot12git/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/glib-2.0/include
-I/home/buildroot12git/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/gstreamer-0.10
-I/home/buildroot12git/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/QtPrintSupport -I../include/QtWebKit
-I/home/buildroot12git/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/QtWidgets
-I/home/buildroot12git/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/QtSql
-I/home/buildroot12git/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/QtNetwork
-I/home/buildroot12git/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/QtGui
-I/home/buildroot12git/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/QtGui/5.0.2
-I/home/buildroot12git/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/QtGui/5.0.2/QtGui
-I/home/buildroot12git/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/QtCore
-I/home/buildroot12git/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/QtCore/5.0.2
-I/home/buildroot12git/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/QtCore/5.0.2/QtCore
-I.moc/release-shared -o .obj/release-shared/.moc/release-shared/moc_QtWebComboBox.o .moc/release-shared/moc_QtWebComboBox.cpp
rm -f libQt5WebKitWidgets.so.5.0.2 libQt5WebKitWidgets.so libQt5WebKitWidgets.so.5 libQt5WebKitWidgets.so.5.0
/home/buildroot12git/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-g++
--sysroot=/home/buildroot12git/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot -Wl,--no-undefined -Wl,--gc-sections
-Wl,--no-undefined -Wl,-O1 -shared -Wl,-Bsymbolic-functions -Wl,-soname,libQt5WebKitWidgets.so.5 -o libQt5WebKitWidgets.so.5.0.2
.obj/release-shared/WebKit/qt/WidgetApi/qgraphicswebview.o .obj/release-shared/WebKit/qt/WidgetApi/qwebframe.o
.obj/release-shared/WebKit/qt/WidgetApi/qwebpage.o .obj/release-shared/WebKit/qt/WidgetApi/qwebview.o
.obj/release-shared/WebKit/qt/WidgetApi/qwebinspector.o .obj/release-shared/WebKit/qt/WidgetSupport/QtFallbackWebPopup.o
.obj/release-shared/WebKit/qt/WidgetSupport/QtWebComboBox.o .obj/release-shared/WebKit/qt/WidgetSupport/QWebUndoCommand.o
.obj/release-shared/WebKit/qt/WidgetSupport/DefaultFullScreenVideoHandler.o
.obj/release-shared/WebKit/qt/WidgetSupport/InitWebKitQt.o .obj/release-shared/WebKit/qt/WidgetSupport/InspectorClientWebPage.o
.obj/release-shared/WebKit/qt/WidgetSupport/PageClientQt.o .obj/release-shared/WebKit/qt/WidgetSupport/QStyleFacadeImp.o
.obj/release-shared/WebKit/qt/WidgetSupport/QGraphicsWidgetPluginImpl.o
.obj/release-shared/WebKit/qt/WidgetSupport/QWidgetPluginImpl.o .obj/release-shared/WebKit/qt/WidgetApi/qwebviewaccessible.o
.obj/release-shared/.moc/release-shared/moc_qwebinspector.o .obj/release-shared/.moc/release-shared/moc_qwebkitplatformplugin.o
.obj/release-shared/.moc/release-shared/moc_InspectorClientWebPage.o
.obj/release-shared/.moc/release-shared/moc_DefaultFullScreenVideoHandler.o
.obj/release-shared/.moc/release-shared/moc_QtFallbackWebPopup.o .obj/release-shared/.moc/release-shared/moc_QtWebComboBox.o
-L/home/buildroot12git/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib -lxml2 -ludev -lgio-2.0 -lgstapp-0.10
-lgstinterfaces-0.10 -lgstpbutils-0.10 -lgstvideo-0.10 -lgstbase-0.10 -lgstreamer-0.10 -lgobject-2.0 -lgmodule-2.0 -lgthread-2.0
-pthread -lglib-2.0 -lintl -lsqlite3 -lQt5PrintSupport -L/home/buildroot12git/output/build/qt5webkit-5.0.2/lib -lQt5WebKit
-lQt5Widgets -lQt5Sql -lQt5Network -lQt5Gui -lQt5Core -lrt -ldl -lpthread  
ln -s libQt5WebKitWidgets.so.5.0.2 libQt5WebKitWidgets.so
ln -s libQt5WebKitWidgets.so.5.0.2 libQt5WebKitWidgets.so.5
ln -s libQt5WebKitWidgets.so.5.0.2 libQt5WebKitWidgets.so.5.0
rm -f ../lib/libQt5WebKitWidgets.so.5.0.2
rm -f ../lib/libQt5WebKitWidgets.so
rm -f ../lib/libQt5WebKitWidgets.so.5
rm -f ../lib/libQt5WebKitWidgets.so.5.0
mv -f libQt5WebKitWidgets.so.5.0.2 libQt5WebKitWidgets.so libQt5WebKitWidgets.so.5 libQt5WebKitWidgets.so.5.0 ../lib/
make[3]: Leaving directory `/home/buildroot12git/output/build/qt5webkit-5.0.2/Source'
make[2]: Leaving directory `/home/buildroot12git/output/build/qt5webkit-5.0.2/Source'
cd Tools/ && ( test -e Makefile.Tools || /home/buildroot12git/output/host/usr/bin/qmake
/home/buildroot12git/output/build/qt5webkit-5.0.2/Tools/Tools.pro -o Makefile.Tools ) && /usr/bin/make -f Makefile.Tools 
make[2]: Entering directory `/home/buildroot12git/output/build/qt5webkit-5.0.2/Tools'
make[2]: Nothing to be done for `first'.
make[2]: Leaving directory `/home/buildroot12git/output/build/qt5webkit-5.0.2/Tools'
make[1]: Leaving directory `/home/buildroot12git/output/build/qt5webkit-5.0.2'
>>> qt5webkit 5.0.2 Installing to staging directory
PATH="/home/buildroot12git/output/host/bin:/home/buildroot12git/output/host/usr/bin:/home/buildroot12git/output/host/usr/sbin/:/usr/
local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/home/buildroot12git/output/host/usr/bin"
PERLLIB="/home/buildroot12git/output/host/usr/lib/perl" /usr/bin/make -j5 -C /home/buildroot12git/output/build/qt5webkit-5.0.2
install
make[1]: Entering directory `/home/buildroot12git/output/build/qt5webkit-5.0.2'
cd Source/WTF/ && ( test -e Makefile.WTF || /home/buildroot12git/output/host/usr/bin/qmake
/home/buildroot12git/output/build/qt5webkit-5.0.2/Source/WTF/WTF.pro -o Makefile.WTF ) && /usr/bin/make -f Makefile.WTF install
make[2]: Entering directory `/home/buildroot12git/output/build/qt5webkit-5.0.2/Source/WTF'
make[2]: Nothing to be done for `install'.
make[2]: Leaving directory `/home/buildroot12git/output/build/qt5webkit-5.0.2/Source/WTF'
cd Source/JavaScriptCore/ && ( test -e Makefile.JavaScriptCore || /home/buildroot12git/output/host/usr/bin/qmake
/home/buildroot12git/output/build/qt5webkit-5.0.2/Source/JavaScriptCore/JavaScriptCore.pro -o Makefile.JavaScriptCore ) &&
/usr/bin/make -f Makefile.JavaScriptCore install
make[2]: Entering directory `/home/buildroot12git/output/build/qt5webkit-5.0.2/Source/JavaScriptCore'
( test -e Makefile.LLIntOffsetsExtractor || /home/buildroot12git/output/host/usr/bin/qmake
/home/buildroot12git/output/build/qt5webkit-5.0.2/Source/JavaScriptCore/LLIntOffsetsExtractor.pro -o Makefile.LLIntOffsetsExtractor
) && /usr/bin/make -f Makefile.LLIntOffsetsExtractor install
make[3]: Entering directory `/home/buildroot12git/output/build/qt5webkit-5.0.2/Source/JavaScriptCore'
make[3]: Nothing to be done for `install'.
make[3]: Leaving directory `/home/buildroot12git/output/build/qt5webkit-5.0.2/Source/JavaScriptCore'
( test -e Makefile.JavaScriptCore.DerivedSources || /home/buildroot12git/output/host/usr/bin/qmake
/home/buildroot12git/output/build/qt5webkit-5.0.2/Source/JavaScriptCore/DerivedSources.pri -o Makefile.JavaScriptCore.DerivedSources
) && /usr/bin/make -f Makefile.JavaScriptCore.DerivedSources install
make[3]: Entering directory `/home/buildroot12git/output/build/qt5webkit-5.0.2/Source/JavaScriptCore'
make[3]: Nothing to be done for `install'.
make[3]: Leaving directory `/home/buildroot12git/output/build/qt5webkit-5.0.2/Source/JavaScriptCore'
( test -e Makefile.JavaScriptCore.Target || /home/buildroot12git/output/host/usr/bin/qmake
/home/buildroot12git/output/build/qt5webkit-5.0.2/Source/JavaScriptCore/Target.pri -o Makefile.JavaScriptCore.Target ) &&
/usr/bin/make -f Makefile.JavaScriptCore.Target install
make[3]: Entering directory `/home/buildroot12git/output/build/qt5webkit-5.0.2/Source/JavaScriptCore'
make[3]: Nothing to be done for `install'.
make[3]: Leaving directory `/home/buildroot12git/output/build/qt5webkit-5.0.2/Source/JavaScriptCore'
( test -e Makefile.jsc || /home/buildroot12git/output/host/usr/bin/qmake
/home/buildroot12git/output/build/qt5webkit-5.0.2/Source/JavaScriptCore/jsc.pro -o Makefile.jsc ) && /usr/bin/make -f Makefile.jsc
install
make[3]: Entering directory `/home/buildroot12git/output/build/qt5webkit-5.0.2/Source/JavaScriptCore'
make[3]: Nothing to be done for `install'.
make[3]: Leaving directory `/home/buildroot12git/output/build/qt5webkit-5.0.2/Source/JavaScriptCore'
make[2]: Leaving directory `/home/buildroot12git/output/build/qt5webkit-5.0.2/Source/JavaScriptCore'
cd Source/WebCore/ && ( test -e Makefile.WebCore || /home/buildroot12git/output/host/usr/bin/qmake
/home/buildroot12git/output/build/qt5webkit-5.0.2/Source/WebCore/WebCore.pro -o Makefile.WebCore ) && /usr/bin/make -f
Makefile.WebCore install
make[2]: Entering directory `/home/buildroot12git/output/build/qt5webkit-5.0.2/Source/WebCore'
( test -e Makefile.WebCore.DerivedSources || /home/buildroot12git/output/host/usr/bin/qmake
/home/buildroot12git/output/build/qt5webkit-5.0.2/Source/WebCore/DerivedSources.pri -o Makefile.WebCore.DerivedSources ) &&
/usr/bin/make -f Makefile.WebCore.DerivedSources install
make[3]: Entering directory `/home/buildroot12git/output/build/qt5webkit-5.0.2/Source/WebCore'
make[3]: Nothing to be done for `install'.
make[3]: Leaving directory `/home/buildroot12git/output/build/qt5webkit-5.0.2/Source/WebCore'
( test -e Makefile.WebCore.Target || /home/buildroot12git/output/host/usr/bin/qmake
/home/buildroot12git/output/build/qt5webkit-5.0.2/Source/WebCore/Target.pri -o Makefile.WebCore.Target ) && /usr/bin/make -f
Makefile.WebCore.Target install
make[3]: Entering directory `/home/buildroot12git/output/build/qt5webkit-5.0.2/Source/WebCore'
make[3]: Nothing to be done for `install'.
make[3]: Leaving directory `/home/buildroot12git/output/build/qt5webkit-5.0.2/Source/WebCore'
make[2]: Leaving directory `/home/buildroot12git/output/build/qt5webkit-5.0.2/Source/WebCore'
cd Source/WebKit/ && ( test -e Makefile.WebKit1 || /home/buildroot12git/output/host/usr/bin/qmake
/home/buildroot12git/output/build/qt5webkit-5.0.2/Source/WebKit/WebKit1.pro -o Makefile.WebKit1 ) && /usr/bin/make -f
Makefile.WebKit1 install
make[2]: Entering directory `/home/buildroot12git/output/build/qt5webkit-5.0.2/Source/WebKit'
make[2]: Nothing to be done for `install'.
make[2]: Leaving directory `/home/buildroot12git/output/build/qt5webkit-5.0.2/Source/WebKit'
cd Source/ && ( test -e Makefile.QtWebKit || /home/buildroot12git/output/host/usr/bin/qmake
/home/buildroot12git/output/build/qt5webkit-5.0.2/Source/QtWebKit.pro -o Makefile.QtWebKit ) && /usr/bin/make -f Makefile.QtWebKit
install
make[2]: Entering directory `/home/buildroot12git/output/build/qt5webkit-5.0.2/Source'
( test -e Makefile.api || /home/buildroot12git/output/host/usr/bin/qmake
/home/buildroot12git/output/build/qt5webkit-5.0.2/Source/api.pri -o Makefile.api ) && /usr/bin/make -f Makefile.api install
make[3]: Entering directory `/home/buildroot12git/output/build/qt5webkit-5.0.2/Source'
install -m 755 -p "../lib/libQt5WebKit.so.5.0.2"
"/home/buildroot12git/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libQt5WebKit.so.5.0.2"
install -m 644 -p /home/buildroot12git/output/build/qt5webkit-5.0.2/Tools/qmake/mkspecs/modules-inst/qt_lib_webkit.pri
/home/buildroot12git/output/host/usr/mkspecs/modules/
install -m 644 -p /home/buildroot12git/output/build/qt5webkit-5.0.2/include/QtWebKit/QWebDatabase
/home/buildroot12git/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/QtWebKit/
install -m 644 -p /home/buildroot12git/output/build/qt5webkit-5.0.2/Source/WebKit/qt/Api/qwebdatabase.h
/home/buildroot12git/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/QtWebKit/
install -m 644 -p /home/buildroot12git/output/build/qt5webkit-5.0.2/include/QtWebKit/QWebElement
/home/buildroot12git/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/QtWebKit/
install -m 644 -p /home/buildroot12git/output/build/qt5webkit-5.0.2/Source/WebKit/qt/Api/qhttpheader_p.h
/home/buildroot12git/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/QtWebKit/5.0.2/QtWebKit/private/
install -m 644 -p /home/buildroot12git/output/build/qt5webkit-5.0.2/Source/WebKit/qt/Api/qwebelement.h
/home/buildroot12git/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/QtWebKit/
install -m 644 -p /home/buildroot12git/output/build/qt5webkit-5.0.2/include/QtWebKit/QWebElementCollection
/home/buildroot12git/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/QtWebKit/
install -m 644 -p /home/buildroot12git/output/build/qt5webkit-5.0.2/Source/WebKit/qt/Api/qwebdatabase_p.h
/home/buildroot12git/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/QtWebKit/5.0.2/QtWebKit/private/
install -m 644 -p /home/buildroot12git/output/build/qt5webkit-5.0.2/Source/WebKit/qt/Api/qwebhistory.h
/home/buildroot12git/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/QtWebKit/
install -m 644 -p /home/buildroot12git/output/build/qt5webkit-5.0.2/include/QtWebKit/QWebHistoryItem
/home/buildroot12git/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/QtWebKit/
install -m 644 -p /home/buildroot12git/output/build/qt5webkit-5.0.2/Source/WebKit/qt/Api/qwebelement_p.h
/home/buildroot12git/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/QtWebKit/5.0.2/QtWebKit/private/
install -m 644 -p /home/buildroot12git/output/build/qt5webkit-5.0.2/Source/WebKit/qt/Api/qwebhistoryinterface.h
/home/buildroot12git/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/QtWebKit/
install -m 644 -p /home/buildroot12git/output/build/qt5webkit-5.0.2/include/QtWebKit/QWebHistory
/home/buildroot12git/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/QtWebKit/
install -m 644 -p /home/buildroot12git/output/build/qt5webkit-5.0.2/Source/WebKit/qt/Api/qwebhistory_p.h
/home/buildroot12git/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/QtWebKit/5.0.2/QtWebKit/private/
install -m 644 -p /home/buildroot12git/output/build/qt5webkit-5.0.2/Source/WebKit/qt/Api/qwebkitglobal.h
/home/buildroot12git/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/QtWebKit/
install -m 644 -p /home/buildroot12git/output/build/qt5webkit-5.0.2/include/QtWebKit/QWebHistoryInterface
/home/buildroot12git/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/QtWebKit/
install -m 644 -p /home/buildroot12git/output/build/qt5webkit-5.0.2/Source/WebKit/qt/Api/qwebkitplatformplugin.h
/home/buildroot12git/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/QtWebKit/
install -m 644 -p /home/buildroot12git/output/build/qt5webkit-5.0.2/Source/WebKit/qt/Api/qwebplugindatabase_p.h
/home/buildroot12git/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/QtWebKit/5.0.2/QtWebKit/private/
install -m 644 -p /home/buildroot12git/output/build/qt5webkit-5.0.2/include/QtWebKit/QWebSelectData
/home/buildroot12git/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/QtWebKit/
install -m 644 -p /home/buildroot12git/output/build/qt5webkit-5.0.2/Source/WebKit/qt/Api/qwebpluginfactory.h
/home/buildroot12git/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/QtWebKit/
install -m 644 -p /home/buildroot12git/output/build/qt5webkit-5.0.2/Source/WebKit/qt/Api/qwebscriptworld.h
/home/buildroot12git/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/QtWebKit/5.0.2/QtWebKit/private/
install -m 644 -p /home/buildroot12git/output/build/qt5webkit-5.0.2/include/QtWebKit/QWebSelectMethod
/home/buildroot12git/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/QtWebKit/
install -m 644 -p /home/buildroot12git/output/build/qt5webkit-5.0.2/Source/WebKit/qt/Api/qwebsecurityorigin.h
/home/buildroot12git/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/QtWebKit/
install -m 644 -p /home/buildroot12git/output/build/qt5webkit-5.0.2/Source/WebKit/qt/Api/qwebscriptworld_p.h
/home/buildroot12git/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/QtWebKit/5.0.2/QtWebKit/private/
install -m 644 -p /home/buildroot12git/output/build/qt5webkit-5.0.2/include/QtWebKit/QWebNotificationData
/home/buildroot12git/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/QtWebKit/
install -m 644 -p /home/buildroot12git/output/build/qt5webkit-5.0.2/Source/WebKit/qt/Api/qwebsettings.h
/home/buildroot12git/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/QtWebKit/
install -m 644 -p /home/buildroot12git/output/build/qt5webkit-5.0.2/Source/WebKit/qt/Api/qwebsecurityorigin_p.h
/home/buildroot12git/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/QtWebKit/5.0.2/QtWebKit/private/
install -m 644 -p /home/buildroot12git/output/build/qt5webkit-5.0.2/include/QtWebKit/QWebNotificationPresenter
/home/buildroot12git/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/QtWebKit/
install -m 644 -p /home/buildroot12git/output/build/qt5webkit-5.0.2/include/QtWebKit/qtwebkitversion.h
/home/buildroot12git/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/QtWebKit/
install -m 644 -p /home/buildroot12git/output/build/qt5webkit-5.0.2/Source/WebKit2/UIProcess/API/qt/qquicknetworkreply_p.h
/home/buildroot12git/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/QtWebKit/5.0.2/QtWebKit/private/
install -m 644 -p /home/buildroot12git/output/build/qt5webkit-5.0.2/include/QtWebKit/QWebHapticFeedbackPlayer
/home/buildroot12git/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/QtWebKit/
install -m 644 -p /home/buildroot12git/output/build/qt5webkit-5.0.2/include/QtWebKit/QtWebKit
/home/buildroot12git/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/QtWebKit/
install -m 644 -p /home/buildroot12git/output/build/qt5webkit-5.0.2/include/QtWebKit/QWebTouchModifier
/home/buildroot12git/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/QtWebKit/
install -m 644 -p /home/buildroot12git/output/build/qt5webkit-5.0.2/include/QtWebKit/QWebFullScreenVideoHandler
/home/buildroot12git/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/QtWebKit/
install -m 644 -p /home/buildroot12git/output/build/qt5webkit-5.0.2/include/QtWebKit/QWebSpellChecker
/home/buildroot12git/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/QtWebKit/
install -m 644 -p /home/buildroot12git/output/build/qt5webkit-5.0.2/include/QtWebKit/QWebKitPlatformPlugin
/home/buildroot12git/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/QtWebKit/
install -m 644 -p /home/buildroot12git/output/build/qt5webkit-5.0.2/include/QtWebKit/QWebPluginFactory
/home/buildroot12git/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/QtWebKit/
install -m 644 -p /home/buildroot12git/output/build/qt5webkit-5.0.2/include/QtWebKit/QWebSecurityOrigin
/home/buildroot12git/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/QtWebKit/
install -m 644 -p /home/buildroot12git/output/build/qt5webkit-5.0.2/include/QtWebKit/QWebSettings
/home/buildroot12git/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/QtWebKit/
install -m 644 -p /home/buildroot12git/output/build/qt5webkit-5.0.2/include/QtWebKit/QtWebKitVersion
/home/buildroot12git/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/QtWebKit/
install -m 644 -p /home/buildroot12git/output/build/qt5webkit-5.0.2/lib/cmake/Qt5WebKit/Qt5WebKitConfig.cmake
/home/buildroot12git/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/cmake/Qt5WebKit/
install -m 644 -p /home/buildroot12git/output/build/qt5webkit-5.0.2/lib/cmake/Qt5WebKit/Qt5WebKitConfigVersion.cmake
/home/buildroot12git/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/cmake/Qt5WebKit/
install -m 644 -p /home/buildroot12git/output/build/qt5webkit-5.0.2/Source/WebKit2/UIProcess/API/qt/qquicknetworkrequest_p.h
/home/buildroot12git/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/QtWebKit/5.0.2/QtWebKit/private/
install -m 644 -p /home/buildroot12git/output/build/qt5webkit-5.0.2/Source/WebKit2/UIProcess/API/qt/qquickurlschemedelegate_p.h
/home/buildroot12git/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/QtWebKit/5.0.2/QtWebKit/private/
/home/buildroot12git/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-strip --strip-unneeded
"/home/buildroot12git/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libQt5WebKit.so.5.0.2"
install -m 644 -p /home/buildroot12git/output/build/qt5webkit-5.0.2/Source/WebKit2/UIProcess/API/qt/qquickwebpage_p.h
/home/buildroot12git/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/QtWebKit/5.0.2/QtWebKit/private/
install -m 644 -p /home/buildroot12git/output/build/qt5webkit-5.0.2/Source/WebKit2/UIProcess/API/qt/qquickwebpage_p_p.h
/home/buildroot12git/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/QtWebKit/5.0.2/QtWebKit/private/
install -m 644 -p /home/buildroot12git/output/build/qt5webkit-5.0.2/Source/WebKit2/UIProcess/API/qt/qquickwebview_p.h
/home/buildroot12git/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/QtWebKit/5.0.2/QtWebKit/private/
install -m 644 -p /home/buildroot12git/output/build/qt5webkit-5.0.2/Source/WebKit2/UIProcess/API/qt/qquickwebview_p_p.h
/home/buildroot12git/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/QtWebKit/5.0.2/QtWebKit/private/
install -m 644 -p /home/buildroot12git/output/build/qt5webkit-5.0.2/Source/WebKit2/UIProcess/API/qt/qtwebsecurityorigin_p.h
/home/buildroot12git/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/QtWebKit/5.0.2/QtWebKit/private/
install -m 644 -p /home/buildroot12git/output/build/qt5webkit-5.0.2/Source/WebKit2/UIProcess/API/qt/qwebdownloaditem_p.h
/home/buildroot12git/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/QtWebKit/5.0.2/QtWebKit/private/
install -m 644 -p /home/buildroot12git/output/build/qt5webkit-5.0.2/Source/WebKit2/UIProcess/API/qt/qwebdownloaditem_p_p.h
/home/buildroot12git/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/QtWebKit/5.0.2/QtWebKit/private/
install -m 644 -p /home/buildroot12git/output/build/qt5webkit-5.0.2/Source/WebKit2/UIProcess/API/qt/qwebiconimageprovider_p.h
/home/buildroot12git/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/QtWebKit/5.0.2/QtWebKit/private/
install -m 644 -p /home/buildroot12git/output/build/qt5webkit-5.0.2/Source/WebKit2/UIProcess/API/qt/qwebkittest_p.h
/home/buildroot12git/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/QtWebKit/5.0.2/QtWebKit/private/
install -m 644 -p /home/buildroot12git/output/build/qt5webkit-5.0.2/Source/WebKit2/UIProcess/API/qt/qwebloadrequest_p.h
/home/buildroot12git/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/QtWebKit/5.0.2/QtWebKit/private/
install -m 644 -p /home/buildroot12git/output/build/qt5webkit-5.0.2/Source/WebKit2/UIProcess/API/qt/qwebnavigationhistory_p.h
/home/buildroot12git/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/QtWebKit/5.0.2/QtWebKit/private/
install -m 644 -p /home/buildroot12git/output/build/qt5webkit-5.0.2/Source/WebKit2/UIProcess/API/qt/qwebnavigationhistory_p_p.h
/home/buildroot12git/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/QtWebKit/5.0.2/QtWebKit/private/
install -m 644 -p /home/buildroot12git/output/build/qt5webkit-5.0.2/Source/WebKit2/UIProcess/API/qt/qwebnavigationrequest_p.h
/home/buildroot12git/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/QtWebKit/5.0.2/QtWebKit/private/
install -m 644 -p /home/buildroot12git/output/build/qt5webkit-5.0.2/Source/WebKit2/UIProcess/API/qt/qwebpermissionrequest_p.h
/home/buildroot12git/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/QtWebKit/5.0.2/QtWebKit/private/
install -m 644 -p /home/buildroot12git/output/build/qt5webkit-5.0.2/Source/WebKit2/UIProcess/API/qt/qwebpreferences_p.h
/home/buildroot12git/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/QtWebKit/5.0.2/QtWebKit/private/
install -m 644 -p /home/buildroot12git/output/build/qt5webkit-5.0.2/Source/WebKit2/UIProcess/API/qt/qwebpreferences_p_p.h
/home/buildroot12git/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/QtWebKit/5.0.2/QtWebKit/private/
install -m 644 -p /home/buildroot12git/output/build/qt5webkit-5.0.2/Source/WebKit2/UIProcess/API/qt/raw/qrawwebview_p.h
/home/buildroot12git/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/QtWebKit/5.0.2/QtWebKit/private/
install -m 644 -p /home/buildroot12git/output/build/qt5webkit-5.0.2/Source/WebKit2/UIProcess/API/qt/raw/qrawwebview_p_p.h
/home/buildroot12git/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/QtWebKit/5.0.2/QtWebKit/private/
install -m 644 -p /home/buildroot12git/output/build/qt5webkit-5.0.2/Source/WebKit2/UIProcess/API/qt/tests/bytearraytestdata.h
/home/buildroot12git/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/QtWebKit/5.0.2/QtWebKit/private/
install -m 644 -p /home/buildroot12git/output/build/qt5webkit-5.0.2/Source/WebKit2/UIProcess/API/qt/tests/testwindow.h
/home/buildroot12git/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/QtWebKit/5.0.2/QtWebKit/private/
install -m 644 -p /home/buildroot12git/output/build/qt5webkit-5.0.2/Source/WebKit2/UIProcess/API/qt/tests/util.h
/home/buildroot12git/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/QtWebKit/5.0.2/QtWebKit/private/
ln -f -s "libQt5WebKit.so.5.0.2"
"/home/buildroot12git/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libQt5WebKit.so"
ln -f -s "libQt5WebKit.so.5.0.2"
"/home/buildroot12git/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libQt5WebKit.so.5"
ln -f -s "libQt5WebKit.so.5.0.2"
"/home/buildroot12git/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libQt5WebKit.so.5.0"
sed -e "s,/home/buildroot12git/output/build/qt5webkit-5.0.2/include,/usr/include,g" -e
"s,/home/buildroot12git/output/build/qt5webkit-5.0.2/lib,/usr/lib,g" "../lib/libQt5WebKit.prl"
>"/home/buildroot12git/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libQt5WebKit.prl"
sed -e "s,/home/buildroot12git/output/build/qt5webkit-5.0.2/include,/usr/include,g" -e
"s,/home/buildroot12git/output/build/qt5webkit-5.0.2/lib,/usr/lib,g" "../lib/libQt5WebKit.la"
>"/home/buildroot12git/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libQt5WebKit.la"
sed -e "s,/home/buildroot12git/output/build/qt5webkit-5.0.2/include,/usr/include,g" -e
"s,/home/buildroot12git/output/build/qt5webkit-5.0.2/lib,/usr/lib,g" "../lib/pkgconfig/Qt5WebKit.pc"
>"/home/buildroot12git/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/pkgconfig/Qt5WebKit.pc"
make[3]: Leaving directory `/home/buildroot12git/output/build/qt5webkit-5.0.2/Source'
( test -e Makefile.widgetsapi || /home/buildroot12git/output/host/usr/bin/qmake
/home/buildroot12git/output/build/qt5webkit-5.0.2/Source/widgetsapi.pri -o Makefile.widgetsapi ) && /usr/bin/make -f
Makefile.widgetsapi install
make[3]: Entering directory `/home/buildroot12git/output/build/qt5webkit-5.0.2/Source'
install -m 755 -p "../lib/libQt5WebKitWidgets.so.5.0.2"
"/home/buildroot12git/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libQt5WebKitWidgets.so.5.0.2"
install -m 644 -p /home/buildroot12git/output/build/qt5webkit-5.0.2/include/QtWebKitWidgets/QGraphicsWebView
/home/buildroot12git/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/QtWebKitWidgets/
install -m 644 -p /home/buildroot12git/output/build/qt5webkit-5.0.2/Source/WebKit/qt/WidgetApi/qgraphicswebview.h
/home/buildroot12git/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/QtWebKitWidgets/
install -m 644 -p /home/buildroot12git/output/build/qt5webkit-5.0.2/include/QtWebKitWidgets/QWebHitTestResult
/home/buildroot12git/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/QtWebKitWidgets/
install -m 644 -p /home/buildroot12git/output/build/qt5webkit-5.0.2/Tools/qmake/mkspecs/modules-inst/qt_lib_webkitwidgets.pri
/home/buildroot12git/output/host/usr/mkspecs/modules/
/home/buildroot12git/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-strip --strip-unneeded
"/home/buildroot12git/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libQt5WebKitWidgets.so.5.0.2"
install -m 644 -p /home/buildroot12git/output/build/qt5webkit-5.0.2/Source/WebKit/qt/WidgetApi/qwebframe_p.h
/home/buildroot12git/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/QtWebKitWidgets/5.0.2/QtWebKitWidgets/pri
vate/
install -m 644 -p /home/buildroot12git/output/build/qt5webkit-5.0.2/Source/WebKit/qt/WidgetApi/qwebframe.h
/home/buildroot12git/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/QtWebKitWidgets/
install -m 644 -p /home/buildroot12git/output/build/qt5webkit-5.0.2/include/QtWebKitWidgets/QWebFrame
/home/buildroot12git/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/QtWebKitWidgets/
install -m 644 -p /home/buildroot12git/output/build/qt5webkit-5.0.2/Source/WebKit/qt/WidgetApi/qwebinspector.h
/home/buildroot12git/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/QtWebKitWidgets/
install -m 644 -p /home/buildroot12git/output/build/qt5webkit-5.0.2/include/QtWebKitWidgets/QWebInspector
/home/buildroot12git/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/QtWebKitWidgets/
install -m 644 -p /home/buildroot12git/output/build/qt5webkit-5.0.2/Source/WebKit/qt/WidgetApi/qwebinspector_p.h
/home/buildroot12git/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/QtWebKitWidgets/5.0.2/QtWebKitWidgets/pri
vate/
install -m 644 -p /home/buildroot12git/output/build/qt5webkit-5.0.2/Source/WebKit/qt/WidgetApi/qwebpage.h
/home/buildroot12git/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/QtWebKitWidgets/
install -m 644 -p /home/buildroot12git/output/build/qt5webkit-5.0.2/include/QtWebKitWidgets/QWebPage
/home/buildroot12git/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/QtWebKitWidgets/
install -m 644 -p /home/buildroot12git/output/build/qt5webkit-5.0.2/Source/WebKit/qt/WidgetApi/qwebview.h
/home/buildroot12git/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/QtWebKitWidgets/
install -m 644 -p /home/buildroot12git/output/build/qt5webkit-5.0.2/lib/cmake/Qt5WebKitWidgets/Qt5WebKitWidgetsConfig.cmake
/home/buildroot12git/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/cmake/Qt5WebKitWidgets/
install -m 644 -p /home/buildroot12git/output/build/qt5webkit-5.0.2/Source/WebKit/qt/WidgetApi/qwebpage_p.h
/home/buildroot12git/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/QtWebKitWidgets/5.0.2/QtWebKitWidgets/pri
vate/
install -m 644 -p /home/buildroot12git/output/build/qt5webkit-5.0.2/include/QtWebKitWidgets/QWebView
/home/buildroot12git/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/QtWebKitWidgets/
ln -f -s "libQt5WebKitWidgets.so.5.0.2"
"/home/buildroot12git/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libQt5WebKitWidgets.so"
install -m 644 -p /home/buildroot12git/output/build/qt5webkit-5.0.2/include/QtWebKitWidgets/qtwebkitwidgetsversion.h
/home/buildroot12git/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/QtWebKitWidgets/
install -m 644 -p /home/buildroot12git/output/build/qt5webkit-5.0.2/lib/cmake/Qt5WebKitWidgets/Qt5WebKitWidgetsConfigVersion.cmake
/home/buildroot12git/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/cmake/Qt5WebKitWidgets/
install -m 644 -p /home/buildroot12git/output/build/qt5webkit-5.0.2/Source/WebKit/qt/WidgetApi/qwebviewaccessible_p.h
/home/buildroot12git/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/QtWebKitWidgets/5.0.2/QtWebKitWidgets/pri
vate/
install -m 644 -p /home/buildroot12git/output/build/qt5webkit-5.0.2/include/QtWebKitWidgets/QtWebKitWidgetsVersion
/home/buildroot12git/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/QtWebKitWidgets/
install -m 644 -p /home/buildroot12git/output/build/qt5webkit-5.0.2/include/QtWebKitWidgets/QtWebKitWidgets
/home/buildroot12git/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/QtWebKitWidgets/
ln -f -s "libQt5WebKitWidgets.so.5.0.2"
"/home/buildroot12git/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libQt5WebKitWidgets.so.5"
ln -f -s "libQt5WebKitWidgets.so.5.0.2"
"/home/buildroot12git/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libQt5WebKitWidgets.so.5.0"
sed -e "s,/home/buildroot12git/output/build/qt5webkit-5.0.2/include,/usr/include,g" -e
"s,/home/buildroot12git/output/build/qt5webkit-5.0.2/lib,/usr/lib,g" "../lib/libQt5WebKitWidgets.prl"
>"/home/buildroot12git/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libQt5WebKitWidgets.prl"
sed -e "s,/home/buildroot12git/output/build/qt5webkit-5.0.2/include,/usr/include,g" -e
"s,/home/buildroot12git/output/build/qt5webkit-5.0.2/lib,/usr/lib,g" "../lib/libQt5WebKitWidgets.la"
>"/home/buildroot12git/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libQt5WebKitWidgets.la"
sed -e "s,/home/buildroot12git/output/build/qt5webkit-5.0.2/include,/usr/include,g" -e
"s,/home/buildroot12git/output/build/qt5webkit-5.0.2/lib,/usr/lib,g" "../lib/pkgconfig/Qt5WebKitWidgets.pc"
>"/home/buildroot12git/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/pkgconfig/Qt5WebKitWidgets.pc"
make[3]: Leaving directory `/home/buildroot12git/output/build/qt5webkit-5.0.2/Source'
cd WebKit/qt/examples/ && ( test -e Makefile || /home/buildroot12git/output/host/usr/bin/qmake
/home/buildroot12git/output/build/qt5webkit-5.0.2/Source/WebKit/qt/examples/examples.pro -o Makefile ) && /usr/bin/make -f Makefile
install
make[3]: Entering directory `/home/buildroot12git/output/build/qt5webkit-5.0.2/Source/WebKit/qt/examples'
cd platformplugin/ && ( test -e Makefile || /home/buildroot12git/output/host/usr/bin/qmake
/home/buildroot12git/output/build/qt5webkit-5.0.2/Source/WebKit/qt/examples/platformplugin/platformplugin.pro -o Makefile ) &&
/usr/bin/make -f Makefile install
make[4]: Entering directory `/home/buildroot12git/output/build/qt5webkit-5.0.2/Source/WebKit/qt/examples/platformplugin'
make[4]: Nothing to be done for `install'.
make[4]: Leaving directory `/home/buildroot12git/output/build/qt5webkit-5.0.2/Source/WebKit/qt/examples/platformplugin'
make[3]: Leaving directory `/home/buildroot12git/output/build/qt5webkit-5.0.2/Source/WebKit/qt/examples'
make[2]: Leaving directory `/home/buildroot12git/output/build/qt5webkit-5.0.2/Source'
cd Tools/ && ( test -e Makefile.Tools || /home/buildroot12git/output/host/usr/bin/qmake
/home/buildroot12git/output/build/qt5webkit-5.0.2/Tools/Tools.pro -o Makefile.Tools ) && /usr/bin/make -f Makefile.Tools install
make[2]: Entering directory `/home/buildroot12git/output/build/qt5webkit-5.0.2/Tools'
make[2]: Nothing to be done for `install'.
make[2]: Leaving directory `/home/buildroot12git/output/build/qt5webkit-5.0.2/Tools'
make[1]: Leaving directory `/home/buildroot12git/output/build/qt5webkit-5.0.2'
for i in $(find /home/buildroot12git/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib* -name "libQt5*.la"); do
/bin/sed -i -e "s:\(['= ]\)/usr:\\1/home/buildroot12git/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr:g" $i;
/bin/sed -i -e "/^dependency_libs=/s%-L/usr/lib %%g" $i ; done
for i in $(find /home/buildroot12git/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib* -name "libQt5*.prl"); do
/bin/sed -i -e "s%-L/usr/lib%%" $i; done
>>> qt5webkit 5.0.2 Installing to target
cp -dpf /home/buildroot12git/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libQt5WebKit*.so.*
/home/buildroot12git/output/target/usr/lib
cp -dpf /home/buildroot12git/output/build/qt5webkit-5.0.2/bin/* /home/buildroot12git/output/target/usr/bin/
cp -dpfr /home/buildroot12git/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/qml/QtWebKit
/home/buildroot12git/output/target/usr/qml/
cp: cannot stat `/home/buildroot12git/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/qml/QtWebKit': No such file or
directory
make: *** [/home/buildroot12git/output/build/qt5webkit-5.0.2/.stamp_target_installed] Error 1

####################################################################################################################################
###########################################################

-----Oorspronkelijk bericht-----
Van: Thomas Petazzoni [mailto:thomas.petazzoni at free-electrons.com] 
Verzonden: woensdag 7 augustus 2013 23:43
Aan: Sagaert Johan
CC: buildroot at busybox.net
Onderwerp: Re: [Buildroot] qt 5.02 not building

Dear Sagaert Johan,

On Wed, 7 Aug 2013 19:38:37 +0200, Sagaert Johan wrote:
> DirectFB auto-detection... ()
> make[1]: Entering directory `/home/buildroot12git/output/build/qt5base-5.0.2/config.tests/qpa/directfb'
> /home/buildroot12git/output/host/usr/bin/arm-buildroot-linux-uclibcgnu
> eabi-g++ -c -pipe -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
> -D_FILE_OFFSET_BITS=64 -pipe -Os 
> --sysroot=/home/buildroot12git/output/host/usr/arm-buildroot-linux-ucl
> ibcgnueabi/sysroot -D_REENTRANT -O2 -O3 -Wall -W -fPIE  
> -I../../../mkspecs/devices/linux-buildroot-g++ -I.
> -I/home/buildroot12git/output/host/usr/arm-buildroot-linux-uclibcgnuea
> bi/sysroot/usr/include 
> -I/home/buildroot12git/output/host/usr/arm-buildroot-linux-uclibcgnuea
> bi/sysroot/usr/include/directfb -o directfb.o directfb.cpp
> directfb.cpp:45:2: error: #error DirectFB headers are unclean and 
> cannot compile
> make[1]: *** [directfb.o] Error 1
> make[1]: Leaving directory `/home/buildroot12git/output/build/qt5base-5.0.2/config.tests/qpa/directfb'
> DirectFB disabled.
>  DirectFB support cannot be enabled due to functionality tests!
>  Turn on verbose messaging (-v) to ./configure to see the final report.
>  If you believe this message is in error you may use the continue  
> switch (-continue) to ./configure to continue.
> make: *** 
> [/home/buildroot12git/output/build/qt5base-5.0.2/.stamp_configured] 
> Error 101

Ok, so as you can see, the error has nothing to do with what you posted originally (-msse2), but it is related to DirectFB.

I've already seen this error in the autobuilders, but never had the time to investigate. Someone needs to have a look at this one.

Best regards,

Thomas
--
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux development, consulting, training and support.
http://free-electrons.com
