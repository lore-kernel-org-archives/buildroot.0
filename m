From: =?UTF-8?q?Fatih=20A=C5=9F=C4=B1c=C4=B1?= <fatih.asici@gmail.com>
Date: Fri, 26 Dec 2014 14:06:43 +0200
Subject: [Buildroot] [PATCH 4/4] qt5: update URLs to use Qt's new domain
In-Reply-To: <1419595603-15591-1-git-send-email-fatih.asici@gmail.com>
References: <1419595603-15591-1-git-send-email-fatih.asici@gmail.com>
Message-ID: <1419595603-15591-4-git-send-email-fatih.asici@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fatih A??c? <fatih.asici@gmail.com>
---
 package/qt5/Config.in                                    | 2 +-
 package/qt5/qt5.mk                                       | 2 +-
 package/qt5/qt5base/Config.in                            | 2 +-
 package/qt5/qt5base/qt5base.hash                         | 2 +-
 package/qt5/qt5connectivity/Config.in                    | 2 +-
 package/qt5/qt5connectivity/qt5connectivity.hash         | 2 +-
 package/qt5/qt5declarative/Config.in                     | 2 +-
 package/qt5/qt5declarative/qt5declarative.hash           | 2 +-
 package/qt5/qt5enginio/Config.in                         | 2 +-
 package/qt5/qt5enginio/qt5enginio.hash                   | 2 +-
 package/qt5/qt5graphicaleffects/Config.in                | 2 +-
 package/qt5/qt5graphicaleffects/qt5graphicaleffects.hash | 2 +-
 package/qt5/qt5imageformats/Config.in                    | 2 +-
 package/qt5/qt5imageformats/qt5imageformats.hash         | 2 +-
 package/qt5/qt5multimedia/Config.in                      | 2 +-
 package/qt5/qt5multimedia/qt5multimedia.hash             | 2 +-
 package/qt5/qt5quick1/Config.in                          | 2 +-
 package/qt5/qt5quick1/qt5quick1.hash                     | 2 +-
 package/qt5/qt5quickcontrols/Config.in                   | 2 +-
 package/qt5/qt5quickcontrols/qt5quickcontrols.hash       | 2 +-
 package/qt5/qt5script/Config.in                          | 2 +-
 package/qt5/qt5script/qt5script.hash                     | 2 +-
 package/qt5/qt5sensors/Config.in                         | 2 +-
 package/qt5/qt5sensors/qt5sensors.hash                   | 2 +-
 package/qt5/qt5serialport/Config.in                      | 2 +-
 package/qt5/qt5serialport/qt5serialport.hash             | 2 +-
 package/qt5/qt5svg/Config.in                             | 2 +-
 package/qt5/qt5svg/qt5svg.hash                           | 2 +-
 package/qt5/qt5webkit-examples/Config.in                 | 2 +-
 package/qt5/qt5webkit-examples/qt5webkit-examples.hash   | 2 +-
 package/qt5/qt5webkit/Config.in                          | 2 +-
 package/qt5/qt5webkit/qt5webkit.hash                     | 2 +-
 package/qt5/qt5websockets/Config.in                      | 2 +-
 package/qt5/qt5websockets/qt5websockets.hash             | 2 +-
 package/qt5/qt5x11extras/Config.in                       | 2 +-
 package/qt5/qt5x11extras/qt5x11extras.hash               | 2 +-
 package/qt5/qt5xmlpatterns/Config.in                     | 2 +-
 package/qt5/qt5xmlpatterns/qt5xmlpatterns.hash           | 2 +-
 38 files changed, 38 insertions(+), 38 deletions(-)

diff --git a/package/qt5/Config.in b/package/qt5/Config.in
index 0b97374..fd8bde5 100644
--- a/package/qt5/Config.in
+++ b/package/qt5/Config.in
@@ -29,7 +29,7 @@ menuconfig BR2_PACKAGE_QT5
 	  This option enables the Qt5 framework. Sub-options allow to
 	  select which modules should be built.
 
-	  http://qt-project.org
+	  http://qt.io
 
 if BR2_PACKAGE_QT5
 source "package/qt5/qt5base/Config.in"
diff --git a/package/qt5/qt5.mk b/package/qt5/qt5.mk
index 72aca14..3b8f7ec 100644
--- a/package/qt5/qt5.mk
+++ b/package/qt5/qt5.mk
@@ -1,6 +1,6 @@
 QT5_VERSION_MAJOR = 5.4
 QT5_VERSION = $(QT5_VERSION_MAJOR).0
-QT5_SITE = http://download.qt-project.org/official_releases/qt/$(QT5_VERSION_MAJOR)/$(QT5_VERSION)/submodules
+QT5_SITE = http://download.qt.io/official_releases/qt/$(QT5_VERSION_MAJOR)/$(QT5_VERSION)/submodules
 include $(sort $(wildcard package/qt5/*/*.mk))
 
 define QT5_LA_PRL_FILES_FIXUP
diff --git a/package/qt5/qt5base/Config.in b/package/qt5/qt5base/Config.in
index 59fc4e0..d57dd8e 100644
--- a/package/qt5/qt5base/Config.in
+++ b/package/qt5/qt5base/Config.in
@@ -12,7 +12,7 @@ config BR2_PACKAGE_QT5BASE
 	  contains the base Qt libraries: QtCore, QtNetwork, QtGui,
 	  QtWidgets, etc.
 
-	  http://qt-project.org
+	  http://qt.io
 
 if BR2_PACKAGE_QT5BASE
 
diff --git a/package/qt5/qt5base/qt5base.hash b/package/qt5/qt5base/qt5base.hash
index b91b0a9..0097942 100644
--- a/package/qt5/qt5base/qt5base.hash
+++ b/package/qt5/qt5base/qt5base.hash
@@ -1,4 +1,4 @@
-# Hashes from: http://download.qt-project.org/official_releases/qt/5.4/5.4.0/submodules/qtbase-opensource-src-5.4.0.tar.xz.mirrorlist
+# Hashes from: http://download.qt.io/official_releases/qt/5.4/5.4.0/submodules/qtbase-opensource-src-5.4.0.tar.xz.mirrorlist
 sha256 daea240ba5e77bc2d78ec21a2cb664eed83b3d4ad409b6277a6f7d4c0c8e91d1 qtbase-opensource-src-5.4.0.tar.xz
 sha1   2e3d32f32e36a92782ca66c260940824746900bd                         qtbase-opensource-src-5.4.0.tar.xz
 md5    eaaa72a5cb25713ca8d17f3a8d149765                                 qtbase-opensource-src-5.4.0.tar.xz
diff --git a/package/qt5/qt5connectivity/Config.in b/package/qt5/qt5connectivity/Config.in
index de660ca..ca1deab 100644
--- a/package/qt5/qt5connectivity/Config.in
+++ b/package/qt5/qt5connectivity/Config.in
@@ -15,7 +15,7 @@ config BR2_PACKAGE_QT5CONNECTIVITY
 
 	  This package corresponds to the qt5connectivity module.
 
-	  http://qt-project.org
+	  http://qt.io
 
 comment "qt5connectivity needs a toolchain w/ wchar, threads, dynamic library"
 	depends on !BR2_avr32 && BR2_USE_MMU
diff --git a/package/qt5/qt5connectivity/qt5connectivity.hash b/package/qt5/qt5connectivity/qt5connectivity.hash
index c165b8c..8039851 100644
--- a/package/qt5/qt5connectivity/qt5connectivity.hash
+++ b/package/qt5/qt5connectivity/qt5connectivity.hash
@@ -1,4 +1,4 @@
-# Hashes from: http://download.qt-project.org/official_releases/qt/5.4/5.4.0/submodules/qtconnectivity-opensource-src-5.4.0.tar.xz.mirrorlist
+# Hashes from: http://download.qt.io/official_releases/qt/5.4/5.4.0/submodules/qtconnectivity-opensource-src-5.4.0.tar.xz.mirrorlist
 sha256 636685bbcccac28f6c8c2d1bee7c9b06a74bc5c11d9c87a424d80093f19b1038 qtconnectivity-opensource-src-5.4.0.tar.xz
 sha1   08b1e365195cf0ed2d35d5f7fb3d6bda9a9e1dbe                         qtconnectivity-opensource-src-5.4.0.tar.xz
 md5    c1fc247771a2fd1d238db8ffc4e65bbf                                 qtconnectivity-opensource-src-5.4.0.tar.xz
diff --git a/package/qt5/qt5declarative/Config.in b/package/qt5/qt5declarative/Config.in
index edac8cd..eba4c8d 100644
--- a/package/qt5/qt5declarative/Config.in
+++ b/package/qt5/qt5declarative/Config.in
@@ -10,7 +10,7 @@ config BR2_PACKAGE_QT5DECLARATIVE
 
 	  This package corresponds to the qt5declarative module.
 
-	  http://qt-project.org
+	  http://qt.io
 
 if BR2_PACKAGE_QT5DECLARATIVE
 
diff --git a/package/qt5/qt5declarative/qt5declarative.hash b/package/qt5/qt5declarative/qt5declarative.hash
index 23dfb59..d9f7547 100644
--- a/package/qt5/qt5declarative/qt5declarative.hash
+++ b/package/qt5/qt5declarative/qt5declarative.hash
@@ -1,4 +1,4 @@
-# Hashes from: http://download.qt-project.org/official_releases/qt/5.4/5.4.0/submodules/qtdeclarative-opensource-src-5.4.0.tar.xz.mirrorlist
+# Hashes from: http://download.qt.io/official_releases/qt/5.4/5.4.0/submodules/qtdeclarative-opensource-src-5.4.0.tar.xz.mirrorlist
 sha256 e67c9275b0f6869a7c1e8023ad7c0a23fb19f8a8d2f350371e954ead0cfad7b6 qtdeclarative-opensource-src-5.4.0.tar.xz
 sha1   12c12d50c71cfb1f18c7fabfabe4ad4b364b09fe                         qtdeclarative-opensource-src-5.4.0.tar.xz
 md5    4f928e52e72b5e867b50b4d409d5e99b                                 qtdeclarative-opensource-src-5.4.0.tar.xz
diff --git a/package/qt5/qt5enginio/Config.in b/package/qt5/qt5enginio/Config.in
index c06e6da..fcb866c 100644
--- a/package/qt5/qt5enginio/Config.in
+++ b/package/qt5/qt5enginio/Config.in
@@ -10,4 +10,4 @@ config BR2_PACKAGE_QT5ENGINIO
 
 	  This package corresponds to the qt5enginio module.
 
-	  http://qt-project.org
+	  http://qt.io
diff --git a/package/qt5/qt5enginio/qt5enginio.hash b/package/qt5/qt5enginio/qt5enginio.hash
index a9d4ab8..921a0e6 100644
--- a/package/qt5/qt5enginio/qt5enginio.hash
+++ b/package/qt5/qt5enginio/qt5enginio.hash
@@ -1,4 +1,4 @@
-# Hashes from: http://download.qt-project.org/official_releases/qt/5.4/5.4.0/submodules/qtenginio-opensource-src-5.4.0.tar.xz.mirrorlist
+# Hashes from: http://download.qt.io/official_releases/qt/5.4/5.4.0/submodules/qtenginio-opensource-src-5.4.0.tar.xz.mirrorlist
 sha256 fa0954e5f100d38291fd3b3c8c92ade11710b25ae48018af7451c631982d924c qtenginio-opensource-src-5.4.0.tar.xz
 sha1   ec754e21ee461f9a41d66343fb24dcaa358a4a05                         qtenginio-opensource-src-5.4.0.tar.xz
 md5    959a9ebac4faa0464368a318fa677ab6                                 qtenginio-opensource-src-5.4.0.tar.xz
diff --git a/package/qt5/qt5graphicaleffects/Config.in b/package/qt5/qt5graphicaleffects/Config.in
index 0a83638..a42e1f8 100644
--- a/package/qt5/qt5graphicaleffects/Config.in
+++ b/package/qt5/qt5graphicaleffects/Config.in
@@ -10,7 +10,7 @@ config BR2_PACKAGE_QT5GRAPHICALEFFECTS
 
 	  This package corresponds to the qt5graphicaleffects module.
 
-	  http://qt-project.org
+	  http://qt.io
 
 comment "qt5graphicaleffects needs an OpenGL-capable backend"
 	depends on !BR2_PACKAGE_QT5_GL_AVAILABLE
diff --git a/package/qt5/qt5graphicaleffects/qt5graphicaleffects.hash b/package/qt5/qt5graphicaleffects/qt5graphicaleffects.hash
index 1d4f338..771e823 100644
--- a/package/qt5/qt5graphicaleffects/qt5graphicaleffects.hash
+++ b/package/qt5/qt5graphicaleffects/qt5graphicaleffects.hash
@@ -1,4 +1,4 @@
-# Hashes from: http://download.qt-project.org/official_releases/qt/5.4/5.4.0/submodules/qtgraphicaleffects-opensource-src-5.4.0.tar.xz.mirrorlist
+# Hashes from: http://download.qt.io/official_releases/qt/5.4/5.4.0/submodules/qtgraphicaleffects-opensource-src-5.4.0.tar.xz.mirrorlist
 sha256 a43f10e532180eb8400fec65752b36c1adaa9aaf672146035ef630d324a38b19 qtgraphicaleffects-opensource-src-5.4.0.tar.xz
 sha1   b83755ae9457d7a43691e6668a7f7330ff373bdf                         qtgraphicaleffects-opensource-src-5.4.0.tar.xz
 md5    4d26d56c55b0117c37d96e85755da6a4                                 qtgraphicaleffects-opensource-src-5.4.0.tar.xz
diff --git a/package/qt5/qt5imageformats/Config.in b/package/qt5/qt5imageformats/Config.in
index f976caf..4dd848e 100644
--- a/package/qt5/qt5imageformats/Config.in
+++ b/package/qt5/qt5imageformats/Config.in
@@ -8,4 +8,4 @@ config BR2_PACKAGE_QT5IMAGEFORMATS
 
 	  This package corresponds to the qt5imageformats module.
 
-	  http://qt-project.org
+	  http://qt.io
diff --git a/package/qt5/qt5imageformats/qt5imageformats.hash b/package/qt5/qt5imageformats/qt5imageformats.hash
index 9ab0106..829f94b 100644
--- a/package/qt5/qt5imageformats/qt5imageformats.hash
+++ b/package/qt5/qt5imageformats/qt5imageformats.hash
@@ -1,4 +1,4 @@
-# Hashes from: http://download.qt-project.org/official_releases/qt/5.4/5.4.0/submodules/qtimageformats-opensource-src-5.4.0.tar.xz.mirrorlist
+# Hashes from: http://download.qt.io/official_releases/qt/5.4/5.4.0/submodules/qtimageformats-opensource-src-5.4.0.tar.xz.mirrorlist
 sha256 c89b678df71e44f8cff7b5f8362b7d61430a7aa7cd70147be1267d87ac8fe046 qtimageformats-opensource-src-5.4.0.tar.xz
 sha1   6590b61c51a186837c3d2058d8192886d970f92a                         qtimageformats-opensource-src-5.4.0.tar.xz
 md5    608dbe53d5d3a0872eb20025b681d1dc                                 qtimageformats-opensource-src-5.4.0.tar.xz
diff --git a/package/qt5/qt5multimedia/Config.in b/package/qt5/qt5multimedia/Config.in
index 36128eb..59c3984 100644
--- a/package/qt5/qt5multimedia/Config.in
+++ b/package/qt5/qt5multimedia/Config.in
@@ -9,4 +9,4 @@ config BR2_PACKAGE_QT5MULTIMEDIA
 
 	  This package corresponds to the qt5multimedia module.
 
-	  http://qt-project.org
+	  http://qt.io
diff --git a/package/qt5/qt5multimedia/qt5multimedia.hash b/package/qt5/qt5multimedia/qt5multimedia.hash
index 6193492..438bcb3 100644
--- a/package/qt5/qt5multimedia/qt5multimedia.hash
+++ b/package/qt5/qt5multimedia/qt5multimedia.hash
@@ -1,4 +1,4 @@
-# Hashes from: http://download.qt-project.org/official_releases/qt/5.4/5.4.0/submodules/qtmultimedia-opensource-src-5.4.0.tar.xz.mirrorlist
+# Hashes from: http://download.qt.io/official_releases/qt/5.4/5.4.0/submodules/qtmultimedia-opensource-src-5.4.0.tar.xz.mirrorlist
 sha256 5ab9dba27ae64123f2d0124b6884da276d8982aa959d65aa44125f758ef9af51 qtmultimedia-opensource-src-5.4.0.tar.xz
 sha1   a66fe5538f554957f60fc160121a3b0e7e72753b                         qtmultimedia-opensource-src-5.4.0.tar.xz
 md5    3a6a415813b54a54cf283a5e2906e012                                 qtmultimedia-opensource-src-5.4.0.tar.xz
diff --git a/package/qt5/qt5quick1/Config.in b/package/qt5/qt5quick1/Config.in
index c44a15f..16076eb 100644
--- a/package/qt5/qt5quick1/Config.in
+++ b/package/qt5/qt5quick1/Config.in
@@ -15,7 +15,7 @@ config BR2_PACKAGE_QT5QUICK1
 
 	  This package corresponds to the qt5quick1 module.
 
-	  http://qt-project.org
+	  http://qt.io
 
 comment "qt5quick1 needs a toolchain w/ dynamic library"
 	depends on BR2_PACKAGE_QT5_JSCORE_AVAILABLE
diff --git a/package/qt5/qt5quick1/qt5quick1.hash b/package/qt5/qt5quick1/qt5quick1.hash
index a51b7ec..aae2b26 100644
--- a/package/qt5/qt5quick1/qt5quick1.hash
+++ b/package/qt5/qt5quick1/qt5quick1.hash
@@ -1,4 +1,4 @@
-# Hashes from: http://download.qt-project.org/official_releases/qt/5.4/5.4.0/submodules/qtquick1-opensource-src-5.4.0.tar.xz.mirrorlist
+# Hashes from: http://download.qt.io/official_releases/qt/5.4/5.4.0/submodules/qtquick1-opensource-src-5.4.0.tar.xz.mirrorlist
 sha256 d5a8b77c1c4832383f3c5a39c6dc60e992e61e684e7fbbdf9a208c31d9d032dc qtquick1-opensource-src-5.4.0.tar.xz
 sha1   d4af107f1227f111b7a65924d2ce5e3c08c7ee20                         qtquick1-opensource-src-5.4.0.tar.xz
 md5    c1c5b1072137773d308c8b498cf35d05                                 qtquick1-opensource-src-5.4.0.tar.xz
diff --git a/package/qt5/qt5quickcontrols/Config.in b/package/qt5/qt5quickcontrols/Config.in
index aae3d89..0fe8465 100644
--- a/package/qt5/qt5quickcontrols/Config.in
+++ b/package/qt5/qt5quickcontrols/Config.in
@@ -10,7 +10,7 @@ config BR2_PACKAGE_QT5QUICKCONTROLS
 
 	  This package corresponds to the qt5quickcontrols module.
 
-	  http://qt-project.org
+	  http://qt.io
 
 comment "qt5quickcontrols needs an OpenGL-capable backend"
 	depends on !BR2_PACKAGE_QT5_GL_AVAILABLE
diff --git a/package/qt5/qt5quickcontrols/qt5quickcontrols.hash b/package/qt5/qt5quickcontrols/qt5quickcontrols.hash
index ad81f7e..3fe4e18 100644
--- a/package/qt5/qt5quickcontrols/qt5quickcontrols.hash
+++ b/package/qt5/qt5quickcontrols/qt5quickcontrols.hash
@@ -1,4 +1,4 @@
-# Hashes from: http://download.qt-project.org/official_releases/qt/5.4/5.4.0/submodules/qtquickcontrols-opensource-src-5.4.0.tar.xz.mirrorlist
+# Hashes from: http://download.qt.io/official_releases/qt/5.4/5.4.0/submodules/qtquickcontrols-opensource-src-5.4.0.tar.xz.mirrorlist
 sha256 b59f43333291c3e73f9a9f92706a4c98d4d810b4efd6803a4edd3f1658fae61e qtquickcontrols-opensource-src-5.4.0.tar.xz
 sha1   1d8dd4a0b1c69e14805c59d4676c8406c65a4114                         qtquickcontrols-opensource-src-5.4.0.tar.xz
 md5    6d2b408526b6197ff2edc32ac3238252                                 qtquickcontrols-opensource-src-5.4.0.tar.xz
diff --git a/package/qt5/qt5script/Config.in b/package/qt5/qt5script/Config.in
index f755d1e..5313e90 100644
--- a/package/qt5/qt5script/Config.in
+++ b/package/qt5/qt5script/Config.in
@@ -8,4 +8,4 @@ config BR2_PACKAGE_QT5SCRIPT
 
 	  This package corresponds to the qt5script module.
 
-	  http://qt-project.org
+	  http://qt.io
diff --git a/package/qt5/qt5script/qt5script.hash b/package/qt5/qt5script/qt5script.hash
index ae2aea6..19068d3 100644
--- a/package/qt5/qt5script/qt5script.hash
+++ b/package/qt5/qt5script/qt5script.hash
@@ -1,4 +1,4 @@
-# Hashes from: http://download.qt-project.org/official_releases/qt/5.4/5.4.0/submodules/qtscript-opensource-src-5.4.0.tar.xz.mirrorlist
+# Hashes from: http://download.qt.io/official_releases/qt/5.4/5.4.0/submodules/qtscript-opensource-src-5.4.0.tar.xz.mirrorlist
 sha256 f5f35702ec36f24b17878348af1aa1ecf93056a9ddf475097b3fdd52c3330ed0 qtscript-opensource-src-5.4.0.tar.xz
 sha1   7ca8d6ccbc97fb24a9e76b69eeaa5e7e9c321955                         qtscript-opensource-src-5.4.0.tar.xz
 md5    b38b35643d85aea25ff1cbea84f76a82                                 qtscript-opensource-src-5.4.0.tar.xz
diff --git a/package/qt5/qt5sensors/Config.in b/package/qt5/qt5sensors/Config.in
index 3e1c4b7..741ebba 100644
--- a/package/qt5/qt5sensors/Config.in
+++ b/package/qt5/qt5sensors/Config.in
@@ -7,4 +7,4 @@ config BR2_PACKAGE_QT5SENSORS
 
 	  This package corresponds to the qt5sensors module.
 
-	  http://qt-project.org
+	  http://qt.io
diff --git a/package/qt5/qt5sensors/qt5sensors.hash b/package/qt5/qt5sensors/qt5sensors.hash
index e703945..65dd262 100644
--- a/package/qt5/qt5sensors/qt5sensors.hash
+++ b/package/qt5/qt5sensors/qt5sensors.hash
@@ -1,4 +1,4 @@
-# Hashes from: http://download.qt-project.org/official_releases/qt/5.4/5.4.0/submodules/qtsensors-opensource-src-5.4.0.tar.xz.mirrorlist
+# Hashes from: http://download.qt.io/official_releases/qt/5.4/5.4.0/submodules/qtsensors-opensource-src-5.4.0.tar.xz.mirrorlist
 sha256 8a0f33ccf572b9fbcdc46fca602d75270979a2f851b6a1f399d039b1f7aae159 qtsensors-opensource-src-5.4.0.tar.xz
 sha1   5fe798541707acfe7a4955076a0d27d8d58f4d15                         qtsensors-opensource-src-5.4.0.tar.xz
 md5    044f7d3f92c45dd76072077826ca4a07                                 qtsensors-opensource-src-5.4.0.tar.xz
diff --git a/package/qt5/qt5serialport/Config.in b/package/qt5/qt5serialport/Config.in
index 772de88..c419d17 100644
--- a/package/qt5/qt5serialport/Config.in
+++ b/package/qt5/qt5serialport/Config.in
@@ -7,4 +7,4 @@ config BR2_PACKAGE_QT5SERIALPORT
 
 	  This package corresponds to the qt5serialport module.
 
-	  http://qt-project.org
+	  http://qt.io
diff --git a/package/qt5/qt5serialport/qt5serialport.hash b/package/qt5/qt5serialport/qt5serialport.hash
index c99670d..0259ec4 100644
--- a/package/qt5/qt5serialport/qt5serialport.hash
+++ b/package/qt5/qt5serialport/qt5serialport.hash
@@ -1,4 +1,4 @@
-# Hashes from: http://download.qt-project.org/official_releases/qt/5.4/5.4.0/submodules/qtserialport-opensource-src-5.4.0.tar.xz.mirrorlist
+# Hashes from: http://download.qt.io/official_releases/qt/5.4/5.4.0/submodules/qtserialport-opensource-src-5.4.0.tar.xz.mirrorlist
 sha256 0fc619ef714f5b920ff19ec811b6459c849fafcc697ef4091dbb74e45bd058c3 qtserialport-opensource-src-5.4.0.tar.xz
 sha1   ccfc39045d803405ec36bcfdbf281417dd96663a                         qtserialport-opensource-src-5.4.0.tar.xz
 md5    691b0b71e4ad791a37e288b41979662c                                 qtserialport-opensource-src-5.4.0.tar.xz
diff --git a/package/qt5/qt5svg/Config.in b/package/qt5/qt5svg/Config.in
index 27e6b05..e1acafb 100644
--- a/package/qt5/qt5svg/Config.in
+++ b/package/qt5/qt5svg/Config.in
@@ -8,4 +8,4 @@ config BR2_PACKAGE_QT5SVG
 
 	  This package corresponds to the qt5svg module.
 
-	  http://qt-project.org
+	  http://qt.io
diff --git a/package/qt5/qt5svg/qt5svg.hash b/package/qt5/qt5svg/qt5svg.hash
index f5412be..82bb663 100644
--- a/package/qt5/qt5svg/qt5svg.hash
+++ b/package/qt5/qt5svg/qt5svg.hash
@@ -1,4 +1,4 @@
-# Hashes from: http://download.qt-project.org/official_releases/qt/5.4/5.4.0/submodules/qtsvg-opensource-src-5.4.0.tar.xz.mirrorlist
+# Hashes from: http://download.qt.io/official_releases/qt/5.4/5.4.0/submodules/qtsvg-opensource-src-5.4.0.tar.xz.mirrorlist
 sha256 68ee762bacc7b63aea29f446549ee6daae46e6fe2120e2460f30d47accc2b789 qtsvg-opensource-src-5.4.0.tar.xz
 sha1   b49d9974dd83c82887a076f9093250cb9fcceea7                         qtsvg-opensource-src-5.4.0.tar.xz
 md5    1c9921a44060bd98096b105c97556e68                                 qtsvg-opensource-src-5.4.0.tar.xz
diff --git a/package/qt5/qt5webkit-examples/Config.in b/package/qt5/qt5webkit-examples/Config.in
index 6260f03..e7610c2 100644
--- a/package/qt5/qt5webkit-examples/Config.in
+++ b/package/qt5/qt5webkit-examples/Config.in
@@ -7,4 +7,4 @@ config BR2_PACKAGE_QT5WEBKIT_EXAMPLES
 
 	  This package contains examples for the qt5webkit module.
 
-	  http://qt-project.org
+	  http://qt.io
diff --git a/package/qt5/qt5webkit-examples/qt5webkit-examples.hash b/package/qt5/qt5webkit-examples/qt5webkit-examples.hash
index 9061b4e..b0c3bad 100644
--- a/package/qt5/qt5webkit-examples/qt5webkit-examples.hash
+++ b/package/qt5/qt5webkit-examples/qt5webkit-examples.hash
@@ -1,4 +1,4 @@
-# Hashes from: http://download.qt-project.org/official_releases/qt/5.4/5.4.0/submodules/qtwebkit-examples-opensource-src-5.4.0.tar.xz.mirrorlist
+# Hashes from: http://download.qt.io/official_releases/qt/5.4/5.4.0/submodules/qtwebkit-examples-opensource-src-5.4.0.tar.xz.mirrorlist
 sha256 b02a2f3d381e66e83fbf972416ad376e2a03ccfa8b4371867c83970bf0f0e9f6 qtwebkit-examples-opensource-src-5.4.0.tar.xz
 sha1   5c03fb53826f22891739b8d537257070aef7e07a                         qtwebkit-examples-opensource-src-5.4.0.tar.xz
 md5    369617a40e64b93686cebd12a99916c0                                 qtwebkit-examples-opensource-src-5.4.0.tar.xz
diff --git a/package/qt5/qt5webkit/Config.in b/package/qt5/qt5webkit/Config.in
index 25f0a85..419e393 100644
--- a/package/qt5/qt5webkit/Config.in
+++ b/package/qt5/qt5webkit/Config.in
@@ -15,4 +15,4 @@ config BR2_PACKAGE_QT5WEBKIT
 
 	  This package corresponds to the qt5webkit module.
 
-	  http://qt-project.org
+	  http://qt.io
diff --git a/package/qt5/qt5webkit/qt5webkit.hash b/package/qt5/qt5webkit/qt5webkit.hash
index ac5c444..e234f8a 100644
--- a/package/qt5/qt5webkit/qt5webkit.hash
+++ b/package/qt5/qt5webkit/qt5webkit.hash
@@ -1,4 +1,4 @@
-# Hashes from: http://download.qt-project.org/official_releases/qt/5.4/5.4.0/submodules/qtwebkit-opensource-src-5.4.0.tar.xz.mirrorlist
+# Hashes from: http://download.qt.io/official_releases/qt/5.4/5.4.0/submodules/qtwebkit-opensource-src-5.4.0.tar.xz.mirrorlist
 sha256 6c672207765d5d2e88aa14b72b3876ad7bce453397a02e1a3d6e4670a8d188c1 qtwebkit-opensource-src-5.4.0.tar.xz
 sha1   e5e92e126bb673dadc329bc726c21bf4f994d829                         qtwebkit-opensource-src-5.4.0.tar.xz
 md5    e62d72c410dffe5129043f80f624c896                                 qtwebkit-opensource-src-5.4.0.tar.xz
diff --git a/package/qt5/qt5websockets/Config.in b/package/qt5/qt5websockets/Config.in
index be693c7..385a07c 100644
--- a/package/qt5/qt5websockets/Config.in
+++ b/package/qt5/qt5websockets/Config.in
@@ -8,4 +8,4 @@ config BR2_PACKAGE_QT5WEBSOCKETS
 
 	  This package corresponds to the qt5websockets module.
 
-	  http://qt-project.org
+	  http://qt.io
diff --git a/package/qt5/qt5websockets/qt5websockets.hash b/package/qt5/qt5websockets/qt5websockets.hash
index 352be50..748c97d 100644
--- a/package/qt5/qt5websockets/qt5websockets.hash
+++ b/package/qt5/qt5websockets/qt5websockets.hash
@@ -1,4 +1,4 @@
-# Hashes from: http://download.qt-project.org/official_releases/qt/5.4/5.4.0/submodules/qtwebsockets-opensource-src-5.4.0.tar.xz.mirrorlist
+# Hashes from: http://download.qt.io/official_releases/qt/5.4/5.4.0/submodules/qtwebsockets-opensource-src-5.4.0.tar.xz.mirrorlist
 sha256 2acd274a4a983cdd2288678d9005429fded51b5277d0621c4a953fa4f4f4cbdf qtwebsockets-opensource-src-5.4.0.tar.xz
 sha1   d0b7e62bbdd634de01d5321f94a4bdff8b228cf5                         qtwebsockets-opensource-src-5.4.0.tar.xz
 md5    0c406bca48296d0d99cc93b00f40aca7                                 qtwebsockets-opensource-src-5.4.0.tar.xz
diff --git a/package/qt5/qt5x11extras/Config.in b/package/qt5/qt5x11extras/Config.in
index 79ff9b9..6fc2c0a 100644
--- a/package/qt5/qt5x11extras/Config.in
+++ b/package/qt5/qt5x11extras/Config.in
@@ -8,4 +8,4 @@ config BR2_PACKAGE_QT5X11EXTRAS
 
 	  This package corresponds to the qt5x11extras module.
 
-	  http://qt-project.org
+	  http://qt.io
diff --git a/package/qt5/qt5x11extras/qt5x11extras.hash b/package/qt5/qt5x11extras/qt5x11extras.hash
index a6de3e7..4a84232 100644
--- a/package/qt5/qt5x11extras/qt5x11extras.hash
+++ b/package/qt5/qt5x11extras/qt5x11extras.hash
@@ -1,4 +1,4 @@
-# Hashes from: http://download.qt-project.org/official_releases/qt/5.4/5.4.0/submodules/qtx11extras-opensource-src-5.4.0.tar.xz.mirrorlist
+# Hashes from: http://download.qt.io/official_releases/qt/5.4/5.4.0/submodules/qtx11extras-opensource-src-5.4.0.tar.xz.mirrorlist
 sha256 a3c66bc9e2b877109073f27bbc7865489fa1ed548584f5fc87c371380dc1474c qtx11extras-opensource-src-5.4.0.tar.xz
 sha1   999026cf8389c66af22ffb29767b87b1a793595b                         qtx11extras-opensource-src-5.4.0.tar.xz
 md5    f3a7b9b20dd5f19fc5ed12ef030c59b7                                 qtx11extras-opensource-src-5.4.0.tar.xz
diff --git a/package/qt5/qt5xmlpatterns/Config.in b/package/qt5/qt5xmlpatterns/Config.in
index 6ea7466..8c82656 100644
--- a/package/qt5/qt5xmlpatterns/Config.in
+++ b/package/qt5/qt5xmlpatterns/Config.in
@@ -7,4 +7,4 @@ config BR2_PACKAGE_QT5XMLPATTERNS
 
 	  This package corresponds to the qt5xmlpatterns module.
 
-	  http://qt-project.org
+	  http://qt.io
diff --git a/package/qt5/qt5xmlpatterns/qt5xmlpatterns.hash b/package/qt5/qt5xmlpatterns/qt5xmlpatterns.hash
index 0ca8dac..da769dc 100644
--- a/package/qt5/qt5xmlpatterns/qt5xmlpatterns.hash
+++ b/package/qt5/qt5xmlpatterns/qt5xmlpatterns.hash
@@ -1,4 +1,4 @@
-# Hashes from: http://download.qt-project.org/official_releases/qt/5.4/5.4.0/submodules/qtxmlpatterns-opensource-src-5.4.0.tar.xz.mirrorlist
+# Hashes from: http://download.qt.io/official_releases/qt/5.4/5.4.0/submodules/qtxmlpatterns-opensource-src-5.4.0.tar.xz.mirrorlist
 sha256 791c697b9bc7a5384e3d0dbec56af7f2194fe7dc91f8b1e0fd502089135e5425 qtxmlpatterns-opensource-src-5.4.0.tar.xz
 sha1   e6d08bca4186b8c10e669836e5f6133ad59c9cce                         qtxmlpatterns-opensource-src-5.4.0.tar.xz
 md5    5ad30d6b478d4e5d71e9c5bef3f3fbf7                                 qtxmlpatterns-opensource-src-5.4.0.tar.xz
-- 
1.9.1
