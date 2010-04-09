From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri,  9 Apr 2010 11:07:21 +0200
Subject: [Buildroot] [PATCH 43/44] Update defconfigs after fs cleanup
In-Reply-To: <cover.1270803901.git.thomas.petazzoni@free-electrons.com>
References: <cover.1270803901.git.thomas.petazzoni@free-electrons.com>
Message-ID: <c1d601afff4ca569933e60281b363ead9f15a1f4.1270803901.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 configs/at91rm9200df_defconfig       |    8 ++++----
 configs/at91rm9200df_ext_defconfig   |    8 ++++----
 configs/at91sam9260dfc_defconfig     |    8 ++++----
 configs/at91sam9260dfc_ext_defconfig |    8 ++++----
 configs/at91sam9260pf_defconfig      |    4 ++--
 configs/at91sam9261ek_defconfig      |    8 ++++----
 configs/at91sam9261ek_ext_defconfig  |    8 ++++----
 configs/at91sam9263ek_defconfig      |    8 ++++----
 configs/at91sam9263ek_ext_defconfig  |    8 ++++----
 configs/at91sam9g20dfc_defconfig     |    8 ++++----
 configs/at91sam9g20dfc_ext_defconfig |    8 ++++----
 configs/atngw100-base_defconfig      |    6 +++---
 configs/atngw100_defconfig           |    6 +++---
 configs/atstk1005_defconfig          |    6 +++---
 configs/atstk100x_defconfig          |    6 +++---
 configs/i386_defconfig               |    4 ++--
 configs/i686_defconfig               |    4 ++--
 configs/integrator926_defconfig      |    6 +++---
 configs/integrator926_huge_defconfig |    6 +++---
 configs/kb9202_defconfig             |    2 +-
 configs/v100sc2_defconfig            |    2 +-
 21 files changed, 66 insertions(+), 66 deletions(-)

diff --git a/configs/at91rm9200df_defconfig b/configs/at91rm9200df_defconfig
index d5c5249..1fe6e3f 100644
--- a/configs/at91rm9200df_defconfig
+++ b/configs/at91rm9200df_defconfig
@@ -853,12 +853,12 @@ BR2_TARGET_ROOTFS_EXT2_BLOCKS=0
 BR2_TARGET_ROOTFS_EXT2_INODES=0
 BR2_TARGET_ROOTFS_EXT2_RESBLKS=0
 BR2_TARGET_ROOTFS_EXT2_SQUASH=y
-BR2_TARGET_ROOTFS_EXT2_OUTPUT="$(IMAGE).ext2"
+
 BR2_TARGET_ROOTFS_EXT2_NONE=y
 # BR2_TARGET_ROOTFS_EXT2_GZIP is not set
 # BR2_TARGET_ROOTFS_EXT2_BZIP2 is not set
 # BR2_TARGET_ROOTFS_EXT2_LZMA is not set
-BR2_TARGET_ROOTFS_EXT2_COPYTO="/tftpboot"
+
 BR2_TARGET_ROOTFS_JFFS2=y
 BR2_TARGET_ROOTFS_JFFS2_DATAFLASH_1056=y
 # BR2_TARGET_ROOTFS_JFFS2_DATAFLASH_528 is not set
@@ -875,8 +875,8 @@ BR2_TARGET_ROOTFS_JFFS2_LE=y
 # BR2_TARGET_ROOTFS_JFFS2_BE is not set
 # BR2_TARGET_ROOTFS_JFFS2_SQUASH is not set
 # BR2_TARGET_ROOTFS_JFFS2_SUMMARY is not set
-BR2_TARGET_ROOTFS_JFFS2_OUTPUT="$(IMAGE).jffs2"
-BR2_TARGET_ROOTFS_JFFS2_COPYTO="/tftpboot"
+
+
 # BR2_TARGET_ROOTFS_UBIFS is not set
 # BR2_TARGET_ROOTFS_SQUASHFS is not set
 # BR2_TARGET_ROOTFS_TAR is not set
diff --git a/configs/at91rm9200df_ext_defconfig b/configs/at91rm9200df_ext_defconfig
index ca03b76..32843ba 100644
--- a/configs/at91rm9200df_ext_defconfig
+++ b/configs/at91rm9200df_ext_defconfig
@@ -778,12 +778,12 @@ BR2_TARGET_ROOTFS_EXT2_BLOCKS=0
 BR2_TARGET_ROOTFS_EXT2_INODES=0
 BR2_TARGET_ROOTFS_EXT2_RESBLKS=0
 BR2_TARGET_ROOTFS_EXT2_SQUASH=y
-BR2_TARGET_ROOTFS_EXT2_OUTPUT="$(IMAGE).ext2"
+
 BR2_TARGET_ROOTFS_EXT2_NONE=y
 # BR2_TARGET_ROOTFS_EXT2_GZIP is not set
 # BR2_TARGET_ROOTFS_EXT2_BZIP2 is not set
 # BR2_TARGET_ROOTFS_EXT2_LZMA is not set
-BR2_TARGET_ROOTFS_EXT2_COPYTO="/tftpboot"
+
 BR2_TARGET_ROOTFS_JFFS2=y
 BR2_TARGET_ROOTFS_JFFS2_DATAFLASH_1056=y
 # BR2_TARGET_ROOTFS_JFFS2_DATAFLASH_528 is not set
@@ -800,8 +800,8 @@ BR2_TARGET_ROOTFS_JFFS2_LE=y
 # BR2_TARGET_ROOTFS_JFFS2_BE is not set
 # BR2_TARGET_ROOTFS_JFFS2_SQUASH is not set
 # BR2_TARGET_ROOTFS_JFFS2_SUMMARY is not set
-BR2_TARGET_ROOTFS_JFFS2_OUTPUT="$(IMAGE).jffs2"
-BR2_TARGET_ROOTFS_JFFS2_COPYTO="/tftpboot"
+
+
 # BR2_TARGET_ROOTFS_UBIFS is not set
 # BR2_TARGET_ROOTFS_SQUASHFS is not set
 # BR2_TARGET_ROOTFS_TAR is not set
diff --git a/configs/at91sam9260dfc_defconfig b/configs/at91sam9260dfc_defconfig
index 2d8961c..46166e0 100644
--- a/configs/at91sam9260dfc_defconfig
+++ b/configs/at91sam9260dfc_defconfig
@@ -867,12 +867,12 @@ BR2_TARGET_ROOTFS_EXT2_BLOCKS=0
 BR2_TARGET_ROOTFS_EXT2_INODES=0
 BR2_TARGET_ROOTFS_EXT2_RESBLKS=0
 BR2_TARGET_ROOTFS_EXT2_SQUASH=y
-BR2_TARGET_ROOTFS_EXT2_OUTPUT="$(IMAGE).ext2"
+
 BR2_TARGET_ROOTFS_EXT2_NONE=y
 # BR2_TARGET_ROOTFS_EXT2_GZIP is not set
 # BR2_TARGET_ROOTFS_EXT2_BZIP2 is not set
 # BR2_TARGET_ROOTFS_EXT2_LZMA is not set
-BR2_TARGET_ROOTFS_EXT2_COPYTO="/tftpboot"
+
 BR2_TARGET_ROOTFS_JFFS2=y
 BR2_TARGET_ROOTFS_JFFS2_DATAFLASH_1056=y
 # BR2_TARGET_ROOTFS_JFFS2_DATAFLASH_528 is not set
@@ -889,8 +889,8 @@ BR2_TARGET_ROOTFS_JFFS2_LE=y
 # BR2_TARGET_ROOTFS_JFFS2_BE is not set
 # BR2_TARGET_ROOTFS_JFFS2_SQUASH is not set
 # BR2_TARGET_ROOTFS_JFFS2_SUMMARY is not set
-BR2_TARGET_ROOTFS_JFFS2_OUTPUT="$(IMAGE).jffs2"
-BR2_TARGET_ROOTFS_JFFS2_COPYTO="/tftpboot"
+
+
 # BR2_TARGET_ROOTFS_UBIFS is not set
 # BR2_TARGET_ROOTFS_SQUASHFS is not set
 # BR2_TARGET_ROOTFS_TAR is not set
diff --git a/configs/at91sam9260dfc_ext_defconfig b/configs/at91sam9260dfc_ext_defconfig
index ddd4b42..7f12884 100644
--- a/configs/at91sam9260dfc_ext_defconfig
+++ b/configs/at91sam9260dfc_ext_defconfig
@@ -786,12 +786,12 @@ BR2_TARGET_ROOTFS_EXT2_BLOCKS=0
 BR2_TARGET_ROOTFS_EXT2_INODES=0
 BR2_TARGET_ROOTFS_EXT2_RESBLKS=0
 BR2_TARGET_ROOTFS_EXT2_SQUASH=y
-BR2_TARGET_ROOTFS_EXT2_OUTPUT="$(IMAGE).ext2"
+
 BR2_TARGET_ROOTFS_EXT2_NONE=y
 # BR2_TARGET_ROOTFS_EXT2_GZIP is not set
 # BR2_TARGET_ROOTFS_EXT2_BZIP2 is not set
 # BR2_TARGET_ROOTFS_EXT2_LZMA is not set
-BR2_TARGET_ROOTFS_EXT2_COPYTO="/tftpboot"
+
 BR2_TARGET_ROOTFS_JFFS2=y
 BR2_TARGET_ROOTFS_JFFS2_DATAFLASH_1056=y
 # BR2_TARGET_ROOTFS_JFFS2_DATAFLASH_528 is not set
@@ -808,8 +808,8 @@ BR2_TARGET_ROOTFS_JFFS2_LE=y
 # BR2_TARGET_ROOTFS_JFFS2_BE is not set
 # BR2_TARGET_ROOTFS_JFFS2_SQUASH is not set
 # BR2_TARGET_ROOTFS_JFFS2_SUMMARY is not set
-BR2_TARGET_ROOTFS_JFFS2_OUTPUT="$(IMAGE).jffs2"
-BR2_TARGET_ROOTFS_JFFS2_COPYTO="/tftpboot"
+
+
 # BR2_TARGET_ROOTFS_UBIFS is not set
 # BR2_TARGET_ROOTFS_SQUASHFS is not set
 # BR2_TARGET_ROOTFS_TAR is not set
diff --git a/configs/at91sam9260pf_defconfig b/configs/at91sam9260pf_defconfig
index 17477d2..b9e8a28 100644
--- a/configs/at91sam9260pf_defconfig
+++ b/configs/at91sam9260pf_defconfig
@@ -558,12 +558,12 @@ BR2_TARGET_ROOTFS_EXT2_BLOCKS=0
 BR2_TARGET_ROOTFS_EXT2_INODES=0
 BR2_TARGET_ROOTFS_EXT2_RESBLKS=0
 BR2_TARGET_ROOTFS_EXT2_SQUASH=y
-BR2_TARGET_ROOTFS_EXT2_OUTPUT="$(IMAGE).ext2"
+
 BR2_TARGET_ROOTFS_EXT2_NONE=y
 # BR2_TARGET_ROOTFS_EXT2_GZIP is not set
 # BR2_TARGET_ROOTFS_EXT2_BZIP2 is not set
 # BR2_TARGET_ROOTFS_EXT2_LZMA is not set
-BR2_TARGET_ROOTFS_EXT2_COPYTO=""
+
 # BR2_TARGET_ROOTFS_JFFS2 is not set
 # BR2_TARGET_ROOTFS_SQUASHFS is not set
 # BR2_TARGET_ROOTFS_TAR is not set
diff --git a/configs/at91sam9261ek_defconfig b/configs/at91sam9261ek_defconfig
index 824a503..1073e78 100644
--- a/configs/at91sam9261ek_defconfig
+++ b/configs/at91sam9261ek_defconfig
@@ -918,12 +918,12 @@ BR2_TARGET_ROOTFS_EXT2_BLOCKS=0
 BR2_TARGET_ROOTFS_EXT2_INODES=0
 BR2_TARGET_ROOTFS_EXT2_RESBLKS=0
 BR2_TARGET_ROOTFS_EXT2_SQUASH=y
-BR2_TARGET_ROOTFS_EXT2_OUTPUT="$(IMAGE).ext2"
+
 BR2_TARGET_ROOTFS_EXT2_NONE=y
 # BR2_TARGET_ROOTFS_EXT2_GZIP is not set
 # BR2_TARGET_ROOTFS_EXT2_BZIP2 is not set
 # BR2_TARGET_ROOTFS_EXT2_LZMA is not set
-BR2_TARGET_ROOTFS_EXT2_COPYTO=""
+
 BR2_TARGET_ROOTFS_JFFS2=y
 # BR2_TARGET_ROOTFS_JFFS2_DATAFLASH_1056 is not set
 # BR2_TARGET_ROOTFS_JFFS2_DATAFLASH_528 is not set
@@ -941,8 +941,8 @@ BR2_TARGET_ROOTFS_JFFS2_LE=y
 # BR2_TARGET_ROOTFS_JFFS2_BE is not set
 # BR2_TARGET_ROOTFS_JFFS2_SQUASH is not set
 # BR2_TARGET_ROOTFS_JFFS2_SUMMARY is not set
-BR2_TARGET_ROOTFS_JFFS2_OUTPUT="$(IMAGE).jffs2"
-BR2_TARGET_ROOTFS_JFFS2_COPYTO=""
+
+
 # BR2_TARGET_ROOTFS_UBIFS is not set
 # BR2_TARGET_ROOTFS_SQUASHFS is not set
 # BR2_TARGET_ROOTFS_TAR is not set
diff --git a/configs/at91sam9261ek_ext_defconfig b/configs/at91sam9261ek_ext_defconfig
index 3ee047c..d7f9f4a 100644
--- a/configs/at91sam9261ek_ext_defconfig
+++ b/configs/at91sam9261ek_ext_defconfig
@@ -874,12 +874,12 @@ BR2_TARGET_ROOTFS_EXT2_BLOCKS=0
 BR2_TARGET_ROOTFS_EXT2_INODES=0
 BR2_TARGET_ROOTFS_EXT2_RESBLKS=0
 BR2_TARGET_ROOTFS_EXT2_SQUASH=y
-BR2_TARGET_ROOTFS_EXT2_OUTPUT="$(IMAGE).ext2"
+
 BR2_TARGET_ROOTFS_EXT2_NONE=y
 # BR2_TARGET_ROOTFS_EXT2_GZIP is not set
 # BR2_TARGET_ROOTFS_EXT2_BZIP2 is not set
 # BR2_TARGET_ROOTFS_EXT2_LZMA is not set
-BR2_TARGET_ROOTFS_EXT2_COPYTO=""
+
 BR2_TARGET_ROOTFS_JFFS2=y
 # BR2_TARGET_ROOTFS_JFFS2_DATAFLASH_1056 is not set
 # BR2_TARGET_ROOTFS_JFFS2_DATAFLASH_528 is not set
@@ -897,8 +897,8 @@ BR2_TARGET_ROOTFS_JFFS2_LE=y
 # BR2_TARGET_ROOTFS_JFFS2_BE is not set
 # BR2_TARGET_ROOTFS_JFFS2_SQUASH is not set
 # BR2_TARGET_ROOTFS_JFFS2_SUMMARY is not set
-BR2_TARGET_ROOTFS_JFFS2_OUTPUT="$(IMAGE).jffs2"
-BR2_TARGET_ROOTFS_JFFS2_COPYTO=""
+
+
 # BR2_TARGET_ROOTFS_UBIFS is not set
 # BR2_TARGET_ROOTFS_SQUASHFS is not set
 # BR2_TARGET_ROOTFS_TAR is not set
diff --git a/configs/at91sam9263ek_defconfig b/configs/at91sam9263ek_defconfig
index 8dff3e4..74dbfcd 100644
--- a/configs/at91sam9263ek_defconfig
+++ b/configs/at91sam9263ek_defconfig
@@ -915,12 +915,12 @@ BR2_TARGET_ROOTFS_EXT2_BLOCKS=0
 BR2_TARGET_ROOTFS_EXT2_INODES=0
 BR2_TARGET_ROOTFS_EXT2_RESBLKS=0
 BR2_TARGET_ROOTFS_EXT2_SQUASH=y
-BR2_TARGET_ROOTFS_EXT2_OUTPUT="$(IMAGE).ext2"
+
 BR2_TARGET_ROOTFS_EXT2_NONE=y
 # BR2_TARGET_ROOTFS_EXT2_GZIP is not set
 # BR2_TARGET_ROOTFS_EXT2_BZIP2 is not set
 # BR2_TARGET_ROOTFS_EXT2_LZMA is not set
-BR2_TARGET_ROOTFS_EXT2_COPYTO=""
+
 BR2_TARGET_ROOTFS_JFFS2=y
 # BR2_TARGET_ROOTFS_JFFS2_DATAFLASH_1056 is not set
 # BR2_TARGET_ROOTFS_JFFS2_DATAFLASH_528 is not set
@@ -938,8 +938,8 @@ BR2_TARGET_ROOTFS_JFFS2_LE=y
 # BR2_TARGET_ROOTFS_JFFS2_BE is not set
 # BR2_TARGET_ROOTFS_JFFS2_SQUASH is not set
 # BR2_TARGET_ROOTFS_JFFS2_SUMMARY is not set
-BR2_TARGET_ROOTFS_JFFS2_OUTPUT="$(IMAGE).jffs2"
-BR2_TARGET_ROOTFS_JFFS2_COPYTO=""
+
+
 # BR2_TARGET_ROOTFS_UBIFS is not set
 # BR2_TARGET_ROOTFS_SQUASHFS is not set
 # BR2_TARGET_ROOTFS_TAR is not set
diff --git a/configs/at91sam9263ek_ext_defconfig b/configs/at91sam9263ek_ext_defconfig
index a84cc7a..44c30e2 100644
--- a/configs/at91sam9263ek_ext_defconfig
+++ b/configs/at91sam9263ek_ext_defconfig
@@ -836,12 +836,12 @@ BR2_TARGET_ROOTFS_EXT2_BLOCKS=0
 BR2_TARGET_ROOTFS_EXT2_INODES=0
 BR2_TARGET_ROOTFS_EXT2_RESBLKS=0
 BR2_TARGET_ROOTFS_EXT2_SQUASH=y
-BR2_TARGET_ROOTFS_EXT2_OUTPUT="$(IMAGE).ext2"
+
 BR2_TARGET_ROOTFS_EXT2_NONE=y
 # BR2_TARGET_ROOTFS_EXT2_GZIP is not set
 # BR2_TARGET_ROOTFS_EXT2_BZIP2 is not set
 # BR2_TARGET_ROOTFS_EXT2_LZMA is not set
-BR2_TARGET_ROOTFS_EXT2_COPYTO=""
+
 BR2_TARGET_ROOTFS_JFFS2=y
 # BR2_TARGET_ROOTFS_JFFS2_DATAFLASH_1056 is not set
 # BR2_TARGET_ROOTFS_JFFS2_DATAFLASH_528 is not set
@@ -859,8 +859,8 @@ BR2_TARGET_ROOTFS_JFFS2_LE=y
 # BR2_TARGET_ROOTFS_JFFS2_BE is not set
 # BR2_TARGET_ROOTFS_JFFS2_SQUASH is not set
 # BR2_TARGET_ROOTFS_JFFS2_SUMMARY is not set
-BR2_TARGET_ROOTFS_JFFS2_OUTPUT="$(IMAGE).jffs2"
-BR2_TARGET_ROOTFS_JFFS2_COPYTO=""
+
+
 # BR2_TARGET_ROOTFS_UBIFS is not set
 # BR2_TARGET_ROOTFS_SQUASHFS is not set
 # BR2_TARGET_ROOTFS_TAR is not set
diff --git a/configs/at91sam9g20dfc_defconfig b/configs/at91sam9g20dfc_defconfig
index 3f7da32..9b3af76 100644
--- a/configs/at91sam9g20dfc_defconfig
+++ b/configs/at91sam9g20dfc_defconfig
@@ -783,12 +783,12 @@ BR2_TARGET_ROOTFS_EXT2_BLOCKS=0
 BR2_TARGET_ROOTFS_EXT2_INODES=0
 BR2_TARGET_ROOTFS_EXT2_RESBLKS=0
 BR2_TARGET_ROOTFS_EXT2_SQUASH=y
-BR2_TARGET_ROOTFS_EXT2_OUTPUT="$(IMAGE).ext2"
+
 BR2_TARGET_ROOTFS_EXT2_NONE=y
 # BR2_TARGET_ROOTFS_EXT2_GZIP is not set
 # BR2_TARGET_ROOTFS_EXT2_BZIP2 is not set
 # BR2_TARGET_ROOTFS_EXT2_LZMA is not set
-BR2_TARGET_ROOTFS_EXT2_COPYTO="/tftpboot"
+
 BR2_TARGET_ROOTFS_JFFS2=y
 BR2_TARGET_ROOTFS_JFFS2_DATAFLASH_1056=y
 # BR2_TARGET_ROOTFS_JFFS2_DATAFLASH_528 is not set
@@ -805,8 +805,8 @@ BR2_TARGET_ROOTFS_JFFS2_LE=y
 # BR2_TARGET_ROOTFS_JFFS2_BE is not set
 # BR2_TARGET_ROOTFS_JFFS2_SQUASH is not set
 # BR2_TARGET_ROOTFS_JFFS2_SUMMARY is not set
-BR2_TARGET_ROOTFS_JFFS2_OUTPUT="$(IMAGE).jffs2"
-BR2_TARGET_ROOTFS_JFFS2_COPYTO="/tftpboot"
+
+
 # BR2_TARGET_ROOTFS_UBIFS is not set
 # BR2_TARGET_ROOTFS_SQUASHFS is not set
 # BR2_TARGET_ROOTFS_TAR is not set
diff --git a/configs/at91sam9g20dfc_ext_defconfig b/configs/at91sam9g20dfc_ext_defconfig
index 84d703a..5bf6ea7 100644
--- a/configs/at91sam9g20dfc_ext_defconfig
+++ b/configs/at91sam9g20dfc_ext_defconfig
@@ -786,12 +786,12 @@ BR2_TARGET_ROOTFS_EXT2_BLOCKS=0
 BR2_TARGET_ROOTFS_EXT2_INODES=0
 BR2_TARGET_ROOTFS_EXT2_RESBLKS=0
 BR2_TARGET_ROOTFS_EXT2_SQUASH=y
-BR2_TARGET_ROOTFS_EXT2_OUTPUT="$(IMAGE).ext2"
+
 BR2_TARGET_ROOTFS_EXT2_NONE=y
 # BR2_TARGET_ROOTFS_EXT2_GZIP is not set
 # BR2_TARGET_ROOTFS_EXT2_BZIP2 is not set
 # BR2_TARGET_ROOTFS_EXT2_LZMA is not set
-BR2_TARGET_ROOTFS_EXT2_COPYTO="/tftpboot"
+
 BR2_TARGET_ROOTFS_JFFS2=y
 BR2_TARGET_ROOTFS_JFFS2_DATAFLASH_1056=y
 # BR2_TARGET_ROOTFS_JFFS2_DATAFLASH_528 is not set
@@ -808,8 +808,8 @@ BR2_TARGET_ROOTFS_JFFS2_LE=y
 # BR2_TARGET_ROOTFS_JFFS2_BE is not set
 # BR2_TARGET_ROOTFS_JFFS2_SQUASH is not set
 # BR2_TARGET_ROOTFS_JFFS2_SUMMARY is not set
-BR2_TARGET_ROOTFS_JFFS2_OUTPUT="$(IMAGE).jffs2"
-BR2_TARGET_ROOTFS_JFFS2_COPYTO="/tftpboot"
+
+
 # BR2_TARGET_ROOTFS_UBIFS is not set
 # BR2_TARGET_ROOTFS_SQUASHFS is not set
 # BR2_TARGET_ROOTFS_TAR is not set
diff --git a/configs/atngw100-base_defconfig b/configs/atngw100-base_defconfig
index adae5c6..fe34989 100644
--- a/configs/atngw100-base_defconfig
+++ b/configs/atngw100-base_defconfig
@@ -723,8 +723,8 @@ BR2_TARGET_ROOTFS_JFFS2_PADSIZE=0x0
 # BR2_TARGET_ROOTFS_JFFS2_LE is not set
 BR2_TARGET_ROOTFS_JFFS2_BE=y
 # BR2_TARGET_ROOTFS_JFFS2_SUMMARY is not set
-BR2_TARGET_ROOTFS_JFFS2_OUTPUT="$(IMAGE).jffs2"
-BR2_TARGET_ROOTFS_JFFS2_COPYTO=""
+
+
 # BR2_TARGET_ROOTFS_UBIFS is not set
 # BR2_TARGET_ROOTFS_SQUASHFS is not set
 BR2_TARGET_ROOTFS_TAR=y
@@ -733,7 +733,7 @@ BR2_TARGET_ROOTFS_TAR_NONE=y
 # BR2_TARGET_ROOTFS_TAR_BZIP2 is not set
 # BR2_TARGET_ROOTFS_TAR_LZMA is not set
 BR2_TARGET_ROOTFS_TAR_OPTIONS=""
-BR2_TARGET_ROOTFS_TAR_COPYTO=""
+
 # BR2_TARGET_ROOTFS_CPIO is not set
 # BR2_TARGET_ROOTFS_INITRAMFS is not set
 # BR2_TARGET_ROOTFS_ROMFS is not set
diff --git a/configs/atngw100_defconfig b/configs/atngw100_defconfig
index 0c76398..4a702a5 100644
--- a/configs/atngw100_defconfig
+++ b/configs/atngw100_defconfig
@@ -713,8 +713,8 @@ BR2_TARGET_ROOTFS_JFFS2_NOCLEANMARKER=y
 # BR2_TARGET_ROOTFS_JFFS2_LE is not set
 BR2_TARGET_ROOTFS_JFFS2_BE=y
 # BR2_TARGET_ROOTFS_JFFS2_SUMMARY is not set
-BR2_TARGET_ROOTFS_JFFS2_OUTPUT="$(IMAGE).jffs2"
-BR2_TARGET_ROOTFS_JFFS2_COPYTO="/tftpboot"
+
+
 # BR2_TARGET_ROOTFS_UBIFS is not set
 # BR2_TARGET_ROOTFS_SQUASHFS is not set
 BR2_TARGET_ROOTFS_TAR=y
@@ -723,7 +723,7 @@ BR2_TARGET_ROOTFS_TAR_NONE=y
 # BR2_TARGET_ROOTFS_TAR_BZIP2 is not set
 # BR2_TARGET_ROOTFS_TAR_LZMA is not set
 BR2_TARGET_ROOTFS_TAR_OPTIONS=""
-BR2_TARGET_ROOTFS_TAR_COPYTO=""
+
 # BR2_TARGET_ROOTFS_CPIO is not set
 # BR2_TARGET_ROOTFS_INITRAMFS is not set
 # BR2_TARGET_ROOTFS_ROMFS is not set
diff --git a/configs/atstk1005_defconfig b/configs/atstk1005_defconfig
index 8044b38..c829495 100644
--- a/configs/atstk1005_defconfig
+++ b/configs/atstk1005_defconfig
@@ -757,8 +757,8 @@ BR2_TARGET_ROOTFS_JFFS2_NOCLEANMARKER=y
 BR2_TARGET_ROOTFS_JFFS2_BE=y
 # BR2_TARGET_ROOTFS_JFFS2_SQUASH is not set
 # BR2_TARGET_ROOTFS_JFFS2_SUMMARY is not set
-BR2_TARGET_ROOTFS_JFFS2_OUTPUT="$(IMAGE).jffs2"
-BR2_TARGET_ROOTFS_JFFS2_COPYTO="/tftpboot"
+
+
 # BR2_TARGET_ROOTFS_UBIFS is not set
 # BR2_TARGET_ROOTFS_SQUASHFS is not set
 BR2_TARGET_ROOTFS_TAR=y
@@ -767,7 +767,7 @@ BR2_TARGET_ROOTFS_TAR_NONE=y
 # BR2_TARGET_ROOTFS_TAR_BZIP2 is not set
 # BR2_TARGET_ROOTFS_TAR_LZMA is not set
 BR2_TARGET_ROOTFS_TAR_OPTIONS=""
-BR2_TARGET_ROOTFS_TAR_COPYTO=""
+
 # BR2_TARGET_ROOTFS_CPIO is not set
 # BR2_TARGET_ROOTFS_INITRAMFS is not set
 # BR2_TARGET_ROOTFS_ROMFS is not set
diff --git a/configs/atstk100x_defconfig b/configs/atstk100x_defconfig
index aac5aa8..c1398d4 100644
--- a/configs/atstk100x_defconfig
+++ b/configs/atstk100x_defconfig
@@ -848,12 +848,12 @@ BR2_TARGET_ROOTFS_EXT2_BLOCKS=0
 BR2_TARGET_ROOTFS_EXT2_INODES=0
 BR2_TARGET_ROOTFS_EXT2_RESBLKS=0
 BR2_TARGET_ROOTFS_EXT2_SQUASH=y
-BR2_TARGET_ROOTFS_EXT2_OUTPUT="$(IMAGE).ext2"
+
 # BR2_TARGET_ROOTFS_EXT2_NONE is not set
 # BR2_TARGET_ROOTFS_EXT2_GZIP is not set
 BR2_TARGET_ROOTFS_EXT2_BZIP2=y
 # BR2_TARGET_ROOTFS_EXT2_LZMA is not set
-BR2_TARGET_ROOTFS_EXT2_COPYTO="/tftpboot"
+
 # BR2_TARGET_ROOTFS_JFFS2 is not set
 # BR2_TARGET_ROOTFS_UBIFS is not set
 # BR2_TARGET_ROOTFS_SQUASHFS is not set
@@ -863,7 +863,7 @@ BR2_TARGET_ROOTFS_TAR_NONE=y
 # BR2_TARGET_ROOTFS_TAR_BZIP2 is not set
 # BR2_TARGET_ROOTFS_TAR_LZMA is not set
 BR2_TARGET_ROOTFS_TAR_OPTIONS=""
-BR2_TARGET_ROOTFS_TAR_COPYTO=""
+
 # BR2_TARGET_ROOTFS_CPIO is not set
 # BR2_TARGET_ROOTFS_INITRAMFS is not set
 # BR2_TARGET_ROOTFS_ROMFS is not set
diff --git a/configs/i386_defconfig b/configs/i386_defconfig
index f4506f1..4c2d092 100644
--- a/configs/i386_defconfig
+++ b/configs/i386_defconfig
@@ -701,8 +701,8 @@ BR2_TARGET_ROOTFS_JFFS2_EBSIZE=0x20000
 BR2_TARGET_ROOTFS_JFFS2_LE=y
 # BR2_TARGET_ROOTFS_JFFS2_BE is not set
 # BR2_TARGET_ROOTFS_JFFS2_SUMMARY is not set
-BR2_TARGET_ROOTFS_JFFS2_OUTPUT="$(IMAGE).jffs2"
-BR2_TARGET_ROOTFS_JFFS2_COPYTO=""
+
+
 # BR2_TARGET_ROOTFS_UBIFS is not set
 # BR2_TARGET_ROOTFS_SQUASHFS is not set
 # BR2_TARGET_ROOTFS_TAR is not set
diff --git a/configs/i686_defconfig b/configs/i686_defconfig
index fc1f278..dcf35d7 100644
--- a/configs/i686_defconfig
+++ b/configs/i686_defconfig
@@ -701,8 +701,8 @@ BR2_TARGET_ROOTFS_JFFS2_EBSIZE=0x20000
 BR2_TARGET_ROOTFS_JFFS2_LE=y
 # BR2_TARGET_ROOTFS_JFFS2_BE is not set
 # BR2_TARGET_ROOTFS_JFFS2_SUMMARY is not set
-BR2_TARGET_ROOTFS_JFFS2_OUTPUT="$(IMAGE).jffs2"
-BR2_TARGET_ROOTFS_JFFS2_COPYTO=""
+
+
 # BR2_TARGET_ROOTFS_UBIFS is not set
 # BR2_TARGET_ROOTFS_SQUASHFS is not set
 # BR2_TARGET_ROOTFS_TAR is not set
diff --git a/configs/integrator926_defconfig b/configs/integrator926_defconfig
index e985df4..e537b40 100644
--- a/configs/integrator926_defconfig
+++ b/configs/integrator926_defconfig
@@ -687,12 +687,12 @@ BR2_TARGET_ROOTFS_EXT2_BLOCKS=0
 BR2_TARGET_ROOTFS_EXT2_INODES=0
 BR2_TARGET_ROOTFS_EXT2_RESBLKS=0
 BR2_TARGET_ROOTFS_EXT2_SQUASH=y
-BR2_TARGET_ROOTFS_EXT2_OUTPUT="$(IMAGE).ext2"
+
 BR2_TARGET_ROOTFS_EXT2_NONE=y
 # BR2_TARGET_ROOTFS_EXT2_GZIP is not set
 # BR2_TARGET_ROOTFS_EXT2_BZIP2 is not set
 # BR2_TARGET_ROOTFS_EXT2_LZMA is not set
-BR2_TARGET_ROOTFS_EXT2_COPYTO=""
+
 # BR2_TARGET_ROOTFS_JFFS2 is not set
 # BR2_TARGET_ROOTFS_UBIFS is not set
 # BR2_TARGET_ROOTFS_SQUASHFS is not set
@@ -702,7 +702,7 @@ BR2_TARGET_ROOTFS_TAR_NONE=y
 # BR2_TARGET_ROOTFS_TAR_BZIP2 is not set
 # BR2_TARGET_ROOTFS_TAR_LZMA is not set
 BR2_TARGET_ROOTFS_TAR_OPTIONS=""
-BR2_TARGET_ROOTFS_TAR_COPYTO=""
+
 # BR2_TARGET_ROOTFS_CPIO is not set
 # BR2_TARGET_ROOTFS_INITRAMFS is not set
 # BR2_TARGET_ROOTFS_ROMFS is not set
diff --git a/configs/integrator926_huge_defconfig b/configs/integrator926_huge_defconfig
index b0d1dfe..276d69a 100644
--- a/configs/integrator926_huge_defconfig
+++ b/configs/integrator926_huge_defconfig
@@ -664,12 +664,12 @@ BR2_TARGET_ROOTFS_EXT2_BLOCKS=0
 BR2_TARGET_ROOTFS_EXT2_INODES=0
 BR2_TARGET_ROOTFS_EXT2_RESBLKS=0
 BR2_TARGET_ROOTFS_EXT2_SQUASH=y
-BR2_TARGET_ROOTFS_EXT2_OUTPUT="$(IMAGE).ext2"
+
 BR2_TARGET_ROOTFS_EXT2_NONE=y
 # BR2_TARGET_ROOTFS_EXT2_GZIP is not set
 # BR2_TARGET_ROOTFS_EXT2_BZIP2 is not set
 # BR2_TARGET_ROOTFS_EXT2_LZMA is not set
-BR2_TARGET_ROOTFS_EXT2_COPYTO=""
+
 # BR2_TARGET_ROOTFS_JFFS2 is not set
 # BR2_TARGET_ROOTFS_UBIFS is not set
 # BR2_TARGET_ROOTFS_SQUASHFS is not set
@@ -679,7 +679,7 @@ BR2_TARGET_ROOTFS_CPIO_NONE=y
 # BR2_TARGET_ROOTFS_CPIO_GZIP is not set
 # BR2_TARGET_ROOTFS_CPIO_BZIP2 is not set
 # BR2_TARGET_ROOTFS_CPIO_LZMA is not set
-BR2_TARGET_ROOTFS_CPIO_COPYTO=""
+
 # BR2_TARGET_ROOTFS_INITRAMFS is not set
 # BR2_TARGET_ROOTFS_ROMFS is not set
 
diff --git a/configs/kb9202_defconfig b/configs/kb9202_defconfig
index 3a0dfd6..67e6d68 100644
--- a/configs/kb9202_defconfig
+++ b/configs/kb9202_defconfig
@@ -672,7 +672,7 @@ BR2_TARGET_ROOTFS_TAR_NONE=y
 # BR2_TARGET_ROOTFS_TAR_BZIP2 is not set
 # BR2_TARGET_ROOTFS_TAR_LZMA is not set
 BR2_TARGET_ROOTFS_TAR_OPTIONS=""
-BR2_TARGET_ROOTFS_TAR_COPYTO=""
+
 # BR2_TARGET_ROOTFS_CPIO is not set
 # BR2_TARGET_ROOTFS_INITRAMFS is not set
 # BR2_TARGET_ROOTFS_ROMFS is not set
diff --git a/configs/v100sc2_defconfig b/configs/v100sc2_defconfig
index 3c2afa4..836321a 100644
--- a/configs/v100sc2_defconfig
+++ b/configs/v100sc2_defconfig
@@ -703,7 +703,7 @@ BR2_TARGET_ROOTFS_TAR_NONE=y
 # BR2_TARGET_ROOTFS_TAR_BZIP2 is not set
 # BR2_TARGET_ROOTFS_TAR_LZMA is not set
 BR2_TARGET_ROOTFS_TAR_OPTIONS=""
-BR2_TARGET_ROOTFS_TAR_COPYTO=""
+
 # BR2_TARGET_ROOTFS_CPIO is not set
 # BR2_TARGET_ROOTFS_INITRAMFS is not set
 # BR2_TARGET_ROOTFS_ROMFS is not set
-- 
1.6.3.3
