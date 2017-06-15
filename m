From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 15 Jun 2017 13:34:56 +0300
Subject: [Buildroot] [PATCH 1/2] libnspr: bump to version 4.15
Message-ID: <6ba94c95ef12b7c3337ebb5ead42c6870e8aa545.1497522897.git.baruch@tkos.co.il>
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
index 9111a32c8669..13cee6e7ef77 100644
--- a/package/libnspr/libnspr.hash
+++ b/package/libnspr/libnspr.hash
@@ -1,2 +1,2 @@
-# From https://ftp.mozilla.org/pub/nspr/releases/v4.14/src/SHA256SUMS
-sha256	64fc18826257403a9132240aa3c45193d577a84b08e96f7e7770a97c074d17d5	nspr-4.14.tar.gz
+# From https://ftp.mozilla.org/pub/nspr/releases/v4.15/src/SHA256SUMS
+sha256	27dde06bc3d0c88903a20d6ad807361a912cfb624ca0ab4efb10fc50b19e2d80	nspr-4.15.tar.gz
diff --git a/package/libnspr/libnspr.mk b/package/libnspr/libnspr.mk
index c74b14ac333d..7659baf6d3b5 100644
--- a/package/libnspr/libnspr.mk
+++ b/package/libnspr/libnspr.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBNSPR_VERSION = 4.14
+LIBNSPR_VERSION = 4.15
 LIBNSPR_SOURCE = nspr-$(LIBNSPR_VERSION).tar.gz
 LIBNSPR_SITE = https://ftp.mozilla.org/pub/mozilla.org/nspr/releases/v$(LIBNSPR_VERSION)/src
 LIBNSPR_SUBDIR = nspr
-- 
2.11.0
