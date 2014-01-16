From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 16 Jan 2014 10:21:09 -0300
Subject: [Buildroot] [PATCH] mpc: bump to version 1.0.2
Message-ID: <1389878469-11421-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/mpc/mpc.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/mpc/mpc.mk b/package/mpc/mpc.mk
index 1023665..81ee5f0 100644
--- a/package/mpc/mpc.mk
+++ b/package/mpc/mpc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MPC_VERSION = 1.0.1
+MPC_VERSION = 1.0.2
 MPC_SITE = $(BR2_GNU_MIRROR)/mpc
 MPC_LICENSE = LGPLv3+
 MPC_LICENSE_FILES = COPYING.LESSER
-- 
1.8.3.2
