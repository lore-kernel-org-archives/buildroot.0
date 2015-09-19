From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 19 Sep 2015 12:34:36 +0200
Subject: [Buildroot] [PATCH 2/5] package/libmicrohttpd: bump to version
	0.9.43
In-Reply-To: <1442658879-5494-1-git-send-email-bernd.kuhls@t-online.de>
References: <1442658879-5494-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1442658879-5494-2-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/libmicrohttpd/libmicrohttpd.hash | 4 ++--
 package/libmicrohttpd/libmicrohttpd.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libmicrohttpd/libmicrohttpd.hash b/package/libmicrohttpd/libmicrohttpd.hash
index d5fb7da..7abec2f 100644
--- a/package/libmicrohttpd/libmicrohttpd.hash
+++ b/package/libmicrohttpd/libmicrohttpd.hash
@@ -1,2 +1,2 @@
-# Locally calculated after checking pgp signature
-sha256	00352073367003da40607319e4090a6a8308748b59246ae80e9871f34dad7d5b	libmicrohttpd-0.9.42.tar.gz
+# Locally calculated
+sha256	414bb37471fd91646a7a41c6877a5be2d03871e8d9f845fd3ee55d0970d9069f	libmicrohttpd-0.9.43.tar.gz
diff --git a/package/libmicrohttpd/libmicrohttpd.mk b/package/libmicrohttpd/libmicrohttpd.mk
index f8a9d22..4fa27d8 100644
--- a/package/libmicrohttpd/libmicrohttpd.mk
+++ b/package/libmicrohttpd/libmicrohttpd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBMICROHTTPD_VERSION = 0.9.42
+LIBMICROHTTPD_VERSION = 0.9.43
 LIBMICROHTTPD_SITE = $(BR2_GNU_MIRROR)/libmicrohttpd
 LIBMICROHTTPD_LICENSE_FILES = COPYING
 LIBMICROHTTPD_INSTALL_STAGING = YES
-- 
2.1.4
