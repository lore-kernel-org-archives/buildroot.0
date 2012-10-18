From: Marek Belisko <marek.belisko@open-nandra.com>
Date: Thu, 18 Oct 2012 22:31:39 +0200
Subject: [Buildroot] [PATCH] connman: bump to version 1.8.
Message-ID: <1350592299-22900-1-git-send-email-marek.belisko@open-nandra.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Marek Belisko <marek.belisko@open-nandra.com>
---
 package/connman/connman.mk |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/connman/connman.mk b/package/connman/connman.mk
index 2ce3dbd..2c04cdd 100644
--- a/package/connman/connman.mk
+++ b/package/connman/connman.mk
@@ -4,7 +4,7 @@
 #
 #######################################################
 
-CONNMAN_VERSION = 1.7
+CONNMAN_VERSION = 1.8
 CONNMAN_SITE = $(BR2_KERNEL_MIRROR)/linux/network/connman/
 CONNMAN_DEPENDENCIES = libglib2 dbus iptables gnutls
 CONNMAN_INSTALL_STAGING = YES
-- 
1.7.10.4
