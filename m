From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Mon, 12 Mar 2012 11:47:21 +0100
Subject: [Buildroot] [PATCH] can-utils: bump version and change download
	location
Message-ID: <1331549241-21658-1-git-send-email-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

SocketCAN repository moved from Berlios.de to gitorious

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/can-utils/can-utils.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/can-utils/can-utils.mk b/package/can-utils/can-utils.mk
index 198c38d..5039043 100644
--- a/package/can-utils/can-utils.mk
+++ b/package/can-utils/can-utils.mk
@@ -4,8 +4,8 @@
 #
 #############################################################
 
-CAN_UTILS_VERSION = 1235
-CAN_UTILS_SITE = svn://svn.berlios.de/socketcan/trunk/can-utils
+CAN_UTILS_VERSION = 50775159276d896d8b3102b6dbc658a91a2a1d53
+CAN_UTILS_SITE = git://gitorious.org/linux-can/can-utils.git
 CAN_UTILS_AUTORECONF = YES
 
 $(eval $(call AUTOTARGETS))
-- 
1.7.7
