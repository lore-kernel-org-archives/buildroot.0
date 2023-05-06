Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85E02C77B73
	for <buildroot@archiver.kernel.org>; Sat,  6 May 2023 17:41:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2E92D4107A;
	Sat,  6 May 2023 17:41:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2E92D4107A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SxT_V0opqwU9; Sat,  6 May 2023 17:41:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 034804103C;
	Sat,  6 May 2023 17:41:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 034804103C
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1D5621BF369
 for <buildroot@lists.busybox.net>; Sat,  6 May 2023 17:39:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4FD5683EF3
 for <buildroot@lists.busybox.net>; Sat,  6 May 2023 17:39:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4FD5683EF3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id z1PB_Qy5Ed3h for <buildroot@lists.busybox.net>;
 Sat,  6 May 2023 17:39:24 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 038E783EF2
Received: from mailout09.t-online.de (mailout09.t-online.de [194.25.134.84])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 038E783EF2
 for <buildroot@buildroot.org>; Sat,  6 May 2023 17:39:23 +0000 (UTC)
Received: from fwd87.dcpf.telekom.de (fwd87.aul.t-online.de [10.223.144.113])
 by mailout09.t-online.de (Postfix) with SMTP id 08333A155
 for <buildroot@buildroot.org>; Sat,  6 May 2023 19:39:22 +0200 (CEST)
Received: from fli4l.lan.fli4l ([79.214.192.80]) by fwd87.t-online.de
 with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
 esmtp id 1pvLsN-1rHtIY0; Sat, 6 May 2023 19:39:19 +0200
Received: from bruckner.lan.fli4l ([192.168.1.1]:36596)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd.kuhls@t-online.de>) id 1pvLsM-0004jT-36
 for buildroot@buildroot.org; Sat, 06 May 2023 19:39:19 +0200
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Sat,  6 May 2023 19:39:07 +0200
Message-Id: <20230506173917.1112500-12-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230506173917.1112500-1-bernd.kuhls@t-online.de>
References: <20230506173917.1112500-1-bernd.kuhls@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1683394759-EEFFAC53-45007385/0/0 CLEAN NORMAL
X-TOI-MSGID: bbc482a2-104d-4ab5-a75e-30cd0d21cf52
Subject: [Buildroot] [PATCH 12/22] package/x11r7/xdriver_xf86-video-savage:
 bump version to 2.4.0
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

Release notes:
https://lists.x.org/archives/xorg-announce/2023-April/003381.html

Removed all patches due to upstream commits:
https://gitlab.freedesktop.org/xorg/driver/xf86-video-savage/-/commit/2ec88355123b1def99d8c79769f396ac97bc5008
https://gitlab.freedesktop.org/xorg/driver/xf86-video-savage/-/commit/0ece556daa8a88771b669d8104396abd9166d2d0

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 .../0001-cross-compile.patch                  | 27 -------------------
 .../0002-xorg-xserver120.patch                | 23 ----------------
 .../xdriver_xf86-video-savage.hash            |  5 ++--
 .../xdriver_xf86-video-savage.mk              |  7 +++--
 4 files changed, 6 insertions(+), 56 deletions(-)
 delete mode 100644 package/x11r7/xdriver_xf86-video-savage/0001-cross-compile.patch
 delete mode 100644 package/x11r7/xdriver_xf86-video-savage/0002-xorg-xserver120.patch

diff --git a/package/x11r7/xdriver_xf86-video-savage/0001-cross-compile.patch b/package/x11r7/xdriver_xf86-video-savage/0001-cross-compile.patch
deleted file mode 100644
index b9c296b6b5..0000000000
--- a/package/x11r7/xdriver_xf86-video-savage/0001-cross-compile.patch
+++ /dev/null
@@ -1,27 +0,0 @@
---- a/configure.ac	2008-05-21 16:04:23.000000000 -0400
-+++ b/configure.ac	2008-06-23 11:41:50.000000000 -0400
-@@ -68,12 +68,18 @@ sdkdir=$(pkg-config --variable=sdkdir xo
- AC_HEADER_STDC
- 
- if test "$DRI" != no; then
--        AC_CHECK_FILE([${sdkdir}/dri.h],
--                      [have_dri_h="yes"], [have_dri_h="no"])
--        AC_CHECK_FILE([${sdkdir}/sarea.h],
--                      [have_sarea_h="yes"], [have_sarea_h="no"])
--        AC_CHECK_FILE([${sdkdir}/dristruct.h],
--                      [have_dristruct_h="yes"], [have_dristruct_h="no"])
-+  	if test "$cross_compiling" = "no" ; then
-+ 		AC_CHECK_FILE([${sdkdir}/dri.h],
-+                        [have_dri_h="yes"], [have_dri_h="no"])
-+ 		AC_CHECK_FILE([${sdkdir}/sarea.h],
-+                        [have_sarea_h="yes"], [have_sarea_h="no"])
-+ 		AC_CHECK_FILE([${sdkdir}/dristruct.h],
-+                        [have_dristruct_h="yes"], [have_dristruct_h="no"])
-+  	else
-+  		have_dri_h="yes"
-+  		have_sarea_h="yes"
-+  		have_dristruct_h="yes"
-+  	fi
- fi
- 
- AC_MSG_CHECKING([whether to include DRI support])
diff --git a/package/x11r7/xdriver_xf86-video-savage/0002-xorg-xserver120.patch b/package/x11r7/xdriver_xf86-video-savage/0002-xorg-xserver120.patch
deleted file mode 100644
index 4c695960d1..0000000000
--- a/package/x11r7/xdriver_xf86-video-savage/0002-xorg-xserver120.patch
+++ /dev/null
@@ -1,23 +0,0 @@
-Fix build with modular-xorg-server-1.20
-
-Downloaded from
-http://cvsweb.netbsd.org/bsdweb.cgi/pkgsrc/x11/xf86-video-savage/patches/patch-src_savage__driver.c?rev=1.3&content-type=text/x-cvsweb-markup
-
-Patch was sent upstream by Thomas Klausner <wiz@netbsd.org>:
-https://lists.x.org/archives/xorg-devel/2018-May/056952.html
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
-
---- a/src/savage_driver.c.orig	2017-01-17 22:43:40.000000000 +0000
-+++ b/src/savage_driver.c
-@@ -2034,8 +2034,10 @@ static Bool SavagePreInit(ScrnInfoPtr pS
-     xf86DrvMsg(pScrn->scrnIndex, X_PROBED, "Detected current MCLK value of %1.3f MHz\n",
- 	       mclk / 1000.0);
- 
-+#if 0
-     pScrn->maxHValue = 2048 << 3;	/* 11 bits of h_total 8-pixel units */
-     pScrn->maxVValue = 2048;		/* 11 bits of v_total */
-+#endif
-     pScrn->virtualX = pScrn->display->virtualX;
-     pScrn->virtualY = pScrn->display->virtualY;
- 
diff --git a/package/x11r7/xdriver_xf86-video-savage/xdriver_xf86-video-savage.hash b/package/x11r7/xdriver_xf86-video-savage/xdriver_xf86-video-savage.hash
index 661c8749f2..4482ff5991 100644
--- a/package/x11r7/xdriver_xf86-video-savage/xdriver_xf86-video-savage.hash
+++ b/package/x11r7/xdriver_xf86-video-savage/xdriver_xf86-video-savage.hash
@@ -1,4 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2017-January/002760.html
-sha256  2c93c4db1f71e725dda0caee5821253129d4b52d7aa0fd720593e7769bceec86  xf86-video-savage-2.3.9.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2023-April/003381.html
+sha256  b36cf02cfdd08a39423bb977c45397fbca5813267c727f0fd3c963ac38b601fd  xf86-video-savage-2.4.0.tar.xz
+sha512  a4db097c200f1430887e4c52bbe14aeaaa2c73dfc392beeed104c682114bd067f89b69994d649829cdc5d188cdbe7a41b22c82b0b49e3a02cdf366013ebbc161  xf86-video-savage-2.4.0.tar.xz
 # Locally calculated
 sha256  611f4020815e3d5011a39a58f0958262715cd3becd9cb1ef14cc166fd84ec5a6  COPYING
diff --git a/package/x11r7/xdriver_xf86-video-savage/xdriver_xf86-video-savage.mk b/package/x11r7/xdriver_xf86-video-savage/xdriver_xf86-video-savage.mk
index 9e5bf61997..03983d5cdc 100644
--- a/package/x11r7/xdriver_xf86-video-savage/xdriver_xf86-video-savage.mk
+++ b/package/x11r7/xdriver_xf86-video-savage/xdriver_xf86-video-savage.mk
@@ -4,12 +4,11 @@
 #
 ################################################################################
 
-XDRIVER_XF86_VIDEO_SAVAGE_VERSION = 2.3.9
-XDRIVER_XF86_VIDEO_SAVAGE_SOURCE = xf86-video-savage-$(XDRIVER_XF86_VIDEO_SAVAGE_VERSION).tar.bz2
-XDRIVER_XF86_VIDEO_SAVAGE_SITE = http://xorg.freedesktop.org/releases/individual/driver
+XDRIVER_XF86_VIDEO_SAVAGE_VERSION = 2.4.0
+XDRIVER_XF86_VIDEO_SAVAGE_SOURCE = xf86-video-savage-$(XDRIVER_XF86_VIDEO_SAVAGE_VERSION).tar.xz
+XDRIVER_XF86_VIDEO_SAVAGE_SITE = https://xorg.freedesktop.org/archive/individual/driver
 XDRIVER_XF86_VIDEO_SAVAGE_LICENSE = MIT
 XDRIVER_XF86_VIDEO_SAVAGE_LICENSE_FILES = COPYING
-XDRIVER_XF86_VIDEO_SAVAGE_AUTORECONF = YES
 XDRIVER_XF86_VIDEO_SAVAGE_DEPENDENCIES = xserver_xorg-server libdrm xorgproto
 
 ifeq ($(BR2_PACKAGE_HAS_LIBGL),y)
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
