From: Axel Lin <axel.lin@ingics.com>
Date: Fri, 27 Dec 2013 14:57:59 +0800
Subject: [Buildroot] [PATCH] cryptsetup: bump to version 1.6.3
Message-ID: <1388127479.28860.0.camel@phoenix>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Axel Lin <axel.lin@ingics.com>
---
 package/cryptsetup/cryptsetup.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/cryptsetup/cryptsetup.mk b/package/cryptsetup/cryptsetup.mk
index a65f841..6ea3aae 100644
--- a/package/cryptsetup/cryptsetup.mk
+++ b/package/cryptsetup/cryptsetup.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CRYPTSETUP_VERSION = 1.6.2
+CRYPTSETUP_VERSION = 1.6.3
 CRYPTSETUP_SOURCE = cryptsetup-$(CRYPTSETUP_VERSION).tar.bz2
 CRYPTSETUP_SITE = http://cryptsetup.googlecode.com/files
 CRYPTSETUP_CONF_ENV += LIBGCRYPT_CONFIG=$(STAGING_DIR)/usr/bin/libgcrypt-config
-- 
1.8.1.2
