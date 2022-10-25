Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24919FA373E
	for <buildroot@archiver.kernel.org>; Tue, 25 Oct 2022 21:00:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B467981076;
	Tue, 25 Oct 2022 21:00:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B467981076
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 13BXCYM4HLth; Tue, 25 Oct 2022 21:00:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 75AFF80BDE;
	Tue, 25 Oct 2022 21:00:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 75AFF80BDE
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id EFA5F1BF977
 for <buildroot@lists.busybox.net>; Tue, 25 Oct 2022 21:00:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CA2BC40265
 for <buildroot@lists.busybox.net>; Tue, 25 Oct 2022 21:00:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CA2BC40265
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id F6ic7MJE7Pef for <buildroot@lists.busybox.net>;
 Tue, 25 Oct 2022 21:00:22 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id C854440264
 for <buildroot@buildroot.org>; Tue, 25 Oct 2022 21:00:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C854440264
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B761B870A6; Tue, 25 Oct 2022 21:00:22 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 25 Oct 2022 22:59:15 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 13a8417f0de1649ebb51fcd2e02862310b7b3d43
X-Git-Newrev: 0861fed2f0ede61f45c7279028f7341519343913
X-Patchwork-Hint: ignore
Message-Id: <20221025210022.B761B870A6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/kmod: bump to version 30
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=0861fed2f0ede61f45c7279028f7341519343913
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/kmod/kmod.hash | 2 +-
 package/kmod/kmod.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/kmod/kmod.hash b/package/kmod/kmod.hash
index c68e41f1b6..b181f73e9b 100644
--- a/package/kmod/kmod.hash
+++ b/package/kmod/kmod.hash
@@ -1,5 +1,5 @@
 # From https://www.kernel.org/pub/linux/utils/kernel/kmod/sha256sums.asc
-sha256  0b80eea7aa184ac6fd20cafa2a1fdf290ffecc70869a797079e2cc5c6225a52a  kmod-29.tar.xz
+sha256  f897dd72698dc6ac1ef03255cd0a5734ad932318e4adbaebc7338ef2f5202f9f  kmod-30.tar.xz
 
 # Locally calculated
 sha256  6095e9ffa777dd22839f7801aa845b31c9ed07f3d6bf8a26dc5d2dec8ccc0ef3  libkmod/COPYING
diff --git a/package/kmod/kmod.mk b/package/kmod/kmod.mk
index 82e8597759..5d6d4408f9 100644
--- a/package/kmod/kmod.mk
+++ b/package/kmod/kmod.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KMOD_VERSION = 29
+KMOD_VERSION = 30
 KMOD_SOURCE = kmod-$(KMOD_VERSION).tar.xz
 KMOD_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/kernel/kmod
 KMOD_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
