From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 30 Jan 2016 17:04:17 +0100
Subject: [Buildroot] [PATCH 1/1] package/lcms2: bump version to 2.7
Message-ID: <1454169857-28276-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/lcms2/lcms2.hash | 5 ++++-
 package/lcms2/lcms2.mk   | 2 +-
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/package/lcms2/lcms2.hash b/package/lcms2/lcms2.hash
index 8dcfe4a..908822f 100644
--- a/package/lcms2/lcms2.hash
+++ b/package/lcms2/lcms2.hash
@@ -1,2 +1,5 @@
+# From http://sourceforge.net/projects/lcms/files/lcms/2.7/
+sha1	625f0d74bad4a0f6f917120fd992437d26f754d2	lcms2-2.7.tar.gz
+md5	06c1626f625424a811fb4b5eb070839d		lcms2-2.7.tar.gz
 # Locally computed:
-sha256  6727772b44470a2111dba53b9ce4c952b87e7d1b72a31c5ebdf44ba6eb0aa72b  lcms2-2.5.tar.gz
+sha256	4524234ae7de185e6b6da5d31d6875085b2198bc63b1211f7dde6e2d197d6a53	lcms2-2.7.tar.gz
diff --git a/package/lcms2/lcms2.mk b/package/lcms2/lcms2.mk
index 1798123..265af29 100644
--- a/package/lcms2/lcms2.mk
+++ b/package/lcms2/lcms2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LCMS2_VERSION = 2.5
+LCMS2_VERSION = 2.7
 LCMS2_SITE = http://downloads.sourceforge.net/lcms/lcms
 LCMS2_LICENSE = MIT
 LCMS2_LICENSE_FILES = COPYING
-- 
2.7.0.rc3
