Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89DE6C43334
	for <buildroot@archiver.kernel.org>; Sun, 24 Jul 2022 19:55:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F1FC96104A;
	Sun, 24 Jul 2022 19:55:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F1FC96104A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2ZBNRiSJuC6n; Sun, 24 Jul 2022 19:55:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id F265160C0F;
	Sun, 24 Jul 2022 19:55:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F265160C0F
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DCD501BF20B
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 19:55:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B9AE983F1B
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 19:55:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B9AE983F1B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LLNoDFy0bzXJ for <buildroot@lists.busybox.net>;
 Sun, 24 Jul 2022 19:55:32 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0B07683EE2
 for <buildroot@buildroot.org>; Sun, 24 Jul 2022 19:55:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0B07683EE2
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 4BB2985CBF; Sun, 24 Jul 2022 19:41:52 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sun, 24 Jul 2022 21:44:43 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d3f2b732f189850e6bd6fd1472f1a6e134e60cad
X-Git-Newrev: db4b759dfc3a9f404861e112f216e30ff65ba9d9
X-Patchwork-Hint: ignore
Message-Id: <20220724194152.4BB2985CBF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/x11r7/xapp_xev: bump version to
 1.2.5
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

commit: https://git.buildroot.net/buildroot/commit/?id=db4b759dfc3a9f404861e112f216e30ff65ba9d9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/x11r7/xapp_xev/xapp_xev.hash | 6 +++---
 package/x11r7/xapp_xev/xapp_xev.mk   | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/x11r7/xapp_xev/xapp_xev.hash b/package/x11r7/xapp_xev/xapp_xev.hash
index 8b9a006c46..9449781360 100644
--- a/package/x11r7/xapp_xev/xapp_xev.hash
+++ b/package/x11r7/xapp_xev/xapp_xev.hash
@@ -1,5 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2020-July/003048.html
-sha256  d700e08bfe751ed2dbf802baa204b056d0e49348b6eb3c6f9cb035d8ae4885e2  xev-1.2.4.tar.bz2
-sha512  383472ddbfad639ba46a69080ecdd11a514a0578fd32c463fae18da02e0265c944589eebf12a858994f5fd601c02a0d51517e9b3ff61c6afe740d374f02781ca  xev-1.2.4.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2022-July/003185.html
+sha256  c9461a4389714e0f33974f9e75934bdc38d836a0f059b8dc089c7cbf2ce36ec1  xev-1.2.5.tar.xz
+sha512  9fbfb78c9547974c2256a678948bf4a694a40b1c2bd5c5dec5f365a713e6d938c6039f055a9629f49de27f02f3d7cb912f07c035df129798a4b2ddc20febe66a  xev-1.2.5.tar.xz
 # Locally computed
 sha256  9b840f2e1900889124cc999f3158da2b6b07bf6d0d77bdbb01ce65d2e702dc83  COPYING
diff --git a/package/x11r7/xapp_xev/xapp_xev.mk b/package/x11r7/xapp_xev/xapp_xev.mk
index 7d5f3cbb82..0f29a731e7 100644
--- a/package/x11r7/xapp_xev/xapp_xev.mk
+++ b/package/x11r7/xapp_xev/xapp_xev.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-XAPP_XEV_VERSION = 1.2.4
-XAPP_XEV_SOURCE = xev-$(XAPP_XEV_VERSION).tar.bz2
-XAPP_XEV_SITE = http://xorg.freedesktop.org/releases/individual/app
+XAPP_XEV_VERSION = 1.2.5
+XAPP_XEV_SOURCE = xev-$(XAPP_XEV_VERSION).tar.xz
+XAPP_XEV_SITE = https://xorg.freedesktop.org/releases/individual/app
 XAPP_XEV_LICENSE = MIT
 XAPP_XEV_LICENSE_FILES = COPYING
 XAPP_XEV_DEPENDENCIES = xlib_libX11 xlib_libXrandr
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
