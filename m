Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DFA2C77B7F
	for <buildroot@archiver.kernel.org>; Mon,  8 May 2023 16:06:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1F8E68445B;
	Mon,  8 May 2023 16:06:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1F8E68445B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OLAzVURNYUMW; Mon,  8 May 2023 16:05:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9220C84463;
	Mon,  8 May 2023 16:05:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9220C84463
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 466B11BF867
 for <buildroot@lists.busybox.net>; Mon,  8 May 2023 16:05:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 044CC41CDA
 for <buildroot@lists.busybox.net>; Mon,  8 May 2023 16:05:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 044CC41CDA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1fC7nnq-qqdG for <buildroot@lists.busybox.net>;
 Mon,  8 May 2023 16:05:16 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3A34741CC0
 for <buildroot@buildroot.org>; Mon,  8 May 2023 16:05:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3A34741CC0
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 282CA86146; Mon,  8 May 2023 16:05:16 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Mon, 8 May 2023 17:51:02 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d1757fdfb0010d29f20cd68cb6e16f019e236424
X-Git-Newrev: 2f43af1b997f5f0e9262159be3336d73bd4d0d21
X-Patchwork-Hint: ignore
Message-Id: <20230508160516.282CA86146@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/at-spi2-atk: remove package
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=2f43af1b997f5f0e9262159be3336d73bd4d0d21
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

at-spi2-atk has been merged into at-spi2-core with version 2.45.1.

https://gitlab.gnome.org/GNOME/at-spi2-core/-/blob/AT_SPI2_CORE_2_45_1/NEWS
https://gitlab.gnome.org/GNOME/at-spi2-core/-/merge_requests/78

Signed-off-by: Daniel Lang <d.lang@abatec.at>
Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>
Tested-by: Adrian Perez de Castro <aperez@igalia.com>
Reviewed-by: Adrian Perez de Castro <aperez@igalia.com>
[yann.morin.1998@free.fr: regenerate .checkpackageignore]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 .checkpackageignore                                |  1 -
 Config.in.legacy                                   |  6 +++
 DEVELOPERS                                         |  1 -
 package/Config.in                                  |  1 -
 .../at-spi2-atk/0001-meson-add-tests-option.patch  | 43 ----------------------
 package/at-spi2-atk/Config.in                      | 22 -----------
 package/at-spi2-atk/at-spi2-atk.hash               |  5 ---
 package/at-spi2-atk/at-spi2-atk.mk                 | 19 ----------
 8 files changed, 6 insertions(+), 92 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 0d55748263..94a32e0531 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -181,7 +181,6 @@ package/asterisk/0003-build-ensure-target-directory-for-modules-exists.patch Ups
 package/asterisk/0004-install-samples-need-the-data-files.patch Upstream
 package/asterisk/0005-configure-fix-detection-of-re-entrant-resolver-funct.patch Upstream
 package/asterisk/0006-main-iostream.c-fix-build-with-libressl.patch Upstream
-package/at-spi2-atk/0001-meson-add-tests-option.patch Upstream
 package/at/0001-Makefile.in-fix-make-install-for-non-root-don-t-stri.patch Upstream
 package/at/S99at Indent Variables
 package/atest/0001-seq.h-fix-build-with-gcc-10.patch Upstream
diff --git a/Config.in.legacy b/Config.in.legacy
index 2a710c30dc..7837f5a588 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,12 @@ endif
 
 comment "Legacy options removed in 2023.05"
 
+config BR2_PACKAGE_AT_SPI2_ATK
+	bool "at-spi2-atk removed"
+	select BR2_LEGACY
+	help
+	  at-spi2-atk is now part of at-spi2-core.
+
 config BR2_PACKAGE_OPTEE_BENCHMARK
 	bool "optee-benchmark has been removed"
 	select BR2_LEGACY
diff --git a/DEVELOPERS b/DEVELOPERS
index 57b67e091e..5658dfa14b 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1632,7 +1632,6 @@ F:	support/testing/tests/package/test_avocado.py
 F:	support/testing/tests/package/test_python_aexpect.py
 
 N:	Joseph Kogut <joseph.kogut@gmail.com>
-F:	package/at-spi2-atk/
 F:	package/at-spi2-core/
 F:	package/clang/
 F:	package/earlyoom/
diff --git a/package/Config.in b/package/Config.in
index 53c2d3b077..92ef7160d0 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1554,7 +1554,6 @@ endmenu
 
 menu "Graphics"
 	source "package/assimp/Config.in"
-	source "package/at-spi2-atk/Config.in"
 	source "package/at-spi2-core/Config.in"
 	source "package/atk/Config.in"
 	source "package/atkmm/Config.in"
diff --git a/package/at-spi2-atk/0001-meson-add-tests-option.patch b/package/at-spi2-atk/0001-meson-add-tests-option.patch
deleted file mode 100644
index 3a2aefa090..0000000000
--- a/package/at-spi2-atk/0001-meson-add-tests-option.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From 466d04a57b32417dbf2d5e818af1b7593af5f802 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Sun, 3 May 2020 10:29:36 +0200
-Subject: [PATCH] meson: add tests option
-
-Add tests option to allow the user to build at-spi2-atk without tests,
-it is especially useful as one of the test requires libxml-2.0
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status:
-https://gitlab.gnome.org/GNOME/at-spi2-atk/-/merge_requests/22]
----
- meson.build       | 4 +++-
- meson_options.txt | 4 ++++
- 2 files changed, 7 insertions(+), 1 deletion(-)
-
-diff --git a/meson.build b/meson.build
-index 9fce5d6..61bc93d 100644
---- a/meson.build
-+++ b/meson.build
-@@ -61,4 +61,6 @@ install_data('at-spi2-atk.desktop',
- 
- subdir('droute')
- subdir('atk-adaptor')
--subdir('tests')
-+if get_option('tests')
-+  subdir('tests')
-+endif
-diff --git a/meson_options.txt b/meson_options.txt
-index 24c9228..a4abdc2 100644
---- a/meson_options.txt
-+++ b/meson_options.txt
-@@ -2,3 +2,7 @@ option('disable_p2p',
-        description: 'Disable peer-to-peer DBus connections',
-        type: 'boolean',
-        value: false)
-+option('tests',
-+       description: 'Whether to build tests',
-+       type: 'boolean',
-+       value: true)
--- 
-2.26.2
-
diff --git a/package/at-spi2-atk/Config.in b/package/at-spi2-atk/Config.in
deleted file mode 100644
index 9a7cfde0af..0000000000
--- a/package/at-spi2-atk/Config.in
+++ /dev/null
@@ -1,22 +0,0 @@
-config BR2_PACKAGE_AT_SPI2_ATK
-	bool "at-spi2-atk"
-	depends on BR2_PACKAGE_XORG7 # at-spi2-core
-	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2
-	depends on BR2_USE_MMU # glib2
-	depends on BR2_USE_WCHAR # glib2
-	select BR2_PACKAGE_ATK
-	select BR2_PACKAGE_AT_SPI2_CORE
-	select BR2_PACKAGE_LIBGLIB2
-	help
-	  The At-Spi2 Atk package contains a library that bridges
-	  ATK to At-Spi2 D-Bus service.
-
-	  https://www.freedesktop.org/wiki/Accessibility/AT-SPI2/
-
-comment "at-spi2-atk needs a toolchain w/ wchar, threads"
-	depends on BR2_USE_MMU
-	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
-
-comment "at-spi2-atk depends on X.org"
-	depends on BR2_USE_MMU
-	depends on !BR2_PACKAGE_XORG7
diff --git a/package/at-spi2-atk/at-spi2-atk.hash b/package/at-spi2-atk/at-spi2-atk.hash
deleted file mode 100644
index 9c564c32af..0000000000
--- a/package/at-spi2-atk/at-spi2-atk.hash
+++ /dev/null
@@ -1,5 +0,0 @@
-# From http://ftp.acc.umu.se/pub/gnome/sources/at-spi2-atk/2.34/at-spi2-atk-2.34.2.sha256sum
-sha256  901323cee0eef05c01ec4dee06c701aeeca81a314a7d60216fa363005e27f4f0  at-spi2-atk-2.34.2.tar.xz
-
-# locally calculated
-sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/at-spi2-atk/at-spi2-atk.mk b/package/at-spi2-atk/at-spi2-atk.mk
deleted file mode 100644
index 232b577230..0000000000
--- a/package/at-spi2-atk/at-spi2-atk.mk
+++ /dev/null
@@ -1,19 +0,0 @@
-################################################################################
-#
-# at-spi2-atk
-#
-################################################################################
-
-AT_SPI2_ATK_VERSION_MAJOR = 2.34
-AT_SPI2_ATK_VERSION = $(AT_SPI2_ATK_VERSION_MAJOR).2
-AT_SPI2_ATK_SOURCE = at-spi2-atk-$(AT_SPI2_ATK_VERSION).tar.xz
-AT_SPI2_ATK_SITE = \
-	http://ftp.gnome.org/pub/gnome/sources/at-spi2-atk/$(AT_SPI2_ATK_VERSION_MAJOR)
-AT_SPI2_ATK_LICENSE = LGPL-2.1+
-AT_SPI2_ATK_LICENSE_FILES = COPYING
-AT_SPI2_ATK_CPE_ID_VENDOR = gnome
-AT_SPI2_ATK_INSTALL_STAGING = YES
-AT_SPI2_ATK_DEPENDENCIES = atk at-spi2-core libglib2 host-pkgconf
-AT_SPI2_ATK_CONF_OPTS = -Dtests=false
-
-$(eval $(meson-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
