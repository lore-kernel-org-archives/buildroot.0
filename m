From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun,  5 Jun 2016 19:52:07 +0200
Subject: [Buildroot] [PATCH 14/28] package/softether: bump version
In-Reply-To: <1465149141-15774-1-git-send-email-bernd.kuhls@t-online.de>
References: <1465149141-15774-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1465149141-15774-14-git-send-email-bernd.kuhls@t-online.de>
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
index 489341e..9f98774 100644
--- a/package/softether/softether.mk
+++ b/package/softether/softether.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SOFTETHER_VERSION = 4b65e251f240d0b36c704acd598f4ceb07c41413
+SOFTETHER_VERSION = 1e17c9bcfd7e7b31756aa5389bcbff76c2c9c88a
 SOFTETHER_SITE = $(call github,SoftEtherVPN,SoftEtherVPN,$(SOFTETHER_VERSION))
 SOFTETHER_PATCH = \
 	https://github.com/dajhorn/SoftEtherVPN/commit/c5e5d7e93c6f3302adf5821c29c4efdb7630e418.patch \
-- 
2.8.1
