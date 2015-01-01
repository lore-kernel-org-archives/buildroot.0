From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 1 Jan 2015 23:00:30 +0100
Subject: [Buildroot] [git commit] sunxi-mali-prop: bump version
Message-ID: <20150101220254.0703B807CA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=bc91aaa6fe3ee94cd6306580532c997371bc8426
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/sunxi-mali-prop/sunxi-mali-prop.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/sunxi-mali-prop/sunxi-mali-prop.mk b/package/sunxi-mali-prop/sunxi-mali-prop.mk
index 0cb2d93..b828dc2 100644
--- a/package/sunxi-mali-prop/sunxi-mali-prop.mk
+++ b/package/sunxi-mali-prop/sunxi-mali-prop.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SUNXI_MALI_PROP_VERSION = e4ced471d576708ac9aa093e41a0f91cf429862b
+SUNXI_MALI_PROP_VERSION = 1c5063f43cdc9de341c0d63b2e3921cab86c7742
 SUNXI_MALI_PROP_SITE = $(call github,linux-sunxi,sunxi-mali-proprietary,$(SUNXI_MALI_PROP_VERSION))
 
 $(eval $(generic-package))
