From: =?UTF-8?q?Jer=C3=B4nimo=20Lopes?= <lopesjeronimo@gmail.com>
Date: Mon, 28 Apr 2014 12:34:50 -0300
Subject: [Buildroot] [PATCH 1/3] connman: bump to version 1.23
Message-ID: <1398699292-19411-1-git-send-email-lopesjeronimo@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Jer?nimo Lopes <lopesjeronimo@gmail.com>
---
 package/connman/connman.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/connman/connman.mk b/package/connman/connman.mk
index 27fe72e..f720d1c 100644
--- a/package/connman/connman.mk
+++ b/package/connman/connman.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CONNMAN_VERSION = 1.21
+CONNMAN_VERSION = 1.23
 CONNMAN_SOURCE = connman-$(CONNMAN_VERSION).tar.xz
 CONNMAN_SITE = $(BR2_KERNEL_MIRROR)/linux/network/connman/
 CONNMAN_DEPENDENCIES = libglib2 dbus iptables gnutls
-- 
1.9.1
