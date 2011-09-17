From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 17 Sep 2011 08:22:12 +0200
Subject: [Buildroot] [git commit] qt: bump version
Message-ID: <20110917063642.239518D728@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=27b58e3972e287374259532e09a0ef4761b4270f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 ....3-configure.patch => qt-4.7.4-configure.patch} |    0
 ..._np.patch => qt-4.7.4-pthread_getattr_np.patch} |    0
 ...ch => qt-4.7.4-pthread_getattr_np_webkit.patch} |    0
 ...i.patch => qt-4.7.4-script-qtdbus-no-gui.patch} |    0
 package/qt/qt.mk                                   |    2 +-
 5 files changed, 1 insertions(+), 1 deletions(-)
 rename package/qt/{qt-4.7.3-configure.patch => qt-4.7.4-configure.patch} (100%)
 rename package/qt/{qt-4.7.3-pthread_getattr_np.patch => qt-4.7.4-pthread_getattr_np.patch} (100%)
 rename package/qt/{qt-4.7.3-pthread_getattr_np_webkit.patch => qt-4.7.4-pthread_getattr_np_webkit.patch} (100%)
 rename package/qt/{qt-4.7.3-script-qtdbus-no-gui.patch => qt-4.7.4-script-qtdbus-no-gui.patch} (100%)

diff --git a/package/qt/qt-4.7.3-configure.patch b/package/qt/qt-4.7.4-configure.patch
similarity index 100%
rename from package/qt/qt-4.7.3-configure.patch
rename to package/qt/qt-4.7.4-configure.patch
diff --git a/package/qt/qt-4.7.3-pthread_getattr_np.patch b/package/qt/qt-4.7.4-pthread_getattr_np.patch
similarity index 100%
rename from package/qt/qt-4.7.3-pthread_getattr_np.patch
rename to package/qt/qt-4.7.4-pthread_getattr_np.patch
diff --git a/package/qt/qt-4.7.3-pthread_getattr_np_webkit.patch b/package/qt/qt-4.7.4-pthread_getattr_np_webkit.patch
similarity index 100%
rename from package/qt/qt-4.7.3-pthread_getattr_np_webkit.patch
rename to package/qt/qt-4.7.4-pthread_getattr_np_webkit.patch
diff --git a/package/qt/qt-4.7.3-script-qtdbus-no-gui.patch b/package/qt/qt-4.7.4-script-qtdbus-no-gui.patch
similarity index 100%
rename from package/qt/qt-4.7.3-script-qtdbus-no-gui.patch
rename to package/qt/qt-4.7.4-script-qtdbus-no-gui.patch
diff --git a/package/qt/qt.mk b/package/qt/qt.mk
index ff67058..ed95b2c 100644
--- a/package/qt/qt.mk
+++ b/package/qt/qt.mk
@@ -12,7 +12,7 @@
 #
 ######################################################################
 
-QT_VERSION = 4.7.3
+QT_VERSION = 4.7.4
 QT_SOURCE  = qt-everywhere-opensource-src-$(QT_VERSION).tar.gz
 QT_SITE    = http://get.qt.nokia.com/qt/source
 
-- 
1.7.3.4
