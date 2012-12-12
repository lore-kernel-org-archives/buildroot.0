From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 12 Dec 2012 17:24:07 -0300
Subject: [Buildroot] [PATCH] iproute2: bump to version 3.7.0
Message-ID: <1355343847-29140-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/iproute2/iproute2.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/iproute2/iproute2.mk b/package/iproute2/iproute2.mk
index 6f5ee51..7766ab8 100644
--- a/package/iproute2/iproute2.mk
+++ b/package/iproute2/iproute2.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-IPROUTE2_VERSION = 3.6.0
+IPROUTE2_VERSION = 3.7.0
 IPROUTE2_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/net/iproute2
 IPROUTE2_TARGET_SBINS = ctstat genl ifstat ip lnstat nstat routef routel rtacct rtmon rtpr rtstat ss tc
 IPROUTE2_LICENSE = GPLv2
-- 
1.7.8.6
