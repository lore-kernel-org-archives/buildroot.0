Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB4BDC433FE
	for <buildroot@archiver.kernel.org>; Wed, 23 Nov 2022 21:58:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7BAC780D44;
	Wed, 23 Nov 2022 21:58:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7BAC780D44
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id v_UundNaF7fY; Wed, 23 Nov 2022 21:58:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C78A480D18;
	Wed, 23 Nov 2022 21:58:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C78A480D18
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C879F1BF964
 for <buildroot@lists.busybox.net>; Wed, 23 Nov 2022 21:57:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AF85C418D6
 for <buildroot@lists.busybox.net>; Wed, 23 Nov 2022 21:57:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AF85C418D6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id M-hSl6cjB3u1 for <buildroot@lists.busybox.net>;
 Wed, 23 Nov 2022 21:57:51 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9891B41717
 for <buildroot@buildroot.org>; Wed, 23 Nov 2022 21:57:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9891B41717
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8319A84447; Wed, 23 Nov 2022 21:57:51 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 23 Nov 2022 22:51:27 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 6bab22ca418f4f1ecde53c178ee301c7dfaab44a
X-Git-Newrev: 76e153273416a83574d78eb25b39ba2a47846a02
X-Patchwork-Hint: ignore
Message-Id: <20221123215751.8319A84447@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next]
 package/freescale-imx/kernel-module-imx-gpu-viv: bump to version 6.4.3.p4.4
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

commit: https://git.buildroot.net/buildroot/commit/?id=76e153273416a83574d78eb25b39ba2a47846a02
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

- To match NXP 5.15.52-2.1.0 release.

Signed-off-by: Chris Dimich <chris.dimich@boundarydevices.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../kernel-module-imx-gpu-viv/kernel-module-imx-gpu-viv.hash          | 4 ++--
 .../kernel-module-imx-gpu-viv/kernel-module-imx-gpu-viv.mk            | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/freescale-imx/kernel-module-imx-gpu-viv/kernel-module-imx-gpu-viv.hash b/package/freescale-imx/kernel-module-imx-gpu-viv/kernel-module-imx-gpu-viv.hash
index ccb28bc4f6..5079de9840 100644
--- a/package/freescale-imx/kernel-module-imx-gpu-viv/kernel-module-imx-gpu-viv.hash
+++ b/package/freescale-imx/kernel-module-imx-gpu-viv/kernel-module-imx-gpu-viv.hash
@@ -1,3 +1,3 @@
 # locally computed
-sha256  b816ab94b1d248cfc5fe5f6381422346c273d01760bb324303e0298e10bd46e2  kernel-module-imx-gpu-viv-82c6cb6c607424403b8d76805bb17e7be74292f6.tar.gz
-sha256  b499eddebda05a8859e32b820a64577d91f1de2b52efa2a1575a2cb4000bc259  COPYING
+sha256  0754114b3088a46b9fee9a5bd1c7b9ec94b6ca656ed930c4cad9e04382e8e372  kernel-module-imx-gpu-viv-00fe5a0bedc07337c873f93998da9025083116ed.tar.gz
+sha256  0754114b3088a46b9fee9a5bd1c7b9ec94b6ca656ed930c4cad9e04382e8e372  COPYING
diff --git a/package/freescale-imx/kernel-module-imx-gpu-viv/kernel-module-imx-gpu-viv.mk b/package/freescale-imx/kernel-module-imx-gpu-viv/kernel-module-imx-gpu-viv.mk
index d301494a0b..5c96ba0390 100644
--- a/package/freescale-imx/kernel-module-imx-gpu-viv/kernel-module-imx-gpu-viv.mk
+++ b/package/freescale-imx/kernel-module-imx-gpu-viv/kernel-module-imx-gpu-viv.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KERNEL_MODULE_IMX_GPU_VIV_VERSION = 82c6cb6c607424403b8d76805bb17e7be74292f6
+KERNEL_MODULE_IMX_GPU_VIV_VERSION = 00fe5a0bedc07337c873f93998da9025083116ed
 KERNEL_MODULE_IMX_GPU_VIV_SITE = \
 	$(call github,Freescale,kernel-module-imx-gpu-viv,$(KERNEL_MODULE_IMX_GPU_VIV_VERSION))
 KERNEL_MODULE_IMX_GPU_VIV_LICENSE = GPL-2.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
