From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue,  7 Apr 2015 14:31:46 -0300
Subject: [Buildroot] [PATCH] libmicrohttpd: bump to version 0.9.40
Message-ID: <1428427906-28982-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/libmicrohttpd/libmicrohttpd.hash | 2 +-
 package/libmicrohttpd/libmicrohttpd.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libmicrohttpd/libmicrohttpd.hash b/package/libmicrohttpd/libmicrohttpd.hash
index 2cf1a54..fa01fbc 100644
--- a/package/libmicrohttpd/libmicrohttpd.hash
+++ b/package/libmicrohttpd/libmicrohttpd.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256	4f937b6065c366d776be86b1d24b8fc400ebc7ea006a9d77c49a8f2f0cd7e373	libmicrohttpd-0.9.39.tar.gz
+sha256	403d4d46a8690ad8382bd9f156be3eaf4e80869a75b39f03d48bbcb124c7b7a6	libmicrohttpd-0.9.40.tar.gz
diff --git a/package/libmicrohttpd/libmicrohttpd.mk b/package/libmicrohttpd/libmicrohttpd.mk
index e1b5f8b..b661f95 100644
--- a/package/libmicrohttpd/libmicrohttpd.mk
+++ b/package/libmicrohttpd/libmicrohttpd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBMICROHTTPD_VERSION = 0.9.39
+LIBMICROHTTPD_VERSION = 0.9.40
 LIBMICROHTTPD_SITE = $(BR2_GNU_MIRROR)/libmicrohttpd
 LIBMICROHTTPD_LICENSE_FILES = COPYING
 LIBMICROHTTPD_INSTALL_STAGING = YES
-- 
2.0.5
