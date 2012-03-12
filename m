From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 12 Mar 2012 12:04:20 +0100
Subject: [Buildroot] [git commit] can-utils: bump version and change
	download location
Message-ID: <20120312112157.F134590D6B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0ffcd60a25fa1d93809cdb5ed354a62adae72759
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

SocketCAN repository moved from Berlios.de to gitorious

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
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
