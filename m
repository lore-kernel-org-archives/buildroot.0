From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Fri, 16 Nov 2012 09:56:22 +0100
Subject: [Buildroot] [PATCH] can-utils: add CAN FD support
Message-ID: <1353056182-13051-1-git-send-email-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/can-utils/can-utils.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/can-utils/can-utils.mk b/package/can-utils/can-utils.mk
index ea1dc06..321dc52 100644
--- a/package/can-utils/can-utils.mk
+++ b/package/can-utils/can-utils.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-CAN_UTILS_VERSION = 50775159276d896d8b3102b6dbc658a91a2a1d53
+CAN_UTILS_VERSION = 836d3cc0122ce31a1b732d369cbd27b690c3110f
 CAN_UTILS_SITE = git://gitorious.org/linux-can/can-utils.git
 CAN_UTILS_AUTORECONF = YES
 
-- 
1.7.7
