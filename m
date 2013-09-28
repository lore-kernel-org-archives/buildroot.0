From: Gilles Talis <gilles.talis@gmail.com>
Date: Sat, 28 Sep 2013 15:10:03 +0200
Subject: [Buildroot] [PATCH] webp: bump to version 0.3.1
Message-ID: <1380373803-3293-1-git-send-email-gilles.talis@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
---
 package/webp/webp.mk |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/webp/webp.mk b/package/webp/webp.mk
index 9f2acf9..15acd8a 100644
--- a/package/webp/webp.mk
+++ b/package/webp/webp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WEBP_VERSION = 0.3.0
+WEBP_VERSION = 0.3.1
 WEBP_SOURCE = libwebp-$(WEBP_VERSION).tar.gz
 WEBP_SITE = https://webp.googlecode.com/files
 WEBP_LICENSE = BSD-3c
-- 
1.7.10.4
