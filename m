From: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>
Date: Wed,  8 Feb 2017 02:24:00 +0100
Subject: [Buildroot] [PATCH 2/2] package/qt5/*: add meaningful help texts
	and package URLs
In-Reply-To: <1486517040-8075-1-git-send-email-mr.zoltan.gyarmati@gmail.com>
References: <1486517040-8075-1-git-send-email-mr.zoltan.gyarmati@gmail.com>
Message-ID: <1486517040-8075-3-git-send-email-mr.zoltan.gyarmati@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>
---
 package/qt5/qt53d/Config.in               | 4 +++-
 package/qt5/qt5canvas3d/Config.in         | 5 +++--
 package/qt5/qt5connectivity/Config.in     | 6 ++++--
 package/qt5/qt5declarative/Config.in      | 6 ++++--
 package/qt5/qt5enginio/Config.in          | 5 +++--
 package/qt5/qt5graphicaleffects/Config.in | 6 ++++--
 package/qt5/qt5imageformats/Config.in     | 5 +++--
 package/qt5/qt5location/Config.in         | 6 ++++--
 package/qt5/qt5multimedia/Config.in       | 7 +++++--
 package/qt5/qt5quickcontrols/Config.in    | 5 +++--
 package/qt5/qt5quickcontrols2/Config.in   | 6 ++++--
 package/qt5/qt5script/Config.in           | 5 +++--
 package/qt5/qt5sensors/Config.in          | 5 +++--
 package/qt5/qt5serialbus/Config.in        | 6 ++++--
 package/qt5/qt5serialport/Config.in       | 6 ++++--
 package/qt5/qt5svg/Config.in              | 5 +++--
 package/qt5/qt5tools/Config.in            | 5 +++--
 package/qt5/qt5webchannel/Config.in       | 6 ++++--
 package/qt5/qt5webkit/Config.in           | 6 ++++--
 package/qt5/qt5websockets/Config.in       | 7 +++++--
 package/qt5/qt5x11extras/Config.in        | 5 +++--
 package/qt5/qt5xmlpatterns/Config.in      | 5 +++--
 22 files changed, 79 insertions(+), 43 deletions(-)

diff --git a/package/qt5/qt53d/Config.in b/package/qt5/qt53d/Config.in
index ff50204..03752ca 100644
--- a/package/qt5/qt53d/Config.in
+++ b/package/qt5/qt53d/Config.in
@@ -10,7 +10,9 @@ config BR2_PACKAGE_QT53D
 	  Qt is a cross-platform application and UI framework for
 	  developers using C++.
 
-	  This package corresponds to the qt53d module.
+	  The Qt 3D module provides functionality for near-realtime simulation
+	  systems with support for 2D and 3D rendering in both Qt C++ and
+	  Qt Quick  applications.
 
 	  Enable the assimp package to gain the assimp sceneparser plugin.
 
diff --git a/package/qt5/qt5canvas3d/Config.in b/package/qt5/qt5canvas3d/Config.in
index 3ae5192..8058a2e 100644
--- a/package/qt5/qt5canvas3d/Config.in
+++ b/package/qt5/qt5canvas3d/Config.in
@@ -8,9 +8,10 @@ config BR2_PACKAGE_QT5CANVAS3D
 	  Qt is a cross-platform application and UI framework for
 	  developers using C++.
 
-	  This package corresponds to the qt5canvas3d module.
+	  Qt Canvas 3D module provides a way to make WebGL-like
+	  3D drawing calls from Qt Quick JavaScript.
 
-	  http://qt.io
+	  http://doc.qt.io/qt-5/qtcanvas3d-index.html
 
 comment "qt5canvas3d needs an OpenGL-capable backend"
 	depends on !BR2_PACKAGE_QT5_GL_AVAILABLE
diff --git a/package/qt5/qt5connectivity/Config.in b/package/qt5/qt5connectivity/Config.in
index fa9b911..8903fc9 100644
--- a/package/qt5/qt5connectivity/Config.in
+++ b/package/qt5/qt5connectivity/Config.in
@@ -8,9 +8,11 @@ config BR2_PACKAGE_QT5CONNECTIVITY
 	  Qt is a cross-platform application and UI framework for
 	  developers using C++.
 
-	  This package corresponds to the qt5connectivity module.
+	  Qt Connectivity module provides support for Bluetooth/NFC
+	  peripherials.
 
-	  http://qt.io
+	  http://doc.qt.io/qt-5/qtbluetooth-index.html
+	  http://doc.qt.io/qt-5/qtnfc-index.html
 
 comment "qt5connectivity needs neard and/or bluez(5)_utils"
 	depends on !BR2_PACKAGE_NEARD && !BR2_PACKAGE_BLUEZ_UTILS && \
diff --git a/package/qt5/qt5declarative/Config.in b/package/qt5/qt5declarative/Config.in
index eba4c8d..853322c 100644
--- a/package/qt5/qt5declarative/Config.in
+++ b/package/qt5/qt5declarative/Config.in
@@ -8,9 +8,11 @@ config BR2_PACKAGE_QT5DECLARATIVE
 	  Qt is a cross-platform application and UI framework for
 	  developers using C++.
 
-	  This package corresponds to the qt5declarative module.
+	  Qt Declarative module provides the Qt QML and Qt Quick
+	  modules for developing UIs with the QML language
 
-	  http://qt.io
+	  http://doc.qt.io/qt-5/qtqml-index.html
+	  http://doc.qt.io/qt-5/qtquick-index.html
 
 if BR2_PACKAGE_QT5DECLARATIVE
 
diff --git a/package/qt5/qt5enginio/Config.in b/package/qt5/qt5enginio/Config.in
index dba75e2..102058e 100644
--- a/package/qt5/qt5enginio/Config.in
+++ b/package/qt5/qt5enginio/Config.in
@@ -8,9 +8,10 @@ config BR2_PACKAGE_QT5ENGINIO
 	  Qt is a cross-platform application and UI framework for
 	  developers using C++.
 
-	  This package corresponds to the qt5enginio module.
+	  Enginio is a Backend-as-a-Service solution for simplifying
+	  backend development of connected and data-driven applications.
 
 	  This package has been tagged as deprecated since version
 	  5.6 and not recommended for new design.
 
-	  http://qt.io
+	  http://doc.qt.io/archives/qt-5.5/enginio-index.html
diff --git a/package/qt5/qt5graphicaleffects/Config.in b/package/qt5/qt5graphicaleffects/Config.in
index a42e1f8..df23425 100644
--- a/package/qt5/qt5graphicaleffects/Config.in
+++ b/package/qt5/qt5graphicaleffects/Config.in
@@ -8,9 +8,11 @@ config BR2_PACKAGE_QT5GRAPHICALEFFECTS
 	  Qt is a cross-platform application and UI framework for
 	  developers using C++.
 
-	  This package corresponds to the qt5graphicaleffects module.
+	  The Qt Graphical Effects module provides a set of QML types
+	  for adding visually impressive and configurable effects to
+	  user interfaces.
 
-	  http://qt.io
+	  http://doc.qt.io/qt-5/qtgraphicaleffects-index.html
 
 comment "qt5graphicaleffects needs an OpenGL-capable backend"
 	depends on !BR2_PACKAGE_QT5_GL_AVAILABLE
diff --git a/package/qt5/qt5imageformats/Config.in b/package/qt5/qt5imageformats/Config.in
index 4dd848e..44c85c9 100644
--- a/package/qt5/qt5imageformats/Config.in
+++ b/package/qt5/qt5imageformats/Config.in
@@ -6,6 +6,7 @@ config BR2_PACKAGE_QT5IMAGEFORMATS
 	  Qt is a cross-platform application and UI framework for
 	  developers using C++.
 
-	  This package corresponds to the qt5imageformats module.
+	  The Qt Image Formats module provides plugins for
+	  additional image formats: TIFF, MNG, TGA, WBMP
 
-	  http://qt.io
+	  http://doc.qt.io/qt-5/qtimageformats-index.html
diff --git a/package/qt5/qt5location/Config.in b/package/qt5/qt5location/Config.in
index 209d134..e177818 100644
--- a/package/qt5/qt5location/Config.in
+++ b/package/qt5/qt5location/Config.in
@@ -5,6 +5,8 @@ config BR2_PACKAGE_QT5LOCATION
 	  Qt is a cross-platform application and UI framework for
 	  developers using C++.
 
-	  This package corresponds to the qt5location module.
+	  The Qt Location API helps you create viable mapping
+	  solutions using the data available from some of the
+	  popular location services.
 
-	  http://qt.io
+	  http://doc.qt.io/qt-5/qtlocation-index.html
diff --git a/package/qt5/qt5multimedia/Config.in b/package/qt5/qt5multimedia/Config.in
index 7549b35..5b14ac5 100644
--- a/package/qt5/qt5multimedia/Config.in
+++ b/package/qt5/qt5multimedia/Config.in
@@ -8,6 +8,9 @@ config BR2_PACKAGE_QT5MULTIMEDIA
 	  Qt is a cross-platform application and UI framework for
 	  developers using C++.
 
-	  This package corresponds to the qt5multimedia module.
+	  The Qt Multimedia module provides a rich feature set that
+	  enables you to easily take advantage of a platform's multimedia
+	  capabilities such as media playback and the use of camera and
+	  radio devices.
 
-	  http://qt.io
+	  http://doc.qt.io/qt-5/multimediaoverview.html
diff --git a/package/qt5/qt5quickcontrols/Config.in b/package/qt5/qt5quickcontrols/Config.in
index 0fe8465..3ab6ded 100644
--- a/package/qt5/qt5quickcontrols/Config.in
+++ b/package/qt5/qt5quickcontrols/Config.in
@@ -8,9 +8,10 @@ config BR2_PACKAGE_QT5QUICKCONTROLS
 	  Qt is a cross-platform application and UI framework for
 	  developers using C++.
 
-	  This package corresponds to the qt5quickcontrols module.
+	  The Qt Quick Controls module provides a set of controls
+	  that can be used to build complete interfaces in Qt Quick.
 
-	  http://qt.io
+	  http://doc.qt.io/qt-5/qtquickcontrols-index.html
 
 comment "qt5quickcontrols needs an OpenGL-capable backend"
 	depends on !BR2_PACKAGE_QT5_GL_AVAILABLE
diff --git a/package/qt5/qt5quickcontrols2/Config.in b/package/qt5/qt5quickcontrols2/Config.in
index 1e57674..c5517f1 100644
--- a/package/qt5/qt5quickcontrols2/Config.in
+++ b/package/qt5/qt5quickcontrols2/Config.in
@@ -8,9 +8,11 @@ config BR2_PACKAGE_QT5QUICKCONTROLS2
 	  Qt is a cross-platform application and UI framework for
 	  developers using C++.
 
-	  This package corresponds to the qt5quickcontrols2 module.
+	  Qt Quick Controls 2 provides a set of controls that can
+	  be used to build complete interfaces in Qt Quick.
+	  The module was introduced in Qt 5.7.
 
-	  http://qt.io
+	  https://doc.qt.io/qt-5/qtquickcontrols2-index.html
 
 comment "qt5quickcontrols2 needs an OpenGL-capable backend"
 	depends on !BR2_PACKAGE_QT5_GL_AVAILABLE
diff --git a/package/qt5/qt5script/Config.in b/package/qt5/qt5script/Config.in
index 0d15ef2..ad19727 100644
--- a/package/qt5/qt5script/Config.in
+++ b/package/qt5/qt5script/Config.in
@@ -6,10 +6,11 @@ config BR2_PACKAGE_QT5SCRIPT
 	  Qt is a cross-platform application and UI framework for
 	  developers using C++.
 
-	  This package corresponds to the qt5script module.
+	  Qt Script provides support for making Qt applications
+	  scriptable. Provided for Qt 4.x compatibility.
 
 	  This package has been tagged as deprecated since version
 	  5.5.0 and should be replaced by Qt QML module in new
 	  design.
 
-	  http://qt.io
+	  http://doc.qt.io/qt-5/qtscript-index.html
diff --git a/package/qt5/qt5sensors/Config.in b/package/qt5/qt5sensors/Config.in
index 741ebba..3d268fb 100644
--- a/package/qt5/qt5sensors/Config.in
+++ b/package/qt5/qt5sensors/Config.in
@@ -5,6 +5,7 @@ config BR2_PACKAGE_QT5SENSORS
 	  Qt is a cross-platform application and UI framework for
 	  developers using C++.
 
-	  This package corresponds to the qt5sensors module.
+	  The Qt Sensors API provides access to sensor hardware 
+	  via QML and C++ interfaces.
 
-	  http://qt.io
+	  http://doc.qt.io/qt-5/qtsensors-index.html
diff --git a/package/qt5/qt5serialbus/Config.in b/package/qt5/qt5serialbus/Config.in
index f5b713d..aa2378a 100644
--- a/package/qt5/qt5serialbus/Config.in
+++ b/package/qt5/qt5serialbus/Config.in
@@ -7,9 +7,11 @@ config BR2_PACKAGE_QT5SERIALBUS
 	  Qt is a cross-platform application and UI framework for
 	  developers using C++.
 
-	  This package corresponds to the qt5serialbus module.
+	  The Qt Serial Bus API provides classes and functions to
+	  access the various industrial serial buses and protocols,
+	  such as CAN, ModBus, and others.
 
-	  http://qt.io
+	  http://doc.qt.io/qt-5/qtserialbus-index.html
 
 comment "qt5serialbus needs headers >= 3.6"
 	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_6
diff --git a/package/qt5/qt5serialport/Config.in b/package/qt5/qt5serialport/Config.in
index c419d17..3538c52 100644
--- a/package/qt5/qt5serialport/Config.in
+++ b/package/qt5/qt5serialport/Config.in
@@ -5,6 +5,8 @@ config BR2_PACKAGE_QT5SERIALPORT
 	  Qt is a cross-platform application and UI framework for
 	  developers using C++.
 
-	  This package corresponds to the qt5serialport module.
+	  Qt Serial Port provides the basic functionality, which
+	  includes configuring, I/O operations, getting and setting
+	  the control signals of the RS-232 pinouts.
 
-	  http://qt.io
+	  http://doc.qt.io/qt-5/qtserialport-index.html
diff --git a/package/qt5/qt5svg/Config.in b/package/qt5/qt5svg/Config.in
index e1acafb..bc80b62 100644
--- a/package/qt5/qt5svg/Config.in
+++ b/package/qt5/qt5svg/Config.in
@@ -6,6 +6,7 @@ config BR2_PACKAGE_QT5SVG
 	  Qt is a cross-platform application and UI framework for
 	  developers using C++.
 
-	  This package corresponds to the qt5svg module.
+	  Qt SVG provides classes for rendering and displaying SVG
+	  drawings in widgets and on other paint devices.
 
-	  http://qt.io
+	  http://doc.qt.io/qt-5/qtsvg-index.html
diff --git a/package/qt5/qt5tools/Config.in b/package/qt5/qt5tools/Config.in
index 453913b..20f00f6 100644
--- a/package/qt5/qt5tools/Config.in
+++ b/package/qt5/qt5tools/Config.in
@@ -4,9 +4,10 @@ config BR2_PACKAGE_QT5TOOLS
 	  Qt is a cross-platform application and UI framework for
 	  developers using C++.
 
-	  This package corresponds to the qt5tools module.
+	  Qt Tools provides tools facilitate the development
+	  and design of applications.
 
-	  http://qt.io
+	  http://doc.qt.io/qt-5/qtmodules.html#qt-tools
 
 if BR2_PACKAGE_QT5TOOLS
 
diff --git a/package/qt5/qt5webchannel/Config.in b/package/qt5/qt5webchannel/Config.in
index 218629a..e3d8405 100644
--- a/package/qt5/qt5webchannel/Config.in
+++ b/package/qt5/qt5webchannel/Config.in
@@ -6,6 +6,8 @@ config BR2_PACKAGE_QT5WEBCHANNEL
 	  Qt is a cross-platform application and UI framework for
 	  developers using C++.
 
-	  This package corresponds to the qt5webchannel module.
+	  Qt WebChannel enables peer-to-peer communication between
+	  a server (QML/C++ application) and a client
+	  (HTML/JavaScript or QML application).
 
-	  http://qt.io
+	  http://doc.qt.io/qt-5/qtwebchannel-index.html
diff --git a/package/qt5/qt5webkit/Config.in b/package/qt5/qt5webkit/Config.in
index 48aaf94..e9c11fb 100644
--- a/package/qt5/qt5webkit/Config.in
+++ b/package/qt5/qt5webkit/Config.in
@@ -13,14 +13,16 @@ config BR2_PACKAGE_QT5WEBKIT
 	  Qt is a cross-platform application and UI framework for
 	  developers using C++.
 
-	  This package corresponds to the qt5webkit module.
+	  The Qt WebKit module provides the WebView API, which
+	  allows QML applications to render regions of dynamic
+	  web content.
 
 	  This package has been removed from the official release packages
 	  since Qt5.6.0, but it is still available for users to build it
 	  from source. This is useful for platforms without GPU since the
 	  successor (QtWebEngine) requires OpenGL support.
 
-	  http://qt.io
+	  http://doc.qt.io/archives/qt-5.5/qtwebkit-index.html
 
 comment "qt5webkit needs a toolchain w/ dynamic library"
 	depends on BR2_STATIC_LIBS
diff --git a/package/qt5/qt5websockets/Config.in b/package/qt5/qt5websockets/Config.in
index 385a07c..0cfde91 100644
--- a/package/qt5/qt5websockets/Config.in
+++ b/package/qt5/qt5websockets/Config.in
@@ -6,6 +6,9 @@ config BR2_PACKAGE_QT5WEBSOCKETS
 	  Qt is a cross-platform application and UI framework for
 	  developers using C++.
 
-	  This package corresponds to the qt5websockets module.
+	  The Qt WebSockets module provides C++ and QML interfaces
+	  that enable Qt applications to act as a server that can
+	  process WebSocket requests, or a client that can
+	  consume data received from the server, or both.
 
-	  http://qt.io
+	  http://doc.qt.io/qt-5/qtwebsockets-index.html
diff --git a/package/qt5/qt5x11extras/Config.in b/package/qt5/qt5x11extras/Config.in
index 6fc2c0a..9c514cd 100644
--- a/package/qt5/qt5x11extras/Config.in
+++ b/package/qt5/qt5x11extras/Config.in
@@ -6,6 +6,7 @@ config BR2_PACKAGE_QT5X11EXTRAS
 	  Qt is a cross-platform application and UI framework for
 	  developers using C++.
 
-	  This package corresponds to the qt5x11extras module.
+	  Qt X11 Extras enables the Qt programmer to write
+	  applications for the Linux/X11 platform.
 
-	  http://qt.io
+	  http://doc.qt.io/qt-5/qtx11extras-index.html
diff --git a/package/qt5/qt5xmlpatterns/Config.in b/package/qt5/qt5xmlpatterns/Config.in
index 8c82656..dd8b54e 100644
--- a/package/qt5/qt5xmlpatterns/Config.in
+++ b/package/qt5/qt5xmlpatterns/Config.in
@@ -5,6 +5,7 @@ config BR2_PACKAGE_QT5XMLPATTERNS
 	  Qt is a cross-platform application and UI framework for
 	  developers using C++.
 
-	  This package corresponds to the qt5xmlpatterns module.
+	  The Qt XML Patterns module provides support for XPath,
+	  XQuery, XSLT, and XML Schema validation.
 
-	  http://qt.io
+	  http://doc.qt.io/qt-5/qtxmlpatterns-index.html
-- 
2.7.4
