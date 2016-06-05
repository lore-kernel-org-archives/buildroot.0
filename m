From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 5 Jun 2016 21:33:38 +0200
Subject: [Buildroot] [git commit] package/can-utils: bump version
Message-ID: <20160605200530.058867FB44@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b97a3b91670906b8be9b92575bd6e1f1e54b94d5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
 
