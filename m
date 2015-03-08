From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 8 Mar 2015 20:33:32 +0100
Subject: [Buildroot] [git commit] can-utils: bump version
Message-ID: <20150308195304.29FB3807F7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=dc47198684c01dac58518a2b06b59f78c86f50ff
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes following autobuild failure, via defining N_SLCAN, if not
already declared:

http://autobuild.buildroot.net/results/799/799561c928d711ada4070ae5e09f4097dd4091e3/

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/can-utils/can-utils.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

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
 
