From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Fri, 24 Jan 2014 11:46:22 +0100
Subject: [Buildroot] [PATCH] can-utils: bump version
Message-ID: <1390560382-12486-1-git-send-email-yegorslists@googlemail.com>
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
index 743fe7c..44713cf 100644
--- a/package/can-utils/can-utils.mk
+++ b/package/can-utils/can-utils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CAN_UTILS_VERSION = 16c970d40e6c19dde705bad4751bab1a3a4f3a0d
+CAN_UTILS_VERSION = 111f8d3acf6f6b30bf208fd9c98399c5fb9d29de
 CAN_UTILS_SITE = git://gitorious.org/linux-can/can-utils.git
 CAN_UTILS_AUTORECONF = YES
 
-- 
1.7.7
