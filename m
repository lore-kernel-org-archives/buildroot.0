From: Jonathan Liu <net147@gmail.com>
Date: Fri, 17 Aug 2012 23:23:01 +1000
Subject: [Buildroot] [PATCH] connman: bump to version 1.5
Message-ID: <1345209781-30976-1-git-send-email-net147@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 package/connman/connman.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/connman/connman.mk b/package/connman/connman.mk
index 726cb73..0a2e236 100644
--- a/package/connman/connman.mk
+++ b/package/connman/connman.mk
@@ -4,7 +4,7 @@
 #
 #######################################################
 
-CONNMAN_VERSION = 1.4
+CONNMAN_VERSION = 1.5
 CONNMAN_SITE = $(BR2_KERNEL_MIRROR)/linux/network/connman/
 CONNMAN_DEPENDENCIES = libglib2 dbus iptables gnutls
 CONNMAN_INSTALL_STAGING = YES
-- 
1.7.11.3
