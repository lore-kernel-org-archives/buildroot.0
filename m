Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 398AFE6FE46
	for <buildroot@archiver.kernel.org>; Fri,  6 Sep 2024 20:02:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0549D847AC;
	Fri,  6 Sep 2024 20:02:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1RQnesN40kcP; Fri,  6 Sep 2024 20:02:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 54716847B2
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 54716847B2;
	Fri,  6 Sep 2024 20:02:29 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D51C81BF20B
 for <buildroot@lists.busybox.net>; Fri,  6 Sep 2024 19:59:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1E485407A3
 for <buildroot@lists.busybox.net>; Fri,  6 Sep 2024 19:58:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UKnPA4ge1W06 for <buildroot@lists.busybox.net>;
 Fri,  6 Sep 2024 19:58:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 23BEF4073D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 23BEF4073D
 for <buildroot@buildroot.org>; Fri,  6 Sep 2024 19:58:56 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1CA107FC34; Fri,  6 Sep 2024 19:58:56 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 23 Aug 2024 18:40:55 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 90c386d1ec4d9ac7aca2f7127543f4cc74ed1f8a
X-Git-Newrev: 41ce1cc690b0837a1822079317bf317ddaeac17b
X-Patchwork-Hint: ignore
Message-Id: <20240906195856.1CA107FC34@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libv4l: bump version to 1.28.1
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=41ce1cc690b0837a1822079317bf317ddaeac17b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Upstream switched to xz tarball and meson.

Changelog:
https://git.linuxtv.org/v4l-utils.git/tree/ChangeLog?h=stable-1.28

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libv4l/libv4l.hash |  4 ++--
 package/libv4l/libv4l.mk   | 41 +++++++++++++----------------------------
 2 files changed, 15 insertions(+), 30 deletions(-)

diff --git a/package/libv4l/libv4l.hash b/package/libv4l/libv4l.hash
index 4f694de34b..0c8ea1010b 100644
--- a/package/libv4l/libv4l.hash
+++ b/package/libv4l/libv4l.hash
@@ -1,7 +1,7 @@
 # Locally calculated after checking signature
-# https://linuxtv.org/downloads/v4l-utils/v4l-utils-1.20.0.tar.bz2.asc
+# https://linuxtv.org/downloads/v4l-utils/v4l-utils-1.28.1.tar.xz.asc
 # with key 05D0169C26E41593418129DF199A64FADFB500FF
-sha256  cbb7fe8a6307f5ce533a05cded70bb93c3ba06395ab9b6d007eb53b75d805f5b  v4l-utils-1.24.1.tar.bz2
+sha256  0fa075ce59b6618847af6ea191b6155565ccaa44de0504581ddfed795a328a82  v4l-utils-1.28.1.tar.xz
 
 # Locally calculated
 sha256  391e4da1c54a422a78d83be7bf84b2dfb8bacdd8ad256fa4374e128655584a8a  COPYING
diff --git a/package/libv4l/libv4l.mk b/package/libv4l/libv4l.mk
index 1142a7442f..072d7efcf3 100644
--- a/package/libv4l/libv4l.mk
+++ b/package/libv4l/libv4l.mk
@@ -4,19 +4,12 @@
 #
 ################################################################################
 
-LIBV4L_VERSION = 1.24.1
-LIBV4L_SOURCE = v4l-utils-$(LIBV4L_VERSION).tar.bz2
+LIBV4L_VERSION = 1.28.1
+LIBV4L_SOURCE = v4l-utils-$(LIBV4L_VERSION).tar.xz
 LIBV4L_SITE = https://linuxtv.org/downloads/v4l-utils
 LIBV4L_INSTALL_STAGING = YES
 LIBV4L_DEPENDENCIES = host-pkgconf
-LIBV4L_CONF_OPTS = --disable-doxygen-doc --disable-qvidcap --disable-v4l2-tracer
-# needed to get utils/qv4l link flags right
-LIBV4L_AUTORECONF = YES
-# add host-gettext for AM_ICONV macro
-LIBV4L_DEPENDENCIES += host-gettext
-
-# fix uclibc-ng configure/compile
-LIBV4L_CONF_ENV = ac_cv_prog_cc_c99='-std=gnu99'
+LIBV4L_CONF_OPTS = -Ddoxygen-doc=disabled -Dqvidcap=disabled -Dv4l2-tracer=disabled
 
 # v4l-utils components have different licences, see v4l-utils.spec for details
 LIBV4L_LICENSE = GPL-2.0+ (utilities), LGPL-2.1+ (libraries)
@@ -34,10 +27,10 @@ endif
 LIBV4L_DEPENDENCIES += $(if $(BR2_PACKAGE_LIBICONV),libiconv)
 
 ifeq ($(BR2_PACKAGE_JPEG),y)
+LIBV4L_CONF_OPTS += -Djpeg=enabled
 LIBV4L_DEPENDENCIES += jpeg
-LIBV4L_CONF_OPTS += --with-jpeg
 else
-LIBV4L_CONF_OPTS += --without-jpeg
+LIBV4L_CONF_OPTS += -Djpeg=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_HAS_LIBGL),y)
@@ -45,10 +38,10 @@ LIBV4L_DEPENDENCIES += libgl
 endif
 
 ifeq ($(BR2_PACKAGE_HAS_UDEV),y)
-LIBV4L_CONF_OPTS += --with-libudev --with-udevdir=/usr/lib/udev
+LIBV4L_CONF_OPTS += -Dlibdvbv5=enabled -Dudevdir=/usr/lib/udev
 LIBV4L_DEPENDENCIES += udev
 else
-LIBV4L_CONF_OPTS += --without-libudev
+LIBV4L_CONF_OPTS += -Dlibdvbv5=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_LIBGLU),y)
@@ -56,33 +49,25 @@ LIBV4L_DEPENDENCIES += libglu
 endif
 
 ifeq ($(BR2_PACKAGE_LIBV4L_UTILS),y)
-LIBV4L_CONF_OPTS += --enable-v4l-utils
+LIBV4L_CONF_OPTS += -Dv4l-utils=true
 LIBV4L_DEPENDENCIES += $(TARGET_NLS_DEPENDENCIES)
 
-# v4l2-ctl needs c++11, use gnu++11 for typeof support
-LIBV4L_CONF_ENV += CXXFLAGS="$(TARGET_CXXFLAGS) -std=gnu++11"
-
 # IR BPF decoder support needs toolchain with linux-headers >= 3.18
 # libelf and clang support
-LIBV4L_CONF_OPTS += --disable-bpf
+LIBV4L_CONF_OPTS += -Dbpf=disabled
 
 ifeq ($(BR2_PACKAGE_QT5BASE)$(BR2_PACKAGE_QT5BASE_GUI)$(BR2_PACKAGE_QT5BASE_WIDGETS),yyy)
-LIBV4L_CONF_OPTS += --enable-qv4l2
+LIBV4L_CONF_OPTS += -Dqv4l2=enabled
 LIBV4L_DEPENDENCIES += qt5base
-# protect against host version detection of moc-qt5/rcc-qt5/uic-qt5
-LIBV4L_CONF_ENV += \
-	ac_cv_prog_MOC=$(HOST_DIR)/bin/moc \
-	ac_cv_prog_RCC=$(HOST_DIR)/bin/rcc \
-	ac_cv_prog_UIC=$(HOST_DIR)/bin/uic
 else
-LIBV4L_CONF_OPTS += --disable-qv4l2
+LIBV4L_CONF_OPTS += -Dqv4l2=disabled
 endif
 else
-LIBV4L_CONF_OPTS += --disable-v4l-utils
+LIBV4L_CONF_OPTS += -Dv4l-utils=false
 endif
 
 ifeq ($(BR2_PACKAGE_SDL2_IMAGE),y)
 LIBV4L_DEPENDENCIES += sdl2_image
 endif
 
-$(eval $(autotools-package))
+$(eval $(meson-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
