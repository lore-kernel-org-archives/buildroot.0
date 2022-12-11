Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6C2FC636D6
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 22:43:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5001C42DBE;
	Mon, 20 Feb 2023 22:43:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5001C42DBE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9S-hDXXbVbzw; Mon, 20 Feb 2023 22:43:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0946A49475;
	Mon, 20 Feb 2023 22:43:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0946A49475
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id F38B81BF8C7
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:55:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0DEC1611F4
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0DEC1611F4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SEx_pmo8XiTw for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:07 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2B78F6107E
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2B78F6107E
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1B0588648F; Mon, 20 Feb 2023 20:52:07 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 11 Dec 2022 17:17:44 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: d23d6fde81b3a8bf701d0382d55fe60e2334c934
X-Git-Newrev: 7255c2b31755241d8c4fafc5f733faa68182282d
X-Patchwork-Hint: ignore
Message-Id: <20230220205207.1B0588648F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next]
 package/x11r7/xdriver_xf86-input-joystick: bump version to 1.6.4
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

commit: https://git.buildroot.net/buildroot/commit/?id=7255c2b31755241d8c4fafc5f733faa68182282d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

https://lists.x.org/archives/xorg-announce/2022-December/003290.html

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 .../xdriver_xf86-input-joystick/xdriver_xf86-input-joystick.hash    | 5 +++--
 .../xdriver_xf86-input-joystick/xdriver_xf86-input-joystick.mk      | 6 +++---
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/package/x11r7/xdriver_xf86-input-joystick/xdriver_xf86-input-joystick.hash b/package/x11r7/xdriver_xf86-input-joystick/xdriver_xf86-input-joystick.hash
index d2384d6c15..0d7911bf96 100644
--- a/package/x11r7/xdriver_xf86-input-joystick/xdriver_xf86-input-joystick.hash
+++ b/package/x11r7/xdriver_xf86-input-joystick/xdriver_xf86-input-joystick.hash
@@ -1,4 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2016-November/002742.html
-sha256  9e7669ecf0f23b8e5dc39d5397cf28296f692aa4c0e4255f5e02816612c18eab  xf86-input-joystick-1.6.3.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2022-December/003290.html
+sha256  905ec485fabc699b1cb21518cbd152246776fa83570e09c5822ca0973733ccd2  xf86-input-joystick-1.6.4.tar.xz
+sha512  4e9127f125543060f9e6bc4b0aa384bc98a92acc52bfb240c9a114c565e0b24d2e9dcbc0e866845abc8aeb1e1a6c78cd5e3f0c0f22007aa93460b6a1910d67ef  xf86-input-joystick-1.6.4.tar.xz
 # Locally calculated
 sha256  460cf612147407317a3911ce03a215707d8d6d5f3e604a53fefa6e54974ad07e  COPYING
diff --git a/package/x11r7/xdriver_xf86-input-joystick/xdriver_xf86-input-joystick.mk b/package/x11r7/xdriver_xf86-input-joystick/xdriver_xf86-input-joystick.mk
index 0ec4be5e53..0573f43949 100644
--- a/package/x11r7/xdriver_xf86-input-joystick/xdriver_xf86-input-joystick.mk
+++ b/package/x11r7/xdriver_xf86-input-joystick/xdriver_xf86-input-joystick.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-XDRIVER_XF86_INPUT_JOYSTICK_VERSION = 1.6.3
-XDRIVER_XF86_INPUT_JOYSTICK_SOURCE = xf86-input-joystick-$(XDRIVER_XF86_INPUT_JOYSTICK_VERSION).tar.bz2
-XDRIVER_XF86_INPUT_JOYSTICK_SITE = http://xorg.freedesktop.org/releases/individual/driver
+XDRIVER_XF86_INPUT_JOYSTICK_VERSION = 1.6.4
+XDRIVER_XF86_INPUT_JOYSTICK_SOURCE = xf86-input-joystick-$(XDRIVER_XF86_INPUT_JOYSTICK_VERSION).tar.xz
+XDRIVER_XF86_INPUT_JOYSTICK_SITE = https://xorg.freedesktop.org/archive/individual/driver
 XDRIVER_XF86_INPUT_JOYSTICK_LICENSE = MIT
 XDRIVER_XF86_INPUT_JOYSTICK_LICENSE_FILES = COPYING
 XDRIVER_XF86_INPUT_JOYSTICK_DEPENDENCIES = xserver_xorg-server xorgproto
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
