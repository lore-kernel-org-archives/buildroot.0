From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 10 Oct 2016 13:54:45 -0300
Subject: [Buildroot] [PATCH 1/2] libnspr: bump to version 4.13
Message-ID: <1476118486-5645-1-git-send-email-gustavo@zacarias.com.ar>
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
index f513213..36203ac 100644
--- a/package/libnspr/libnspr.hash
+++ b/package/libnspr/libnspr.hash
@@ -1,2 +1,2 @@
-# From https://ftp.mozilla.org/pub/mozilla.org/nspr/releases/v4.12/src/SHA256SUMS
-sha256	e0b10a1e569153668ff8bdea6c7e491b389fab69c2f18285a1ebf7c2ea4269de	nspr-4.12.tar.gz
+# From https://ftp.mozilla.org/pub/mozilla.org/nspr/releases/v4.13/src/SHA256SUMS
+sha256	19c33334bb3fa6d24800ffa65d7d806c54ad5f8c3758a5c11352ad43212ab181	nspr-4.13.tar.gz
diff --git a/package/libnspr/libnspr.mk b/package/libnspr/libnspr.mk
index 0311f8f..3cf3fe9 100644
--- a/package/libnspr/libnspr.mk
+++ b/package/libnspr/libnspr.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBNSPR_VERSION = 4.12
+LIBNSPR_VERSION = 4.13
 LIBNSPR_SOURCE = nspr-$(LIBNSPR_VERSION).tar.gz
 LIBNSPR_SITE = https://ftp.mozilla.org/pub/mozilla.org/nspr/releases/v$(LIBNSPR_VERSION)/src
 LIBNSPR_SUBDIR = nspr
-- 
2.7.3
