From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 5 Sep 2013 10:47:55 +0200
Subject: [Buildroot] [git commit] at91sam9261ek_defconfig: fix linux
	defconfig name
Message-ID: <20130905084829.61BF19B5B2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7504705667a6a267f257baf70a1a945af8c68d80
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The 9261 defconfig got renamed to at91sam9261_9g10_defconfig in kernel
3.11.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 configs/at91sam9261ek_defconfig |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/configs/at91sam9261ek_defconfig b/configs/at91sam9261ek_defconfig
index c53e732..0824a00 100644
--- a/configs/at91sam9261ek_defconfig
+++ b/configs/at91sam9261ek_defconfig
@@ -16,4 +16,4 @@ BR2_TARGET_UBOOT_BOARDNAME="at91sam9261ek_dataflash_cs0"
 
 # Kernel
 BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_DEFCONFIG="at91sam9261"
+BR2_LINUX_KERNEL_DEFCONFIG="at91sam9261_9g10"
