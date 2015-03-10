From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Tue, 10 Mar 2015 19:58:37 +0100
Subject: [Buildroot] [PATCH 2/2] package/softether: bump version
In-Reply-To: <1426013917-11263-1-git-send-email-bernd.kuhls@t-online.de>
References: <1426013917-11263-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1426013917-11263-2-git-send-email-bernd.kuhls@t-online.de>
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
index 7f2dfb8..ea43877 100644
--- a/package/softether/softether.mk
+++ b/package/softether/softether.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SOFTETHER_VERSION = 16b713b98da8dba29f0f845d5a8c36d6f7c34824
+SOFTETHER_VERSION = 64fd19e6f849247e3daee765ad278c6bf072afcb
 SOFTETHER_SITE = $(call github,SoftEtherVPN,SoftEtherVPN,$(SOFTETHER_VERSION))
 SOFTETHER_PATCH = \
 	https://github.com/dajhorn/SoftEtherVPN/commit/c5e5d7e93c6f3302adf5821c29c4efdb7630e418.patch \
-- 
1.7.10.4
