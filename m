Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57CA4C2BD09
	for <buildroot@archiver.kernel.org>; Fri, 12 Jul 2024 09:39:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4357B412D4;
	Fri, 12 Jul 2024 09:39:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vu74PypQuSPw; Fri, 12 Jul 2024 09:39:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DC233412F1
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DC233412F1;
	Fri, 12 Jul 2024 09:39:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 47CE31BF995
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 09:39:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4156040B5B
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 09:39:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fN9J1xSUoHOf for <buildroot@lists.busybox.net>;
 Fri, 12 Jul 2024 09:39:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 12D1940B37
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 12D1940B37
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 09:39:05 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id F1F8F85CC6; Fri, 12 Jul 2024 09:39:04 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 12 Jul 2024 11:09:26 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9e50b643ad9a3afb7d2201faef7ac6385e5c3c52
X-Git-Newrev: f69f957f289fc715ab913629212448d3799dd168
X-Patchwork-Hint: ignore
Message-Id: <20240712093904.F1F8F85CC6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/freescale-imx/imx-vpu-hantro-vc:
 bump to version 1.9.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=f69f957f289fc715ab913629212448d3799dd168
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- To match NXP 6.1.55-2.2.0 release.
- EULA/COPYING: update to LA_OPT_NXP_Software_License v49.

Signed-off-by: Chris Dimich <cdimich2188@gmail.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/freescale-imx/imx-vpu-hantro-vc/imx-vpu-hantro-vc.hash | 6 +++---
 package/freescale-imx/imx-vpu-hantro-vc/imx-vpu-hantro-vc.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/freescale-imx/imx-vpu-hantro-vc/imx-vpu-hantro-vc.hash b/package/freescale-imx/imx-vpu-hantro-vc/imx-vpu-hantro-vc.hash
index bd9bc37c1f..7f6193e397 100644
--- a/package/freescale-imx/imx-vpu-hantro-vc/imx-vpu-hantro-vc.hash
+++ b/package/freescale-imx/imx-vpu-hantro-vc/imx-vpu-hantro-vc.hash
@@ -1,4 +1,4 @@
 # Locally computed:
-sha256  62b5ba3c4aab21d0d4be3eee9b204a9bb50b83b6140ee1a3b27c648809bdfbaa  imx-vpu-hantro-vc-1.9.0.bin
-sha256  5bd7aab9dc380a6f9577443b2e90bd5ca73d9528175fad04b6d17da43a05a48e  COPYING
-sha256  654f0c4ce6d08f9a6d74e29c58206742cb7469a6a7c25413028a9bdbe647aa13  EULA
+sha256  84fcefa0619def2f009ca6651c5cffcda57fed29cd7060ef68be48c5d0d7814b  imx-vpu-hantro-vc-1.9.1.bin
+sha256  de37a0bcbf1717b910c1a53ea6eab853c404e61e8143bb6c081d39f532571e54  COPYING
+sha256  b158adaac5e2d1c7fa6e739ff168ab498957e3303070f1c0b0e66d9a8f02a354  EULA
diff --git a/package/freescale-imx/imx-vpu-hantro-vc/imx-vpu-hantro-vc.mk b/package/freescale-imx/imx-vpu-hantro-vc/imx-vpu-hantro-vc.mk
index 3d266fb5bd..de88ebf32c 100644
--- a/package/freescale-imx/imx-vpu-hantro-vc/imx-vpu-hantro-vc.mk
+++ b/package/freescale-imx/imx-vpu-hantro-vc/imx-vpu-hantro-vc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IMX_VPU_HANTRO_VC_VERSION = 1.9.0
+IMX_VPU_HANTRO_VC_VERSION = 1.9.1
 IMX_VPU_HANTRO_VC_SITE = $(FREESCALE_IMX_SITE)
 IMX_VPU_HANTRO_VC_SOURCE = imx-vpu-hantro-vc-$(IMX_VPU_HANTRO_VC_VERSION).bin
 IMX_VPU_HANTRO_VC_DEPENDENCIES = linux
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
