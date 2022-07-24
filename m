Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DD78C433EF
	for <buildroot@archiver.kernel.org>; Sun, 24 Jul 2022 19:55:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B33B6417B2;
	Sun, 24 Jul 2022 19:55:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B33B6417B2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id N3dh9DujaxO5; Sun, 24 Jul 2022 19:55:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5AC674177F;
	Sun, 24 Jul 2022 19:55:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5AC674177F
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E6F6A1BF95E
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 19:55:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CB55C60FC8
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 19:55:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CB55C60FC8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fPbVL0h0288w for <buildroot@lists.busybox.net>;
 Sun, 24 Jul 2022 19:55:31 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id BA0B560BE0
 for <buildroot@buildroot.org>; Sun, 24 Jul 2022 19:55:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BA0B560BE0
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id E1E7085CBF; Sun, 24 Jul 2022 19:41:51 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sun, 24 Jul 2022 21:44:17 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 71cc3992598a30a8de584853ec1a2332d005cd49
X-Git-Newrev: 1f3b3e61e9f7f618602003dc4a98660edb94095f
X-Patchwork-Hint: ignore
Message-Id: <20220724194151.E1E7085CBF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/x11r7/xapp_xclipboard: bump
 version to 1.1.4
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

commit: https://git.buildroot.net/buildroot/commit/?id=1f3b3e61e9f7f618602003dc4a98660edb94095f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/x11r7/xapp_xclipboard/xapp_xclipboard.hash | 5 +++--
 package/x11r7/xapp_xclipboard/xapp_xclipboard.mk   | 6 +++---
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/package/x11r7/xapp_xclipboard/xapp_xclipboard.hash b/package/x11r7/xapp_xclipboard/xapp_xclipboard.hash
index ef45b92891..d848a47342 100644
--- a/package/x11r7/xapp_xclipboard/xapp_xclipboard.hash
+++ b/package/x11r7/xapp_xclipboard/xapp_xclipboard.hash
@@ -1,4 +1,5 @@
-# From http://lists.x.org/archives/xorg-announce/2013-September/002299.html
-sha256  9c0e0a1f4f1d49f73c6cf3ccd27b5ca0e18afc63679f1a1ee466b1d82446ebb5  xclipboard-1.1.3.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2022-July/003171.html
+sha256  f43d4560d1464e8ff58e850212f6bdb703989b66d599fb61f351b5f9e077f253  xclipboard-1.1.4.tar.xz
+sha512  efa7800e0c4fb0242362c4263d80182d591bded07d1064a36b157b6202b15b0c82f083658ced2b82392eca905fb57c04a537d67e75c1237a1667ed2ce0cb09fe  xclipboard-1.1.4.tar.xz
 # Locally computed
 sha256  f0a362fc1b8e788845b1c0ad7ba9ade58fdfb73da750c3b9780db5d70b947657  COPYING
diff --git a/package/x11r7/xapp_xclipboard/xapp_xclipboard.mk b/package/x11r7/xapp_xclipboard/xapp_xclipboard.mk
index d77ac98621..c76d5ded3c 100644
--- a/package/x11r7/xapp_xclipboard/xapp_xclipboard.mk
+++ b/package/x11r7/xapp_xclipboard/xapp_xclipboard.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-XAPP_XCLIPBOARD_VERSION = 1.1.3
-XAPP_XCLIPBOARD_SOURCE = xclipboard-$(XAPP_XCLIPBOARD_VERSION).tar.bz2
-XAPP_XCLIPBOARD_SITE = http://xorg.freedesktop.org/releases/individual/app
+XAPP_XCLIPBOARD_VERSION = 1.1.4
+XAPP_XCLIPBOARD_SOURCE = xclipboard-$(XAPP_XCLIPBOARD_VERSION).tar.xz
+XAPP_XCLIPBOARD_SITE = https://xorg.freedesktop.org/releases/individual/app
 XAPP_XCLIPBOARD_LICENSE = MIT
 XAPP_XCLIPBOARD_LICENSE_FILES = COPYING
 XAPP_XCLIPBOARD_DEPENDENCIES = xlib_libXaw xlib_libXmu xlib_libXt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
