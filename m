From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 17 Sep 2013 14:00:50 +0200
Subject: [Buildroot] [git commit] can-utils: bump version
Message-ID: <20130917120200.AE4099B7BD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2a3e794ef76fc4edae0ce4551e06ea5ba15fe23d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/can-utils/can-utils.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/can-utils/can-utils.mk b/package/can-utils/can-utils.mk
index c4a777b..743fe7c 100644
--- a/package/can-utils/can-utils.mk
+++ b/package/can-utils/can-utils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CAN_UTILS_VERSION = 836d3cc0122ce31a1b732d369cbd27b690c3110f
+CAN_UTILS_VERSION = 16c970d40e6c19dde705bad4751bab1a3a4f3a0d
 CAN_UTILS_SITE = git://gitorious.org/linux-can/can-utils.git
 CAN_UTILS_AUTORECONF = YES
 
