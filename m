From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 14 Jul 2011 22:02:02 +0200
Subject: [Buildroot] [git commit] linux-fusion: change linux26 dependency to
	linux
Message-ID: <20110714200342.1F1AE8A5A8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=8e3bf78a85bc434b92558f1929728ce8e0bbf4f9
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Sven Neumann <s.neumann@raumfeld.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
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
1.7.3.4
