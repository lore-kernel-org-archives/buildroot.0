Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C332DC4167D
	for <buildroot@archiver.kernel.org>; Wed, 23 Nov 2022 21:58:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5242340C50;
	Wed, 23 Nov 2022 21:58:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5242340C50
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id u4j3e0wPTRkR; Wed, 23 Nov 2022 21:58:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 637EA404DD;
	Wed, 23 Nov 2022 21:58:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 637EA404DD
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id ED3961BF2F7
 for <buildroot@lists.busybox.net>; Wed, 23 Nov 2022 21:57:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 88BD581EE8
 for <buildroot@lists.busybox.net>; Wed, 23 Nov 2022 21:57:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 88BD581EE8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zrSFrqWJpSiM for <buildroot@lists.busybox.net>;
 Wed, 23 Nov 2022 21:57:51 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id BB4F6820C0
 for <buildroot@buildroot.org>; Wed, 23 Nov 2022 21:57:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BB4F6820C0
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A77268444F; Wed, 23 Nov 2022 21:57:51 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 23 Nov 2022 22:52:02 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: b84557b588b3519b8cbe4856669d33fca1c56f7c
X-Git-Newrev: 43f6ae0de3220118ec6520b421b39c580396720d
X-Patchwork-Hint: ignore
Message-Id: <20221123215751.A77268444F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next]
 package/freescale-imx/imx-vpu-hantro-vc: bump version to 1.9.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=43f6ae0de3220118ec6520b421b39c580396720d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

- To match NXP 5.15.52-2.1.0 release.
- EULA/COPYING: update to LA_OPT_NXP_Software_License v39.

Signed-off-by: Chris Dimich <chris.dimich@boundarydevices.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/freescale-imx/imx-vpu-hantro-vc/imx-vpu-hantro-vc.hash | 6 +++---
 package/freescale-imx/imx-vpu-hantro-vc/imx-vpu-hantro-vc.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/freescale-imx/imx-vpu-hantro-vc/imx-vpu-hantro-vc.hash b/package/freescale-imx/imx-vpu-hantro-vc/imx-vpu-hantro-vc.hash
index aadf5b121f..bd9bc37c1f 100644
--- a/package/freescale-imx/imx-vpu-hantro-vc/imx-vpu-hantro-vc.hash
+++ b/package/freescale-imx/imx-vpu-hantro-vc/imx-vpu-hantro-vc.hash
@@ -1,4 +1,4 @@
 # Locally computed:
-sha256  d5efae484c4271c098286d007590d6bf40c272d4f35702ff65625f2362715ab3  imx-vpu-hantro-vc-1.4.0.bin
-sha256  ea58636bf34f589048fcd46e38497c47229fde8498df086ff5fb52f9ef8e15ee  COPYING
-sha256  50099e283cfd307f84f159aeb1a6f462351320273dbcdb80d7f2c9db0494b71c  EULA
+sha256  62b5ba3c4aab21d0d4be3eee9b204a9bb50b83b6140ee1a3b27c648809bdfbaa  imx-vpu-hantro-vc-1.9.0.bin
+sha256  5bd7aab9dc380a6f9577443b2e90bd5ca73d9528175fad04b6d17da43a05a48e  COPYING
+sha256  654f0c4ce6d08f9a6d74e29c58206742cb7469a6a7c25413028a9bdbe647aa13  EULA
diff --git a/package/freescale-imx/imx-vpu-hantro-vc/imx-vpu-hantro-vc.mk b/package/freescale-imx/imx-vpu-hantro-vc/imx-vpu-hantro-vc.mk
index 5f4c6faee4..1f033c1434 100644
--- a/package/freescale-imx/imx-vpu-hantro-vc/imx-vpu-hantro-vc.mk
+++ b/package/freescale-imx/imx-vpu-hantro-vc/imx-vpu-hantro-vc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IMX_VPU_HANTRO_VC_VERSION = 1.4.0
+IMX_VPU_HANTRO_VC_VERSION = 1.9.0
 IMX_VPU_HANTRO_VC_SITE = $(FREESCALE_IMX_SITE)
 IMX_VPU_HANTRO_VC_SOURCE = imx-vpu-hantro-vc-$(IMX_VPU_HANTRO_VC_VERSION).bin
 IMX_VPU_HANTRO_VC_DEPENDENCIES = linux
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
