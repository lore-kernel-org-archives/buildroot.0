From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 21 Dec 2014 23:22:37 +0100
Subject: [Buildroot] [git commit] boot/uboot/Config.in: Fix
	BR2_TARGET_UBOOT_SPL_NAME
Message-ID: <20141221222307.1A01880587@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b819a5fcc0523212362f322a674309cd2581b6b4
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Point out that the SPL name is an image name.

Signed-off-by: J??rg Krause <jkrause@posteo.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 boot/uboot/Config.in |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index 397d2ca..cf40fdc 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -225,7 +225,7 @@ config BR2_TARGET_UBOOT_SPL
 	  into DDR.
 
 config BR2_TARGET_UBOOT_SPL_NAME
-	string "U-Boot SPL target name"
+	string "U-Boot SPL binary image name"
 	default "spl/u-boot-spl.bin"
 	depends on BR2_TARGET_UBOOT_SPL
 	help
