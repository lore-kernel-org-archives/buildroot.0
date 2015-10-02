From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 2 Oct 2015 15:35:41 +0200
Subject: [Buildroot] [git commit] libmicrohttpd: bump to version 0.9.44
Message-ID: <20151002135307.853A981E16@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4640f87f2f6ab9ad2156e06e2b62f4534e983473
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libmicrohttpd/libmicrohttpd.hash |    4 ++--
 package/libmicrohttpd/libmicrohttpd.mk   |    2 +-
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
