Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35832C43334
	for <buildroot@archiver.kernel.org>; Sun, 24 Jul 2022 19:58:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DE1D881444;
	Sun, 24 Jul 2022 19:58:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DE1D881444
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0LOYxHtk3wKJ; Sun, 24 Jul 2022 19:58:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DCE7381403;
	Sun, 24 Jul 2022 19:58:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DCE7381403
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 25FAE1BF20B
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 19:55:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8B7AB83E65
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 19:55:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8B7AB83E65
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ycVLNNbxwA-z for <buildroot@lists.busybox.net>;
 Sun, 24 Jul 2022 19:55:32 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2056483EE8
 for <buildroot@buildroot.org>; Sun, 24 Jul 2022 19:55:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2056483EE8
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 5DE6785CC8; Sun, 24 Jul 2022 19:41:52 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sun, 24 Jul 2022 21:44:48 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f88469885fca0353db6387acfbf6405b1cd3cde9
X-Git-Newrev: 9c41f778a78af5a91fef223c89d35c9ae5a93309
X-Patchwork-Hint: ignore
Message-Id: <20220724194152.5DE6785CC8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/x11r7/xapp_xmessage: bump version
 to 1.0.6
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

commit: https://git.buildroot.net/buildroot/commit/?id=9c41f778a78af5a91fef223c89d35c9ae5a93309
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/x11r7/xapp_xmessage/xapp_xmessage.hash | 10 ++++------
 package/x11r7/xapp_xmessage/xapp_xmessage.mk   |  6 +++---
 2 files changed, 7 insertions(+), 9 deletions(-)

diff --git a/package/x11r7/xapp_xmessage/xapp_xmessage.hash b/package/x11r7/xapp_xmessage/xapp_xmessage.hash
index b668edf6a1..350739284f 100644
--- a/package/x11r7/xapp_xmessage/xapp_xmessage.hash
+++ b/package/x11r7/xapp_xmessage/xapp_xmessage.hash
@@ -1,7 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2018-March/002868.html
-md5 e50ffae17eeb3943079620cb78f5ce0b  xmessage-1.0.5.tar.bz2
-sha1 d3eca72c7173d0d9547c676a16bcec51ca1213a2  xmessage-1.0.5.tar.bz2
-sha256 373dfb81e7a6f06d3d22485a12fcde6e255d58c6dee1bbaeb00c7d0caa9b2029  xmessage-1.0.5.tar.bz2
-sha512 a8423c3986b1576fa67800c315a605a527bb9a8f594ac269a736ae7b91eed0d4d83deb89148197dc3cd3f0e51894146958ce2979f78e97dcdb99c5326e34dabe  xmessage-1.0.5.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2022-July/003187.html
+sha256  d2eac545f137156b960877e052fcc8e29795ed735c02f7690fd7b439e6846a12  xmessage-1.0.6.tar.xz
+sha512  89deb7a81bd047027f99cb92cd16a47f94479c61a6f9fbac4638e6d642037b3e9bbac2313db59ac8c5544175947c693f6a210537c6df2b88dc3de1c67498cba8  xmessage-1.0.6.tar.xz
 # Locally computed
-sha256 dfd5427188bd6d6647ad1a9a0644428403c6239f6aa7f9d1a17629d8cc0a4ecd COPYING
+sha256  dfd5427188bd6d6647ad1a9a0644428403c6239f6aa7f9d1a17629d8cc0a4ecd COPYING
diff --git a/package/x11r7/xapp_xmessage/xapp_xmessage.mk b/package/x11r7/xapp_xmessage/xapp_xmessage.mk
index 9d426974bd..52a9f32631 100644
--- a/package/x11r7/xapp_xmessage/xapp_xmessage.mk
+++ b/package/x11r7/xapp_xmessage/xapp_xmessage.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-XAPP_XMESSAGE_VERSION = 1.0.5
-XAPP_XMESSAGE_SOURCE = xmessage-$(XAPP_XMESSAGE_VERSION).tar.bz2
-XAPP_XMESSAGE_SITE = http://xorg.freedesktop.org/releases/individual/app
+XAPP_XMESSAGE_VERSION = 1.0.6
+XAPP_XMESSAGE_SOURCE = xmessage-$(XAPP_XMESSAGE_VERSION).tar.xz
+XAPP_XMESSAGE_SITE = https://xorg.freedesktop.org/releases/individual/app
 XAPP_XMESSAGE_LICENSE = MIT
 XAPP_XMESSAGE_LICENSE_FILES = COPYING
 XAPP_XMESSAGE_DEPENDENCIES = xlib_libXaw
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
