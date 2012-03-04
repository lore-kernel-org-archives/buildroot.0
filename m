From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sun,  4 Mar 2012 22:07:52 +0100
Subject: [Buildroot] [PATCH] at91sam9260dfc_defconfig: fix kernel defconfig
	name
Message-ID: <1330895272-13834-1-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

at91sam9260_defconfig contains support for the EVM (since v3.2).

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

---
 configs/at91sam9260dfc_defconfig |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/configs/at91sam9260dfc_defconfig b/configs/at91sam9260dfc_defconfig
index de7ac42..3cd58ac 100644
--- a/configs/at91sam9260dfc_defconfig
+++ b/configs/at91sam9260dfc_defconfig
@@ -15,7 +15,7 @@ BR2_TARGET_UBOOT_2011_12=y
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_USE_DEFCONFIG=y
-BR2_LINUX_KERNEL_DEFCONFIG="at91sam9260ek"
+BR2_LINUX_KERNEL_DEFCONFIG="at91sam9260"
 
 # Filesystem
 BR2_TARGET_ROOTFS_TAR=y
-- 
tg: (dca6e03..) t/at91sam9260dfc_defconfig (depends on: master)
