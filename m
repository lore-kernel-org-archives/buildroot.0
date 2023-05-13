Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2290EC77B7C
	for <buildroot@archiver.kernel.org>; Sat, 13 May 2023 12:38:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9914784485;
	Sat, 13 May 2023 12:38:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9914784485
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zfwNQ8eod8Em; Sat, 13 May 2023 12:38:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B864D843C0;
	Sat, 13 May 2023 12:38:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B864D843C0
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B1B201BF86C
 for <buildroot@lists.busybox.net>; Sat, 13 May 2023 12:37:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8C000409A5
 for <buildroot@lists.busybox.net>; Sat, 13 May 2023 12:37:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8C000409A5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DMRuo4JD-4HM for <buildroot@lists.busybox.net>;
 Sat, 13 May 2023 12:37:46 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id C619B408F1
 for <buildroot@buildroot.org>; Sat, 13 May 2023 12:37:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C619B408F1
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B22E0864CD; Sat, 13 May 2023 12:37:46 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 13 May 2023 14:37:26 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f93574a2925ecf97e998d36d2595b73a68135777
X-Git-Newrev: 05566ff3a389473d05610f51114fc1a1fb1a268d
X-Patchwork-Hint: ignore
Message-Id: <20230513123746.B22E0864CD@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/freescale-imx/imx-gpu-g2d: bump to
 version 6.4.11.p1.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=05566ff3a389473d05610f51114fc1a1fb1a268d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Same version as NXP release 6.1.1-1.0.0 [1]
- EULA/COPYING: update to LA_OPT_NXP_Software_License v42
- Requires toolchain with glibc 2.34+

[1]
https://github.com/nxp-imx/meta-imx/tree/langdale-6.1.1-1.0.0/meta-bsp/recipes-graphics/imx-g2d

Signed-off-by: Gary Bisson <bisson.gary@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/freescale-imx/imx-gpu-g2d/imx-gpu-g2d.hash | 8 ++++----
 package/freescale-imx/imx-gpu-g2d/imx-gpu-g2d.mk   | 4 ++--
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/freescale-imx/imx-gpu-g2d/imx-gpu-g2d.hash b/package/freescale-imx/imx-gpu-g2d/imx-gpu-g2d.hash
index 27f6a438d1..8bb6a6fe32 100644
--- a/package/freescale-imx/imx-gpu-g2d/imx-gpu-g2d.hash
+++ b/package/freescale-imx/imx-gpu-g2d/imx-gpu-g2d.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  7737a3372bcde34e2d275397df67c307df5033d5b133ac770f75cac4e1ec2580  imx-gpu-g2d-6.4.3.p4.4-arm.bin
-sha256  8341d6e2cde3f3ffa035dc95b0487dd04a50531cc80f4cddc5a689ebc4946e02  imx-gpu-g2d-6.4.3.p4.4-aarch64.bin
-sha256  5bd7aab9dc380a6f9577443b2e90bd5ca73d9528175fad04b6d17da43a05a48e  COPYING
-sha256  654f0c4ce6d08f9a6d74e29c58206742cb7469a6a7c25413028a9bdbe647aa13  EULA
+sha256  65427c12b43c7bb3838ec2bc91a5853c310652b920a65b2b52bacad8e761a8e4  imx-gpu-g2d-6.4.11.p1.0-arm.bin
+sha256  9bf8ebbfc85245d75ab7d133c3e135a4c5f23a0430c75883af9700e9cb82c151  imx-gpu-g2d-6.4.11.p1.0-aarch64.bin
+sha256  e17419ff1c87b5754282227f651745bd7b3986aed983e2d494505828022db4a8  COPYING
+sha256  eff6daec54c4f86eb4682eeecd3dd24ffe90398c9460c2e573dd4141bcd28652  EULA
diff --git a/package/freescale-imx/imx-gpu-g2d/imx-gpu-g2d.mk b/package/freescale-imx/imx-gpu-g2d/imx-gpu-g2d.mk
index 42a1fe70cf..a93c51cba3 100644
--- a/package/freescale-imx/imx-gpu-g2d/imx-gpu-g2d.mk
+++ b/package/freescale-imx/imx-gpu-g2d/imx-gpu-g2d.mk
@@ -5,9 +5,9 @@
 ################################################################################
 
 ifeq ($(BR2_aarch64),y)
-IMX_GPU_G2D_VERSION = 6.4.3.p4.4-aarch64
+IMX_GPU_G2D_VERSION = 6.4.11.p1.0-aarch64
 else
-IMX_GPU_G2D_VERSION = 6.4.3.p4.4-arm
+IMX_GPU_G2D_VERSION = 6.4.11.p1.0-arm
 endif
 IMX_GPU_G2D_SITE = $(FREESCALE_IMX_SITE)
 IMX_GPU_G2D_SOURCE = imx-gpu-g2d-$(IMX_GPU_G2D_VERSION).bin
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
