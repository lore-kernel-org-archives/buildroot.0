Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C54DC77B73
	for <buildroot@archiver.kernel.org>; Mon,  5 Jun 2023 11:48:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2AA1661140;
	Mon,  5 Jun 2023 11:48:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2AA1661140
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MTVMtVoUaTyY; Mon,  5 Jun 2023 11:48:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 239E061106;
	Mon,  5 Jun 2023 11:48:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 239E061106
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0F4911BF4DA
 for <buildroot@lists.busybox.net>; Mon,  5 Jun 2023 11:45:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B107C417A3
 for <buildroot@lists.busybox.net>; Mon,  5 Jun 2023 11:45:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B107C417A3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1QSz7lFdjksc for <buildroot@lists.busybox.net>;
 Mon,  5 Jun 2023 11:45:19 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 63604417A9
 for <buildroot@buildroot.org>; Mon,  5 Jun 2023 11:45:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 63604417A9
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6108C86C77; Mon,  5 Jun 2023 11:45:19 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 5 Jun 2023 13:39:53 +0200
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: cf6733b7943347fde134cc2e3d6836d481e813a4
X-Git-Newrev: 44b1e44ef9b62c637975d8446c24c8cc6653f912
X-Patchwork-Hint: ignore
Message-Id: <20230605114519.6108C86C77@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x]
 package/x11r7/xdriver_xf86-video-ark: bump version to 0.7.6
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

commit: https://git.buildroot.net/buildroot/commit/?id=44b1e44ef9b62c637975d8446c24c8cc6653f912
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

Release notes:
https://lists.x.org/archives/xorg-announce/2023-February/003328.html

Removed patch which was applied upstream.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
[yann.morin.1998@free.fr: regenerate .checkpackageignore]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit cd1b1bcc0ec31b3af8d901cb7e05bd2794e3130f)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../xdriver_xf86-video-ark/0001-mibstore.patch     | 40 ----------------------
 .../xdriver_xf86-video-ark.hash                    |  5 +--
 .../xdriver_xf86-video-ark.mk                      |  6 ++--
 3 files changed, 6 insertions(+), 45 deletions(-)

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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
