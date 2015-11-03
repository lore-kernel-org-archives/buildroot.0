From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue,  3 Nov 2015 07:51:42 -0300
Subject: [Buildroot] [PATCH] libmicrohttpd: bump to version 0.9.45
Message-ID: <1446547902-23546-1-git-send-email-gustavo@zacarias.com.ar>
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
index 0b3b795..618d53a 100644
--- a/package/libmicrohttpd/libmicrohttpd.hash
+++ b/package/libmicrohttpd/libmicrohttpd.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256	f2739cc05112dc00a5ebe1a470174970ca3a3fd71dcd67fb7539af9d83b8411e	libmicrohttpd-0.9.44.tar.gz
+sha256	1075def48da9327be22441f4a3460d24159fae2bf4bcfb4ab6e7ca5e95e54a69	libmicrohttpd-0.9.45.tar.gz
diff --git a/package/libmicrohttpd/libmicrohttpd.mk b/package/libmicrohttpd/libmicrohttpd.mk
index f649da2..06b40a1 100644
--- a/package/libmicrohttpd/libmicrohttpd.mk
+++ b/package/libmicrohttpd/libmicrohttpd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBMICROHTTPD_VERSION = 0.9.44
+LIBMICROHTTPD_VERSION = 0.9.45
 LIBMICROHTTPD_SITE = $(BR2_GNU_MIRROR)/libmicrohttpd
 LIBMICROHTTPD_LICENSE_FILES = COPYING
 LIBMICROHTTPD_INSTALL_STAGING = YES
-- 
2.4.10
