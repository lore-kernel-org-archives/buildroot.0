From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 28 Apr 2013 21:44:24 +0200
Subject: [Buildroot] [git commit] Add defconfig for ATMEL at91sam9g45m10ek
	board
Message-ID: <20130428205743.910B99B8AE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ed205c3878ddce10f485be6bb39d89b87ebec867
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Alexandre Belloni <alexandre.belloni@piout.net>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 configs/at91sam9g45m10ek_defconfig |    9 +++++++++
 1 files changed, 9 insertions(+), 0 deletions(-)

diff --git a/configs/at91sam9g45m10ek_defconfig b/configs/at91sam9g45m10ek_defconfig
new file mode 100644
index 0000000..c958859
--- /dev/null
+++ b/configs/at91sam9g45m10ek_defconfig
@@ -0,0 +1,9 @@
+BR2_arm=y
+BR2_arm926t=y
+BR2_PACKAGE_HOST_SAM_BA=y
+BR2_TARGET_AT91BOOTSTRAP=y
+BR2_TARGET_AT91BOOTSTRAP_BOARD="at91sam9m10g45ek"
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BOARDNAME="at91sam9m10g45ek_nandflash"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_DEFCONFIG="at91sam9g45"
