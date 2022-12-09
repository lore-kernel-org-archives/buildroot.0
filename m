Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D169C61DA3
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 21:51:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 469904AAB4;
	Mon, 20 Feb 2023 21:51:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 469904AAB4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FKnNTKFG-3ZF; Mon, 20 Feb 2023 21:51:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 38CD44EC67;
	Mon, 20 Feb 2023 21:51:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 38CD44EC67
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A4C661BF8C7
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:53:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E8A7A61100
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:51:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E8A7A61100
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SG24qQK68nMj for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:51:57 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 277166110A
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:51:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 277166110A
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 14F6C828C8; Mon, 20 Feb 2023 20:51:57 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Fri, 9 Dec 2022 17:31:54 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: ea7d4fe0df7154b60f563295de0ce362991ff1d4
X-Git-Newrev: 835918d8e8e34ee298580c4da5e57bf0f925f708
X-Patchwork-Hint: ignore
Message-Id: <20230220205157.14F6C828C8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/x11r7/xapp_xrandr:
 bump version to 1.5.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=835918d8e8e34ee298580c4da5e57bf0f925f708
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

https://lists.x.org/archives/xorg-announce/2022-December/003270.html
Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/x11r7/xapp_xrandr/xapp_xrandr.hash | 8 +++-----
 package/x11r7/xapp_xrandr/xapp_xrandr.mk   | 4 ++--
 2 files changed, 5 insertions(+), 7 deletions(-)

diff --git a/package/x11r7/xapp_xrandr/xapp_xrandr.hash b/package/x11r7/xapp_xrandr/xapp_xrandr.hash
index 4c68dcbb71..a407326bb8 100644
--- a/package/x11r7/xapp_xrandr/xapp_xrandr.hash
+++ b/package/x11r7/xapp_xrandr/xapp_xrandr.hash
@@ -1,7 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2019-August/003018.html
-md5  fe40f7a4fd39dd3a02248d3e0b1972e4  xrandr-1.5.1.tar.xz
-sha1  9f72957e0d2a26ece509336ea7e1529cc9ea881e  xrandr-1.5.1.tar.xz
-sha256  7bc76daf9d72f8aff885efad04ce06b90488a1a169d118dea8a2b661832e8762  xrandr-1.5.1.tar.xz
-sha512  3d0d37e974b9dffb996276ee7fd676327fd0956e5f5f572dd142a651a35d3cdfa2f6dd415cf27bf87f306981957aba4cc014c12baebefcabaa5d66b78a114922  xrandr-1.5.1.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2022-December/003270.html
+sha256  c8bee4790d9058bacc4b6246456c58021db58a87ddda1a9d0139bf5f18f1f240  xrandr-1.5.2.tar.xz
+sha512  b536e8f1e04094894aa52ae496725c58691b043860b3327c41d737b07b642a939733321b62f698032b11ba857208a6177600a3ca3295ff1be6ade4341cdc2747  xrandr-1.5.2.tar.xz
 # Locally computed
 sha256  0dd9a3d62c48dd7b87790029e39fb5e11756d33fded3bc1644e11585c87b2038  COPYING
diff --git a/package/x11r7/xapp_xrandr/xapp_xrandr.mk b/package/x11r7/xapp_xrandr/xapp_xrandr.mk
index 8586c6feb3..d6b39b51d0 100644
--- a/package/x11r7/xapp_xrandr/xapp_xrandr.mk
+++ b/package/x11r7/xapp_xrandr/xapp_xrandr.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-XAPP_XRANDR_VERSION = 1.5.1
+XAPP_XRANDR_VERSION = 1.5.2
 XAPP_XRANDR_SOURCE = xrandr-$(XAPP_XRANDR_VERSION).tar.xz
-XAPP_XRANDR_SITE = http://xorg.freedesktop.org/releases/individual/app
+XAPP_XRANDR_SITE = https://xorg.freedesktop.org/archive/individual/app
 XAPP_XRANDR_LICENSE = MIT
 XAPP_XRANDR_LICENSE_FILES = COPYING
 XAPP_XRANDR_DEPENDENCIES = xlib_libXrandr xlib_libX11
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
