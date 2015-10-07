From: Peter Seiderer <ps.report@gmx.net>
Date: Wed,  7 Oct 2015 23:56:49 +0200
Subject: [Buildroot] [PATCH v2 3/4] Config.in.legacy: add missing select
	BR2_LEGACY
In-Reply-To: <1444255010-6341-1-git-send-email-ps.report@gmx.net>
References: <1444255010-6341-1-git-send-email-ps.report@gmx.net>
Message-ID: <1444255010-6341-3-git-send-email-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
Changes v1 -> v2:
  - new patch to fix missing select BR2_LEGACY (suggested by Arnout Vandecappelle)
---
 Config.in.legacy | 40 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/Config.in.legacy b/Config.in.legacy
index af92b72..007e598 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -119,6 +119,7 @@ config BR2_PACKAGE_MEDIA_CTL
 
 config BR2_PACKAGE_SCHIFRA
 	bool "schifra package has been removed"
+	select BR2_LEGACY
 	help
 	  Schifra package has been maked broken since 2014.11 release and
 	  haven't been fixed since then.
@@ -136,6 +137,7 @@ config BR2_PACKAGE_ZXING
 config BR2_PACKAGE_FREERDP_CLIENT
 	bool "freerdp client option renamed"
 	depends on BR2_PACKAGE_FREERDP
+	select BR2_LEGACY
 	select BR2_PACKAGE_FREERDP_CLIENT_X11
 
 config BR2_PACKAGE_BLACKBOX
@@ -187,6 +189,7 @@ config BR2_KERNEL_HEADERS_3_15
 
 config BR2_PACKAGE_DIRECTFB_EXAMPLES_ANDI
 	bool "DirectFB example df_andi has been removed"
+	select BR2_LEGACY
 	select BR2_PACKAGE_DIRECTFB_EXAMPLES
 	help
 	  The per-DirectFB example options have been removed. The
@@ -195,6 +198,7 @@ config BR2_PACKAGE_DIRECTFB_EXAMPLES_ANDI
 
 config BR2_PACKAGE_DIRECTFB_EXAMPLES_BLTLOAD
 	bool "DirectFB example df_bltload has been removed"
+	select BR2_LEGACY
 	select BR2_PACKAGE_DIRECTFB_EXAMPLES
 	help
 	  The per-DirectFB example options have been removed. The
@@ -203,6 +207,7 @@ config BR2_PACKAGE_DIRECTFB_EXAMPLES_BLTLOAD
 
 config BR2_PACKAGE_DIRECTFB_EXAMPLES_CPULOAD
 	bool "DirectFB example df_cpuload has been removed"
+	select BR2_LEGACY
 	select BR2_PACKAGE_DIRECTFB_EXAMPLES
 	help
 	  The per-DirectFB example options have been removed. The
@@ -211,6 +216,7 @@ config BR2_PACKAGE_DIRECTFB_EXAMPLES_CPULOAD
 
 config BR2_PACKAGE_DIRECTFB_EXAMPLES_DATABUFFER
 	bool "DirectFB example df_databuffer has been removed"
+	select BR2_LEGACY
 	select BR2_PACKAGE_DIRECTFB_EXAMPLES
 	help
 	  The per-DirectFB example options have been removed. The
@@ -219,6 +225,7 @@ config BR2_PACKAGE_DIRECTFB_EXAMPLES_DATABUFFER
 
 config BR2_PACKAGE_DIRECTFB_EXAMPLES_DIOLOAD
 	bool "DirectFB example df_dioload has been removed"
+	select BR2_LEGACY
 	select BR2_PACKAGE_DIRECTFB_EXAMPLES
 	help
 	  The per-DirectFB example options have been removed. The
@@ -227,6 +234,7 @@ config BR2_PACKAGE_DIRECTFB_EXAMPLES_DIOLOAD
 
 config BR2_PACKAGE_DIRECTFB_EXAMPLES_DOK
 	bool "DirectFB example df_dok has been removed"
+	select BR2_LEGACY
 	select BR2_PACKAGE_DIRECTFB_EXAMPLES
 	help
 	  The per-DirectFB example options have been removed. The
@@ -235,6 +243,7 @@ config BR2_PACKAGE_DIRECTFB_EXAMPLES_DOK
 
 config BR2_PACKAGE_DIRECTFB_EXAMPLES_DRIVERTEST
 	bool "DirectFB example df_drivertest has been removed"
+	select BR2_LEGACY
 	select BR2_PACKAGE_DIRECTFB_EXAMPLES
 	help
 	  The per-DirectFB example options have been removed. The
@@ -244,6 +253,7 @@ config BR2_PACKAGE_DIRECTFB_EXAMPLES_DRIVERTEST
 
 config BR2_PACKAGE_DIRECTFB_EXAMPLES_FIRE
 	bool "DirectFB example df_fire has been removed"
+	select BR2_LEGACY
 	select BR2_PACKAGE_DIRECTFB_EXAMPLES
 	help
 	  The per-DirectFB example options have been removed. The
@@ -252,6 +262,7 @@ config BR2_PACKAGE_DIRECTFB_EXAMPLES_FIRE
 
 config BR2_PACKAGE_DIRECTFB_EXAMPLES_FLIP
 	bool "DirectFB example df_flip has been removed"
+	select BR2_LEGACY
 	select BR2_PACKAGE_DIRECTFB_EXAMPLES
 	help
 	  The per-DirectFB example options have been removed. The
@@ -260,6 +271,7 @@ config BR2_PACKAGE_DIRECTFB_EXAMPLES_FLIP
 
 config BR2_PACKAGE_DIRECTFB_EXAMPLES_FONTS
 	bool "DirectFB example df_fonts has been removed"
+	select BR2_LEGACY
 	select BR2_PACKAGE_DIRECTFB_EXAMPLES
 	help
 	  The per-DirectFB example options have been removed. The
@@ -268,6 +280,7 @@ config BR2_PACKAGE_DIRECTFB_EXAMPLES_FONTS
 
 config BR2_PACKAGE_DIRECTFB_EXAMPLES_INPUT
 	bool "DirectFB example df_input has been removed"
+	select BR2_LEGACY
 	select BR2_PACKAGE_DIRECTFB_EXAMPLES
 	help
 	  The per-DirectFB example options have been removed. The
@@ -276,6 +289,7 @@ config BR2_PACKAGE_DIRECTFB_EXAMPLES_INPUT
 
 config BR2_PACKAGE_DIRECTFB_EXAMPLES_JOYSTICK
 	bool "DirectFB example df_joystick has been removed"
+	select BR2_LEGACY
 	select BR2_PACKAGE_DIRECTFB_EXAMPLES
 	help
 	  The per-DirectFB example options have been removed. The
@@ -284,6 +298,7 @@ config BR2_PACKAGE_DIRECTFB_EXAMPLES_JOYSTICK
 
 config BR2_PACKAGE_DIRECTFB_EXAMPLES_KNUCKLES
 	bool "DirectFB example df_knuckles has been removed"
+	select BR2_LEGACY
 	select BR2_PACKAGE_DIRECTFB_EXAMPLES
 	help
 	  The per-DirectFB example options have been removed. The
@@ -292,6 +307,7 @@ config BR2_PACKAGE_DIRECTFB_EXAMPLES_KNUCKLES
 
 config BR2_PACKAGE_DIRECTFB_EXAMPLES_LAYER
 	bool "DirectFB example df_layer has been removed"
+	select BR2_LEGACY
 	select BR2_PACKAGE_DIRECTFB_EXAMPLES
 	help
 	  The per-DirectFB example options have been removed. The
@@ -300,6 +316,7 @@ config BR2_PACKAGE_DIRECTFB_EXAMPLES_LAYER
 
 config BR2_PACKAGE_DIRECTFB_EXAMPLES_MATRIX
 	bool "DirectFB example df_matrix has been removed"
+	select BR2_LEGACY
 	select BR2_PACKAGE_DIRECTFB_EXAMPLES
 	help
 	  The per-DirectFB example options have been removed. The
@@ -308,6 +325,7 @@ config BR2_PACKAGE_DIRECTFB_EXAMPLES_MATRIX
 
 config BR2_PACKAGE_DIRECTFB_EXAMPLES_MATRIX_WATER
 	bool "DirectFB example df_matrix_water has been removed"
+	select BR2_LEGACY
 	select BR2_PACKAGE_DIRECTFB_EXAMPLES
 	help
 	  The per-DirectFB example options have been removed. The
@@ -316,6 +334,7 @@ config BR2_PACKAGE_DIRECTFB_EXAMPLES_MATRIX_WATER
 
 config BR2_PACKAGE_DIRECTFB_EXAMPLES_NEO
 	bool "DirectFB example df_neo has been removed"
+	select BR2_LEGACY
 	select BR2_PACKAGE_DIRECTFB_EXAMPLES
 	help
 	  The per-DirectFB example options have been removed. The
@@ -324,6 +343,7 @@ config BR2_PACKAGE_DIRECTFB_EXAMPLES_NEO
 
 config BR2_PACKAGE_DIRECTFB_EXAMPLES_NETLOAD
 	bool "DirectFB example df_netload has been removed"
+	select BR2_LEGACY
 	select BR2_PACKAGE_DIRECTFB_EXAMPLES
 	help
 	  The per-DirectFB example options have been removed. The
@@ -340,6 +360,7 @@ config BR2_PACKAGE_DIRECTFB_EXAMPLES_PALETTE
 
 config BR2_PACKAGE_DIRECTFB_EXAMPLES_PARTICLE
 	bool "DirectFB example df_particle has been removed"
+	select BR2_LEGACY
 	select BR2_PACKAGE_DIRECTFB_EXAMPLES
 	help
 	  The per-DirectFB example options have been removed. The
@@ -348,6 +369,7 @@ config BR2_PACKAGE_DIRECTFB_EXAMPLES_PARTICLE
 
 config BR2_PACKAGE_DIRECTFB_EXAMPLES_PORTER
 	bool "DirectFB example df_porter has been removed"
+	select BR2_LEGACY
 	select BR2_PACKAGE_DIRECTFB_EXAMPLES
 	help
 	  The per-DirectFB example options have been removed. The
@@ -364,6 +386,7 @@ config BR2_PACKAGE_DIRECTFB_EXAMPLES_STRESS
 
 config BR2_PACKAGE_DIRECTFB_EXAMPLES_TEXTURE
 	bool "DirectFB example df_texture has been removed"
+	select BR2_LEGACY
 	select BR2_PACKAGE_DIRECTFB_EXAMPLES
 	help
 	  The per-DirectFB example options have been removed. The
@@ -372,6 +395,7 @@ config BR2_PACKAGE_DIRECTFB_EXAMPLES_TEXTURE
 
 config BR2_PACKAGE_DIRECTFB_EXAMPLES_VIDEO
 	bool "DirectFB example df_video has been removed"
+	select BR2_LEGACY
 	select BR2_PACKAGE_DIRECTFB_EXAMPLES
 	help
 	  The per-DirectFB example options have been removed. The
@@ -380,6 +404,7 @@ config BR2_PACKAGE_DIRECTFB_EXAMPLES_VIDEO
 
 config BR2_PACKAGE_DIRECTFB_EXAMPLES_VIDEO_PARTICLE
 	bool "DirectFB example df_video_particle has been removed"
+	select BR2_LEGACY
 	select BR2_PACKAGE_DIRECTFB_EXAMPLES
 	help
 	  The per-DirectFB example options have been removed. The
@@ -388,6 +413,7 @@ config BR2_PACKAGE_DIRECTFB_EXAMPLES_VIDEO_PARTICLE
 
 config BR2_PACKAGE_DIRECTFB_EXAMPLES_WINDOW
 	bool "DirectFB example df_window has been removed"
+	select BR2_LEGACY
 	select BR2_PACKAGE_DIRECTFB_EXAMPLES
 	help
 	  The per-DirectFB example options have been removed. The
@@ -502,6 +528,7 @@ config BR2_PACKAGE_GPU_VIV_BIN_MX6Q
 config BR2_PACKAGE_LIBSEMANAGE_PYTHON_BINDINGS
 	depends on BR2_PACKAGE_PYTHON
 	bool "libsemanage python bindings removed"
+	select BR2_LEGACY
 	help
 	  This option has been removed, since the libsemanage Python
 	  bindings on the target were not useful.
@@ -579,6 +606,7 @@ config BR2_PACKAGE_TIFF_TIFFCP
 
 config BR2_LINUX_KERNEL_EXT_RTAI_PATCH
 	bool "RTAI patch file path has been removed"
+	select BR2_LEGACY
 	help
 	  This option has never worked, so it has been removed.
 
@@ -913,6 +941,7 @@ config BR2_PACKAGE_XLIB_LIBPCIACCESS
 
 config BR2_PACKAGE_LINUX_FIRMWARE_XC5000
 	bool "Xceive xc5000 option has been renamed"
+	select BR2_LEGACY
 	select BR2_PACKAGE_LINUX_FIRMWARE_XCx000
 	help
 	  The Xceive xc5000 option now also handles older firmwares from
@@ -921,6 +950,7 @@ config BR2_PACKAGE_LINUX_FIRMWARE_XC5000
 
 config BR2_PACKAGE_LINUX_FIRMWARE_CXGB4
 	bool "Chelsio T4 option has been renamed"
+	select BR2_LEGACY
 	select BR2_PACKAGE_LINUX_FIRMWARE_CXGB4_T4
 	help
 	  The Chelsio T4 option BR2_PACKAGE_LINUX_FIRMWARE_CXGB4
@@ -929,6 +959,7 @@ config BR2_PACKAGE_LINUX_FIRMWARE_CXGB4
 
 config BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_3160_7260_7
 	bool "BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_3160_7260_7 has been renamed"
+	select BR2_LEGACY
 	help
 	  The option BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_3160_7260_7 was
 	  renamed to BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_REV_7. You must
@@ -939,6 +970,7 @@ config BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_3160_7260_7
 
 config BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_3160_7260_8
 	bool "BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_3160_7260_8 has been renamed"
+	select BR2_LEGACY
 	help
 	  The option BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_3160_7260_8 was
 	  renamed to BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_REV_8. You must
@@ -1150,6 +1182,7 @@ config BR2_TARGET_TZ_ZONELIST
 
 config BR2_PACKAGE_TZDATA_ZONELIST
 	string "tzdata: the timezone list option has been renamed"
+	select BR2_LEGACY
 	help
 	  The option BR2_PACKAGE_TZDATA_ZONELIST has been renamed to
 	  BR2_TARGET_TZ_ZONELIST, and moved to the "System configuration"
@@ -1276,18 +1309,21 @@ comment "Legacy options removed in 2014.02"
 
 config BR2_sh2
 	bool "sh2 support removed"
+	select BR2_LEGACY
 	help
 	  Due to an inexistent user base and generally poor Linux
 	  support, the support for the SH2 architecture was removed.
 
 config BR2_sh3
 	bool "sh3 support removed"
+	select BR2_LEGACY
 	help
 	  Due to an inexistent user base and generally poor Linux
 	  support, the support for the SH3 architecture was removed.
 
 config BR2_sh3eb
 	bool "sh3eb support removed"
+	select BR2_LEGACY
 	help
 	  Due to an inexistent user base and generally poor Linux
 	  support, the support for the SH3eb architecture was removed.
@@ -1501,6 +1537,7 @@ config BR2_PACKAGE_MODULE_INIT_TOOLS
 
 config BR2_TARGET_UBOOT_CUSTOM_GIT_REPO_URL
 	string "u-boot: the git repository URL option has been renamed"
+	select BR2_LEGACY
 	help
 	  The option BR2_TARGET_UBOOT_CUSTOM_GIT_REPO_URL has
 	  been renamed to BR2_TARGET_UBOOT_CUSTOM_REPO_URL.
@@ -1515,6 +1552,7 @@ config BR2_TARGET_UBOOT_CUSTOM_GIT_REPO_URL_WRAP
 
 config BR2_TARGET_UBOOT_CUSTOM_GIT_VERSION
 	string "u-boot: the git repository version option has been renamed"
+	select BR2_LEGACY
 	help
 	  The option BR2_TARGET_UBOOT_CUSTOM_GIT_VERSION has
 	  been renamed to BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION.
@@ -1529,6 +1567,7 @@ config BR2_TARGET_UBOOT_CUSTOM_GIT_VERSION_WRAP
 
 config BR2_LINUX_KERNEL_CUSTOM_GIT_REPO_URL
 	string "linux: the git repository URL option has been renamed"
+	select BR2_LEGACY
 	help
 	  The option BR2_LINUX_KERNEL_CUSTOM_GIT_REPO_URL has
 	  been renamed to
@@ -1544,6 +1583,7 @@ config BR2_LINUX_KERNEL_CUSTOM_GIT_REPO_URL_WRAP
 
 config BR2_LINUX_KERNEL_CUSTOM_GIT_VERSION
 	string "linux: the git repository version option has been renamed"
+	select BR2_LEGACY
 	help
 	  The option BR2_LINUX_KERNEL_CUSTOM_GIT_VERSION has
 	  been renamed to
-- 
2.1.4
