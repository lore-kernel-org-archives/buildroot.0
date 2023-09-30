Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 297F0E77376
	for <buildroot@archiver.kernel.org>; Sat, 30 Sep 2023 16:05:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C828B42442;
	Sat, 30 Sep 2023 16:05:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C828B42442
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uKtJVc0JvdAk; Sat, 30 Sep 2023 16:05:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BA50142403;
	Sat, 30 Sep 2023 16:05:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BA50142403
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 807281BF870
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 16:05:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5887741869
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 16:05:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5887741869
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IaaF0HZq8z-i for <buildroot@lists.busybox.net>;
 Sat, 30 Sep 2023 16:05:21 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 534C241835
 for <buildroot@buildroot.org>; Sat, 30 Sep 2023 16:05:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 534C241835
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3BFE683BC8; Sat, 30 Sep 2023 16:05:21 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 30 Sep 2023 18:01:39 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e36240d2ab7b5e01a9bdc05c47b4a0ebf9540984
X-Git-Newrev: 02fb588dd8bb9c885fd1b611c9e15ac3cfb465f1
X-Patchwork-Hint: ignore
Message-Id: <20230930160521.3BFE683BC8@busybox.osuosl.org>
Subject: [Buildroot] [git commit]
 package/freescale-imx/kernel-module-imx-gpu-viv: bump to version
 6.4.11.p.1.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=02fb588dd8bb9c885fd1b611c9e15ac3cfb465f1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

To match NXP 6.1.22-2.0.0 release.

Signed-off-by: Chris Dimich <cdimich2188@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../kernel-module-imx-gpu-viv/kernel-module-imx-gpu-viv.hash          | 4 ++--
 .../kernel-module-imx-gpu-viv/kernel-module-imx-gpu-viv.mk            | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/freescale-imx/kernel-module-imx-gpu-viv/kernel-module-imx-gpu-viv.hash b/package/freescale-imx/kernel-module-imx-gpu-viv/kernel-module-imx-gpu-viv.hash
index 528a4d4d9d..1411c8d3ef 100644
--- a/package/freescale-imx/kernel-module-imx-gpu-viv/kernel-module-imx-gpu-viv.hash
+++ b/package/freescale-imx/kernel-module-imx-gpu-viv/kernel-module-imx-gpu-viv.hash
@@ -1,3 +1,3 @@
 # locally computed
-sha256  7d5102dfb99172f440e957ea23bb755d99655d179efb348c3f17a4ae387ffd56  kernel-module-imx-gpu-viv-8c864975607cf455c5e95d5313aa00e69f48d32f.tar.gz
-sha256  0754114b3088a46b9fee9a5bd1c7b9ec94b6ca656ed930c4cad9e04382e8e372  COPYING
+sha256  ce32d7f9e16daa0ac87a41bd6da2f96743cd5b28b7bc324ca642e985a29a4e48  kernel-module-imx-gpu-viv-1e65746bb15628ccbe88e3ee7a0a1d2becc48e79.tar.gz
+sha256  b499eddebda05a8859e32b820a64577d91f1de2b52efa2a1575a2cb4000bc259  COPYING
diff --git a/package/freescale-imx/kernel-module-imx-gpu-viv/kernel-module-imx-gpu-viv.mk b/package/freescale-imx/kernel-module-imx-gpu-viv/kernel-module-imx-gpu-viv.mk
index 56724a4a98..13df35dcc0 100644
--- a/package/freescale-imx/kernel-module-imx-gpu-viv/kernel-module-imx-gpu-viv.mk
+++ b/package/freescale-imx/kernel-module-imx-gpu-viv/kernel-module-imx-gpu-viv.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KERNEL_MODULE_IMX_GPU_VIV_VERSION = 8c864975607cf455c5e95d5313aa00e69f48d32f
+KERNEL_MODULE_IMX_GPU_VIV_VERSION = 1e65746bb15628ccbe88e3ee7a0a1d2becc48e79
 KERNEL_MODULE_IMX_GPU_VIV_SITE = \
 	$(call github,Freescale,kernel-module-imx-gpu-viv,$(KERNEL_MODULE_IMX_GPU_VIV_VERSION))
 KERNEL_MODULE_IMX_GPU_VIV_LICENSE = GPL-2.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
