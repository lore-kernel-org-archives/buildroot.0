From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 18 Jul 2018 22:48:47 +0200
Subject: [Buildroot] [git commit branch/2018.02.x] qt5: bump latest version
 to 5.9.6
Message-ID: <20180718204431.D781F88C7F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f2ea7e2ad18c9392bbee0f2781b6915e57c3d609
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

Signed-off-by: S??bastien Szymanski <sebastien.szymanski@armadeus.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/qt5/qt5.mk                                       | 2 +-
 package/qt5/qt53d/qt53d.hash                             | 4 ++--
 package/qt5/qt5base/qt5base.hash                         | 4 ++--
 package/qt5/qt5canvas3d/qt5canvas3d.hash                 | 4 ++--
 package/qt5/qt5charts/qt5charts.hash                     | 4 ++--
 package/qt5/qt5connectivity/qt5connectivity.hash         | 4 ++--
 package/qt5/qt5declarative/qt5declarative.hash           | 4 ++--
 package/qt5/qt5graphicaleffects/qt5graphicaleffects.hash | 4 ++--
 package/qt5/qt5imageformats/qt5imageformats.hash         | 4 ++--
 package/qt5/qt5location/qt5location.hash                 | 4 ++--
 package/qt5/qt5multimedia/qt5multimedia.hash             | 4 ++--
 package/qt5/qt5quickcontrols/qt5quickcontrols.hash       | 4 ++--
 package/qt5/qt5quickcontrols2/qt5quickcontrols2.hash     | 4 ++--
 package/qt5/qt5script/qt5script.hash                     | 4 ++--
 package/qt5/qt5scxml/qt5scxml.hash                       | 4 ++--
 package/qt5/qt5sensors/qt5sensors.hash                   | 4 ++--
 package/qt5/qt5serialbus/qt5serialbus.hash               | 4 ++--
 package/qt5/qt5serialport/qt5serialport.hash             | 4 ++--
 package/qt5/qt5svg/qt5svg.hash                           | 4 ++--
 package/qt5/qt5tools/qt5tools.hash                       | 4 ++--
 package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.hash   | 4 ++--
 package/qt5/qt5wayland/qt5wayland.hash                   | 4 ++--
 package/qt5/qt5webchannel/qt5webchannel.hash             | 4 ++--
 package/qt5/qt5webengine/qt5webengine.hash               | 4 ++--
 package/qt5/qt5websockets/qt5websockets.hash             | 4 ++--
 package/qt5/qt5x11extras/qt5x11extras.hash               | 4 ++--
 package/qt5/qt5xmlpatterns/qt5xmlpatterns.hash           | 4 ++--
 27 files changed, 53 insertions(+), 53 deletions(-)

diff --git a/package/qt5/qt5.mk b/package/qt5/qt5.mk
index 3c03c10066..84b7a4a469 100644
--- a/package/qt5/qt5.mk
+++ b/package/qt5/qt5.mk
@@ -6,7 +6,7 @@
 
 ifeq ($(BR2_PACKAGE_QT5_VERSION_LATEST),y)
 QT5_VERSION_MAJOR = 5.9
-QT5_VERSION = $(QT5_VERSION_MAJOR).4
+QT5_VERSION = $(QT5_VERSION_MAJOR).6
 else
 QT5_VERSION_MAJOR = 5.6
 QT5_VERSION = $(QT5_VERSION_MAJOR).3
diff --git a/package/qt5/qt53d/qt53d.hash b/package/qt5/qt53d/qt53d.hash
index 9d629eb540..dfa595dcc4 100644
--- a/package/qt5/qt53d/qt53d.hash
+++ b/package/qt5/qt53d/qt53d.hash
@@ -1,8 +1,8 @@
 # Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qt3d-opensource-src-5.6.3.tar.xz.mirrorlist
 sha256 10d05a30e925fcad971126c7f47a5e32c39f007dab96b298b2094501f9607ffe qt3d-opensource-src-5.6.3.tar.xz
 
-# Hash from: https://download.qt.io/official_releases/qt/5.9/5.9.4/submodules/qt3d-opensource-src-5.9.4.tar.xz.mirrorlist
-sha256 ad18b1c98a100025a96d600008c9478f646432c9e8cf11fb9a405c55f1970550 qt3d-opensource-src-5.9.4.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.9/5.9.6/submodules/qt3d-opensource-src-5.9.6.tar.xz.mirrorlist
+sha256 c89cbc12fde5a279e5b127651a194cae75003ba8113f9e7e7b24e67495ecff09  qt3d-opensource-src-5.9.6.tar.xz
 
 # Hashes for license files:
 sha256 edfe70e99be2a7c109d860b19204609e582720b211c50caedac729da372a1253 LICENSE.GPL
diff --git a/package/qt5/qt5base/qt5base.hash b/package/qt5/qt5base/qt5base.hash
index a72d8cd4da..950785c0de 100644
--- a/package/qt5/qt5base/qt5base.hash
+++ b/package/qt5/qt5base/qt5base.hash
@@ -1,8 +1,8 @@
 # Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtbase-opensource-src-5.6.3.tar.xz.mirrorlist
 sha256 fef48529a6fc2617a30d75d952cb327c6be341fd104154993922184b3b3b4da1 qtbase-opensource-src-5.6.3.tar.xz
 
-# Hash from: https://download.qt.io/official_releases/qt/5.9/5.9.4/submodules/qtbase-opensource-src-5.9.4.tar.xz.mirrorlist
-sha256 69e6bde3ab00673a77e1506173551fec7d0cd899fcbf9b1260517db1b61004cf qtbase-opensource-src-5.9.4.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.9/5.9.6/submodules/qtbase-opensource-src-5.9.6.tar.xz.mirrorlist
+sha256 eed620cb268b199bd83b3fc6a471c51d51e1dc2dbb5374fc97a0cc75facbe36f  qtbase-opensource-src-5.9.6.tar.xz
 
 # Hashes for license files:
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
diff --git a/package/qt5/qt5canvas3d/qt5canvas3d.hash b/package/qt5/qt5canvas3d/qt5canvas3d.hash
index 68d1691d3d..be353fbc4e 100644
--- a/package/qt5/qt5canvas3d/qt5canvas3d.hash
+++ b/package/qt5/qt5canvas3d/qt5canvas3d.hash
@@ -1,8 +1,8 @@
 # Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtcanvas3d-opensource-src-5.6.3.tar.xz.mirrorlist
 sha256 e99e0e159f2fba539b7947a1921072f6807f20958d32809edbf12aac571f56ff qtcanvas3d-opensource-src-5.6.3.tar.xz
 
-# Hash from: https://download.qt.io/official_releases/qt/5.9/5.9.4/submodules/qtcanvas3d-opensource-src-5.9.4.tar.xz.mirrorlist
-sha256 ef358503e2f243c2e162c3fef2181707ff3485376198d8e4fcc6d979e6ebed29 qtcanvas3d-opensource-src-5.9.4.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.9/5.9.6/submodules/qtcanvas3d-opensource-src-5.9.6.tar.xz.mirrorlist
+sha256 9da45991f62152c2c76931aed8a6059375fdce441b38752991e1ad2c77507c22  qtcanvas3d-opensource-src-5.9.6.tar.xz
 
 # Hashes for license files:
 sha256 edfe70e99be2a7c109d860b19204609e582720b211c50caedac729da372a1253 LICENSE.GPLv2
diff --git a/package/qt5/qt5charts/qt5charts.hash b/package/qt5/qt5charts/qt5charts.hash
index a0c2d0d739..84e8959178 100644
--- a/package/qt5/qt5charts/qt5charts.hash
+++ b/package/qt5/qt5charts/qt5charts.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/5.9/5.9.4/submodules/qtcharts-opensource-src-5.9.4.tar.xz.mirrorlist
-sha256 75f72983fde6720a093d5f065d33f47e77a4bd2188ae9d41ebb9a4fcc459d3e7 qtcharts-opensource-src-5.9.4.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.9/5.9.6/submodules/qtcharts-opensource-src-5.9.6.tar.xz.mirrorlist
+sha256 5fd60f08b1815b0e7b813c75a0ec726bffc7cc686b160bebf1e710e882ceadab  qtcharts-opensource-src-5.9.6.tar.xz
 
 # Hashes for license files:
 sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903 LICENSE.GPL3
diff --git a/package/qt5/qt5connectivity/qt5connectivity.hash b/package/qt5/qt5connectivity/qt5connectivity.hash
index 21d0ded4e0..1da448ad5e 100644
--- a/package/qt5/qt5connectivity/qt5connectivity.hash
+++ b/package/qt5/qt5connectivity/qt5connectivity.hash
@@ -1,5 +1,5 @@
 # Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtconnectivity-opensource-src-5.6.3.tar.xz.mirrorlist
 sha256 fa406e3d63fa4a2acc8ecae6d110f20c766f19a21c7061a12f3c167deb07ccde qtconnectivity-opensource-src-5.6.3.tar.xz
 
-# Hash from: https://download.qt.io/official_releases/qt/5.9/5.9.4/submodules/qtconnectivity-opensource-src-5.9.4.tar.xz.mirrorlist
-sha256 dba750363bf55648a08bc44372f423d31f405f6deac5393f0b76376a3e9e0c8b qtconnectivity-opensource-src-5.9.4.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.9/5.9.6/submodules/qtconnectivity-opensource-src-5.9.6.tar.xz.mirrorlist
+sha256 6c696855c2d4e63709ba81d22c85cab30f66418eac2fb2810a02a4b47a531c57  qtconnectivity-opensource-src-5.9.6.tar.xz
diff --git a/package/qt5/qt5declarative/qt5declarative.hash b/package/qt5/qt5declarative/qt5declarative.hash
index 308a4f0f56..9bbda42210 100644
--- a/package/qt5/qt5declarative/qt5declarative.hash
+++ b/package/qt5/qt5declarative/qt5declarative.hash
@@ -1,8 +1,8 @@
 # Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtdeclarative-opensource-src-5.6.3.tar.xz.mirrorlist
 sha256 f63fc053d0d16b8a9ca9308f8ead77874b470ae31b66057e2bd336bf648191fc qtdeclarative-opensource-src-5.6.3.tar.xz
 
-# Hash from: https://download.qt.io/official_releases/qt/5.9/5.9.4/submodules/qtdeclarative-opensource-src-5.9.4.tar.xz.mirrorlist
-sha256 dc638a3b207dd2c6607a21415f6dd8d760568535dfe4b485fdb4576c98832d65 qtdeclarative-opensource-src-5.9.4.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.9/5.9.6/submodules/qtdeclarative-opensource-src-5.9.6.tar.xz.mirrorlist
+sha256 058fd99a779a753fc5f5e887f1afb799aa53b9f010faa06374b1cfb6fc8bad8a  qtdeclarative-opensource-src-5.9.6.tar.xz
 
 # Hashes for license files:
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
diff --git a/package/qt5/qt5graphicaleffects/qt5graphicaleffects.hash b/package/qt5/qt5graphicaleffects/qt5graphicaleffects.hash
index 9a1bbdac32..c7f9312938 100644
--- a/package/qt5/qt5graphicaleffects/qt5graphicaleffects.hash
+++ b/package/qt5/qt5graphicaleffects/qt5graphicaleffects.hash
@@ -1,8 +1,8 @@
 # Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtgraphicaleffects-opensource-src-5.6.3.tar.xz.mirrorlist
 sha256 c742592d5e45b122b29df60b69be23ba7c817f2dc471db86e054f6ea24a999ed qtgraphicaleffects-opensource-src-5.6.3.tar.xz
 
-# Hash from: https://download.qt.io/official_releases/qt/5.9/5.9.4/submodules/qtgraphicaleffects-opensource-src-5.9.4.tar.xz.mirrorlist
-sha256 97f75327d7d20ec02e920f1c86ee2bc4063396833d93215e509e95c58e24b8ef qtgraphicaleffects-opensource-src-5.9.4.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.9/5.9.6/submodules/qtgraphicaleffects-opensource-src-5.9.6.tar.xz.mirrorlist
+sha256 5f98bc62e8f27bd13853e90306e7e10f47fb06d7cd38f2e7be76bd907ef37154  qtgraphicaleffects-opensource-src-5.9.6.tar.xz
 
 # Hashes for license files:
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
diff --git a/package/qt5/qt5imageformats/qt5imageformats.hash b/package/qt5/qt5imageformats/qt5imageformats.hash
index 37d0519ed4..d24e550514 100644
--- a/package/qt5/qt5imageformats/qt5imageformats.hash
+++ b/package/qt5/qt5imageformats/qt5imageformats.hash
@@ -1,8 +1,8 @@
 # Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtimageformats-opensource-src-5.6.3.tar.xz.mirrorlist
 sha256 efe4da3c90c976c9b9a2eb6b081d2b8e1435935695104456276ce98e8a5848c3 qtimageformats-opensource-src-5.6.3.tar.xz
 
-# Hash from: https://download.qt.io/official_releases/qt/5.9/5.9.4/submodules/qtimageformats-opensource-src-5.9.4.tar.xz.mirrorlist
-sha256 69e17081a8649b7db138073942d07d2e99f78f4b954ccd6aab3a406e92dbddd9 qtimageformats-opensource-src-5.9.4.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.9/5.9.6/submodules/qtimageformats-opensource-src-5.9.6.tar.xz.mirrorlist
+sha256 158272da5e49a388b43423399592372968984323bfd543a5a992bbd466ff4060  qtimageformats-opensource-src-5.9.6.tar.xz
 
 # Hashes for license files:
 sha256 edfe70e99be2a7c109d860b19204609e582720b211c50caedac729da372a1253 LICENSE.GPLv2
diff --git a/package/qt5/qt5location/qt5location.hash b/package/qt5/qt5location/qt5location.hash
index 3f9ba667c1..a21e707763 100644
--- a/package/qt5/qt5location/qt5location.hash
+++ b/package/qt5/qt5location/qt5location.hash
@@ -1,8 +1,8 @@
 # Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtlocation-opensource-src-5.6.3.tar.xz.mirrorlist
 sha256 b7a81c58cc331fb15bea8fba21d3c9a59f6dc6ad2e4855e30a14ce59a2af1466 qtlocation-opensource-src-5.6.3.tar.xz
 
-# Hash from: https://download.qt.io/official_releases/qt/5.9/5.9.4/submodules/qtlocation-opensource-src-5.9.4.tar.xz.mirrorlist
-sha256 37ed68b0243a30b836cda79802e3f33404b1792f7b845a25b2e4989dc2fed2a0 qtlocation-opensource-src-5.9.4.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.9/5.9.6/submodules/qtlocation-opensource-src-5.9.6.tar.xz.mirrorlist
+sha256 7d65c8e155c617719e2fb56d39f11cf2bc911a43cf6667c124d86cc1a12619c9  qtlocation-opensource-src-5.9.6.tar.xz
 
 # Hashes for license files:
 sha256 edfe70e99be2a7c109d860b19204609e582720b211c50caedac729da372a1253 LICENSE.GPLv2
diff --git a/package/qt5/qt5multimedia/qt5multimedia.hash b/package/qt5/qt5multimedia/qt5multimedia.hash
index 5cb253790a..69a378f409 100644
--- a/package/qt5/qt5multimedia/qt5multimedia.hash
+++ b/package/qt5/qt5multimedia/qt5multimedia.hash
@@ -1,8 +1,8 @@
 # Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtmultimedia-opensource-src-5.6.3.tar.xz.mirrorlist
 sha256 ae36039ea8037742342f1615687e0ca2188f3ed0d700627a5e5be546c15e1b46 qtmultimedia-opensource-src-5.6.3.tar.xz
 
-# Hash from: https://download.qt.io/official_releases/qt/5.9/5.9.4/submodules/qtmultimedia-opensource-src-5.9.4.tar.xz.mirrorlist
-sha256 4952a00712e209ad34241b22cb338bad2f44c42a77316b3b05389faeee1e4e74 qtmultimedia-opensource-src-5.9.4.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.9/5.9.6/submodules/qtmultimedia-opensource-src-5.9.6.tar.xz.mirrorlist
+sha256 9edc11d74e10e4ef857ab38a66700259829e6b5baa4ab0b30655f549d8939fff  qtmultimedia-opensource-src-5.9.6.tar.xz
 
 # Hashes for license files:
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
diff --git a/package/qt5/qt5quickcontrols/qt5quickcontrols.hash b/package/qt5/qt5quickcontrols/qt5quickcontrols.hash
index ca1e217d83..c437073de0 100644
--- a/package/qt5/qt5quickcontrols/qt5quickcontrols.hash
+++ b/package/qt5/qt5quickcontrols/qt5quickcontrols.hash
@@ -1,8 +1,8 @@
 # Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtquickcontrols-opensource-src-5.6.3.tar.xz.mirrorlist
 sha256 31bb0fc8f21b855af6ff02c415be3246128b523d0ef7c05e248e92281ab0db8e qtquickcontrols-opensource-src-5.6.3.tar.xz
 
-# Hash from: https://download.qt.io/official_releases/qt/5.9/5.9.4/submodules/qtquickcontrols-opensource-src-5.9.4.tar.xz.mirrorlist
-sha256 16a205a09bfe9d54c38e9ef555e6f1ecd082576ef2a33cb80b6d49a7ccaed98b qtquickcontrols-opensource-src-5.9.4.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.9/5.9.6/submodules/qtquickcontrols-opensource-src-5.9.6.tar.xz.mirrorlist
+sha256 da4dd353802197c2bb53c92a36cf7749c7d9dc29b4acc919b692683e9c1c3313  qtquickcontrols-opensource-src-5.9.6.tar.xz
 
 # Hashes for license files:
 sha256 edfe70e99be2a7c109d860b19204609e582720b211c50caedac729da372a1253 LICENSE.GPLv2
diff --git a/package/qt5/qt5quickcontrols2/qt5quickcontrols2.hash b/package/qt5/qt5quickcontrols2/qt5quickcontrols2.hash
index 15f23b5e4b..ae6fb01f58 100644
--- a/package/qt5/qt5quickcontrols2/qt5quickcontrols2.hash
+++ b/package/qt5/qt5quickcontrols2/qt5quickcontrols2.hash
@@ -1,8 +1,8 @@
 # Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtquickcontrols2-opensource-src-5.6.3.tar.xz.mirrorlist
 sha256 ec5078470abe2da888c2be5d1749b5961ef5132487c180ce4d4aa19ea7ff81cb qtquickcontrols2-opensource-src-5.6.3.tar.xz
 
-# Hash from: https://download.qt.io/official_releases/qt/5.9/5.9.4/submodules/qtquickcontrols2-opensource-src-5.9.4.tar.xz.mirrorlist
-sha256 1528a7a356e7073f5eeca93ba6e3330ba708d31c3a8f10dc1ce4546d9557640c qtquickcontrols2-opensource-src-5.9.4.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.9/5.9.6/submodules/qtquickcontrols2-opensource-src-5.9.6.tar.xz.mirrorlist
+sha256 24b41ae6acec9372190147736ba31bf0b4467c71cc4b14817e3a82a750481679  qtquickcontrols2-opensource-src-5.9.6.tar.xz
 
 # Hashes for license files:
 sha256 d2cfc059acb4abd8e513cd0a73cd8489f34cbafa7bc34d5d31fb3210821cf8ca LICENSE.GPLv3
diff --git a/package/qt5/qt5script/qt5script.hash b/package/qt5/qt5script/qt5script.hash
index 9b43e5fd65..acbd3dfab4 100644
--- a/package/qt5/qt5script/qt5script.hash
+++ b/package/qt5/qt5script/qt5script.hash
@@ -1,8 +1,8 @@
 # Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtscript-opensource-src-5.6.3.tar.xz.mirrorlist
 sha256 f08720dd0e3a70377c1cb7fa3b129e24f4cdedade279e51b67c9271ab470b389 qtscript-opensource-src-5.6.3.tar.xz
 
-# Hash from: https://download.qt.io/official_releases/qt/5.9/5.9.4/submodules/qtscript-opensource-src-5.9.4.tar.xz.mirrorlist
-sha256 4045da078600b5928f8206341c442cc7f5eec8c51f477f7367072ab5c28ee053 qtscript-opensource-src-5.9.4.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.9/5.9.6/submodules/qtscript-opensource-src-5.9.6.tar.xz.mirrorlist
+sha256 8dbf41abee35be4eb34a56ca3276fac83f3b8671db54c3c7e91c877225727220  qtscript-opensource-src-5.9.6.tar.xz
 
 # Hashes for license files:
 sha256 245248009fd0af1725d183248380e476c1283383909358a13686606352bf2a17 LICENSE.GPLv3
diff --git a/package/qt5/qt5scxml/qt5scxml.hash b/package/qt5/qt5scxml/qt5scxml.hash
index dbe81ecbb6..4a1b3833bb 100644
--- a/package/qt5/qt5scxml/qt5scxml.hash
+++ b/package/qt5/qt5scxml/qt5scxml.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/5.9/5.9.4/submodules/qtscxml-opensource-src-5.9.4.tar.xz.mirrorlist
-sha256 1decc54e157a1492066fe0e7d534c6a9888c096731af7cac9b64c52fd3950b75 qtscxml-opensource-src-5.9.4.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.9/5.9.6/submodules/qtscxml-opensource-src-5.9.6.tar.xz.mirrorlist
+sha256 33947621fd6675c68d67ba11325746a82e7d582599ca0f04e03da4f60d82339a  qtscxml-opensource-src-5.9.6.tar.xz
 
 # Hashes for license files:
 
diff --git a/package/qt5/qt5sensors/qt5sensors.hash b/package/qt5/qt5sensors/qt5sensors.hash
index 1a78d46770..cf26d8f212 100644
--- a/package/qt5/qt5sensors/qt5sensors.hash
+++ b/package/qt5/qt5sensors/qt5sensors.hash
@@ -1,8 +1,8 @@
 # Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtsensors-opensource-src-5.6.3.tar.xz.mirrorlist
 sha256 7502d4dc5571865a7eea2a4180c3be396dfb8ce22df4c4f3d7e9ff32ab334973 qtsensors-opensource-src-5.6.3.tar.xz
 
-# Hash from: https://download.qt.io/official_releases/qt/5.9/5.9.4/submodules/qtsensors-opensource-src-5.9.4.tar.xz.mirrorlist
-sha256 793f3aa056b7ce9ae91acb599eab80525983e5e973bb4a2fdba82776ec9cd458 qtsensors-opensource-src-5.9.4.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.9/5.9.6/submodules/qtsensors-opensource-src-5.9.6.tar.xz.mirrorlist
+sha256 047fac53c555e685c346be53faacf581cb98d9e2a3193cb55f4e7e81fc51de27  qtsensors-opensource-src-5.9.6.tar.xz
 
 # Hashes for license files:
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
diff --git a/package/qt5/qt5serialbus/qt5serialbus.hash b/package/qt5/qt5serialbus/qt5serialbus.hash
index 005fd0b5dc..8a77ab4dc5 100644
--- a/package/qt5/qt5serialbus/qt5serialbus.hash
+++ b/package/qt5/qt5serialbus/qt5serialbus.hash
@@ -1,8 +1,8 @@
 # Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtserialbus-opensource-src-5.6.3.tar.xz.mirrorlist
 sha256 71c89be3879414e2a11cad93a4882758f9259b1c0aec980560309192c99f9a9e qtserialbus-opensource-src-5.6.3.tar.xz
 
-# Hash from: https://download.qt.io/official_releases/qt/5.9/5.9.4/submodules/qtserialbus-opensource-src-5.9.4.tar.xz.mirrorlist
-sha256 ce91402e9781ef6ff37e313ce504b7f6fecb74e83d57d640fcbf82f1133fcbc4 qtserialbus-opensource-src-5.9.4.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.9/5.9.6/submodules/qtserialbus-opensource-src-5.9.6.tar.xz.mirrorlist
+sha256 f3e8d0e6ff836198c9fc5b9a2a89dea3c5d604c63a62126fab6d11c2763f172a  qtserialbus-opensource-src-5.9.6.tar.xz
 
 # Hashes for license files:
 sha256 edfe70e99be2a7c109d860b19204609e582720b211c50caedac729da372a1253 LICENSE.GPLv2
diff --git a/package/qt5/qt5serialport/qt5serialport.hash b/package/qt5/qt5serialport/qt5serialport.hash
index 04122ef804..22542fdc2d 100644
--- a/package/qt5/qt5serialport/qt5serialport.hash
+++ b/package/qt5/qt5serialport/qt5serialport.hash
@@ -1,8 +1,8 @@
 # Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtserialport-opensource-src-5.6.3.tar.xz.mirrorlist
 sha256 082d1fee2703aed19f840c4e4031e37c9b929e5bd8ebef2ebac4b28c509bae1a qtserialport-opensource-src-5.6.3.tar.xz
 
-# Hash from: https://download.qt.io/official_releases/qt/5.9/5.9.4/submodules/qtserialport-opensource-src-5.9.4.tar.xz.mirrorlist
-sha256 0c3d8e2908743c167113ce27be7b685e6f5c827c108107411d0c4c8b2f2b519c qtserialport-opensource-src-5.9.4.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.9/5.9.6/submodules/qtserialport-opensource-src-5.9.6.tar.xz.mirrorlist
+sha256 741dfe9d132aed411ad163304fd4485df2da0b40fe57ebce2f6ed4b4043dfcb9  qtserialport-opensource-src-5.9.6.tar.xz
 
 # Hashes for license files:
 sha256 edfe70e99be2a7c109d860b19204609e582720b211c50caedac729da372a1253 LICENSE.GPLv2
diff --git a/package/qt5/qt5svg/qt5svg.hash b/package/qt5/qt5svg/qt5svg.hash
index a94082c4bf..ee2a77ffc2 100644
--- a/package/qt5/qt5svg/qt5svg.hash
+++ b/package/qt5/qt5svg/qt5svg.hash
@@ -1,8 +1,8 @@
 # Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtsvg-opensource-src-5.6.3.tar.xz.mirrorlist
 sha256 100f183517b46554079beabd8d2cabe3070a74dd0a2e64b6a304eac71cfadcec qtsvg-opensource-src-5.6.3.tar.xz
 
-# Hash from: https://download.qt.io/official_releases/qt/5.9/5.9.4/submodules/qtsvg-opensource-src-5.9.4.tar.xz.mirrorlist
-sha256 a2f22732bfd4f0f0204443daaa59448298ab5018750dce4600d01d969355037a qtsvg-opensource-src-5.9.4.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.9/5.9.6/submodules/qtsvg-opensource-src-5.9.6.tar.xz.mirrorlist
+sha256 4318ce3c1f94ca865e3405aefb927f257ca824c5adc482302f1449ed34dbd8b8  qtsvg-opensource-src-5.9.6.tar.xz
 
 # Hashes for license files:
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
diff --git a/package/qt5/qt5tools/qt5tools.hash b/package/qt5/qt5tools/qt5tools.hash
index 40176e6aee..f3030b1326 100644
--- a/package/qt5/qt5tools/qt5tools.hash
+++ b/package/qt5/qt5tools/qt5tools.hash
@@ -1,8 +1,8 @@
 # Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qttools-opensource-src-5.6.3.tar.xz.mirrorlist
 sha256 1a63ba838058d73cb540040589b235ded77f76402693decfd6d4d3c75ea67926 qttools-opensource-src-5.6.3.tar.xz
 
-# Hash from: https://download.qt.io/official_releases/qt/5.9/5.9.4/submodules/qttools-opensource-src-5.9.4.tar.xz.mirrorlist
-sha256 95aa5782d5a79be22fba36cea4dc2319cf2a2060a3cc1e24e6585b8d98996e87 qttools-opensource-src-5.9.4.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.9/5.9.6/submodules/qttools-opensource-src-5.9.6.tar.xz.mirrorlist
+sha256 50e75417ec0c74bb8b1989d1d8e981ee83690dce7dfc0c2169f7c00f397e5117  qttools-opensource-src-5.9.6.tar.xz
 
 # Hashes for license files:
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
diff --git a/package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.hash b/package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.hash
index 81c81edff1..f31129b463 100644
--- a/package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.hash
+++ b/package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/5.9/5.9.4/submodules/qtvirtualkeyboard-opensource-src-5.9.4.tar.xz.mirrorlist
-sha256 bf742a886054f12a73621952879cf7a2182304c498bc31ec8a61ef376b07e1ee qtvirtualkeyboard-opensource-src-5.9.4.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.9/5.9.6/submodules/qtvirtualkeyboard-opensource-src-5.9.6.tar.xz.mirrorlist
+sha256 217d8502f3f53b62e6e9108e0afb3694cf1d8ae8a6348d3625e3192fc126128c  qtvirtualkeyboard-opensource-src-5.9.6.tar.xz
 
 # Hashes for license files:
 sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903 LICENSE.GPL3
diff --git a/package/qt5/qt5wayland/qt5wayland.hash b/package/qt5/qt5wayland/qt5wayland.hash
index 86dc65179f..6e9079b90f 100644
--- a/package/qt5/qt5wayland/qt5wayland.hash
+++ b/package/qt5/qt5wayland/qt5wayland.hash
@@ -1,8 +1,8 @@
 # hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtwayland-opensource-src-5.6.3.tar.xz.mirrorlist
 sha256 5a475278b2db73aa7fa7f3ba6d98d8d72774f5c77e172495007d79f91d09daa3 qtwayland-opensource-src-5.6.3.tar.xz
 
-# Hash from: https://download.qt.io/official_releases/qt/5.9/5.9.4/submodules/qtwayland-opensource-src-5.9.4.tar.xz.mirrorlist
-sha256 3f7496522013e6122bb8dc00d0c3cc7753a44dca94fa3b22096eaa21e6099874 qtwayland-opensource-src-5.9.4.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.9/5.9.6/submodules/qtwayland-opensource-src-5.9.6.tar.xz.mirrorlist
+sha256 6dd066b1ab518b16dc2bebc4b3629528a30161cfce48ce5d8482c67a570667d8  qtwayland-opensource-src-5.9.6.tar.xz
 
 # Hashes for license files:
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
diff --git a/package/qt5/qt5webchannel/qt5webchannel.hash b/package/qt5/qt5webchannel/qt5webchannel.hash
index f1b69438d8..b78f9172ab 100644
--- a/package/qt5/qt5webchannel/qt5webchannel.hash
+++ b/package/qt5/qt5webchannel/qt5webchannel.hash
@@ -1,8 +1,8 @@
 # Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtwebchannel-opensource-src-5.6.3.tar.xz.mirrorlist
 sha256 8eb1b0ac2286653c7932758c21e7760788a5d7cfd6162da09afa926d5be50713 qtwebchannel-opensource-src-5.6.3.tar.xz
 
-# Hash from: https://download.qt.io/official_releases/qt/5.9/5.9.4/submodules/qtwebchannel-opensource-src-5.9.4.tar.xz.mirrorlist
-sha256 90303a72da63f250b6d6731b74827b0a1764904aac790a7264a3f65c94039aa9 qtwebchannel-opensource-src-5.9.4.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.9/5.9.6/submodules/qtwebchannel-opensource-src-5.9.6.tar.xz.mirrorlist
+sha256 222df712c661d4003eebf28806cfd25047721e1c21b70ca320c5978c4a2c7ba5  qtwebchannel-opensource-src-5.9.6.tar.xz
 
 # Hashes for license files:
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
diff --git a/package/qt5/qt5webengine/qt5webengine.hash b/package/qt5/qt5webengine/qt5webengine.hash
index 9195c7f3b6..27ce589803 100644
--- a/package/qt5/qt5webengine/qt5webengine.hash
+++ b/package/qt5/qt5webengine/qt5webengine.hash
@@ -1,5 +1,5 @@
 # Hash from https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtwebengine-opensource-src-5.6.3.tar.xz.mirrorlist
 sha256 009d69fb39f6c0e2b0cd89a7e9302cd0ae1872d02c787d3a37f2cacca5ddb7a7 qtwebengine-opensource-src-5.6.3.tar.xz
 
-# Hash from: https://download.qt.io/official_releases/qt/5.9/5.9.4/submodules/qtwebengine-opensource-src-5.9.4.tar.xz.mirrorlist
-sha256 04b4305489b326bbbfe32b5f1da4a33ae034e54130776e3616b9e6d45a5a8271 qtwebengine-opensource-src-5.9.4.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.9/5.9.6/submodules/qtwebengine-opensource-src-5.9.6.tar.xz.mirrorlist
+sha256 4766707f5d8c174a284c0ed813bc6163db0220d69736424d3370b44b640443a1  qtwebengine-opensource-src-5.9.6.tar.xz
diff --git a/package/qt5/qt5websockets/qt5websockets.hash b/package/qt5/qt5websockets/qt5websockets.hash
index 368be9b497..28f0f89a5a 100644
--- a/package/qt5/qt5websockets/qt5websockets.hash
+++ b/package/qt5/qt5websockets/qt5websockets.hash
@@ -1,8 +1,8 @@
 # Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtwebsockets-opensource-src-5.6.3.tar.xz.mirrorlist
 sha256 a2439045616c89dfe06333734ff4726075c92e01db6e6b6863bc138e39c028eb qtwebsockets-opensource-src-5.6.3.tar.xz
 
-# Hash from: https://download.qt.io/official_releases/qt/5.9/5.9.4/submodules/qtwebsockets-opensource-src-5.9.4.tar.xz.mirrorlist
-sha256 72970209f0d4260d11688d3d38d9e953d7fa4309a8a55e2c32726a545333e800 qtwebsockets-opensource-src-5.9.4.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.9/5.9.6/submodules/qtwebsockets-opensource-src-5.9.6.tar.xz.mirrorlist
+sha256 7609eba33ebc9c6954644470ebbb1292cdae50f36d0c8ff5ab068b249e4a3c8e  qtwebsockets-opensource-src-5.9.6.tar.xz
 
 # Hashes for license files:
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
diff --git a/package/qt5/qt5x11extras/qt5x11extras.hash b/package/qt5/qt5x11extras/qt5x11extras.hash
index 943577bbd6..b52d2da5bc 100644
--- a/package/qt5/qt5x11extras/qt5x11extras.hash
+++ b/package/qt5/qt5x11extras/qt5x11extras.hash
@@ -1,8 +1,8 @@
 # Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtx11extras-opensource-src-5.6.3.tar.xz.mirrorlist
 sha256 1e7a8e96e0629f2b2b78de684b156b357210cf5df6b42f30789423f2cb07677f qtx11extras-opensource-src-5.6.3.tar.xz
 
-# Hash from: https://download.qt.io/official_releases/qt/5.9/5.9.4/submodules/qtx11extras-opensource-src-5.9.4.tar.xz.mirrorlist
-sha256 879b18c44550e1be86c29adcca555c92915aab9222c40384beae2f7aa22b22a8 qtx11extras-opensource-src-5.9.4.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.9/5.9.6/submodules/qtx11extras-opensource-src-5.9.6.tar.xz.mirrorlist
+sha256 65b83df79d87043d63808e709778b3c6fddaafa3c7864d7104ee9a9da5909493  qtx11extras-opensource-src-5.9.6.tar.xz
 
 # Hashes for license files:
 sha256 edfe70e99be2a7c109d860b19204609e582720b211c50caedac729da372a1253 LICENSE.GPLv2
diff --git a/package/qt5/qt5xmlpatterns/qt5xmlpatterns.hash b/package/qt5/qt5xmlpatterns/qt5xmlpatterns.hash
index 9c68eae1d8..108d6e346b 100644
--- a/package/qt5/qt5xmlpatterns/qt5xmlpatterns.hash
+++ b/package/qt5/qt5xmlpatterns/qt5xmlpatterns.hash
@@ -1,8 +1,8 @@
 # Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtxmlpatterns-opensource-src-5.6.3.tar.xz.mirrorlist
 sha256 a461ff9f0d7310de9b9904ff9cd34919e958bf4071a6fc7096450b8990ab51f6 qtxmlpatterns-opensource-src-5.6.3.tar.xz
 
-# Hash from: https://download.qt.io/official_releases/qt/5.9/5.9.4/submodules/qtxmlpatterns-opensource-src-5.9.4.tar.xz.mirrorlist
-sha256 faf51ad39e5c2b856b38989c79d69253ad74d4b8d3278d4aaa79d3c547047f79 qtxmlpatterns-opensource-src-5.9.4.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.9/5.9.6/submodules/qtxmlpatterns-opensource-src-5.9.6.tar.xz.mirrorlist
+sha256 6a435b14b85e17268b7acf764e7ed92430045a7bb6eb741a1ea200d2df0986dc  qtxmlpatterns-opensource-src-5.9.6.tar.xz
 
 # Hashes for license files:
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
