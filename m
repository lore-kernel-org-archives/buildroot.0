Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26DE0E77377
	for <buildroot@archiver.kernel.org>; Sat, 30 Sep 2023 16:06:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C92E6421E6;
	Sat, 30 Sep 2023 16:06:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C92E6421E6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XRK7YSJiZyDF; Sat, 30 Sep 2023 16:06:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4A617428CF;
	Sat, 30 Sep 2023 16:06:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4A617428CF
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 131FB1BF3B0
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 16:05:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DEEE340B22
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 16:05:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DEEE340B22
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id c6CGKoSkD3Y7 for <buildroot@lists.busybox.net>;
 Sat, 30 Sep 2023 16:05:21 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5B4FB4017A
 for <buildroot@buildroot.org>; Sat, 30 Sep 2023 16:05:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5B4FB4017A
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4630A83BC9; Sat, 30 Sep 2023 16:05:21 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 30 Sep 2023 18:01:43 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 02fb588dd8bb9c885fd1b611c9e15ac3cfb465f1
X-Git-Newrev: 2a6889499d019a35243983c460397ecaad35bcce
X-Patchwork-Hint: ignore
Message-Id: <20230930160521.4630A83BC9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/freescale-imx/imx-gpu-viv: bump to
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

commit: https://git.buildroot.net/buildroot/commit/?id=2a6889499d019a35243983c460397ecaad35bcce
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- To match NXP 6.1.22-2.0.0 release.
- EULA/COPYING: update to LA_OPT_NXP_Software_License v45.

Signed-off-by: Chris Dimich <cdimich2188@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/freescale-imx/imx-gpu-viv/imx-gpu-viv.hash | 8 ++++----
 package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk   | 4 ++--
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.hash b/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.hash
index 8f5708898d..a380e1b712 100644
--- a/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.hash
+++ b/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  6e2f3fb43d16c30fd0b23027f5205818e9d4c74d4903f1c63f265ccf8269f01d  imx-gpu-viv-6.4.11.p1.0-aarch32.bin
-sha256  4a5f2235500dc4bdfaaeaffa0e4c13cdd28436cc0d859e5be222bce990fda461  imx-gpu-viv-6.4.11.p1.0-aarch64.bin
-sha256  e17419ff1c87b5754282227f651745bd7b3986aed983e2d494505828022db4a8  COPYING
-sha256  eff6daec54c4f86eb4682eeecd3dd24ffe90398c9460c2e573dd4141bcd28652  EULA
+sha256  491ac012d691e27856769296e2334ad1b6f45e31ffe7313fcdb028c75b3b69ae  imx-gpu-viv-6.4.11.p1.2-aarch32-1e0c396.bin
+sha256  d5904cbbe33a3c1160e9cd15c44d78df25d0dbd7b251add796673af53d3046f6  imx-gpu-viv-6.4.11.p1.2-aarch64-1e0c396.bin
+sha256  913ba38d4be97361c3d0fa9bf2f6dbe7b1c0c41213dd268fb6738db9704dbe32  COPYING
+sha256  4fd8bb45a2ec22117d20cfea84370e2a3a2cd99e8e177138bed0938137b1aeb3  EULA
diff --git a/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk b/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk
index 57a6a90d6d..5a13419e3e 100644
--- a/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk
+++ b/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk
@@ -5,9 +5,9 @@
 ################################################################################
 
 ifeq ($(BR2_aarch64),y)
-IMX_GPU_VIV_VERSION = 6.4.11.p1.0-aarch64
+IMX_GPU_VIV_VERSION = 6.4.11.p1.2-aarch64-1e0c396
 else
-IMX_GPU_VIV_VERSION = 6.4.11.p1.0-aarch32
+IMX_GPU_VIV_VERSION = 6.4.11.p1.2-aarch32-1e0c396
 endif
 IMX_GPU_VIV_SITE = $(FREESCALE_IMX_SITE)
 IMX_GPU_VIV_SOURCE = imx-gpu-viv-$(IMX_GPU_VIV_VERSION).bin
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
