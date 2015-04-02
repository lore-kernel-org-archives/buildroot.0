From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Thu,  2 Apr 2015 21:59:19 +0200
Subject: [Buildroot] [PATCH 2/2] package/softether: bump version
In-Reply-To: <1428004759-25894-1-git-send-email-bernd.kuhls@t-online.de>
References: <1428004759-25894-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1428004759-25894-2-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/softether/softether.mk |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/softether/softether.mk b/package/softether/softether.mk
index d73d33c..17a450f 100644
--- a/package/softether/softether.mk
+++ b/package/softether/softether.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SOFTETHER_VERSION = 64fd19e6f849247e3daee765ad278c6bf072afcb
+SOFTETHER_VERSION = 18b120e5f747a84d26302ec706f6c1c91d642ace
 SOFTETHER_SITE = $(call github,SoftEtherVPN,SoftEtherVPN,$(SOFTETHER_VERSION))
 SOFTETHER_PATCH = \
 	https://github.com/dajhorn/SoftEtherVPN/commit/c5e5d7e93c6f3302adf5821c29c4efdb7630e418.patch \
-- 
1.7.10.4
