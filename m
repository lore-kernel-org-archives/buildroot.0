From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun,  5 Jun 2016 19:51:56 +0200
Subject: [Buildroot] [PATCH 03/28] package/can-utils: bump version
In-Reply-To: <1465149141-15774-1-git-send-email-bernd.kuhls@t-online.de>
References: <1465149141-15774-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1465149141-15774-3-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/can-utils/can-utils.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/can-utils/can-utils.mk b/package/can-utils/can-utils.mk
index 8e8ed4e..e95cf22 100644
--- a/package/can-utils/can-utils.mk
+++ b/package/can-utils/can-utils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CAN_UTILS_VERSION = f0abaaacb0a3f620f73dd6fd716d7daa3c36a8e3
+CAN_UTILS_VERSION = b70a76670dbe8925c2a7c75f90d36a28a8878d7a
 CAN_UTILS_SITE = $(call github,linux-can,can-utils,$(CAN_UTILS_VERSION))
 CAN_UTILS_AUTORECONF = YES
 
-- 
2.8.1
