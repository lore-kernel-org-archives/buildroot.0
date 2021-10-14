Return-Path: <SRS0=enEc=PC=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09792C433F5
	for <buildroot@archiver.kernel.org>; Thu, 14 Oct 2021 21:42:47 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B28DD6105A
	for <buildroot@archiver.kernel.org>; Thu, 14 Oct 2021 21:42:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B28DD6105A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 822A560755;
	Thu, 14 Oct 2021 21:42:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wFTTeVjxu4cV; Thu, 14 Oct 2021 21:42:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E8992606FF;
	Thu, 14 Oct 2021 21:42:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id BA24E1BF576
 for <buildroot@lists.busybox.net>; Thu, 14 Oct 2021 21:42:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A90CD405BE
 for <buildroot@lists.busybox.net>; Thu, 14 Oct 2021 21:42:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GbffKzkC4TMJ for <buildroot@lists.busybox.net>;
 Thu, 14 Oct 2021 21:42:41 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id EB4C140581
 for <buildroot@buildroot.org>; Thu, 14 Oct 2021 21:42:41 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id B49CB94EB7; Thu, 14 Oct 2021 21:39:46 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Thu, 14 Oct 2021 23:12:37 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d1c0d89df1e16d43af0651360b68948a8d40be26
X-Git-Newrev: 0eb61e6ee3f37dd727d91590e16da2ab4308fc5f
X-Patchwork-Hint: ignore
Message-Id: <20211014213946.B49CB94EB7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/kmod: bump to version 29
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

commit: https://git.buildroot.net/buildroot/commit/?id=0eb61e6ee3f37dd727d91590e16da2ab4308fc5f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Adam Duskett <aduskett@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/kmod/kmod.hash | 2 +-
 package/kmod/kmod.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/kmod/kmod.hash b/package/kmod/kmod.hash
index f0bd436dc8..c68e41f1b6 100644
--- a/package/kmod/kmod.hash
+++ b/package/kmod/kmod.hash
@@ -1,5 +1,5 @@
 # From https://www.kernel.org/pub/linux/utils/kernel/kmod/sha256sums.asc
-sha256  3969fc0f13daa98084256337081c442f8749310089e48aa695c9b4dfe1b3a26c  kmod-28.tar.xz
+sha256  0b80eea7aa184ac6fd20cafa2a1fdf290ffecc70869a797079e2cc5c6225a52a  kmod-29.tar.xz
 
 # Locally calculated
 sha256  6095e9ffa777dd22839f7801aa845b31c9ed07f3d6bf8a26dc5d2dec8ccc0ef3  libkmod/COPYING
diff --git a/package/kmod/kmod.mk b/package/kmod/kmod.mk
index 7c5d200b0f..c7f510ec0f 100644
--- a/package/kmod/kmod.mk
+++ b/package/kmod/kmod.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KMOD_VERSION = 28
+KMOD_VERSION = 29
 KMOD_SOURCE = kmod-$(KMOD_VERSION).tar.xz
 KMOD_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/kernel/kmod
 KMOD_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
