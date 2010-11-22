From: luca at lucaceresoli.net <luca@lucaceresoli.net>
Date: Mon, 22 Nov 2010 23:16:18 +0100
Subject: [Buildroot] [PATCH] qt: bump to 4.7.1
Message-ID: <1290464178-2191-1-git-send-email-luca@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Luca Ceresoli <luca@lucaceresoli.net>

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
---
As this is a bugfix release, I think it should go in 2010.11.


 ..._np.patch => qt-4.7.1-pthread_getattr_np.patch} |    0
 ...ch => qt-4.7.1-pthread_getattr_np_webkit.patch} |    0
 package/qt/qt.mk                                   |    2 +-
 3 files changed, 1 insertions(+), 1 deletions(-)
 rename package/qt/{qt-4.7.0-pthread_getattr_np.patch => qt-4.7.1-pthread_getattr_np.patch} (100%)
 rename package/qt/{qt-4.7.0-pthread_getattr_np_webkit.patch => qt-4.7.1-pthread_getattr_np_webkit.patch} (100%)

diff --git a/package/qt/qt-4.7.0-pthread_getattr_np.patch b/package/qt/qt-4.7.1-pthread_getattr_np.patch
similarity index 100%
rename from package/qt/qt-4.7.0-pthread_getattr_np.patch
rename to package/qt/qt-4.7.1-pthread_getattr_np.patch
diff --git a/package/qt/qt-4.7.0-pthread_getattr_np_webkit.patch b/package/qt/qt-4.7.1-pthread_getattr_np_webkit.patch
similarity index 100%
rename from package/qt/qt-4.7.0-pthread_getattr_np_webkit.patch
rename to package/qt/qt-4.7.1-pthread_getattr_np_webkit.patch
diff --git a/package/qt/qt.mk b/package/qt/qt.mk
index a18ebd4..e344259 100644
--- a/package/qt/qt.mk
+++ b/package/qt/qt.mk
@@ -12,7 +12,7 @@
 #
 ######################################################################
 
-QT_VERSION:=4.7.0
+QT_VERSION:=4.7.1
 QT_SOURCE:=qt-everywhere-opensource-src-$(QT_VERSION).tar.gz
 QT_SITE:=http://get.qt.nokia.com/qt/source
 QT_CAT:=$(ZCAT)
-- 
1.7.1
