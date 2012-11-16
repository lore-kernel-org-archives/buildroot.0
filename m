From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 16 Nov 2012 15:28:44 +0100
Subject: [Buildroot] [git commit] can-utils: add CAN FD support
Message-ID: <20121116160049.4E9079A048@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b5ffa8e3dfca9db911de15e06daafae1f5cc2b07
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
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
 
