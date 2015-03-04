From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 4 Mar 2015 21:28:14 +0100
Subject: [Buildroot] [git commit] can-utils: bump version
Message-ID: <20150304202828.01C5A817F9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=70d354e1ac408b1531b6696608d963c7be9722df
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Change download location as the package has moved to GitHub.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/can-utils/can-utils.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

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
