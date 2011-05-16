From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 16 May 2011 14:27:24 +0200
Subject: [Buildroot] [git commit] qt: bump version
Message-ID: <20110516122801.0B63083533@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=b1f31142536770df278bf195d545173810f248eb
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 ....2-configure.patch => qt-4.7.3-configure.patch} |    0
 ..._np.patch => qt-4.7.3-pthread_getattr_np.patch} |    0
 ...ch => qt-4.7.3-pthread_getattr_np_webkit.patch} |    0
 package/qt/qt.mk                                   |    2 +-
 4 files changed, 1 insertions(+), 1 deletions(-)
 rename package/qt/{qt-4.7.2-configure.patch => qt-4.7.3-configure.patch} (100%)
 rename package/qt/{qt-4.7.2-pthread_getattr_np.patch => qt-4.7.3-pthread_getattr_np.patch} (100%)
 rename package/qt/{qt-4.7.2-pthread_getattr_np_webkit.patch => qt-4.7.3-pthread_getattr_np_webkit.patch} (100%)

diff --git a/package/qt/qt-4.7.2-configure.patch b/package/qt/qt-4.7.3-configure.patch
similarity index 100%
rename from package/qt/qt-4.7.2-configure.patch
rename to package/qt/qt-4.7.3-configure.patch
diff --git a/package/qt/qt-4.7.2-pthread_getattr_np.patch b/package/qt/qt-4.7.3-pthread_getattr_np.patch
similarity index 100%
rename from package/qt/qt-4.7.2-pthread_getattr_np.patch
rename to package/qt/qt-4.7.3-pthread_getattr_np.patch
diff --git a/package/qt/qt-4.7.2-pthread_getattr_np_webkit.patch b/package/qt/qt-4.7.3-pthread_getattr_np_webkit.patch
similarity index 100%
rename from package/qt/qt-4.7.2-pthread_getattr_np_webkit.patch
rename to package/qt/qt-4.7.3-pthread_getattr_np_webkit.patch
diff --git a/package/qt/qt.mk b/package/qt/qt.mk
index 7ec7ccc..8bcbd3f 100644
--- a/package/qt/qt.mk
+++ b/package/qt/qt.mk
@@ -12,7 +12,7 @@
 #
 ######################################################################
 
-QT_VERSION = 4.7.2
+QT_VERSION = 4.7.3
 QT_SOURCE  = qt-everywhere-opensource-src-$(QT_VERSION).tar.gz
 QT_SITE    = http://get.qt.nokia.com/qt/source
 
-- 
1.7.3.4
