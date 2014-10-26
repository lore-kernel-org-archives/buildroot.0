From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Sun, 26 Oct 2014 19:45:38 +0100
Subject: [Buildroot] [PATCH 32/51] sunxi-mali-prop: bump version
In-Reply-To: <1414349157-22749-1-git-send-email-maxime.hadjinlian@gmail.com>
References: <1414349157-22749-1-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <1414349157-22749-32-git-send-email-maxime.hadjinlian@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
---
 package/sunxi-mali-prop/sunxi-mali-prop.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

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
-- 
2.1.1
