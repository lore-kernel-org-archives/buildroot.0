From: Sven Neumann <s.neumann@raumfeld.com>
Date: Thu, 14 Jul 2011 22:00:06 +0200
Subject: [Buildroot] [PATCH] linux-fusion: change linux26 dependency to linux
Message-ID: <1310673606-30130-1-git-send-email-s.neumann@raumfeld.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Sven Neumann <s.neumann@raumfeld.com>
---
 package/linux-fusion/linux-fusion.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/linux-fusion/linux-fusion.mk b/package/linux-fusion/linux-fusion.mk
index 440b8b9..392ffd6 100644
--- a/package/linux-fusion/linux-fusion.mk
+++ b/package/linux-fusion/linux-fusion.mk
@@ -7,7 +7,7 @@ LINUX_FUSION_VERSION = 8.1.2
 LINUX_FUSION_SOURCE = linux-fusion-$(LINUX_FUSION_VERSION).tar.gz
 LINUX_FUSION_SITE = http://directfb.org/downloads/Core/linux-fusion
 LINUX_FUSION_INSTALL_STAGING = YES
-LINUX_FUSION_DEPENDENCIES = linux26
+LINUX_FUSION_DEPENDENCIES = linux
 
 LINUX_FOR_FUSION=$(LINUX26_VERSION_PROBED)
 LINUX_FUSION_ETC_DIR=$(TARGET_DIR)/etc/udev/rules.d
-- 
1.7.4.1
