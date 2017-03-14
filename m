From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 14 Mar 2017 23:38:39 +0100
Subject: [Buildroot] [git commit] uboot: improve BR2_TARGET_UBOOT_SPL_NAME
	help text
Message-ID: <20170314223901.B184781D38@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ab1131d559543840fe366dcd4e4d66c320fdae7e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

SPL is the name used for spl on i.MX6, so update the same on
BR2_TARGET_UBOOT_SPL_NAME help text.

Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Michael Trimarchi <michael@amarulasolutions.com>
Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
[Thomas: rewrap Config.in help text.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 boot/uboot/Config.in | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index 7a73877..c33861b 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -327,8 +327,8 @@ config BR2_TARGET_UBOOT_SPL_NAME
 	depends on BR2_TARGET_UBOOT_SPL
 	help
 	  A space-separated list of SPL binaries, generated during
-	  u-boot build. For most platform it is spl/u-boot-spl.bin
-	  but not always. It is MLO on OMAP for example.
+	  u-boot build. For most platform it is spl/u-boot-spl.bin but
+	  not always. It is MLO on OMAP and SPL on i.MX6 for example.
 
 config BR2_TARGET_UBOOT_ZYNQ_IMAGE
 	bool "Generate image for Xilinx Zynq"
