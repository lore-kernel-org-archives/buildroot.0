Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03596C2BD09
	for <buildroot@archiver.kernel.org>; Fri, 12 Jul 2024 07:16:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BF56941471;
	Fri, 12 Jul 2024 07:16:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jGMv0iwR0xtv; Fri, 12 Jul 2024 07:16:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8BB5441488
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8BB5441488;
	Fri, 12 Jul 2024 07:16:09 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 463291BF995
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 07:15:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EC04B40568
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 07:15:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kHUcdt0KYvsx for <buildroot@lists.busybox.net>;
 Fri, 12 Jul 2024 07:15:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F2E38409A6
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id F2E38409A6
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 07:15:36 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E0816857AA; Fri, 12 Jul 2024 07:15:36 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 12 Jul 2024 09:14:35 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: be95c350c210a85143a7a3194b081181cc0f626e
X-Git-Newrev: a5c1a9980679c1c9ea8d1287082cf6359bbeb770
X-Patchwork-Hint: ignore
Message-Id: <20240712071536.E0816857AA@busybox.osuosl.org>
Subject: [Buildroot] [git commit]
 package/freescale-imx/kernel-module-imx-gpu-viv: bump to version
 6.4.11.p.2.2
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=a5c1a9980679c1c9ea8d1287082cf6359bbeb770
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- To match NXP 6.1.55-2.2.0 release.

Signed-off-by: Chris Dimich <cdimich2188@gmail.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 .../kernel-module-imx-gpu-viv/kernel-module-imx-gpu-viv.hash            | 2 +-
 .../kernel-module-imx-gpu-viv/kernel-module-imx-gpu-viv.mk              | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/freescale-imx/kernel-module-imx-gpu-viv/kernel-module-imx-gpu-viv.hash b/package/freescale-imx/kernel-module-imx-gpu-viv/kernel-module-imx-gpu-viv.hash
index 1411c8d3ef..1a1e89b95a 100644
--- a/package/freescale-imx/kernel-module-imx-gpu-viv/kernel-module-imx-gpu-viv.hash
+++ b/package/freescale-imx/kernel-module-imx-gpu-viv/kernel-module-imx-gpu-viv.hash
@@ -1,3 +1,3 @@
 # locally computed
-sha256  ce32d7f9e16daa0ac87a41bd6da2f96743cd5b28b7bc324ca642e985a29a4e48  kernel-module-imx-gpu-viv-1e65746bb15628ccbe88e3ee7a0a1d2becc48e79.tar.gz
+sha256  b174a79042266b5d36c03f7db12036c93acd546f996367dd33233581e64857bb  kernel-module-imx-gpu-viv-4d035200e7b15d2713d49979a1d05f201b92cf4c.tar.gz
 sha256  b499eddebda05a8859e32b820a64577d91f1de2b52efa2a1575a2cb4000bc259  COPYING
diff --git a/package/freescale-imx/kernel-module-imx-gpu-viv/kernel-module-imx-gpu-viv.mk b/package/freescale-imx/kernel-module-imx-gpu-viv/kernel-module-imx-gpu-viv.mk
index 13df35dcc0..d87f575064 100644
--- a/package/freescale-imx/kernel-module-imx-gpu-viv/kernel-module-imx-gpu-viv.mk
+++ b/package/freescale-imx/kernel-module-imx-gpu-viv/kernel-module-imx-gpu-viv.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KERNEL_MODULE_IMX_GPU_VIV_VERSION = 1e65746bb15628ccbe88e3ee7a0a1d2becc48e79
+KERNEL_MODULE_IMX_GPU_VIV_VERSION = 4d035200e7b15d2713d49979a1d05f201b92cf4c
 KERNEL_MODULE_IMX_GPU_VIV_SITE = \
 	$(call github,Freescale,kernel-module-imx-gpu-viv,$(KERNEL_MODULE_IMX_GPU_VIV_VERSION))
 KERNEL_MODULE_IMX_GPU_VIV_LICENSE = GPL-2.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
