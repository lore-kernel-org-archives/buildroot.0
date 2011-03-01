From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 1 Mar 2011 17:08:42 +0100
Subject: [Buildroot] [git commit master 1/1] qt: bump version
Message-ID: <20110301160925.AF48F8CA64@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=6b46297675cd01cb18b499880f1bb5423278733c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 ..._np.patch => qt-4.7.2-pthread_getattr_np.patch} |    0
 ...ch => qt-4.7.2-pthread_getattr_np_webkit.patch} |    0
 package/qt/qt.mk                                   |    2 +-
 3 files changed, 1 insertions(+), 1 deletions(-)
 rename package/qt/{qt-4.7.1-pthread_getattr_np.patch => qt-4.7.2-pthread_getattr_np.patch} (100%)
 rename package/qt/{qt-4.7.1-pthread_getattr_np_webkit.patch => qt-4.7.2-pthread_getattr_np_webkit.patch} (100%)

diff --git a/package/qt/qt-4.7.1-pthread_getattr_np.patch b/package/qt/qt-4.7.2-pthread_getattr_np.patch
similarity index 100%
rename from package/qt/qt-4.7.1-pthread_getattr_np.patch
rename to package/qt/qt-4.7.2-pthread_getattr_np.patch
diff --git a/package/qt/qt-4.7.1-pthread_getattr_np_webkit.patch b/package/qt/qt-4.7.2-pthread_getattr_np_webkit.patch
similarity index 100%
rename from package/qt/qt-4.7.1-pthread_getattr_np_webkit.patch
rename to package/qt/qt-4.7.2-pthread_getattr_np_webkit.patch
diff --git a/package/qt/qt.mk b/package/qt/qt.mk
index cc90190..e8fff73 100644
--- a/package/qt/qt.mk
+++ b/package/qt/qt.mk
@@ -12,7 +12,7 @@
 #
 ######################################################################
 
-QT_VERSION:=4.7.1
+QT_VERSION:=4.7.2
 QT_SOURCE:=qt-everywhere-opensource-src-$(QT_VERSION).tar.gz
 QT_SITE:=http://get.qt.nokia.com/qt/source
 QT_CAT:=$(ZCAT)
-- 
1.7.3.4
