Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DA7DC77B7F
	for <buildroot@archiver.kernel.org>; Sat,  6 May 2023 17:41:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3335540B80;
	Sat,  6 May 2023 17:41:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3335540B80
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qyk9vanj_Sbk; Sat,  6 May 2023 17:41:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4209840102;
	Sat,  6 May 2023 17:41:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4209840102
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B92AE1BF369
 for <buildroot@lists.busybox.net>; Sat,  6 May 2023 17:39:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A030A40C15
 for <buildroot@lists.busybox.net>; Sat,  6 May 2023 17:39:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A030A40C15
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SpPuWnRFtRbv for <buildroot@lists.busybox.net>;
 Sat,  6 May 2023 17:39:25 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8DF6B40B80
Received: from mailout09.t-online.de (mailout09.t-online.de [194.25.134.84])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8DF6B40B80
 for <buildroot@buildroot.org>; Sat,  6 May 2023 17:39:25 +0000 (UTC)
Received: from fwd87.dcpf.telekom.de (fwd87.aul.t-online.de [10.223.144.113])
 by mailout09.t-online.de (Postfix) with SMTP id 0BB0BA157
 for <buildroot@buildroot.org>; Sat,  6 May 2023 19:39:22 +0200 (CEST)
Received: from fli4l.lan.fli4l ([79.214.192.80]) by fwd87.t-online.de
 with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
 esmtp id 1pvLsO-1wv7PV0; Sat, 6 May 2023 19:39:20 +0200
Received: from bruckner.lan.fli4l ([192.168.1.1]:36596)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd.kuhls@t-online.de>) id 1pvLsN-0004jT-2g
 for buildroot@buildroot.org; Sat, 06 May 2023 19:39:19 +0200
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Sat,  6 May 2023 19:39:17 +0200
Message-Id: <20230506173917.1112500-22-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230506173917.1112500-1-bernd.kuhls@t-online.de>
References: <20230506173917.1112500-1-bernd.kuhls@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1683394760-EEFFAC53-A6B461C2/0/0 CLEAN NORMAL
X-TOI-MSGID: be1e4abf-455c-41e2-b1f8-bc547a387b09
Subject: [Buildroot] [PATCH 22/22] package/x11r7/xdriver_xf86-video-ark:
 bump version to 0.7.6
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
https://lists.x.org/archives/xorg-announce/2023-February/003328.html

Removed patch which was applied upstream.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 .../0001-mibstore.patch                       | 40 -------------------
 .../xdriver_xf86-video-ark.hash               |  5 ++-
 .../xdriver_xf86-video-ark.mk                 |  6 +--
 3 files changed, 6 insertions(+), 45 deletions(-)
 delete mode 100644 package/x11r7/xdriver_xf86-video-ark/0001-mibstore.patch

diff --git a/package/x11r7/xdriver_xf86-video-ark/0001-mibstore.patch b/package/x11r7/xdriver_xf86-video-ark/0001-mibstore.patch
deleted file mode 100644
index fa3e68596a..0000000000
--- a/package/x11r7/xdriver_xf86-video-ark/0001-mibstore.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From 3a3eb72baec46f48e6cf15a834271c3d3386deac Mon Sep 17 00:00:00 2001
-From: Gaetan Nadon <memsize@videotron.ca>
-Date: Tue, 17 Sep 2013 19:55:37 +0000
-Subject: Remove usage of mibstore.h (removed from server)
-
-The module had a compile error for this missing header file.
-
-Changes similar to vmware commit
-23d87c92b7211cc5249eefe4ab3a2c7f370e279e
-
-Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
-Signed-off-by: Gaetan Nadon <memsize@videotron.ca>
----
-Fetch from:
-http://cgit.freedesktop.org/xorg/driver/xf86-video-ark/commit/?id=3a3eb72baec46f48e6cf15a834271c3d3386deac
-
-Signed-off-by: Bernd Kuhls <berndkuhls@hotmail.com>
-
-diff --git a/src/ark_driver.c b/src/ark_driver.c
-index b7c287c..65cfe84 100644
---- a/src/ark_driver.c
-+++ b/src/ark_driver.c
-@@ -39,7 +39,6 @@
- #include "compiler.h"
- #include "mipointer.h"
- #include "micmap.h"
--#include "mibstore.h"
- #include "fb.h"
- #include "ark.h"
- 
-@@ -538,7 +537,6 @@ static Bool ARKScreenInit(SCREEN_INIT_ARGS_DECL)
- 
- 	fbPictureInit (pScreen, 0, 0);
- 
--	miInitializeBackingStore(pScreen);
- 	xf86SetBackingStore(pScreen);
- 
- 	if (!pARK->NoAccel) {
---
-cgit v0.9.0.2-2-gbebe
diff --git a/package/x11r7/xdriver_xf86-video-ark/xdriver_xf86-video-ark.hash b/package/x11r7/xdriver_xf86-video-ark/xdriver_xf86-video-ark.hash
index 2e2e953676..68131fdb38 100644
--- a/package/x11r7/xdriver_xf86-video-ark/xdriver_xf86-video-ark.hash
+++ b/package/x11r7/xdriver_xf86-video-ark/xdriver_xf86-video-ark.hash
@@ -1,4 +1,5 @@
-# From http://lists.x.org/archives/xorg-announce/2012-July/002007.html
-sha256  c690e046f34a393aac1c8d9616b4790e93cda60a460b00b9597d322175dbe51e  xf86-video-ark-0.7.5.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2023-February/003328.html
+sha256  5acc9e78122ff6f4390787b2d0d44df81379bd613b6245983cc4bf3f325d085d  xf86-video-ark-0.7.6.tar.xz
+sha512  a52623e07eef6fa12d77b1afc55bb74b21662b850515b3a32bbf5988dcea2e787b4eddf4e020279aa4e4ddba436505ca9298548406913031e0ed5edaac835491  xf86-video-ark-0.7.6.tar.xz
 # Locally calculated
 sha256  8ba9850fb0ecd9033bb1d25c1be85625cb53ca56ce76b71f78f4a034f7310bda  COPYING
diff --git a/package/x11r7/xdriver_xf86-video-ark/xdriver_xf86-video-ark.mk b/package/x11r7/xdriver_xf86-video-ark/xdriver_xf86-video-ark.mk
index 3f2a63609e..6301a97300 100644
--- a/package/x11r7/xdriver_xf86-video-ark/xdriver_xf86-video-ark.mk
+++ b/package/x11r7/xdriver_xf86-video-ark/xdriver_xf86-video-ark.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-XDRIVER_XF86_VIDEO_ARK_VERSION = 0.7.5
-XDRIVER_XF86_VIDEO_ARK_SOURCE = xf86-video-ark-$(XDRIVER_XF86_VIDEO_ARK_VERSION).tar.bz2
-XDRIVER_XF86_VIDEO_ARK_SITE = http://xorg.freedesktop.org/releases/individual/driver
+XDRIVER_XF86_VIDEO_ARK_VERSION = 0.7.6
+XDRIVER_XF86_VIDEO_ARK_SOURCE = xf86-video-ark-$(XDRIVER_XF86_VIDEO_ARK_VERSION).tar.xz
+XDRIVER_XF86_VIDEO_ARK_SITE = https://xorg.freedesktop.org/archive/individual/driver
 XDRIVER_XF86_VIDEO_ARK_LICENSE = MIT
 XDRIVER_XF86_VIDEO_ARK_LICENSE_FILES = COPYING
 XDRIVER_XF86_VIDEO_ARK_DEPENDENCIES = xserver_xorg-server xorgproto
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
