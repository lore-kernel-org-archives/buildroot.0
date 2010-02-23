From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 24 Feb 2010 00:40:20 +0100
Subject: [Buildroot] [git commit master] qt: fix the patch name for qt-4.5.3
	version
Message-ID: <20100223234242.2DC9C77716@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=f4f157041eb53f674d21d9a323f7245bc14fd844
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francisco Gonzalez Morell <gzmorell@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                                            |    6 ++++++
 ...uild.patch => qt-4.5.3-fix-qt-zlib-build.patch} |    6 +++---
 2 files changed, 9 insertions(+), 3 deletions(-)
 rename package/qt/{qt-4.5.2-fix-qt-zlib-build.patch => qt-4.5.3-fix-qt-zlib-build.patch} (74%)

diff --git a/CHANGES b/CHANGES
index d308e93..ec71d4e 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,9 @@
+2010.02, Not yet released:
+
+	Fixes all over the tree.
+
+	Updated/fixed packages: qt
+
 2010.02-rc2, Released February 23th, 2010:
 
 	Fixes all over the tree and new features.
diff --git a/package/qt/qt-4.5.2-fix-qt-zlib-build.patch b/package/qt/qt-4.5.3-fix-qt-zlib-build.patch
similarity index 74%
rename from package/qt/qt-4.5.2-fix-qt-zlib-build.patch
rename to package/qt/qt-4.5.3-fix-qt-zlib-build.patch
index b191cc7..47fc92f 100644
--- a/package/qt/qt-4.5.2-fix-qt-zlib-build.patch
+++ b/package/qt/qt-4.5.3-fix-qt-zlib-build.patch
@@ -7,10 +7,10 @@ include path to fix this issue.
  src/gui/painting/painting.pri |    3 +++
  1 file changed, 3 insertions(+)
 
-Index: qt-embedded-linux-opensource-src-4.5.2/src/gui/painting/painting.pri
+Index: qt-embedded-linux-opensource-src-4.5.3/src/gui/painting/painting.pri
 ===================================================================
---- qt-embedded-linux-opensource-src-4.5.2.orig/src/gui/painting/painting.pri
-+++ qt-embedded-linux-opensource-src-4.5.2/src/gui/painting/painting.pri
+--- qt-embedded-linux-opensource-src-4.5.3.orig/src/gui/painting/painting.pri
++++ qt-embedded-linux-opensource-src-4.5.3/src/gui/painting/painting.pri
 @@ -367,3 +367,6 @@
          SOURCES += painting/qwindowsurface_d3d.cpp
  }
-- 
1.6.3.3
