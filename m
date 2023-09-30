Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DDE8E77375
	for <buildroot@archiver.kernel.org>; Sat, 30 Sep 2023 14:24:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AAC07831A5;
	Sat, 30 Sep 2023 14:24:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AAC07831A5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XcSm96uYvfzh; Sat, 30 Sep 2023 14:24:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D480682341;
	Sat, 30 Sep 2023 14:24:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D480682341
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 035631BF2A3
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 14:24:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E07CE40635
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 14:24:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E07CE40635
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wKvsvhPRio-q for <buildroot@lists.busybox.net>;
 Sat, 30 Sep 2023 14:24:17 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 01AE5400E4
 for <buildroot@buildroot.org>; Sat, 30 Sep 2023 14:24:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 01AE5400E4
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E26B283A33; Sat, 30 Sep 2023 14:24:16 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 30 Sep 2023 16:24:05 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5e2810fba6e18525d999909060f28aad5bafbf40
X-Git-Newrev: 47fbc4559043cc6e5470dacf80a94468269f4169
X-Patchwork-Hint: ignore
Message-Id: <20230930142416.E26B283A33@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/kmod: bump to version 31
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

commit: https://git.buildroot.net/buildroot/commit/?id=47fbc4559043cc6e5470dacf80a94468269f4169
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/kmod/kmod.hash | 2 +-
 package/kmod/kmod.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/kmod/kmod.hash b/package/kmod/kmod.hash
index b181f73e9b..f4b01b20a2 100644
--- a/package/kmod/kmod.hash
+++ b/package/kmod/kmod.hash
@@ -1,5 +1,5 @@
 # From https://www.kernel.org/pub/linux/utils/kernel/kmod/sha256sums.asc
-sha256  f897dd72698dc6ac1ef03255cd0a5734ad932318e4adbaebc7338ef2f5202f9f  kmod-30.tar.xz
+sha256  f5a6949043cc72c001b728d8c218609c5a15f3c33d75614b78c79418fcf00d80  kmod-31.tar.xz
 
 # Locally calculated
 sha256  6095e9ffa777dd22839f7801aa845b31c9ed07f3d6bf8a26dc5d2dec8ccc0ef3  libkmod/COPYING
diff --git a/package/kmod/kmod.mk b/package/kmod/kmod.mk
index 5d6d4408f9..dae84611fe 100644
--- a/package/kmod/kmod.mk
+++ b/package/kmod/kmod.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KMOD_VERSION = 30
+KMOD_VERSION = 31
 KMOD_SOURCE = kmod-$(KMOD_VERSION).tar.xz
 KMOD_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/kernel/kmod
 KMOD_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
