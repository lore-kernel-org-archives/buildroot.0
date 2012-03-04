From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 4 Mar 2012 22:11:47 +0100
Subject: [Buildroot] [git commit] at91sam9260dfc_defconfig: fix kernel
	defconfig name
Message-ID: <20120304211156.9014890CE0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=15fe22062229886848e02bb98ccd8ce62f8a2f34
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

at91sam9260_defconfig contains support for the EVM (since v3.2).

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
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
