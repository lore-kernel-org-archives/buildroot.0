From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Sun,  8 Mar 2015 19:35:49 +0100
Subject: [Buildroot] [PATCH] can-utils: bump version
Message-ID: <1425839749-9067-1-git-send-email-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes following autobuild failure, via defining N_SLCAN, if not
already declared:

http://autobuild.buildroot.net/results/799/799561c928d711ada4070ae5e09f4097dd4091e3/

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/can-utils/can-utils.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/can-utils/can-utils.mk b/package/can-utils/can-utils.mk
index c50c721..23649fe 100644
--- a/package/can-utils/can-utils.mk
+++ b/package/can-utils/can-utils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CAN_UTILS_VERSION = 002f8eba8703e88cdc6e97f6447a4ce346b739da
+CAN_UTILS_VERSION = 0eb1e3db2e20b0d895468363dbe6030cd8afa61c
 CAN_UTILS_SITE = $(call github,linux-can,can-utils,$(CAN_UTILS_VERSION))
 CAN_UTILS_AUTORECONF = YES
 
-- 
2.1.0
