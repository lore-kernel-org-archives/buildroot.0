Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EB7BC4332F
	for <buildroot@archiver.kernel.org>; Sun, 18 Dec 2022 13:49:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2AB0F60B2D;
	Sun, 18 Dec 2022 13:49:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2AB0F60B2D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9o70MgB8bJE2; Sun, 18 Dec 2022 13:49:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5C3C060687;
	Sun, 18 Dec 2022 13:49:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5C3C060687
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BF5471BF853
 for <buildroot@lists.busybox.net>; Sun, 18 Dec 2022 13:49:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9BA69605D8
 for <buildroot@lists.busybox.net>; Sun, 18 Dec 2022 13:49:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9BA69605D8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id q-u4oiUUGUeq for <buildroot@lists.busybox.net>;
 Sun, 18 Dec 2022 13:49:18 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id D15C9605D6
 for <buildroot@buildroot.org>; Sun, 18 Dec 2022 13:49:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D15C9605D6
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BF5CD8680C; Sun, 18 Dec 2022 13:49:18 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 18 Dec 2022 14:48:27 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 30bc9e5aef772432a9c2753296d89984e0097159
X-Git-Newrev: b9c948df185f61131133d9d8a8cc39beae0ad299
X-Patchwork-Hint: ignore
Message-Id: <20221218134918.BF5CD8680C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/x11r7/xlib_libXft: bump version to
 2.3.7
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

commit: https://git.buildroot.net/buildroot/commit/?id=b9c948df185f61131133d9d8a8cc39beae0ad299
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes:
https://lists.x.org/archives/xorg/2022-November/061175.html

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/x11r7/xlib_libXft/xlib_libXft.hash | 6 +++---
 package/x11r7/xlib_libXft/xlib_libXft.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/x11r7/xlib_libXft/xlib_libXft.hash b/package/x11r7/xlib_libXft/xlib_libXft.hash
index 484764be3d..5074365aed 100644
--- a/package/x11r7/xlib_libXft/xlib_libXft.hash
+++ b/package/x11r7/xlib_libXft/xlib_libXft.hash
@@ -1,5 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2022-September/003211.html
-sha256  60a6e7319fc938bbb8d098c9bcc86031cc2327b5d086d3335fc5c76323c03022  libXft-2.3.6.tar.xz
-sha512  732f8c635fcac6010012ba8c10c23d2dd6ec79b0f096d6bcc9b7e36d2ca0817387faa7ee5bb6f43cff02adc68e4234c1b8f95021ebc548f61c492e0b76836d90  libXft-2.3.6.tar.xz
+# From https://lists.x.org/archives/xorg/2022-November/061175.html
+sha256  79f0b37c45007381c371a790c2754644ad955166dbf2a48e3625032e9bdd4f71  libXft-2.3.7.tar.xz
+sha512  9df29d3c7b88a21952df1015604511e5d79856d721b2a61eb2c5a062a9abccf16318132432a7c86c0ef816bf174ae86842fa67dabbaa0b163dfa56d99022de19  libXft-2.3.7.tar.xz
 # Locally computed
 sha256  7cda22286b1379b9b73df695f72cbad36595e65b039a5fbc5c89b69ecc44438c  COPYING
diff --git a/package/x11r7/xlib_libXft/xlib_libXft.mk b/package/x11r7/xlib_libXft/xlib_libXft.mk
index a86501900c..845b612669 100644
--- a/package/x11r7/xlib_libXft/xlib_libXft.mk
+++ b/package/x11r7/xlib_libXft/xlib_libXft.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XLIB_LIBXFT_VERSION = 2.3.6
+XLIB_LIBXFT_VERSION = 2.3.7
 XLIB_LIBXFT_SOURCE = libXft-$(XLIB_LIBXFT_VERSION).tar.xz
 XLIB_LIBXFT_SITE = https://xorg.freedesktop.org/archive/individual/lib
 XLIB_LIBXFT_LICENSE = MIT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
