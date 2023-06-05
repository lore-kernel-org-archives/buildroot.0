Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B8EAC7EE23
	for <buildroot@archiver.kernel.org>; Mon,  5 Jun 2023 11:47:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4D93A60DED;
	Mon,  5 Jun 2023 11:47:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4D93A60DED
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xPSG_QVLwZHx; Mon,  5 Jun 2023 11:47:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6395A610E7;
	Mon,  5 Jun 2023 11:47:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6395A610E7
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A35A41BF4DA
 for <buildroot@lists.busybox.net>; Mon,  5 Jun 2023 11:45:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 674BB82138
 for <buildroot@lists.busybox.net>; Mon,  5 Jun 2023 11:45:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 674BB82138
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9RT4U6T8mr0w for <buildroot@lists.busybox.net>;
 Mon,  5 Jun 2023 11:45:18 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id CC37081F8C
 for <buildroot@buildroot.org>; Mon,  5 Jun 2023 11:45:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CC37081F8C
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B34C686C78; Mon,  5 Jun 2023 11:45:18 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 5 Jun 2023 13:05:46 +0200
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: d1bd45fdcd2e04af4715d67418dfbb372b0e9e0f
X-Git-Newrev: 8f059f406b823237e32004ed1fd01e3906d030f5
X-Patchwork-Hint: ignore
Message-Id: <20230605114518.B34C686C78@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x]
 package/x11r7/xdriver_xf86-input-mouse: bump version to 1.9.5
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

commit: https://git.buildroot.net/buildroot/commit/?id=8f059f406b823237e32004ed1fd01e3906d030f5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

Release notes:
https://lists.x.org/archives/xorg-announce/2023-May/003392.html

Updated license hash due to update in copyrighht years with upstream
commit:
https://gitlab.freedesktop.org/xorg/driver/xf86-input-mouse/-/commit/5f63ab04338fd811c610ae7617757ede52471316

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit b30206b708e02adb1b287a2d450f48c4bd12f754)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../x11r7/xdriver_xf86-input-mouse/xdriver_xf86-input-mouse.hash  | 8 ++++----
 .../x11r7/xdriver_xf86-input-mouse/xdriver_xf86-input-mouse.mk    | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/x11r7/xdriver_xf86-input-mouse/xdriver_xf86-input-mouse.hash b/package/x11r7/xdriver_xf86-input-mouse/xdriver_xf86-input-mouse.hash
index adba659aea..d654c362a9 100644
--- a/package/x11r7/xdriver_xf86-input-mouse/xdriver_xf86-input-mouse.hash
+++ b/package/x11r7/xdriver_xf86-input-mouse/xdriver_xf86-input-mouse.hash
@@ -1,5 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2022-November/003247.html
-sha256  7f6f8551fc238abdddcf9f38906564c1f8c7dacb0ad947cfc110487aefbd8d4c  xf86-input-mouse-1.9.4.tar.xz
-sha512  7dfde3b1e0c1291c4d78ee920942771808b007f743bfc6eed20de12579383745858673dd874a4b5cf4ab8d9d15f6f7ca2db81ee831547a488d64848a7fe5e16c  xf86-input-mouse-1.9.4.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2023-May/003392.html
+sha256  4fde8ae9b44352e2a208584c36528ee3ed13cf5fe4417208a9785daccefd9968  xf86-input-mouse-1.9.5.tar.xz
+sha512  ed9bd9cb9a05dac0ff1bfb4e4704cb2e94117afb400aa9e0b7ccdbb102bc6db1b0d3af7cb6f99d0892f8fc306f1643286291c0fa7114af8e65864412bd6c1afa  xf86-input-mouse-1.9.5.tar.xz
 # Locally computed
-sha256  472ff645ead9bf3ffb48d42c596376ffc595897e0c0993a071a7ada0da1f4f10  COPYING
+sha256  5b066654bdb61a1ef41f38cceda752897bbddb6e60e20f5889cab436a9b7b813  COPYING
diff --git a/package/x11r7/xdriver_xf86-input-mouse/xdriver_xf86-input-mouse.mk b/package/x11r7/xdriver_xf86-input-mouse/xdriver_xf86-input-mouse.mk
index 4a9eb3089f..25e25ab93d 100644
--- a/package/x11r7/xdriver_xf86-input-mouse/xdriver_xf86-input-mouse.mk
+++ b/package/x11r7/xdriver_xf86-input-mouse/xdriver_xf86-input-mouse.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XDRIVER_XF86_INPUT_MOUSE_VERSION = 1.9.4
+XDRIVER_XF86_INPUT_MOUSE_VERSION = 1.9.5
 XDRIVER_XF86_INPUT_MOUSE_SOURCE = xf86-input-mouse-$(XDRIVER_XF86_INPUT_MOUSE_VERSION).tar.xz
 XDRIVER_XF86_INPUT_MOUSE_SITE = https://xorg.freedesktop.org/archive/individual/driver
 XDRIVER_XF86_INPUT_MOUSE_LICENSE = MIT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
