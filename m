From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 1 Jun 2016 16:53:29 +0200
Subject: [Buildroot] [git commit] uboot-tools: improve the help text of
	existing options
Message-ID: <20160601161312.CA44A802A0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5fe84337485db5e556c962094019169ed9358bc1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Improve the descriptions of the knobs to install mkimage, mkenvimage,
dumpimage, fw_printenv and fw_setenv.

Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/uboot-tools/Config.in | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/package/uboot-tools/Config.in b/package/uboot-tools/Config.in
index aca310b..76983f4 100644
--- a/package/uboot-tools/Config.in
+++ b/package/uboot-tools/Config.in
@@ -10,6 +10,8 @@ if BR2_PACKAGE_UBOOT_TOOLS
 config BR2_PACKAGE_UBOOT_TOOLS_MKIMAGE
 	bool "mkimage"
 	help
+	  Install the mkimage tool on the target system
+
 	  The mkimage tool from Das U-Boot bootloader, which allows
 	  generation of U-Boot images in various formats.
 
@@ -41,6 +43,8 @@ endif
 config BR2_PACKAGE_UBOOT_TOOLS_MKENVIMAGE
 	bool "mkenvimage"
 	help
+	  Install the mkenvimage tool on the target system
+
 	  The mkenvimage tool from Das U-Boot bootloader, which allows
 	  generation of a valid binary environment image from a text file
 	  describing the key=value pairs of the environment.
@@ -49,13 +53,17 @@ config BR2_PACKAGE_UBOOT_TOOLS_FWPRINTENV
 	bool "fw_printenv"
 	default y
 	help
-	  The fw_printenv / fw_setenv tools from Das U-Boot
+	  Install the fw_printenv / fw_setenv tools on the target system
+
+	  The fw_printenv and fw_setenv tools from Das U-Boot
 	  bootloader, which allows access to the U-Boot environment
 	  from Linux.
 
 config BR2_PACKAGE_UBOOT_TOOLS_DUMPIMAGE
 	bool "dumpimage"
 	help
+	  Install the dumpimage tool on the target system
+
 	  The dumpimage tool from Das U-Boot bootloader, which allows
 	  extraction of data from U-Boot images.
 
