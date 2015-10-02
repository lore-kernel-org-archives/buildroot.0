From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri,  2 Oct 2015 10:13:57 -0300
Subject: [Buildroot] [PATCH] libmicrohttpd: bump to version 0.9.44
Message-ID: <1443791637-31068-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/libmicrohttpd/libmicrohttpd.hash | 4 ++--
 package/libmicrohttpd/libmicrohttpd.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libmicrohttpd/libmicrohttpd.hash b/package/libmicrohttpd/libmicrohttpd.hash
index 7abec2f..0b3b795 100644
--- a/package/libmicrohttpd/libmicrohttpd.hash
+++ b/package/libmicrohttpd/libmicrohttpd.hash
@@ -1,2 +1,2 @@
-# Locally calculated
-sha256	414bb37471fd91646a7a41c6877a5be2d03871e8d9f845fd3ee55d0970d9069f	libmicrohttpd-0.9.43.tar.gz
+# Locally calculated after checking pgp signature
+sha256	f2739cc05112dc00a5ebe1a470174970ca3a3fd71dcd67fb7539af9d83b8411e	libmicrohttpd-0.9.44.tar.gz
diff --git a/package/libmicrohttpd/libmicrohttpd.mk b/package/libmicrohttpd/libmicrohttpd.mk
index 4fa27d8..f649da2 100644
--- a/package/libmicrohttpd/libmicrohttpd.mk
+++ b/package/libmicrohttpd/libmicrohttpd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBMICROHTTPD_VERSION = 0.9.43
+LIBMICROHTTPD_VERSION = 0.9.44
 LIBMICROHTTPD_SITE = $(BR2_GNU_MIRROR)/libmicrohttpd
 LIBMICROHTTPD_LICENSE_FILES = COPYING
 LIBMICROHTTPD_INSTALL_STAGING = YES
-- 
2.4.9
