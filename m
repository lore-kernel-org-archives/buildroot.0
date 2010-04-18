From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 18 Apr 2010 22:33:09 +0200
Subject: [Buildroot] [git commit master] Update defconfigs to include
	BR2_ROOTFS_DEVICE_TABLE definition
Message-ID: <20100418203520.28AEF309B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=525ac766cd795c4f7f721e7b940e3ebce99e8ebc
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We only bother updating the defconfigs that need a non-default
BR2_ROOTFS_DEVICE_TABLE value.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 configs/arm_toolchain_defconfig           |    1 +
 configs/at91rm9200df_defconfig            |    1 +
 configs/at91rm9200df_ext_bare_defconfig   |    1 +
 configs/at91rm9200df_ext_defconfig        |    1 +
 configs/at91sam9260dfc_defconfig          |    1 +
 configs/at91sam9260dfc_ext_bare_defconfig |    1 +
 configs/at91sam9260dfc_ext_defconfig      |    1 +
 configs/at91sam9260pf_defconfig           |    1 +
 configs/at91sam9261ek_defconfig           |    1 +
 configs/at91sam9261ek_ext_bare_defconfig  |    1 +
 configs/at91sam9261ek_ext_defconfig       |    1 +
 configs/at91sam9263ek_defconfig           |    1 +
 configs/at91sam9263ek_ext_bare_defconfig  |    1 +
 configs/at91sam9263ek_ext_defconfig       |    1 +
 configs/at91sam9g20dfc_defconfig          |    1 +
 configs/at91sam9g20dfc_ext_bare_defconfig |    1 +
 configs/at91sam9g20dfc_ext_defconfig      |    1 +
 configs/atngw100-base_defconfig           |    1 +
 configs/atngw100_defconfig                |    1 +
 configs/atstk1005_defconfig               |    1 +
 configs/atstk100x_defconfig               |    1 +
 configs/kb9202_defconfig                  |    1 +
 configs/v100sc2_defconfig                 |    1 +
 target/xtensa/defconfig                   |    1 +
 24 files changed, 24 insertions(+), 0 deletions(-)

diff --git a/configs/arm_toolchain_defconfig b/configs/arm_toolchain_defconfig
index 529a363..8e89107 100644
--- a/configs/arm_toolchain_defconfig
+++ b/configs/arm_toolchain_defconfig
@@ -714,6 +714,7 @@ BR2_PACKAGE_XSERVER_none=y
 #
 # filesystem for target device
 #
+BR2_ROOTFS_DEVICE_TABLE="target/device/generic/device_table.txt"
 # BR2_TARGET_ROOTFS_CRAMFS is not set
 # BR2_TARGET_ROOTFS_CLOOP is not set
 # BR2_TARGET_ROOTFS_EXT2 is not set
diff --git a/configs/at91rm9200df_defconfig b/configs/at91rm9200df_defconfig
index e4c0b0e..e004b21 100644
--- a/configs/at91rm9200df_defconfig
+++ b/configs/at91rm9200df_defconfig
@@ -839,6 +839,7 @@ BR2_PACKAGE_LIBXML2=y
 #
 # filesystem for target device
 #
+BR2_ROOTFS_DEVICE_TABLE="target/device/Atmel/root/device_table.txt"
 # BR2_TARGET_ROOTFS_CRAMFS is not set
 # BR2_TARGET_ROOTFS_CLOOP is not set
 BR2_TARGET_ROOTFS_EXT2=y
diff --git a/configs/at91rm9200df_ext_bare_defconfig b/configs/at91rm9200df_ext_bare_defconfig
index 65a640b..032064a 100644
--- a/configs/at91rm9200df_ext_bare_defconfig
+++ b/configs/at91rm9200df_ext_bare_defconfig
@@ -635,6 +635,7 @@ BR2_PACKAGE_XSERVER_none=y
 #
 # filesystem for target device
 #
+BR2_ROOTFS_DEVICE_TABLE="target/device/Atmel/root/device_table.txt"
 # BR2_TARGET_ROOTFS_CRAMFS is not set
 # BR2_TARGET_ROOTFS_CLOOP is not set
 # BR2_TARGET_ROOTFS_EXT2 is not set
diff --git a/configs/at91rm9200df_ext_defconfig b/configs/at91rm9200df_ext_defconfig
index 6a39002..35251a3 100644
--- a/configs/at91rm9200df_ext_defconfig
+++ b/configs/at91rm9200df_ext_defconfig
@@ -765,6 +765,7 @@ BR2_PACKAGE_LIBXML2=y
 #
 # filesystem for target device
 #
+BR2_ROOTFS_DEVICE_TABLE="target/device/Atmel/root/device_table.txt"
 # BR2_TARGET_ROOTFS_CRAMFS is not set
 # BR2_TARGET_ROOTFS_CLOOP is not set
 BR2_TARGET_ROOTFS_EXT2=y
diff --git a/configs/at91sam9260dfc_defconfig b/configs/at91sam9260dfc_defconfig
index 8fb7f0e..b571c80 100644
--- a/configs/at91sam9260dfc_defconfig
+++ b/configs/at91sam9260dfc_defconfig
@@ -853,6 +853,7 @@ BR2_PACKAGE_LIBXML2=y
 #
 # filesystem for target device
 #
+BR2_ROOTFS_DEVICE_TABLE="target/device/Atmel/root/device_table.txt"
 # BR2_TARGET_ROOTFS_CRAMFS is not set
 # BR2_TARGET_ROOTFS_CLOOP is not set
 BR2_TARGET_ROOTFS_EXT2=y
diff --git a/configs/at91sam9260dfc_ext_bare_defconfig b/configs/at91sam9260dfc_ext_bare_defconfig
index 6e4d478..e1ace69 100644
--- a/configs/at91sam9260dfc_ext_bare_defconfig
+++ b/configs/at91sam9260dfc_ext_bare_defconfig
@@ -635,6 +635,7 @@ BR2_PACKAGE_XSERVER_none=y
 #
 # filesystem for target device
 #
+BR2_ROOTFS_DEVICE_TABLE="target/device/Atmel/root/device_table.txt"
 # BR2_TARGET_ROOTFS_CRAMFS is not set
 # BR2_TARGET_ROOTFS_CLOOP is not set
 # BR2_TARGET_ROOTFS_EXT2 is not set
diff --git a/configs/at91sam9260dfc_ext_defconfig b/configs/at91sam9260dfc_ext_defconfig
index 22287ba..c430d3d 100644
--- a/configs/at91sam9260dfc_ext_defconfig
+++ b/configs/at91sam9260dfc_ext_defconfig
@@ -773,6 +773,7 @@ BR2_PACKAGE_LIBXML2=y
 #
 # filesystem for target device
 #
+BR2_ROOTFS_DEVICE_TABLE="target/device/Atmel/root/device_table.txt"
 # BR2_TARGET_ROOTFS_CRAMFS is not set
 # BR2_TARGET_ROOTFS_CLOOP is not set
 BR2_TARGET_ROOTFS_EXT2=y
diff --git a/configs/at91sam9260pf_defconfig b/configs/at91sam9260pf_defconfig
index 396adee..a2b8695 100644
--- a/configs/at91sam9260pf_defconfig
+++ b/configs/at91sam9260pf_defconfig
@@ -548,6 +548,7 @@ BR2_SCRIPTING_SUPPORT=y
 #
 # filesystem for target device
 #
+BR2_ROOTFS_DEVICE_TABLE="target/device/Atmel/root/device_table.txt"
 # BR2_TARGET_ROOTFS_CRAMFS is not set
 # BR2_TARGET_ROOTFS_CLOOP is not set
 BR2_TARGET_ROOTFS_EXT2=y
diff --git a/configs/at91sam9261ek_defconfig b/configs/at91sam9261ek_defconfig
index 73fc09c..1cfc2e7 100644
--- a/configs/at91sam9261ek_defconfig
+++ b/configs/at91sam9261ek_defconfig
@@ -904,6 +904,7 @@ BR2_PACKAGE_LIBXSLT=y
 #
 # filesystem for target device
 #
+BR2_ROOTFS_DEVICE_TABLE="target/device/Atmel/root/device_table.txt"
 # BR2_TARGET_ROOTFS_CRAMFS is not set
 # BR2_TARGET_ROOTFS_CLOOP is not set
 BR2_TARGET_ROOTFS_EXT2=y
diff --git a/configs/at91sam9261ek_ext_bare_defconfig b/configs/at91sam9261ek_ext_bare_defconfig
index 316c15e..5e5e22d 100644
--- a/configs/at91sam9261ek_ext_bare_defconfig
+++ b/configs/at91sam9261ek_ext_bare_defconfig
@@ -638,6 +638,7 @@ BR2_PACKAGE_XSERVER_none=y
 #
 # filesystem for target device
 #
+BR2_ROOTFS_DEVICE_TABLE="target/device/Atmel/root/device_table.txt"
 # BR2_TARGET_ROOTFS_CRAMFS is not set
 # BR2_TARGET_ROOTFS_CLOOP is not set
 # BR2_TARGET_ROOTFS_EXT2 is not set
diff --git a/configs/at91sam9261ek_ext_defconfig b/configs/at91sam9261ek_ext_defconfig
index 4bb96f1..362680b 100644
--- a/configs/at91sam9261ek_ext_defconfig
+++ b/configs/at91sam9261ek_ext_defconfig
@@ -861,6 +861,7 @@ BR2_PACKAGE_LIBXSLT=y
 #
 # filesystem for target device
 #
+BR2_ROOTFS_DEVICE_TABLE="target/device/Atmel/root/device_table.txt"
 # BR2_TARGET_ROOTFS_CRAMFS is not set
 # BR2_TARGET_ROOTFS_CLOOP is not set
 BR2_TARGET_ROOTFS_EXT2=y
diff --git a/configs/at91sam9263ek_defconfig b/configs/at91sam9263ek_defconfig
index cdbeaa3..a670b41 100644
--- a/configs/at91sam9263ek_defconfig
+++ b/configs/at91sam9263ek_defconfig
@@ -901,6 +901,7 @@ BR2_PACKAGE_LIBXSLT=y
 #
 # filesystem for target device
 #
+BR2_ROOTFS_DEVICE_TABLE="target/device/Atmel/root/device_table.txt"
 # BR2_TARGET_ROOTFS_CRAMFS is not set
 # BR2_TARGET_ROOTFS_CLOOP is not set
 BR2_TARGET_ROOTFS_EXT2=y
diff --git a/configs/at91sam9263ek_ext_bare_defconfig b/configs/at91sam9263ek_ext_bare_defconfig
index 3e57789..bc6f626 100644
--- a/configs/at91sam9263ek_ext_bare_defconfig
+++ b/configs/at91sam9263ek_ext_bare_defconfig
@@ -637,6 +637,7 @@ BR2_PACKAGE_XSERVER_none=y
 #
 # filesystem for target device
 #
+BR2_ROOTFS_DEVICE_TABLE="target/device/Atmel/root/device_table.txt"
 # BR2_TARGET_ROOTFS_CRAMFS is not set
 # BR2_TARGET_ROOTFS_CLOOP is not set
 # BR2_TARGET_ROOTFS_EXT2 is not set
diff --git a/configs/at91sam9263ek_ext_defconfig b/configs/at91sam9263ek_ext_defconfig
index 944811f..4a59ea6 100644
--- a/configs/at91sam9263ek_ext_defconfig
+++ b/configs/at91sam9263ek_ext_defconfig
@@ -823,6 +823,7 @@ BR2_PACKAGE_LIBXSLT=y
 #
 # filesystem for target device
 #
+BR2_ROOTFS_DEVICE_TABLE="target/device/Atmel/root/device_table.txt"
 # BR2_TARGET_ROOTFS_CRAMFS is not set
 # BR2_TARGET_ROOTFS_CLOOP is not set
 BR2_TARGET_ROOTFS_EXT2=y
diff --git a/configs/at91sam9g20dfc_defconfig b/configs/at91sam9g20dfc_defconfig
index 710639b..a57dcff 100644
--- a/configs/at91sam9g20dfc_defconfig
+++ b/configs/at91sam9g20dfc_defconfig
@@ -769,6 +769,7 @@ BR2_PACKAGE_EXPAT=y
 #
 # filesystem for target device
 #
+BR2_ROOTFS_DEVICE_TABLE="target/device/Atmel/root/device_table.txt"
 # BR2_TARGET_ROOTFS_CRAMFS is not set
 # BR2_TARGET_ROOTFS_CLOOP is not set
 BR2_TARGET_ROOTFS_EXT2=y
diff --git a/configs/at91sam9g20dfc_ext_bare_defconfig b/configs/at91sam9g20dfc_ext_bare_defconfig
index 4db69f3..3977dc9 100644
--- a/configs/at91sam9g20dfc_ext_bare_defconfig
+++ b/configs/at91sam9g20dfc_ext_bare_defconfig
@@ -635,6 +635,7 @@ BR2_PACKAGE_XSERVER_none=y
 #
 # filesystem for target device
 #
+BR2_ROOTFS_DEVICE_TABLE="target/device/Atmel/root/device_table.txt"
 # BR2_TARGET_ROOTFS_CRAMFS is not set
 # BR2_TARGET_ROOTFS_CLOOP is not set
 # BR2_TARGET_ROOTFS_EXT2 is not set
diff --git a/configs/at91sam9g20dfc_ext_defconfig b/configs/at91sam9g20dfc_ext_defconfig
index a2f34a2..632f2d1 100644
--- a/configs/at91sam9g20dfc_ext_defconfig
+++ b/configs/at91sam9g20dfc_ext_defconfig
@@ -773,6 +773,7 @@ BR2_PACKAGE_LIBXML2=y
 #
 # filesystem for target device
 #
+BR2_ROOTFS_DEVICE_TABLE="target/device/Atmel/root/device_table.txt"
 # BR2_TARGET_ROOTFS_CRAMFS is not set
 # BR2_TARGET_ROOTFS_CLOOP is not set
 BR2_TARGET_ROOTFS_EXT2=y
diff --git a/configs/atngw100-base_defconfig b/configs/atngw100-base_defconfig
index cd5a676..15d779a 100644
--- a/configs/atngw100-base_defconfig
+++ b/configs/atngw100-base_defconfig
@@ -698,6 +698,7 @@ BR2_ROOTFS_SUFFIX="$(DATE)"
 #
 # filesystem for target device
 #
+BR2_ROOTFS_DEVICE_TABLE="target/device/Atmel/atngw100-base/device_table.txt"
 # BR2_TARGET_ROOTFS_CRAMFS is not set
 # BR2_TARGET_ROOTFS_CLOOP is not set
 # BR2_TARGET_ROOTFS_EXT2 is not set
diff --git a/configs/atngw100_defconfig b/configs/atngw100_defconfig
index 367bcdc..ecaf774 100644
--- a/configs/atngw100_defconfig
+++ b/configs/atngw100_defconfig
@@ -688,6 +688,7 @@ BR2_ROOTFS_SUFFIX="$(DATE)"
 #
 # filesystem for target device
 #
+BR2_ROOTFS_DEVICE_TABLE="target/device/Atmel/atngw100/device_table.txt"
 # BR2_TARGET_ROOTFS_CRAMFS is not set
 # BR2_TARGET_ROOTFS_CLOOP is not set
 # BR2_TARGET_ROOTFS_EXT2 is not set
diff --git a/configs/atstk1005_defconfig b/configs/atstk1005_defconfig
index 50e013e..6b7a7b6 100644
--- a/configs/atstk1005_defconfig
+++ b/configs/atstk1005_defconfig
@@ -731,6 +731,7 @@ BR2_PACKAGE_ZLIB=y
 #
 # filesystem for target device
 #
+BR2_ROOTFS_DEVICE_TABLE="target/device/Atmel/atstk1005/device_table.txt"
 # BR2_TARGET_ROOTFS_CRAMFS is not set
 # BR2_TARGET_ROOTFS_CLOOP is not set
 # BR2_TARGET_ROOTFS_EXT2 is not set
diff --git a/configs/atstk100x_defconfig b/configs/atstk100x_defconfig
index df30b05..1a27f1a 100644
--- a/configs/atstk100x_defconfig
+++ b/configs/atstk100x_defconfig
@@ -834,6 +834,7 @@ BR2_ROOTFS_SUFFIX="$(DATE)"
 #
 # filesystem for target device
 #
+BR2_ROOTFS_DEVICE_TABLE="target/device/Atmel/atstk100x/device_table.txt"
 # BR2_TARGET_ROOTFS_CRAMFS is not set
 # BR2_TARGET_ROOTFS_CLOOP is not set
 BR2_TARGET_ROOTFS_EXT2=y
diff --git a/configs/kb9202_defconfig b/configs/kb9202_defconfig
index b1ec323..e66348b 100644
--- a/configs/kb9202_defconfig
+++ b/configs/kb9202_defconfig
@@ -654,6 +654,7 @@ BR2_GAMES=y
 #
 # filesystem for target device
 #
+BR2_ROOTFS_DEVICE_TABLE="target/device/KwikByte/kb9202/device_table.txt"
 # BR2_TARGET_ROOTFS_CRAMFS is not set
 # BR2_TARGET_ROOTFS_CLOOP is not set
 # BR2_TARGET_ROOTFS_EXT2 is not set
diff --git a/configs/v100sc2_defconfig b/configs/v100sc2_defconfig
index 309b80e..b139c27 100644
--- a/configs/v100sc2_defconfig
+++ b/configs/v100sc2_defconfig
@@ -685,6 +685,7 @@ BR2_PACKAGE_LIBXSLT=y
 #
 # filesystem for target device
 #
+BR2_ROOTFS_DEVICE_TABLE="target/device/valka/device_table.txt"
 # BR2_TARGET_ROOTFS_CRAMFS is not set
 # BR2_TARGET_ROOTFS_CLOOP is not set
 # BR2_TARGET_ROOTFS_EXT2 is not set
diff --git a/target/xtensa/defconfig b/target/xtensa/defconfig
index f03f7a6..49b7eb3 100644
--- a/target/xtensa/defconfig
+++ b/target/xtensa/defconfig
@@ -104,6 +104,7 @@ BR2_PACKAGE_PORTMAP=y
 #
 # filesystem for target device
 #
+BR2_ROOTFS_DEVICE_TABLE="target/device/xtensa/device_table.txt"
 BR2_TARGET_ROOTFS_CPIO=y
 BR2_TARGET_ROOTFS_CPIO_GZIP=y
 BR2_TARGET_ROOTFS_INITRAMFS=y
-- 
1.6.3.3
