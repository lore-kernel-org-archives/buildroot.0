Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0DF0E77376
	for <buildroot@archiver.kernel.org>; Sat, 30 Sep 2023 16:05:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F3231418A8;
	Sat, 30 Sep 2023 16:05:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F3231418A8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WMq3VbgNnSYj; Sat, 30 Sep 2023 16:05:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 87CF042241;
	Sat, 30 Sep 2023 16:05:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 87CF042241
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5FE071BF86C
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 16:05:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 37CA84158C
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 16:05:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 37CA84158C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id njcJHeTrozHm for <buildroot@lists.busybox.net>;
 Sat, 30 Sep 2023 16:05:21 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6D49140B22
 for <buildroot@buildroot.org>; Sat, 30 Sep 2023 16:05:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6D49140B22
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5848A83BCB; Sat, 30 Sep 2023 16:05:21 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 30 Sep 2023 18:02:14 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6335c6782a2a2f5f142341f9e319eaeb406abe77
X-Git-Newrev: 91a8088555167f8e4084873400d88d4381ea9cbd
X-Patchwork-Hint: ignore
Message-Id: <20230930160521.5848A83BCB@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/freescale-imx/imx-vpu-hantro: bump
 version to 1.29.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=91a8088555167f8e4084873400d88d4381ea9cbd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- To match NXP 6.1.22-2.0.0 release.
- EULA/COPYING: update to LA_OPT_NXP_Software_License v45.

Signed-off-by: Chris Dimich <cdimich2188@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/freescale-imx/imx-vpu-hantro/imx-vpu-hantro.hash | 6 +++---
 package/freescale-imx/imx-vpu-hantro/imx-vpu-hantro.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/freescale-imx/imx-vpu-hantro/imx-vpu-hantro.hash b/package/freescale-imx/imx-vpu-hantro/imx-vpu-hantro.hash
index 637d7898cf..879b82f7bd 100644
--- a/package/freescale-imx/imx-vpu-hantro/imx-vpu-hantro.hash
+++ b/package/freescale-imx/imx-vpu-hantro/imx-vpu-hantro.hash
@@ -1,4 +1,4 @@
 # Locally computed:
-sha256  7e9bcdbd067ce66a1247373cbf088945346feb0027deb61af541ebc1256277c3  imx-vpu-hantro-1.27.0.bin
-sha256  5bd7aab9dc380a6f9577443b2e90bd5ca73d9528175fad04b6d17da43a05a48e  COPYING
-sha256  654f0c4ce6d08f9a6d74e29c58206742cb7469a6a7c25413028a9bdbe647aa13  EULA
+sha256  2fc836e0ca9a5994c6237ee20b91ccc327fb2529a4ea057e4aedbce3326b6c97  imx-vpu-hantro-1.29.0.bin
+sha256  913ba38d4be97361c3d0fa9bf2f6dbe7b1c0c41213dd268fb6738db9704dbe32  COPYING
+sha256  4fd8bb45a2ec22117d20cfea84370e2a3a2cd99e8e177138bed0938137b1aeb3  EULA
diff --git a/package/freescale-imx/imx-vpu-hantro/imx-vpu-hantro.mk b/package/freescale-imx/imx-vpu-hantro/imx-vpu-hantro.mk
index 4cfc8f41ff..0987551c42 100644
--- a/package/freescale-imx/imx-vpu-hantro/imx-vpu-hantro.mk
+++ b/package/freescale-imx/imx-vpu-hantro/imx-vpu-hantro.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IMX_VPU_HANTRO_VERSION = 1.27.0
+IMX_VPU_HANTRO_VERSION = 1.29.0
 IMX_VPU_HANTRO_SITE = $(FREESCALE_IMX_SITE)
 IMX_VPU_HANTRO_SOURCE = imx-vpu-hantro-$(IMX_VPU_HANTRO_VERSION).bin
 IMX_VPU_HANTRO_DEPENDENCIES = linux
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
