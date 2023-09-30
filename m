Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCD70E77377
	for <buildroot@archiver.kernel.org>; Sat, 30 Sep 2023 16:05:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 86CBA41B4A;
	Sat, 30 Sep 2023 16:05:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 86CBA41B4A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YJrHydxK4OnC; Sat, 30 Sep 2023 16:05:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5ACB041869;
	Sat, 30 Sep 2023 16:05:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5ACB041869
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4D8041BF3B0
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 16:05:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3325E81F97
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 16:05:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3325E81F97
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jtLDObXhjEl4 for <buildroot@lists.busybox.net>;
 Sat, 30 Sep 2023 16:05:21 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 636E181E9D
 for <buildroot@buildroot.org>; Sat, 30 Sep 2023 16:05:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 636E181E9D
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4F46083BCA; Sat, 30 Sep 2023 16:05:21 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 30 Sep 2023 18:02:10 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2a6889499d019a35243983c460397ecaad35bcce
X-Git-Newrev: 6335c6782a2a2f5f142341f9e319eaeb406abe77
X-Patchwork-Hint: ignore
Message-Id: <20230930160521.4F46083BCA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/freescale-imx/imx-gpu-g2d: bump to
 version 6.4.11.p1.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=6335c6782a2a2f5f142341f9e319eaeb406abe77
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- To match NXP 6.1.22-2.0.0 release.
- EULA/COPYING: update to LA_OPT_NXP_Software_License v45.

Signed-off-by: Chris Dimich <cdimich2188@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/freescale-imx/imx-gpu-g2d/imx-gpu-g2d.hash | 8 ++++----
 package/freescale-imx/imx-gpu-g2d/imx-gpu-g2d.mk   | 4 ++--
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/freescale-imx/imx-gpu-g2d/imx-gpu-g2d.hash b/package/freescale-imx/imx-gpu-g2d/imx-gpu-g2d.hash
index 8bb6a6fe32..580b31e453 100644
--- a/package/freescale-imx/imx-gpu-g2d/imx-gpu-g2d.hash
+++ b/package/freescale-imx/imx-gpu-g2d/imx-gpu-g2d.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  65427c12b43c7bb3838ec2bc91a5853c310652b920a65b2b52bacad8e761a8e4  imx-gpu-g2d-6.4.11.p1.0-arm.bin
-sha256  9bf8ebbfc85245d75ab7d133c3e135a4c5f23a0430c75883af9700e9cb82c151  imx-gpu-g2d-6.4.11.p1.0-aarch64.bin
-sha256  e17419ff1c87b5754282227f651745bd7b3986aed983e2d494505828022db4a8  COPYING
-sha256  eff6daec54c4f86eb4682eeecd3dd24ffe90398c9460c2e573dd4141bcd28652  EULA
+sha256  1ed29a4818161198b658ffc428dff7c154c38f5ba48d7358ed9b0be261d72b99  imx-gpu-g2d-6.4.11.p1.2-arm.bin
+sha256  cdf096c9b15c773ad600b24ec8888c1c4a33711c195c655e9411d4b66a992c25  imx-gpu-g2d-6.4.11.p1.2-aarch64.bin
+sha256  913ba38d4be97361c3d0fa9bf2f6dbe7b1c0c41213dd268fb6738db9704dbe32  COPYING
+sha256  4fd8bb45a2ec22117d20cfea84370e2a3a2cd99e8e177138bed0938137b1aeb3  EULA
diff --git a/package/freescale-imx/imx-gpu-g2d/imx-gpu-g2d.mk b/package/freescale-imx/imx-gpu-g2d/imx-gpu-g2d.mk
index a93c51cba3..87fe08ebe3 100644
--- a/package/freescale-imx/imx-gpu-g2d/imx-gpu-g2d.mk
+++ b/package/freescale-imx/imx-gpu-g2d/imx-gpu-g2d.mk
@@ -5,9 +5,9 @@
 ################################################################################
 
 ifeq ($(BR2_aarch64),y)
-IMX_GPU_G2D_VERSION = 6.4.11.p1.0-aarch64
+IMX_GPU_G2D_VERSION = 6.4.11.p1.2-aarch64
 else
-IMX_GPU_G2D_VERSION = 6.4.11.p1.0-arm
+IMX_GPU_G2D_VERSION = 6.4.11.p1.2-arm
 endif
 IMX_GPU_G2D_SITE = $(FREESCALE_IMX_SITE)
 IMX_GPU_G2D_SOURCE = imx-gpu-g2d-$(IMX_GPU_G2D_VERSION).bin
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
