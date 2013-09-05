From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 5 Sep 2013 10:51:19 +0200
Subject: [Buildroot] [git commit] at91sam9260dfc_defconfig: fix linux
	defconfig name
Message-ID: <20130905085140.AF9BA9B703@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b64b7e58e97e979d6fbbc63c642be285bd804eed
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The 9260 defconfig got renamed to at91sam9260_9g20_defconfig in kernel
3.11.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 configs/at91sam9260dfc_defconfig |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/configs/at91sam9260dfc_defconfig b/configs/at91sam9260dfc_defconfig
index 085997a..20389f3 100644
--- a/configs/at91sam9260dfc_defconfig
+++ b/configs/at91sam9260dfc_defconfig
@@ -16,4 +16,4 @@ BR2_TARGET_UBOOT_BOARDNAME="at91sam9260ek_dataflash_cs0"
 
 # Kernel
 BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_DEFCONFIG="at91sam9260"
+BR2_LINUX_KERNEL_DEFCONFIG="at91sam9260_9g20"
