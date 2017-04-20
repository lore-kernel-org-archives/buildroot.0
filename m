From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 20 Apr 2017 20:34:28 +0300
Subject: [Buildroot] [PATCH 1/2] libnspr: bump to version 4.14
Message-ID: <d86176bbf66ac3fbbdc5a47456314bd68006df13.1492709669.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/libnspr/libnspr.hash | 4 ++--
 package/libnspr/libnspr.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libnspr/libnspr.hash b/package/libnspr/libnspr.hash
index a4b19b7f9c1c..9111a32c8669 100644
--- a/package/libnspr/libnspr.hash
+++ b/package/libnspr/libnspr.hash
@@ -1,2 +1,2 @@
-# From https://ftp.mozilla.org/pub/mozilla.org/nspr/releases/v4.13.1/src/SHA256SUMS
-sha256	5e4c1751339a76e7c772c0c04747488d7f8c98980b434dc846977e43117833ab	nspr-4.13.1.tar.gz
+# From https://ftp.mozilla.org/pub/nspr/releases/v4.14/src/SHA256SUMS
+sha256	64fc18826257403a9132240aa3c45193d577a84b08e96f7e7770a97c074d17d5	nspr-4.14.tar.gz
diff --git a/package/libnspr/libnspr.mk b/package/libnspr/libnspr.mk
index 1fc82be0d4ff..c74b14ac333d 100644
--- a/package/libnspr/libnspr.mk
+++ b/package/libnspr/libnspr.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBNSPR_VERSION = 4.13.1
+LIBNSPR_VERSION = 4.14
 LIBNSPR_SOURCE = nspr-$(LIBNSPR_VERSION).tar.gz
 LIBNSPR_SITE = https://ftp.mozilla.org/pub/mozilla.org/nspr/releases/v$(LIBNSPR_VERSION)/src
 LIBNSPR_SUBDIR = nspr
-- 
2.11.0
