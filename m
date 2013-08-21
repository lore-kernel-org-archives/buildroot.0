From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Wed, 21 Aug 2013 22:49:40 +0200
Subject: [Buildroot] [PATCH] linux-fusion: bump version to 9.0.2
Message-ID: <1377118180-28514-1-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes build with recent kernels.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
For 2013.08

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/linux-fusion/linux-fusion.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/linux-fusion/linux-fusion.mk b/package/linux-fusion/linux-fusion.mk
index ff31934..6f3d50a 100644
--- a/package/linux-fusion/linux-fusion.mk
+++ b/package/linux-fusion/linux-fusion.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LINUX_FUSION_VERSION = 9.0.0
+LINUX_FUSION_VERSION = 9.0.2
 LINUX_FUSION_SOURCE = linux-fusion-$(LINUX_FUSION_VERSION).tar.gz
 LINUX_FUSION_SITE = http://directfb.org/downloads/Core/linux-fusion
 LINUX_FUSION_INSTALL_STAGING = YES
-- 
1.8.4.rc3
