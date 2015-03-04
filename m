From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Wed,  4 Mar 2015 20:51:34 +0100
Subject: [Buildroot] [PATCH] can-utils: bump version
Message-ID: <1425498694-24272-1-git-send-email-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Change download location as the package has moved to GitHub.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/can-utils/can-utils.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/can-utils/can-utils.mk b/package/can-utils/can-utils.mk
index 44713cf..c50c721 100644
--- a/package/can-utils/can-utils.mk
+++ b/package/can-utils/can-utils.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-CAN_UTILS_VERSION = 111f8d3acf6f6b30bf208fd9c98399c5fb9d29de
-CAN_UTILS_SITE = git://gitorious.org/linux-can/can-utils.git
+CAN_UTILS_VERSION = 002f8eba8703e88cdc6e97f6447a4ce346b739da
+CAN_UTILS_SITE = $(call github,linux-can,can-utils,$(CAN_UTILS_VERSION))
 CAN_UTILS_AUTORECONF = YES
 
 $(eval $(autotools-package))
-- 
2.1.0
