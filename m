From: Andreas Naumann <anaumann@ultratronik.de>
Date: Tue, 13 Dec 2016 15:59:25 +0100
Subject: [Buildroot] [PATCH v3 1/7] qt5: Remove all hashes
In-Reply-To: <1481641171-10407-1-git-send-email-anaumann@ultratronik.de>
References: <1481641171-10407-1-git-send-email-anaumann@ultratronik.de>
Message-ID: <1481641171-10407-2-git-send-email-anaumann@ultratronik.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Andreas Naumann <anaumann@ultratronik.de>
---
 package/qt5/qt53d/qt53d.hash                             | 2 --
 package/qt5/qt5base/qt5base.hash                         | 2 --
 package/qt5/qt5canvas3d/qt5canvas3d.hash                 | 2 --
 package/qt5/qt5connectivity/qt5connectivity.hash         | 2 --
 package/qt5/qt5declarative/qt5declarative.hash           | 2 --
 package/qt5/qt5enginio/qt5enginio.hash                   | 2 --
 package/qt5/qt5graphicaleffects/qt5graphicaleffects.hash | 2 --
 package/qt5/qt5imageformats/qt5imageformats.hash         | 2 --
 package/qt5/qt5location/qt5location.hash                 | 2 --
 package/qt5/qt5multimedia/qt5multimedia.hash             | 2 --
 package/qt5/qt5quickcontrols/qt5quickcontrols.hash       | 2 --
 package/qt5/qt5quickcontrols2/qt5quickcontrols2.hash     | 2 --
 package/qt5/qt5script/qt5script.hash                     | 2 --
 package/qt5/qt5sensors/qt5sensors.hash                   | 2 --
 package/qt5/qt5serialbus/qt5serialbus.hash               | 2 --
 package/qt5/qt5serialport/qt5serialport.hash             | 2 --
 package/qt5/qt5svg/qt5svg.hash                           | 2 --
 package/qt5/qt5tools/qt5tools.hash                       | 2 --
 package/qt5/qt5webchannel/qt5webchannel.hash             | 2 --
 package/qt5/qt5webkit/qt5webkit.hash                     | 2 --
 package/qt5/qt5websockets/qt5websockets.hash             | 2 --
 package/qt5/qt5x11extras/qt5x11extras.hash               | 2 --
 package/qt5/qt5xmlpatterns/qt5xmlpatterns.hash           | 2 --
 23 files changed, 46 deletions(-)
 delete mode 100644 package/qt5/qt53d/qt53d.hash
 delete mode 100644 package/qt5/qt5base/qt5base.hash
 delete mode 100644 package/qt5/qt5canvas3d/qt5canvas3d.hash
 delete mode 100644 package/qt5/qt5connectivity/qt5connectivity.hash
 delete mode 100644 package/qt5/qt5declarative/qt5declarative.hash
 delete mode 100644 package/qt5/qt5enginio/qt5enginio.hash
 delete mode 100644 package/qt5/qt5graphicaleffects/qt5graphicaleffects.hash
 delete mode 100644 package/qt5/qt5imageformats/qt5imageformats.hash
 delete mode 100644 package/qt5/qt5location/qt5location.hash
 delete mode 100644 package/qt5/qt5multimedia/qt5multimedia.hash
 delete mode 100644 package/qt5/qt5quickcontrols/qt5quickcontrols.hash
 delete mode 100644 package/qt5/qt5quickcontrols2/qt5quickcontrols2.hash
 delete mode 100644 package/qt5/qt5script/qt5script.hash
 delete mode 100644 package/qt5/qt5sensors/qt5sensors.hash
 delete mode 100644 package/qt5/qt5serialbus/qt5serialbus.hash
 delete mode 100644 package/qt5/qt5serialport/qt5serialport.hash
 delete mode 100644 package/qt5/qt5svg/qt5svg.hash
 delete mode 100644 package/qt5/qt5tools/qt5tools.hash
 delete mode 100644 package/qt5/qt5webchannel/qt5webchannel.hash
 delete mode 100644 package/qt5/qt5webkit/qt5webkit.hash
 delete mode 100644 package/qt5/qt5websockets/qt5websockets.hash
 delete mode 100644 package/qt5/qt5x11extras/qt5x11extras.hash
 delete mode 100644 package/qt5/qt5xmlpatterns/qt5xmlpatterns.hash

diff --git a/package/qt5/qt53d/qt53d.hash b/package/qt5/qt53d/qt53d.hash
deleted file mode 100644
index 7179380..0000000
--- a/package/qt5/qt53d/qt53d.hash
+++ /dev/null
@@ -1,2 +0,0 @@
-# Hash from: http://download.qt.io/official_releases/qt/5.6/5.6.2/submodules/qt3d-opensource-src-5.6.2.tar.xz.mirrorlist
-sha256 a21786db6e0f5c6c70213fe1a3530ed3d7f28f28401a0f793970e9bc860ce941 qt3d-opensource-src-5.6.2.tar.xz
diff --git a/package/qt5/qt5base/qt5base.hash b/package/qt5/qt5base/qt5base.hash
deleted file mode 100644
index 9808e9b..0000000
--- a/package/qt5/qt5base/qt5base.hash
+++ /dev/null
@@ -1,2 +0,0 @@
-# Hash from: http://download.qt.io/official_releases/qt/5.6/5.6.2/submodules/qtbase-opensource-src-5.6.2.tar.xz.mirrorlist
-sha256 2f6eae93c5d982fe0a387a01aeb3435571433e23e9d9d9246741faf51f1ee787 qtbase-opensource-src-5.6.2.tar.xz
diff --git a/package/qt5/qt5canvas3d/qt5canvas3d.hash b/package/qt5/qt5canvas3d/qt5canvas3d.hash
deleted file mode 100644
index 01819e4..0000000
--- a/package/qt5/qt5canvas3d/qt5canvas3d.hash
+++ /dev/null
@@ -1,2 +0,0 @@
-# Hash from: http://download.qt.io/official_releases/qt/5.6/5.6.2/submodules/qtcanvas3d-opensource-src-5.6.2.tar.xz.mirrorlist
-sha256 d7584d006b03f99692ccabce922e755a6f12bb1ed1fbc99c2b84842b9e0aa0ad qtcanvas3d-opensource-src-5.6.2.tar.xz
diff --git a/package/qt5/qt5connectivity/qt5connectivity.hash b/package/qt5/qt5connectivity/qt5connectivity.hash
deleted file mode 100644
index 4574f3d..0000000
--- a/package/qt5/qt5connectivity/qt5connectivity.hash
+++ /dev/null
@@ -1,2 +0,0 @@
-# Hash from: http://download.qt.io/official_releases/qt/5.6/5.6.2/submodules/qtconnectivity-opensource-src-5.6.2.tar.xz.mirrorlist
-sha256 1b672923e0703d62f605ccec97b454b1a04c1f0db47f54b687d009e84eabedf9 qtconnectivity-opensource-src-5.6.2.tar.xz
diff --git a/package/qt5/qt5declarative/qt5declarative.hash b/package/qt5/qt5declarative/qt5declarative.hash
deleted file mode 100644
index d8d3a68..0000000
--- a/package/qt5/qt5declarative/qt5declarative.hash
+++ /dev/null
@@ -1,2 +0,0 @@
-# Hash from: http://download.qt.io/official_releases/qt/5.6/5.6.2/submodules/qtdeclarative-opensource-src-5.6.2.tar.xz.mirrorlist
-sha256 0086a986bc36b398ba518c404d08cdff0a0d7978c30aa3fa2ab73d71654209da qtdeclarative-opensource-src-5.6.2.tar.xz
diff --git a/package/qt5/qt5enginio/qt5enginio.hash b/package/qt5/qt5enginio/qt5enginio.hash
deleted file mode 100644
index 9951834..0000000
--- a/package/qt5/qt5enginio/qt5enginio.hash
+++ /dev/null
@@ -1,2 +0,0 @@
-# Hash from: http://download.qt.io/official_releases/qt/5.6/5.6.2/submodules/qtenginio-opensource-src-1.6.2.tar.xz.mirrorlist
-sha256 90ffc38d214a75ab0ef90a4760843f12bc073ae49c17de24c677d1d403bddcc3 qtenginio-opensource-src-1.6.2.tar.xz
diff --git a/package/qt5/qt5graphicaleffects/qt5graphicaleffects.hash b/package/qt5/qt5graphicaleffects/qt5graphicaleffects.hash
deleted file mode 100644
index ae29e3b..0000000
--- a/package/qt5/qt5graphicaleffects/qt5graphicaleffects.hash
+++ /dev/null
@@ -1,2 +0,0 @@
-# Hash from: http://download.qt.io/official_releases/qt/5.6/5.6.2/submodules/qtgraphicaleffects-opensource-src-5.6.2.tar.xz.mirrorlist
-sha256 1e9f0fac2c72a812d396db74b2d9d12f513d2ec9135d5982ca85aee7f00be75e qtgraphicaleffects-opensource-src-5.6.2.tar.xz
diff --git a/package/qt5/qt5imageformats/qt5imageformats.hash b/package/qt5/qt5imageformats/qt5imageformats.hash
deleted file mode 100644
index 54b58e4..0000000
--- a/package/qt5/qt5imageformats/qt5imageformats.hash
+++ /dev/null
@@ -1,2 +0,0 @@
-# Hash from: http://download.qt.io/official_releases/qt/5.6/5.6.2/submodules/qtimageformats-opensource-src-5.6.2.tar.xz.mirrorlist
-sha256 4fb153be62dac393cbcebab65040b3b9d6edecd1ebbe5e543401b0e45bd147e4 qtimageformats-opensource-src-5.6.2.tar.xz
diff --git a/package/qt5/qt5location/qt5location.hash b/package/qt5/qt5location/qt5location.hash
deleted file mode 100644
index 374952f..0000000
--- a/package/qt5/qt5location/qt5location.hash
+++ /dev/null
@@ -1,2 +0,0 @@
-# Hash from: http://download.qt.io/official_releases/qt/5.6/5.6.2/submodules/qtlocation-opensource-src-5.6.2.tar.xz.mirrorlist
-sha256 7a8995206ed0220f943a33c037527a1a8243d5386f5ca77bf88152675c28d23a qtlocation-opensource-src-5.6.2.tar.xz
diff --git a/package/qt5/qt5multimedia/qt5multimedia.hash b/package/qt5/qt5multimedia/qt5multimedia.hash
deleted file mode 100644
index 56a11fb..0000000
--- a/package/qt5/qt5multimedia/qt5multimedia.hash
+++ /dev/null
@@ -1,2 +0,0 @@
-# Hash from: http://download.qt.io/official_releases/qt/5.6/5.6.2/submodules/qtmultimedia-opensource-src-5.6.2.tar.xz.mirrorlist
-sha256 cb9a70a7c6c0eb5be4a3fcaf9590863479e95a255308bbf07d5b7aa303bb8caf qtmultimedia-opensource-src-5.6.2.tar.xz
diff --git a/package/qt5/qt5quickcontrols/qt5quickcontrols.hash b/package/qt5/qt5quickcontrols/qt5quickcontrols.hash
deleted file mode 100644
index 6db589d..0000000
--- a/package/qt5/qt5quickcontrols/qt5quickcontrols.hash
+++ /dev/null
@@ -1,2 +0,0 @@
-# Hash from: http://download.qt.io/official_releases/qt/5.6/5.6.2/submodules/qtquickcontrols-opensource-src-5.6.2.tar.xz.mirrorlist
-sha256 5ed0f2292be10222dfb1b57a05472798fd759279f65455d91c02ef4fb746102c qtquickcontrols-opensource-src-5.6.2.tar.xz
diff --git a/package/qt5/qt5quickcontrols2/qt5quickcontrols2.hash b/package/qt5/qt5quickcontrols2/qt5quickcontrols2.hash
deleted file mode 100644
index 0d85d48..0000000
--- a/package/qt5/qt5quickcontrols2/qt5quickcontrols2.hash
+++ /dev/null
@@ -1,2 +0,0 @@
-# Hash from: http://download.qt.io/official_releases/qt/5.6/5.6.2/submodules/qtquickcontrols2-opensource-src-5.6.2.tar.xz.mirrorlist
-sha256 09dc1710aa4701aebe145829eb99bab94d0870cf578f7dddcec0af92286dfec1 qtquickcontrols2-opensource-src-5.6.2.tar.xz
diff --git a/package/qt5/qt5script/qt5script.hash b/package/qt5/qt5script/qt5script.hash
deleted file mode 100644
index c8ecb75..0000000
--- a/package/qt5/qt5script/qt5script.hash
+++ /dev/null
@@ -1,2 +0,0 @@
-# Hash from: http://download.qt.io/official_releases/qt/5.6/5.6.2/submodules/qtscript-opensource-src-5.6.2.tar.xz.mirrorlist
-sha256 e06ef6b271cae2187b57cd4ffdd6759428fd47f94a060e2ed2af024a8c14110e qtscript-opensource-src-5.6.2.tar.xz
diff --git a/package/qt5/qt5sensors/qt5sensors.hash b/package/qt5/qt5sensors/qt5sensors.hash
deleted file mode 100644
index 65cd127..0000000
--- a/package/qt5/qt5sensors/qt5sensors.hash
+++ /dev/null
@@ -1,2 +0,0 @@
-# Hash from: http://download.qt.io/official_releases/qt/5.6/5.6.2/submodules/qtsensors-opensource-src-5.6.2.tar.xz.mirrorlist
-sha256 a7809081aab4f2f0d7a4f40c3abb02e1690bb390d1dd410d7c6c5019a5053427 qtsensors-opensource-src-5.6.2.tar.xz
diff --git a/package/qt5/qt5serialbus/qt5serialbus.hash b/package/qt5/qt5serialbus/qt5serialbus.hash
deleted file mode 100644
index 308c365..0000000
--- a/package/qt5/qt5serialbus/qt5serialbus.hash
+++ /dev/null
@@ -1,2 +0,0 @@
-# Hash from: http://download.qt.io/official_releases/qt/5.6/5.6.2/submodules/qtserialbus-opensource-src-5.6.2.tar.xz.mirrorlist
-sha256 b39260091691532382935ed51de9ead8e66cfb5f7a6e5410c17cd0695ccaf826 qtserialbus-opensource-src-5.6.2.tar.xz
diff --git a/package/qt5/qt5serialport/qt5serialport.hash b/package/qt5/qt5serialport/qt5serialport.hash
deleted file mode 100644
index 2458e5d..0000000
--- a/package/qt5/qt5serialport/qt5serialport.hash
+++ /dev/null
@@ -1,2 +0,0 @@
-# Hash from: http://download.qt.io/official_releases/qt/5.6/5.6.2/submodules/qtserialport-opensource-src-5.6.2.tar.xz.mirrorlist
-sha256 af76281bad2c2bd283189635316b46091f6712134b845ae1b9e3016eec94f376 qtserialport-opensource-src-5.6.2.tar.xz
diff --git a/package/qt5/qt5svg/qt5svg.hash b/package/qt5/qt5svg/qt5svg.hash
deleted file mode 100644
index 0c9e9eb..0000000
--- a/package/qt5/qt5svg/qt5svg.hash
+++ /dev/null
@@ -1,2 +0,0 @@
-# Hash from: http://download.qt.io/official_releases/qt/5.6/5.6.2/submodules/qtsvg-opensource-src-5.6.2.tar.xz.mirrorlist
-sha256 f7a361bf661b31ae7779513559dd0b774171911bc57f5cfb6bed6878ddc8bc4e qtsvg-opensource-src-5.6.2.tar.xz
diff --git a/package/qt5/qt5tools/qt5tools.hash b/package/qt5/qt5tools/qt5tools.hash
deleted file mode 100644
index cc11b28..0000000
--- a/package/qt5/qt5tools/qt5tools.hash
+++ /dev/null
@@ -1,2 +0,0 @@
-# Hash from: http://download.qt.io/official_releases/qt/5.6/5.6.2/submodules/qttools-opensource-src-5.6.2.tar.xz.mirrorlist
-sha256 db2bb4318786257a47172c377d9c456d5d5ec760d5d69240a4693dc87989e1b7 qttools-opensource-src-5.6.2.tar.xz
diff --git a/package/qt5/qt5webchannel/qt5webchannel.hash b/package/qt5/qt5webchannel/qt5webchannel.hash
deleted file mode 100644
index 0f9eaae..0000000
--- a/package/qt5/qt5webchannel/qt5webchannel.hash
+++ /dev/null
@@ -1,2 +0,0 @@
-# Hash from: http://download.qt.io/official_releases/qt/5.6/5.6.2/submodules/qtwebchannel-opensource-src-5.6.2.tar.xz.mirrorlist
-sha256 700efdef5f51bdb77093f4db212afe275ad35a710ea08ba0e9e9cbc8f09f1a52 qtwebchannel-opensource-src-5.6.2.tar.xz
diff --git a/package/qt5/qt5webkit/qt5webkit.hash b/package/qt5/qt5webkit/qt5webkit.hash
deleted file mode 100644
index 309f776..0000000
--- a/package/qt5/qt5webkit/qt5webkit.hash
+++ /dev/null
@@ -1,2 +0,0 @@
-# Hash from: http://download.qt.io/snapshots/qt/5.6/5.6.2/latest_src/submodules/qtwebkit-opensource-src-5.6.2.tar.xz.mirrorlist
-sha256 528a6b8b1c5095367b26e8ce4f3a46bb739e2e9913ff4dfc6ef58a04fcd73966 qtwebkit-opensource-src-5.6.2.tar.xz
diff --git a/package/qt5/qt5websockets/qt5websockets.hash b/package/qt5/qt5websockets/qt5websockets.hash
deleted file mode 100644
index 3443476..0000000
--- a/package/qt5/qt5websockets/qt5websockets.hash
+++ /dev/null
@@ -1,2 +0,0 @@
-# Hash from: http://download.qt.io/official_releases/qt/5.6/5.6.2/submodules/qtwebsockets-opensource-src-5.6.2.tar.xz.mirrorlist
-sha256 3cd9d4bbff8e6be5e252f00fc9ecb9ac2d8a193020288c7d1e82583daeb5ba35 qtwebsockets-opensource-src-5.6.2.tar.xz
diff --git a/package/qt5/qt5x11extras/qt5x11extras.hash b/package/qt5/qt5x11extras/qt5x11extras.hash
deleted file mode 100644
index 297c578..0000000
--- a/package/qt5/qt5x11extras/qt5x11extras.hash
+++ /dev/null
@@ -1,2 +0,0 @@
-# Hash from: http://download.qt.io/official_releases/qt/5.6/5.6.2/submodules/qtx11extras-opensource-src-5.6.2.tar.xz.mirrorlist
-sha256 71ffde1cfaeec310677b69ecd16cb5992e8885cf3e73b4cec7d6e7a115b40ced qtx11extras-opensource-src-5.6.2.tar.xz
diff --git a/package/qt5/qt5xmlpatterns/qt5xmlpatterns.hash b/package/qt5/qt5xmlpatterns/qt5xmlpatterns.hash
deleted file mode 100644
index fa4e97f..0000000
--- a/package/qt5/qt5xmlpatterns/qt5xmlpatterns.hash
+++ /dev/null
@@ -1,2 +0,0 @@
-# Hash from: http://download.qt.io/official_releases/qt/5.6/5.6.2/submodules/qtxmlpatterns-opensource-src-5.6.2.tar.xz.mirrorlist
-sha256 7c6df3eebf188d8ce6822a22cebbc63da5ac27047cf1bd7236d5b988244782cc qtxmlpatterns-opensource-src-5.6.2.tar.xz
-- 
1.9.1
