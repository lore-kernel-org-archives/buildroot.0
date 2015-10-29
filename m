From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 29 Oct 2015 09:56:05 -0300
Subject: [Buildroot] [PATCH] libnspr: bump to version 4.10.10
Message-ID: <1446123365-21899-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/libnspr/libnspr.hash | 4 ++--
 package/libnspr/libnspr.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libnspr/libnspr.hash b/package/libnspr/libnspr.hash
index 36d17ae..0a5ee87 100644
--- a/package/libnspr/libnspr.hash
+++ b/package/libnspr/libnspr.hash
@@ -1,2 +1,2 @@
-# From https://ftp.mozilla.org/pub/mozilla.org/nspr/releases/v4.10.9/src/SHA256SUMS
-sha256	4112ff6ad91d32696ca0c6c3d4abef6367b5dc0127fa172fcb3c3ab81bb2d881	nspr-4.10.9.tar.gz
+# From https://ftp.mozilla.org/pub/mozilla.org/nspr/releases/v4.10.10/src/SHA256SUMS
+sha256	343614971c30520d0fa55f4af0a72578e2d8674bb71caf7187490c3379523107	nspr-4.10.10.tar.gz
diff --git a/package/libnspr/libnspr.mk b/package/libnspr/libnspr.mk
index bf65f0a..9124ce0 100644
--- a/package/libnspr/libnspr.mk
+++ b/package/libnspr/libnspr.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBNSPR_VERSION = 4.10.9
+LIBNSPR_VERSION = 4.10.10
 LIBNSPR_SOURCE = nspr-$(LIBNSPR_VERSION).tar.gz
 LIBNSPR_SITE = https://ftp.mozilla.org/pub/mozilla.org/nspr/releases/v$(LIBNSPR_VERSION)/src
 LIBNSPR_SUBDIR = nspr
-- 
2.4.10
