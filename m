From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Wed, 24 Nov 2010 15:32:17 +0100
Subject: [Buildroot] [git commit master 1/1] qt: bump to 4.7.1
Message-ID: <20101124143326.92DBA8DCCA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=f53c46ffb27ea2a687def2fa40be942714b4e851
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
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
1.7.2.2
