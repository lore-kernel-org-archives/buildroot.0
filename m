From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun,  9 Aug 2015 17:12:47 +0200
Subject: [Buildroot] [PATCH/next 1/2] package/softether: bump version
Message-ID: <1439133168-13800-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/softether/softether.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/softether/softether.mk b/package/softether/softether.mk
index 17a450f..489341e 100644
--- a/package/softether/softether.mk
+++ b/package/softether/softether.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SOFTETHER_VERSION = 18b120e5f747a84d26302ec706f6c1c91d642ace
+SOFTETHER_VERSION = 4b65e251f240d0b36c704acd598f4ceb07c41413
 SOFTETHER_SITE = $(call github,SoftEtherVPN,SoftEtherVPN,$(SOFTETHER_VERSION))
 SOFTETHER_PATCH = \
 	https://github.com/dajhorn/SoftEtherVPN/commit/c5e5d7e93c6f3302adf5821c29c4efdb7630e418.patch \
-- 
2.1.4
