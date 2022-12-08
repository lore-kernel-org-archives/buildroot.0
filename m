Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03965C001B2
	for <buildroot@archiver.kernel.org>; Thu,  8 Dec 2022 22:55:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 957AE41743;
	Thu,  8 Dec 2022 22:55:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 957AE41743
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LmgFILv5l4L6; Thu,  8 Dec 2022 22:55:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 38C0B41895;
	Thu,  8 Dec 2022 22:55:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 38C0B41895
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B92F01BF35F
 for <buildroot@lists.busybox.net>; Thu,  8 Dec 2022 22:38:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BE142820A7
 for <buildroot@lists.busybox.net>; Thu,  8 Dec 2022 22:38:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BE142820A7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dWvUdJaFVd4q for <buildroot@lists.busybox.net>;
 Thu,  8 Dec 2022 22:38:38 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 91483820EC
Received: from mailout01.t-online.de (mailout01.t-online.de [194.25.134.80])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 91483820EC
 for <buildroot@buildroot.org>; Thu,  8 Dec 2022 22:38:38 +0000 (UTC)
Received: from fwd83.dcpf.telekom.de (fwd83.aul.t-online.de [10.223.144.109])
 by mailout01.t-online.de (Postfix) with SMTP id 5A971134FB
 for <buildroot@buildroot.org>; Thu,  8 Dec 2022 23:38:23 +0100 (CET)
Received: from fli4l.lan.fli4l ([79.214.203.244]) by fwd83.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1p3PX1-2btxJc0; Thu, 8 Dec 2022 23:38:19 +0100
Received: from bruckner.lan.fli4l ([192.168.1.1]:35946)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd.kuhls@t-online.de>) id 1p3PX0-00048i-2q
 for buildroot@buildroot.org; Thu, 08 Dec 2022 23:38:18 +0100
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Thu,  8 Dec 2022 23:37:30 +0100
Message-Id: <20221208223817.1088619-24-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221208223817.1088619-1-bernd.kuhls@t-online.de>
References: <20221208223817.1088619-1-bernd.kuhls@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1670539099-62A0A2DC-8548AADB/0/0 CLEAN NORMAL
X-TOI-MSGID: fad4e471-09c7-41c9-9649-ed028f43f9d3
Subject: [Buildroot] [PATCH 23/70] package/x11r7/xapp_xdm: bump version to
 1.1.14
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://lists.x.org/archives/xorg-announce/2022-December/003265.html

xlib_libXinerama is an optional dependency now.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xapp_xdm/Config.in     |  1 -
 package/x11r7/xapp_xdm/xapp_xdm.hash |  6 +++---
 package/x11r7/xapp_xdm/xapp_xdm.mk   | 12 +++++++++---
 3 files changed, 12 insertions(+), 7 deletions(-)

diff --git a/package/x11r7/xapp_xdm/Config.in b/package/x11r7/xapp_xdm/Config.in
index af816a1349..1ac15ce368 100644
--- a/package/x11r7/xapp_xdm/Config.in
+++ b/package/x11r7/xapp_xdm/Config.in
@@ -8,7 +8,6 @@ config BR2_PACKAGE_XAPP_XDM
 	select BR2_PACKAGE_XLIB_LIBX11
 	select BR2_PACKAGE_XLIB_LIBXAW
 	select BR2_PACKAGE_XLIB_LIBXDMCP
-	select BR2_PACKAGE_XLIB_LIBXINERAMA
 	select BR2_PACKAGE_XLIB_LIBXT
 	select BR2_PACKAGE_XORGPROTO
 	help
diff --git a/package/x11r7/xapp_xdm/xapp_xdm.hash b/package/x11r7/xapp_xdm/xapp_xdm.hash
index 5ba3a3f062..daf1b0852f 100644
--- a/package/x11r7/xapp_xdm/xapp_xdm.hash
+++ b/package/x11r7/xapp_xdm/xapp_xdm.hash
@@ -1,5 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2022-April/003148.html
-sha256  e58267e8f1478f2f5cd57cbcf2367a36973860c3131a450a3e0816585af03264  xdm-1.1.13.tar.xz
-sha512  1c7ba51dc8c6989ff6ede3a3abd06e002903609d4ebd31f06ec39fbfee3a80a690c6180f85c3ab135a0de4623261d92a191d1ca5f733cdb3bd2e7e78977b98e5  xdm-1.1.13.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2022-December/003265.html
+sha256  3e9bf25636797ec9e595286dd6820ecc33901439f07705eaf608ecda012c3d5f  xdm-1.1.14.tar.xz
+sha512  8ed1d2c946916c24cb4b2de9326f65629c97e53b145312c9cb9c6e4308d8b47d67d3981319fbd4feac9b3ed436b9dfb24a1c905d37d7bcf07b49c18a68c7a6e4  xdm-1.1.14.tar.xz
 # Locally computed
 sha256  b33b4bebbd6511b3e15315e8e29d67f25334ee45da8b7da6e6e97c53a70c6923  COPYING
diff --git a/package/x11r7/xapp_xdm/xapp_xdm.mk b/package/x11r7/xapp_xdm/xapp_xdm.mk
index 98306f66f5..035f2e9484 100644
--- a/package/x11r7/xapp_xdm/xapp_xdm.mk
+++ b/package/x11r7/xapp_xdm/xapp_xdm.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-XAPP_XDM_VERSION = 1.1.13
+XAPP_XDM_VERSION = 1.1.14
 XAPP_XDM_SOURCE = xdm-$(XAPP_XDM_VERSION).tar.xz
-XAPP_XDM_SITE = http://xorg.freedesktop.org/releases/individual/app
+XAPP_XDM_SITE = https://xorg.freedesktop.org/archive/individual/app
 XAPP_XDM_LICENSE = MIT
 XAPP_XDM_LICENSE_FILES = COPYING
 XAPP_XDM_CONF_ENV = ac_cv_file__dev_urandom=yes
@@ -16,7 +16,6 @@ XAPP_XDM_DEPENDENCIES = \
 	xlib_libX11 \
 	xlib_libXaw \
 	xlib_libXdmcp \
-	xlib_libXinerama \
 	xlib_libXt \
 	xorgproto
 XAPP_XDM_CONF_OPTS = \
@@ -24,6 +23,13 @@ XAPP_XDM_CONF_OPTS = \
 	--with-utmp-file=/var/adm/utmpx \
 	--with-wtmp-file=/var/adm/wtmpx
 
+ifeq ($(BR2_PACKAGE_XLIB_LIBXINERAMA),y)
+XAPP_XDM_CONF_OPTS += --with-xinerama
+XAPP_XDM_DEPENDENCIES += xlib_libXinerama
+else
+XAPP_XDM_CONF_OPTS += --without-xinerama
+endif
+
 define XAPP_XDM_INSTALL_INIT_SYSV
 	$(INSTALL) -m 0755 -D package/x11r7/xapp_xdm/S99xdm \
 		$(TARGET_DIR)/etc/init.d/S99xdm
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
