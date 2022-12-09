Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13357C636D6
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 21:48:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B39FA42CCD;
	Mon, 20 Feb 2023 21:48:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B39FA42CCD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZjIW-TtRj8eo; Mon, 20 Feb 2023 21:48:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6BCF74EC13;
	Mon, 20 Feb 2023 21:48:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6BCF74EC13
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9F1A71BF2E3
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:53:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 49FF76110D
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:51:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 49FF76110D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7YZueGxcmOc6 for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:51:56 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4D450610C8
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:51:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4D450610C8
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4B6B8828C8; Mon, 20 Feb 2023 20:51:56 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Fri, 9 Dec 2022 17:31:00 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: f298729fc3e3d71c01eab9e2939661fb50a7fe5a
X-Git-Newrev: 82abffdbb7784ab30874544f740abf23f6c0c695
X-Patchwork-Hint: ignore
Message-Id: <20230220205156.4B6B8828C8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next]
 package/x11r7/xdriver_xf86-input-mouse: bump version to 1.9.4
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

commit: https://git.buildroot.net/buildroot/commit/?id=82abffdbb7784ab30874544f740abf23f6c0c695
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 .../x11r7/xdriver_xf86-input-mouse/xdriver_xf86-input-mouse.hash  | 8 +++-----
 .../x11r7/xdriver_xf86-input-mouse/xdriver_xf86-input-mouse.mk    | 6 +++---
 2 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/package/x11r7/xdriver_xf86-input-mouse/xdriver_xf86-input-mouse.hash b/package/x11r7/xdriver_xf86-input-mouse/xdriver_xf86-input-mouse.hash
index fe83f6920f..adba659aea 100644
--- a/package/x11r7/xdriver_xf86-input-mouse/xdriver_xf86-input-mouse.hash
+++ b/package/x11r7/xdriver_xf86-input-mouse/xdriver_xf86-input-mouse.hash
@@ -1,7 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2018-June/002903.html
-md5  a2104693bbcfe1413397f7905eecd3dc  xf86-input-mouse-1.9.3.tar.bz2
-sha1  b3982998808ba43117fc066c4ecc94ce67c5818e  xf86-input-mouse-1.9.3.tar.bz2
-sha256  93ecb350604d05be98b7d4e5db3b8155a44890069a7d8d6b800c0bea79c85cc5  xf86-input-mouse-1.9.3.tar.bz2
-sha512  d99f5b4b1ef1aa4cbf1a92549e412f54f121bc804e4d6643248ad7ea18081b38b958bd289dc8476ebc0f6ef5f7424c2f2a8abcfaa30cae5378829549af6b148f  xf86-input-mouse-1.9.3.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2022-November/003247.html
+sha256  7f6f8551fc238abdddcf9f38906564c1f8c7dacb0ad947cfc110487aefbd8d4c  xf86-input-mouse-1.9.4.tar.xz
+sha512  7dfde3b1e0c1291c4d78ee920942771808b007f743bfc6eed20de12579383745858673dd874a4b5cf4ab8d9d15f6f7ca2db81ee831547a488d64848a7fe5e16c  xf86-input-mouse-1.9.4.tar.xz
 # Locally computed
 sha256  472ff645ead9bf3ffb48d42c596376ffc595897e0c0993a071a7ada0da1f4f10  COPYING
diff --git a/package/x11r7/xdriver_xf86-input-mouse/xdriver_xf86-input-mouse.mk b/package/x11r7/xdriver_xf86-input-mouse/xdriver_xf86-input-mouse.mk
index 3886fa7aa1..4a9eb3089f 100644
--- a/package/x11r7/xdriver_xf86-input-mouse/xdriver_xf86-input-mouse.mk
+++ b/package/x11r7/xdriver_xf86-input-mouse/xdriver_xf86-input-mouse.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-XDRIVER_XF86_INPUT_MOUSE_VERSION = 1.9.3
-XDRIVER_XF86_INPUT_MOUSE_SOURCE = xf86-input-mouse-$(XDRIVER_XF86_INPUT_MOUSE_VERSION).tar.bz2
-XDRIVER_XF86_INPUT_MOUSE_SITE = http://xorg.freedesktop.org/releases/individual/driver
+XDRIVER_XF86_INPUT_MOUSE_VERSION = 1.9.4
+XDRIVER_XF86_INPUT_MOUSE_SOURCE = xf86-input-mouse-$(XDRIVER_XF86_INPUT_MOUSE_VERSION).tar.xz
+XDRIVER_XF86_INPUT_MOUSE_SITE = https://xorg.freedesktop.org/archive/individual/driver
 XDRIVER_XF86_INPUT_MOUSE_LICENSE = MIT
 XDRIVER_XF86_INPUT_MOUSE_LICENSE_FILES = COPYING
 XDRIVER_XF86_INPUT_MOUSE_DEPENDENCIES = xserver_xorg-server xorgproto
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
