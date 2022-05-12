Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31FCBC433EF
	for <buildroot@archiver.kernel.org>; Thu, 12 May 2022 19:52:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D250140242;
	Thu, 12 May 2022 19:52:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wS3NrU7K5HHF; Thu, 12 May 2022 19:52:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id ECC54403AE;
	Thu, 12 May 2022 19:52:20 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4113B1C1189
 for <buildroot@lists.busybox.net>; Thu, 12 May 2022 19:51:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2F39560B3A
 for <buildroot@lists.busybox.net>; Thu, 12 May 2022 19:51:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RbdZqXSQ0Iga for <buildroot@lists.busybox.net>;
 Thu, 12 May 2022 19:51:53 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 76A0260598
 for <buildroot@buildroot.org>; Thu, 12 May 2022 19:51:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id B998E85C6F; Thu, 12 May 2022 19:41:00 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Thu, 12 May 2022 21:49:27 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3769bae1fa2c6849708100d5d84670d44f585cc7
X-Git-Newrev: 4fbc30632d7aa8548cbb5ca581b78dde883b2708
X-Patchwork-Hint: ignore
Message-Id: <20220512194100.B998E85C6F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/x11r7/xapp_xcalc: bump version to
 1.1.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=4fbc30632d7aa8548cbb5ca581b78dde883b2708
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes:
https://lists.x.org/archives/xorg-announce/2022-April/003138.html

Removed md5 and sha1 hashes, not provided by upstream anymore.
Reformatted license hash.
Switched tarball to upstream-provided .xz format.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/x11r7/xapp_xcalc/xapp_xcalc.hash | 10 ++++------
 package/x11r7/xapp_xcalc/xapp_xcalc.mk   |  4 ++--
 2 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/package/x11r7/xapp_xcalc/xapp_xcalc.hash b/package/x11r7/xapp_xcalc/xapp_xcalc.hash
index d7fac37ea6..0580253dd6 100644
--- a/package/x11r7/xapp_xcalc/xapp_xcalc.hash
+++ b/package/x11r7/xapp_xcalc/xapp_xcalc.hash
@@ -1,7 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2019-June/002996.html
-md5 3b566e47c76356cecaa71eb431767ae1  xcalc-1.1.0.tar.bz2
-sha1 0537f7ee56558cf80133c6b49c4757c1166aaeb6  xcalc-1.1.0.tar.bz2
-sha256 d5d746954465afc3da1f355d721882806568fb04b4d059c027702c0d16a3b5eb  xcalc-1.1.0.tar.bz2
-sha512 877aab7bb08f409a21c26b841f4d91eb6993914ed0d26512e47d6b3d2b3e0b231158901415a106cfb45de43f03f253bf2a8733f986538d4ee810afe0e54f98d5  xcalc-1.1.0.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2022-April/003138.html
+sha256  8cb08212c5322e8043f39b28699e13a43f000976c90b3c7fadd4fae2766326b4  xcalc-1.1.1.tar.xz
+sha512  a261e9798d62727f40b9aff07e68e63ba40aa7f4f9b1811d8efd8c3e73cd5912d6178c55ca3c059968191051bd20b889b06b5e92b3df70c7b5d09bd013b9ebdb  xcalc-1.1.1.tar.xz
 # Locally computed
-sha256 8dd69dbec37866a41d3040c5c478aca46e0b50c30319f178064d5e2ed9d3f912  COPYING
+sha256  8dd69dbec37866a41d3040c5c478aca46e0b50c30319f178064d5e2ed9d3f912  COPYING
diff --git a/package/x11r7/xapp_xcalc/xapp_xcalc.mk b/package/x11r7/xapp_xcalc/xapp_xcalc.mk
index b917d9e98e..849746ece3 100644
--- a/package/x11r7/xapp_xcalc/xapp_xcalc.mk
+++ b/package/x11r7/xapp_xcalc/xapp_xcalc.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-XAPP_XCALC_VERSION = 1.1.0
-XAPP_XCALC_SOURCE = xcalc-$(XAPP_XCALC_VERSION).tar.bz2
+XAPP_XCALC_VERSION = 1.1.1
+XAPP_XCALC_SOURCE = xcalc-$(XAPP_XCALC_VERSION).tar.xz
 XAPP_XCALC_SITE = https://xorg.freedesktop.org/releases/individual/app
 XAPP_XCALC_LICENSE = MIT
 XAPP_XCALC_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
