Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48DB7C43334
	for <buildroot@archiver.kernel.org>; Sun, 24 Jul 2022 16:28:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F095C60AF2;
	Sun, 24 Jul 2022 16:28:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F095C60AF2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0MvvXayIII_L; Sun, 24 Jul 2022 16:28:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id EF90460B45;
	Sun, 24 Jul 2022 16:28:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EF90460B45
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2C74B1BF479
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 16:25:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 95A328494F
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 16:25:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 95A328494F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VIkO4KCB8f-f for <buildroot@lists.busybox.net>;
 Sun, 24 Jul 2022 16:25:06 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 337C484929
Received: from mailout02.t-online.de (mailout02.t-online.de [194.25.134.17])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 337C484929
 for <buildroot@buildroot.org>; Sun, 24 Jul 2022 16:25:06 +0000 (UTC)
Received: from fwd81.dcpf.telekom.de (fwd81.aul.t-online.de [10.223.144.107])
 by mailout02.t-online.de (Postfix) with SMTP id 5865A3027
 for <buildroot@buildroot.org>; Sun, 24 Jul 2022 18:25:02 +0200 (CEST)
Received: from fli4l.lan.fli4l ([79.214.202.112]) by fwd81.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1oFePd-3VNz970; Sun, 24 Jul 2022 18:25:02 +0200
Received: from bruckner.lan.fli4l ([192.168.1.1]:40906)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd.kuhls@t-online.de>) id 1oFePd-0007mb-1m;
 Sun, 24 Jul 2022 18:25:01 +0200
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Sun, 24 Jul 2022 18:25:00 +0200
Message-Id: <20220724162500.2683871-21-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220724162500.2683871-1-bernd.kuhls@t-online.de>
References: <20220724162500.2683871-1-bernd.kuhls@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1658679902-0144E3C8-115C1C7F/0/0 CLEAN NORMAL
X-TOI-MSGID: 82790927-ae1a-4c35-9415-7bf472c962f5
Subject: [Buildroot] [PATCH 20/20] package/x11r7/xdriver_xf86-video-mga:
 bump version to 2.0.1
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Removed patch (and autoreconf) which was commited upstream:
https://gitlab.freedesktop.org/xorg/driver/xf86-video-mga/-/commit/f227f2f286123a9ca64b567783825a2c18b87971

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 .../0001-misc-fixes.patch                     | 21 -------------------
 .../xdriver_xf86-video-mga.hash               | 10 ++++-----
 .../xdriver_xf86-video-mga.mk                 |  7 +++----
 3 files changed, 7 insertions(+), 31 deletions(-)
 delete mode 100644 package/x11r7/xdriver_xf86-video-mga/0001-misc-fixes.patch

diff --git a/package/x11r7/xdriver_xf86-video-mga/0001-misc-fixes.patch b/package/x11r7/xdriver_xf86-video-mga/0001-misc-fixes.patch
deleted file mode 100644
index 5707bd1b3a..0000000000
--- a/package/x11r7/xdriver_xf86-video-mga/0001-misc-fixes.patch
+++ /dev/null
@@ -1,21 +0,0 @@
---- xf86-video-mga-1.4.9/configure.ac.orig	2007-06-10 11:55:24.000000000 +0200
-+++ xf86-video-mga-1.4.9/configure.ac	2007-06-10 12:00:37.000000000 +0200
-@@ -77,12 +77,18 @@
- AC_HEADER_STDC
- 
- if test "x$DRI" != xno; then
-+	if test "$cross_compiling" = no; then
-         AC_CHECK_FILE([${sdkdir}/dri.h],
-                       [have_dri_h="yes"], [have_dri_h="no"])
-         AC_CHECK_FILE([${sdkdir}/sarea.h],
-                       [have_sarea_h="yes"], [have_sarea_h="no"])
-         AC_CHECK_FILE([${sdkdir}/dristruct.h],
-                       [have_dristruct_h="yes"], [have_dristruct_h="no"])
-+	else
-+		have_dri_h="yes"
-+		have_sarea_h="yes"
-+		have_dristruct_h="yes"
-+	fi
- fi
- 
- AC_MSG_CHECKING([whether to include DRI support])
diff --git a/package/x11r7/xdriver_xf86-video-mga/xdriver_xf86-video-mga.hash b/package/x11r7/xdriver_xf86-video-mga/xdriver_xf86-video-mga.hash
index 218e52e19c..813429789b 100644
--- a/package/x11r7/xdriver_xf86-video-mga/xdriver_xf86-video-mga.hash
+++ b/package/x11r7/xdriver_xf86-video-mga/xdriver_xf86-video-mga.hash
@@ -1,7 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2018-December/002933.html
-md5 b8fc99b4adea8bfe80156b13df4b6c9c  xf86-video-mga-2.0.0.tar.bz2
-sha1 833f2710a1fd7b3f2db3700b2ad055527da5033b  xf86-video-mga-2.0.0.tar.bz2
-sha256 268946e1a13e9d80e4f724a0740df9e6e8c8bad37697fcbf456924e9fdbb5d79  xf86-video-mga-2.0.0.tar.bz2
-sha512 b92006486aef815ff4399f291d610c65d88c0b32a9dae97658c644715ff62b221b01495b5c7a2311745e26f699c1c1f753b81c7bf54cf75567af9f78ac015540  xf86-video-mga-2.0.0.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2022-July/003184.html
+sha256  27a33b70837965bb4a5f27fd260be085ca5bba837a4e62907f093c2f205603ab  xf86-video-mga-2.0.1.tar.xz
+sha512  d9a0abedb71f3354788c2f91b770bc00c4118cfa2c99072dea82c28f025bc87bb88ebaf969962a8f0e97e1ff7938aebd9c682b730b0e07d5174dd9e8dc2cdfb6  xf86-video-mga-2.0.1.tar.xz
 # Locally computed
-sha256 6c567575e381478c7616eedff3ea2ae5228a5b54fbdd22d4070ebae312fa085c  COPYING
+sha256  f69c2f4fd11ec4de7fcc23146187836eed1755aade3fef28b9204ea1a4adf61b  COPYING
diff --git a/package/x11r7/xdriver_xf86-video-mga/xdriver_xf86-video-mga.mk b/package/x11r7/xdriver_xf86-video-mga/xdriver_xf86-video-mga.mk
index 24f2da2cce..4841a643bc 100644
--- a/package/x11r7/xdriver_xf86-video-mga/xdriver_xf86-video-mga.mk
+++ b/package/x11r7/xdriver_xf86-video-mga/xdriver_xf86-video-mga.mk
@@ -4,12 +4,11 @@
 #
 ################################################################################
 
-XDRIVER_XF86_VIDEO_MGA_VERSION = 2.0.0
-XDRIVER_XF86_VIDEO_MGA_SOURCE = xf86-video-mga-$(XDRIVER_XF86_VIDEO_MGA_VERSION).tar.bz2
-XDRIVER_XF86_VIDEO_MGA_SITE = http://xorg.freedesktop.org/archive/individual/driver
+XDRIVER_XF86_VIDEO_MGA_VERSION = 2.0.1
+XDRIVER_XF86_VIDEO_MGA_SOURCE = xf86-video-mga-$(XDRIVER_XF86_VIDEO_MGA_VERSION).tar.xz
+XDRIVER_XF86_VIDEO_MGA_SITE = https://xorg.freedesktop.org/archive/individual/driver
 XDRIVER_XF86_VIDEO_MGA_LICENSE = MIT
 XDRIVER_XF86_VIDEO_MGA_LICENSE_FILES = COPYING
-XDRIVER_XF86_VIDEO_MGA_AUTORECONF = YES
 XDRIVER_XF86_VIDEO_MGA_DEPENDENCIES = xserver_xorg-server libdrm xorgproto
 
 ifeq ($(BR2_PACKAGE_HAS_LIBGL),y)
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
