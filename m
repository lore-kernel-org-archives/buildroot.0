Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6422C433F5
	for <buildroot@archiver.kernel.org>; Fri, 22 Apr 2022 17:41:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 45917416FA;
	Fri, 22 Apr 2022 17:41:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ujmmC27D2cTl; Fri, 22 Apr 2022 17:41:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 034AB416ED;
	Fri, 22 Apr 2022 17:41:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 99BE21BF3D0
 for <buildroot@lists.busybox.net>; Fri, 22 Apr 2022 17:41:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8665D83FAE
 for <buildroot@lists.busybox.net>; Fri, 22 Apr 2022 17:41:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AUQrkBQWvTuH for <buildroot@lists.busybox.net>;
 Fri, 22 Apr 2022 17:41:39 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mailout08.t-online.de (mailout08.t-online.de [194.25.134.20])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 966C084027
 for <buildroot@buildroot.org>; Fri, 22 Apr 2022 17:41:39 +0000 (UTC)
Received: from fwd81.dcpf.telekom.de (fwd81.aul.t-online.de [10.223.144.107])
 by mailout08.t-online.de (Postfix) with SMTP id 6BF27D16E;
 Fri, 22 Apr 2022 19:41:36 +0200 (CEST)
Received: from fli4l.lan.fli4l ([84.161.179.157]) by fwd81.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1nhxHh-4fnthp0; Fri, 22 Apr 2022 19:41:33 +0200
Received: from bruckner.lan.fli4l ([192.168.1.1]:59930)
 by fli4l.lan.fli4l with esmtp (Exim 4.95)
 (envelope-from <bernd.kuhls@t-online.de>) id 1nhxHg-00074e-Ia;
 Fri, 22 Apr 2022 19:41:32 +0200
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Fri, 22 Apr 2022 19:41:32 +0200
Message-Id: <20220422174132.663076-1-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1650649293-0000BD0E-1726E620/0/0 CLEAN NORMAL
X-TOI-MSGID: e8073377-e423-4502-86c8-268c6d2374c2
Subject: [Buildroot] [PATCH 1/1] package/{mesa3d,
 mesa3d-headers}: bump version to 22.0.2
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Gary Bisson <bisson.gary@gmail.com>, Romain Naour <romain.naour@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jezz@sysmic.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Release notes:
https://lists.freedesktop.org/archives/mesa-announce/2022-April/000670.html
https://lists.freedesktop.org/archives/mesa-announce/2022-March/000667.html
https://lists.freedesktop.org/archives/mesa-announce/2022-March/000665.html
https://www.phoronix.com/scan.php?page=news_item&px=Mesa-22.0-Released

Upstream removed all DRI-based drivers:
https://www.phoronix.com/scan.php?page=news_item&px=Mesa-Classic-Retired

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 Config.in.legacy                              | 24 +++++++
 package/mesa3d-headers/mesa3d-headers.mk      | 12 +---
 package/mesa3d/Config.in                      | 69 ++-----------------
 package/mesa3d/mesa3d.hash                    |  8 +--
 package/mesa3d/mesa3d.mk                      | 16 +----
 .../x11r7/xdriver_xf86-video-amdgpu/Config.in |  4 +-
 .../x11r7/xdriver_xf86-video-ati/Config.in    |  1 -
 .../xdriver_xf86-video-imx-viv/Config.in      |  1 -
 .../xdriver_xf86-video-intel.mk               |  8 ---
 .../xdriver_xf86-video-mach64.mk              |  4 --
 .../xdriver_xf86-video-mga.mk                 |  4 --
 .../xdriver_xf86-video-nouveau/Config.in      |  1 -
 .../xdriver_xf86-video-openchrome/Config.in   |  4 --
 .../xdriver_xf86-video-r128.mk                |  4 --
 .../xdriver_xf86-video-savage.mk              |  4 --
 .../xdriver_xf86-video-sis.mk                 |  4 --
 .../xdriver_xf86-video-tdfx.mk                |  4 --
 17 files changed, 36 insertions(+), 136 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 27f19f14e7..c10b299f37 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,30 @@ endif
 
 comment "Legacy options removed in 2022.05"
 
+config BR2_PACKAGE_MESA3D_DRI_DRIVER_I915
+	bool "mesa DRI i915 driver removed"
+	select BR2_LEGACY
+	help
+	  The DRI i915 driver was removed upstream.
+
+config BR2_PACKAGE_MESA3D_DRI_DRIVER_I965
+	bool "mesa DRI i965 driver removed"
+	select BR2_LEGACY
+	help
+	  The DRI i965 driver was removed upstream.
+
+config BR2_PACKAGE_MESA3D_DRI_DRIVER_NOUVEAU
+	bool "mesa DRI nouveau driver removed"
+	select BR2_LEGACY
+	help
+	  The DRI radeon nouveau was removed upstream.
+
+config BR2_PACKAGE_MESA3D_DRI_DRIVER_RADEON
+	bool "mesa DRI radeon r100 driver removed"
+	select BR2_LEGACY
+	help
+	  The DRI radeon r100 driver was removed upstream.
+
 config BR2_PACKAGE_BOOST_LAYOUT_VERSIONED
 	bool "boost versioned layout removed"
 	select BR2_LEGACY
diff --git a/package/mesa3d-headers/mesa3d-headers.mk b/package/mesa3d-headers/mesa3d-headers.mk
index 760c5368e5..2fa0370f96 100644
--- a/package/mesa3d-headers/mesa3d-headers.mk
+++ b/package/mesa3d-headers/mesa3d-headers.mk
@@ -12,7 +12,7 @@ endif
 
 # Not possible to directly refer to mesa3d variables, because of
 # first/second expansion trickery...
-MESA3D_HEADERS_VERSION = 21.3.8
+MESA3D_HEADERS_VERSION = 22.0.2
 MESA3D_HEADERS_SOURCE = mesa-$(MESA3D_HEADERS_VERSION).tar.xz
 MESA3D_HEADERS_SITE = https://archive.mesa3d.org
 MESA3D_HEADERS_DL_SUBDIR = mesa3d
@@ -33,19 +33,9 @@ MESA3D_HEADERS_DIRS += GL
 
 ifeq ($(BR2_PACKAGE_XORG7),y)
 
-# Not using $(SED) because we do not want to work in-place, and $(SED)
-# contains -i.
-define MESA3D_HEADERS_BUILD_DRI_PC
-	sed -e 's:@VERSION@:$(MESA3D_HEADERS_VERSION):' \
-	    package/mesa3d-headers/dri.pc \
-	    >$(@D)/src/mesa/drivers/dri/dri.pc
-endef
-
 define MESA3D_HEADERS_INSTALL_DRI_PC
 	$(INSTALL) -D -m 0644 $(@D)/include/GL/internal/dri_interface.h \
 		$(STAGING_DIR)/usr/include/GL/internal/dri_interface.h
-	$(INSTALL) -D -m 0644 $(@D)/src/mesa/drivers/dri/dri.pc \
-		$(STAGING_DIR)/usr/lib/pkgconfig/dri.pc
 endef
 
 endif # Xorg
diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
index e41da562dc..7468c2c804 100644
--- a/package/mesa3d/Config.in
+++ b/package/mesa3d/Config.in
@@ -63,16 +63,6 @@ config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER
 	bool
 	select BR2_PACKAGE_MESA3D_DRIVER
 
-config BR2_PACKAGE_MESA3D_DRI_DRIVER
-	bool
-	select BR2_PACKAGE_MESA3D_DRI3 if \
-		(BR2_PACKAGE_XORG7 && BR2_TOOLCHAIN_HAS_SYNC_4 && \
-			!BR2_RISCV_32)
-	select BR2_PACKAGE_MESA3D_DRIVER
-	select BR2_PACKAGE_MESA3D_GBM if \
-		!BR2_PACKAGE_MESA3D_OPENGL_GLX && \
-		!BR2_PACKAGE_MESA3D_OPENGL_EGL
-
 config BR2_PACKAGE_MESA3D_VULKAN_DRIVER
 	bool
 	select BR2_PACKAGE_MESA3D_DRIVER
@@ -134,16 +124,11 @@ config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_FREEDRENO
 config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_I915
 	bool "Gallium i915 driver"
 	depends on BR2_i386 || BR2_x86_64
-	depends on !BR2_PACKAGE_MESA3D_DRI_DRIVER_I915
 	select BR2_PACKAGE_MESA3D_GALLIUM_DRIVER
 	select BR2_PACKAGE_LIBDRM_INTEL
 	help
 	  Support for i915-based Intel GPUs.
 
-comment "Gallium i915: Only one i915 provider can be built"
-	depends on BR2_i386 || BR2_x86_64
-	depends on BR2_PACKAGE_MESA3D_DRI_DRIVER_I915
-
 config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_IRIS
 	bool "Gallium iris driver"
 	depends on BR2_i386 || BR2_x86_64
@@ -330,49 +315,6 @@ comment "Gallium XvMC state tracker needs X.org and gallium drivers r600 or nouv
 		!(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_NOUVEAU \
 		|| BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_R600)
 
-comment "DRI drivers"
-
-config BR2_PACKAGE_MESA3D_DRI_DRIVER_I915
-	bool "DRI i915 driver"
-	depends on BR2_i386 || BR2_x86_64
-	select BR2_PACKAGE_MESA3D_DRI_DRIVER
-	select BR2_PACKAGE_LIBDRM_INTEL
-	help
-	  Support for i915-based Intel GPUs.
-
-config BR2_PACKAGE_MESA3D_DRI_DRIVER_I965
-	bool "DRI i965 driver"
-	depends on BR2_i386 || BR2_x86_64
-	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_17 # memfd.h
-	select BR2_PACKAGE_MESA3D_DRI_DRIVER
-	select BR2_PACKAGE_LIBDRM_INTEL
-	help
-	  Support for i965-based Intel GPUs.
-
-comment "DRI i965 driver needs a toolchain w/ headers >= 3.17"
-	depends on BR2_i386 || BR2_x86_64
-	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_17
-
-config BR2_PACKAGE_MESA3D_DRI_DRIVER_NOUVEAU
-	bool "DRI nouveau driver"
-	select BR2_PACKAGE_MESA3D_DRI_DRIVER
-	select BR2_PACKAGE_LIBDRM_NOUVEAU
-	help
-	  Support for Nvidia-based GPUs.
-
-config BR2_PACKAGE_MESA3D_DRI_DRIVER_RADEON
-	bool "DRI radeon r100 driver"
-	depends on BR2_i386 || BR2_x86_64
-	# libdrm's radeon option depends on LIBDRM_HAS_ATOMIC. Propagating
-	# that dependency here causes a circular dependency that Kconfig
-	# can't see is just spurious. However, that dependency is about
-	# the toolchain having sync4 primitives, which is always a given
-	# for i386 and x86_64.
-	select BR2_PACKAGE_MESA3D_DRI_DRIVER
-	select BR2_PACKAGE_LIBDRM_RADEON
-	help
-	  Legacy Radeon driver for R100 series GPUs.
-
 comment "Vulkan drivers"
 
 config BR2_PACKAGE_MESA3D_VULKAN_DRIVER_INTEL
@@ -406,17 +348,16 @@ comment "OpenGL API Support"
 
 config BR2_PACKAGE_MESA3D_GBM
 	bool "gbm"
-	depends on BR2_PACKAGE_MESA3D_DRI_DRIVER \
-		|| (BR2_PACKAGE_MESA3D_GALLIUM_DRIVER && BR2_PACKAGE_MESA3D_OPENGL_EGL)
+	depends on BR2_PACKAGE_MESA3D_GALLIUM_DRIVER && \
+		BR2_PACKAGE_MESA3D_OPENGL_EGL
 	select BR2_PACKAGE_HAS_LIBGBM
 	select BR2_PACKAGE_LIBGBM_HAS_FEATURE_FORMAT_MODIFIER_PLANE_COUNT
 	select BR2_PACKAGE_LIBGBM_HAS_FEATURE_DMA_BUF
 	help
 	  Enable Generic Buffer Management (gbm)
 
-comment "gbm support needs a dri driver or a gallium driver w/ EGL support."
-	depends on !BR2_PACKAGE_MESA3D_DRI_DRIVER \
-		&& !(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER && BR2_PACKAGE_MESA3D_OPENGL_EGL)
+comment "gbm support needs a gallium driver w/ EGL support."
+	depends on !(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER && BR2_PACKAGE_MESA3D_OPENGL_EGL)
 
 config BR2_PACKAGE_MESA3D_OPENGL_GLX
 	bool "OpenGL GLX"
@@ -432,7 +373,7 @@ comment "OpenGL GLX support needs X11"
 
 config BR2_PACKAGE_MESA3D_OPENGL_EGL
 	bool "OpenGL EGL"
-	depends on BR2_PACKAGE_MESA3D_DRI_DRIVER || BR2_PACKAGE_MESA3D_GALLIUM_DRIVER
+	depends on BR2_PACKAGE_MESA3D_GALLIUM_DRIVER
 	select BR2_PACKAGE_HAS_LIBEGL if !BR2_PACKAGE_LIBGLVND
 	select BR2_PACKAGE_LIBGLVND_DISPATCH_EGL if BR2_PACKAGE_LIBGLVND
 	select BR2_PACKAGE_HAS_LIBEGL_WAYLAND
diff --git a/package/mesa3d/mesa3d.hash b/package/mesa3d/mesa3d.hash
index 5b74e14fef..6f06c85760 100644
--- a/package/mesa3d/mesa3d.hash
+++ b/package/mesa3d/mesa3d.hash
@@ -1,6 +1,6 @@
-# From https://lists.freedesktop.org/archives/mesa-announce/2022-March/000666.html
-sha256  e70d273bdc53a4e931871bb5550ba3900e6a3deab2fff64184107c33e92d9da7  mesa-21.3.8.tar.xz
-sha512  0462c44fa8e358dafd03088411452bc172a365902795b3198df1e6cfbf1d87675ef5b72b572de7f15e5ee87b30ce5b2f217c81ea72b376962f6428c6ff83f2e9  mesa-21.3.8.tar.xz
+# From https://lists.freedesktop.org/archives/mesa-announce/2022-April/000670.html
+sha256  df4fa560dcce6680133067cd15b0505fc424ca703244ce9ab247c74d2fab6885  mesa-22.0.2.tar.xz
+sha512  939ddf9acd280e1b20b3540349b3ad07bbeee5d821198f1d667e86634449bf5d0a0df5832753b8b3f8816709c2f02959cce25f3d26a33cc758dd8e25d158ddb8  mesa-22.0.2.tar.xz
 
 # License
-sha256  998437f3f75f0c542046f83c1cb349408122268168fb13eb4ae6967aa18b7d98  docs/license.rst
+sha256  4bc15d14dcc134b024cbdca3b5330010136ce8a427b6f8353440ce2ad7aab037  docs/license.rst
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index a1015a7dae..41c8d80daf 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # When updating the version, please also update mesa3d-headers
-MESA3D_VERSION = 21.3.8
+MESA3D_VERSION = 22.0.2
 MESA3D_SOURCE = mesa-$(MESA3D_VERSION).tar.xz
 MESA3D_SITE = https://archive.mesa3d.org
 MESA3D_LICENSE = MIT, SGI, Khronos
@@ -115,11 +115,6 @@ MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_TEGRA)    += tegra
 MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_V3D)      += v3d
 MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_VC4)      += vc4
 MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_VIRGL)    += virgl
-# DRI Drivers
-MESA3D_DRI_DRIVERS-$(BR2_PACKAGE_MESA3D_DRI_DRIVER_I915)   += i915
-MESA3D_DRI_DRIVERS-$(BR2_PACKAGE_MESA3D_DRI_DRIVER_I965)   += i965
-MESA3D_DRI_DRIVERS-$(BR2_PACKAGE_MESA3D_DRI_DRIVER_NOUVEAU) += nouveau
-MESA3D_DRI_DRIVERS-$(BR2_PACKAGE_MESA3D_DRI_DRIVER_RADEON) += r100
 # Vulkan Drivers
 MESA3D_VULKAN_DRIVERS-$(BR2_PACKAGE_MESA3D_VULKAN_DRIVER_INTEL)   += intel
 
@@ -134,15 +129,6 @@ MESA3D_CONF_OPTS += \
 	-Dgallium-extra-hud=true
 endif
 
-ifeq ($(BR2_PACKAGE_MESA3D_DRI_DRIVER),)
-MESA3D_CONF_OPTS += \
-	-Ddri-drivers=
-else
-MESA3D_CONF_OPTS += \
-	-Dshared-glapi=enabled \
-	-Ddri-drivers=$(subst $(space),$(comma),$(MESA3D_DRI_DRIVERS-y))
-endif
-
 ifeq ($(BR2_PACKAGE_MESA3D_VULKAN_DRIVER),)
 MESA3D_CONF_OPTS += \
 	-Dvulkan-drivers=
diff --git a/package/x11r7/xdriver_xf86-video-amdgpu/Config.in b/package/x11r7/xdriver_xf86-video-amdgpu/Config.in
index c42255f55c..14c36930d5 100644
--- a/package/x11r7/xdriver_xf86-video-amdgpu/Config.in
+++ b/package/x11r7/xdriver_xf86-video-amdgpu/Config.in
@@ -1,7 +1,6 @@
 config BR2_PACKAGE_XDRIVER_XF86_VIDEO_AMDGPU
 	bool "xf86-video-amdgpu"
 	depends on BR2_USE_MMU # libdrm
-	depends on BR2_PACKAGE_MESA3D_DRI_DRIVER
 	depends on BR2_PACKAGE_MESA3D_OPENGL_EGL # gbm
 	select BR2_PACKAGE_LIBDRM
 	select BR2_PACKAGE_LIBDRM_AMDGPU
@@ -13,5 +12,4 @@ config BR2_PACKAGE_XDRIVER_XF86_VIDEO_AMDGPU
 
 comment "xf86-video-amdgpu needs egl/opengl support from mesa3d"
 	depends on BR2_USE_MMU
-	depends on !BR2_PACKAGE_MESA3D_OPENGL_EGL || \
-		!BR2_PACKAGE_MESA3D_DRI_DRIVER
+	depends on !BR2_PACKAGE_MESA3D_OPENGL_EGL
diff --git a/package/x11r7/xdriver_xf86-video-ati/Config.in b/package/x11r7/xdriver_xf86-video-ati/Config.in
index 1246014dca..090e00dad5 100644
--- a/package/x11r7/xdriver_xf86-video-ati/Config.in
+++ b/package/x11r7/xdriver_xf86-video-ati/Config.in
@@ -4,7 +4,6 @@ config BR2_PACKAGE_XDRIVER_XF86_VIDEO_ATI
 	depends on BR2_PACKAGE_MESA3D
 	select BR2_PACKAGE_LIBDRM
 	select BR2_PACKAGE_LIBDRM_RADEON
-	select BR2_PACKAGE_MESA3D_DRI_DRIVER_RADEON
 	select BR2_PACKAGE_XLIB_LIBXCOMPOSITE
 	select BR2_PACKAGE_XORGPROTO
 	help
diff --git a/package/x11r7/xdriver_xf86-video-imx-viv/Config.in b/package/x11r7/xdriver_xf86-video-imx-viv/Config.in
index 13cee14deb..5f6e2bdf77 100644
--- a/package/x11r7/xdriver_xf86-video-imx-viv/Config.in
+++ b/package/x11r7/xdriver_xf86-video-imx-viv/Config.in
@@ -4,7 +4,6 @@ config BR2_PACKAGE_XDRIVER_XF86_VIDEO_IMX_VIV
 	depends on BR2_PACKAGE_IMX_GPU_G2D
 	depends on BR2_TOOLCHAIN_HAS_SYNC_1 # mesa3d
 	select BR2_PACKAGE_MESA3D # Needed in order to compile xorg with glx/dri
-	select BR2_PACKAGE_MESA3D_DRI_DRIVER
 	select BR2_PACKAGE_LIBDRM
 	select BR2_PACKAGE_XORGPROTO
 	help
diff --git a/package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel.mk b/package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel.mk
index d911234c92..03b4221e57 100644
--- a/package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel.mk
+++ b/package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel.mk
@@ -31,12 +31,4 @@ XDRIVER_XF86_VIDEO_INTEL_DEPENDENCIES = \
 	xorgproto \
 	xserver_xorg-server
 
-# X.org server support for DRI depends on a Mesa3D DRI driver
-ifeq ($(BR2_PACKAGE_MESA3D_DRI_DRIVER),y)
-XDRIVER_XF86_VIDEO_INTEL_CONF_OPTS += \
-	--enable-dri2 \
-	--enable-dri3 \
-	--enable-uxa
-endif
-
 $(eval $(autotools-package))
diff --git a/package/x11r7/xdriver_xf86-video-mach64/xdriver_xf86-video-mach64.mk b/package/x11r7/xdriver_xf86-video-mach64/xdriver_xf86-video-mach64.mk
index eee8fec2e8..bc7b347eac 100644
--- a/package/x11r7/xdriver_xf86-video-mach64/xdriver_xf86-video-mach64.mk
+++ b/package/x11r7/xdriver_xf86-video-mach64/xdriver_xf86-video-mach64.mk
@@ -12,8 +12,4 @@ XDRIVER_XF86_VIDEO_MACH64_LICENSE_FILES = COPYING
 XDRIVER_XF86_VIDEO_MACH64_AUTORECONF = YES
 XDRIVER_XF86_VIDEO_MACH64_DEPENDENCIES = xserver_xorg-server xorgproto
 
-ifeq ($(BR2_PACKAGE_MESA3D_DRI_DRIVER),)
-XDRIVER_XF86_VIDEO_MACH64_CONF_OPTS += --disable-dri
-endif
-
 $(eval $(autotools-package))
diff --git a/package/x11r7/xdriver_xf86-video-mga/xdriver_xf86-video-mga.mk b/package/x11r7/xdriver_xf86-video-mga/xdriver_xf86-video-mga.mk
index 3c668a5c98..96ca5e0578 100644
--- a/package/x11r7/xdriver_xf86-video-mga/xdriver_xf86-video-mga.mk
+++ b/package/x11r7/xdriver_xf86-video-mga/xdriver_xf86-video-mga.mk
@@ -12,8 +12,4 @@ XDRIVER_XF86_VIDEO_MGA_LICENSE_FILES = COPYING
 XDRIVER_XF86_VIDEO_MGA_AUTORECONF = YES
 XDRIVER_XF86_VIDEO_MGA_DEPENDENCIES = xserver_xorg-server libdrm xorgproto
 
-ifeq ($(BR2_PACKAGE_MESA3D_DRI_DRIVER),)
-XDRIVER_XF86_VIDEO_MGA_CONF_OPTS += --disable-dri
-endif
-
 $(eval $(autotools-package))
diff --git a/package/x11r7/xdriver_xf86-video-nouveau/Config.in b/package/x11r7/xdriver_xf86-video-nouveau/Config.in
index c9fd2e3d2f..a68f85c781 100644
--- a/package/x11r7/xdriver_xf86-video-nouveau/Config.in
+++ b/package/x11r7/xdriver_xf86-video-nouveau/Config.in
@@ -1,7 +1,6 @@
 config BR2_PACKAGE_XDRIVER_XF86_VIDEO_NOUVEAU
 	bool "xf86-video-nouveau"
 	depends on BR2_PACKAGE_MESA3D
-	select BR2_PACKAGE_MESA3D_DRI_DRIVER_NOUVEAU
 	select BR2_PACKAGE_LIBDRM
 	select BR2_PACKAGE_LIBDRM_NOUVEAU
 	select BR2_PACKAGE_XORGPROTO
diff --git a/package/x11r7/xdriver_xf86-video-openchrome/Config.in b/package/x11r7/xdriver_xf86-video-openchrome/Config.in
index a93d14376b..6b2e236f00 100644
--- a/package/x11r7/xdriver_xf86-video-openchrome/Config.in
+++ b/package/x11r7/xdriver_xf86-video-openchrome/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_XDRIVER_XF86_VIDEO_OPENCHROME
 	bool "xf86-video-openchrome"
-	depends on BR2_PACKAGE_MESA3D_DRI_DRIVER
 	select BR2_PACKAGE_LIBDRM
 	select BR2_PACKAGE_XLIB_LIBX11
 	select BR2_PACKAGE_XLIB_LIBXCOMPOSITE
@@ -11,6 +10,3 @@ config BR2_PACKAGE_XDRIVER_XF86_VIDEO_OPENCHROME
 	  VIA/S3G UniChrome and UniChrome Pro graphics chipsets.
 
 	  https://www.freedesktop.org/wiki/Openchrome/
-
-comment "xf86-video-openchrome needs a DRI driver from mesa3d"
-	depends on !BR2_PACKAGE_MESA3D_DRI_DRIVER
diff --git a/package/x11r7/xdriver_xf86-video-r128/xdriver_xf86-video-r128.mk b/package/x11r7/xdriver_xf86-video-r128/xdriver_xf86-video-r128.mk
index 690041d4c6..51435c9389 100644
--- a/package/x11r7/xdriver_xf86-video-r128/xdriver_xf86-video-r128.mk
+++ b/package/x11r7/xdriver_xf86-video-r128/xdriver_xf86-video-r128.mk
@@ -11,8 +11,4 @@ XDRIVER_XF86_VIDEO_R128_LICENSE = MIT
 XDRIVER_XF86_VIDEO_R128_LICENSE_FILES = COPYING
 XDRIVER_XF86_VIDEO_R128_DEPENDENCIES = xserver_xorg-server xorgproto
 
-ifeq ($(BR2_PACKAGE_MESA3D_DRI_DRIVER),)
-XDRIVER_XF86_VIDEO_R128_CONF_OPTS += --disable-dri
-endif
-
 $(eval $(autotools-package))
diff --git a/package/x11r7/xdriver_xf86-video-savage/xdriver_xf86-video-savage.mk b/package/x11r7/xdriver_xf86-video-savage/xdriver_xf86-video-savage.mk
index 102aa2c48e..2306c14915 100644
--- a/package/x11r7/xdriver_xf86-video-savage/xdriver_xf86-video-savage.mk
+++ b/package/x11r7/xdriver_xf86-video-savage/xdriver_xf86-video-savage.mk
@@ -12,8 +12,4 @@ XDRIVER_XF86_VIDEO_SAVAGE_LICENSE_FILES = COPYING
 XDRIVER_XF86_VIDEO_SAVAGE_AUTORECONF = YES
 XDRIVER_XF86_VIDEO_SAVAGE_DEPENDENCIES = xserver_xorg-server libdrm xorgproto
 
-ifeq ($(BR2_PACKAGE_MESA3D_DRI_DRIVER),)
-XDRIVER_XF86_VIDEO_SAVAGE_CONF_OPTS += --disable-dri
-endif
-
 $(eval $(autotools-package))
diff --git a/package/x11r7/xdriver_xf86-video-sis/xdriver_xf86-video-sis.mk b/package/x11r7/xdriver_xf86-video-sis/xdriver_xf86-video-sis.mk
index f96b0a9d0e..e05573de1f 100644
--- a/package/x11r7/xdriver_xf86-video-sis/xdriver_xf86-video-sis.mk
+++ b/package/x11r7/xdriver_xf86-video-sis/xdriver_xf86-video-sis.mk
@@ -11,8 +11,4 @@ XDRIVER_XF86_VIDEO_SIS_LICENSE = MIT
 XDRIVER_XF86_VIDEO_SIS_LICENSE_FILES = COPYING
 XDRIVER_XF86_VIDEO_SIS_DEPENDENCIES = xserver_xorg-server libdrm xorgproto
 
-ifeq ($(BR2_PACKAGE_MESA3D_DRI_DRIVER),)
-XDRIVER_XF86_VIDEO_SIS_CONF_OPTS += --disable-dri
-endif
-
 $(eval $(autotools-package))
diff --git a/package/x11r7/xdriver_xf86-video-tdfx/xdriver_xf86-video-tdfx.mk b/package/x11r7/xdriver_xf86-video-tdfx/xdriver_xf86-video-tdfx.mk
index 14c40e4d89..b9e57705ae 100644
--- a/package/x11r7/xdriver_xf86-video-tdfx/xdriver_xf86-video-tdfx.mk
+++ b/package/x11r7/xdriver_xf86-video-tdfx/xdriver_xf86-video-tdfx.mk
@@ -15,8 +15,4 @@ XDRIVER_XF86_VIDEO_TDFX_DEPENDENCIES = \
 	xorgproto \
 	xserver_xorg-server
 
-ifeq ($(BR2_PACKAGE_MESA3D_DRI_DRIVER),)
-XDRIVER_XF86_VIDEO_TDFX_CONF_OPTS += --disable-dri
-endif
-
 $(eval $(autotools-package))
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
