Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 914C3C77B7D
	for <buildroot@archiver.kernel.org>; Sat, 13 May 2023 12:38:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 132CC843C0;
	Sat, 13 May 2023 12:38:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 132CC843C0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id msiM349GHgFx; Sat, 13 May 2023 12:38:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 337E984485;
	Sat, 13 May 2023 12:38:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 337E984485
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A3E481BF86B
 for <buildroot@lists.busybox.net>; Sat, 13 May 2023 12:37:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7CA0B60BE2
 for <buildroot@lists.busybox.net>; Sat, 13 May 2023 12:37:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7CA0B60BE2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fvABGwiIKvaY for <buildroot@lists.busybox.net>;
 Sat, 13 May 2023 12:37:46 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id BBA4160BDC
 for <buildroot@buildroot.org>; Sat, 13 May 2023 12:37:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BBA4160BDC
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A717F864CC; Sat, 13 May 2023 12:37:46 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 13 May 2023 14:37:20 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1ae13888bb5b4f603109ede2e053def8937510aa
X-Git-Newrev: f93574a2925ecf97e998d36d2595b73a68135777
X-Patchwork-Hint: ignore
Message-Id: <20230513123746.A717F864CC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/freescale-imx/imx-gpu-viv: bump to
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

commit: https://git.buildroot.net/buildroot/commit/?id=f93574a2925ecf97e998d36d2595b73a68135777
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Same version as NXP release 6.1.1-1.0.0 [1]
- EULA/COPYING: update to LA_OPT_NXP_Software_License v42
- Requires toolchain with glibc 2.34+

[1]
https://github.com/nxp-imx/meta-imx/tree/langdale-6.1.1-1.0.0/meta-bsp/recipes-graphics/imx-gpu-viv

Signed-off-by: Gary Bisson <bisson.gary@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/freescale-imx/imx-gpu-viv/imx-gpu-viv.hash | 8 ++++----
 package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk   | 4 ++--
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.hash b/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.hash
index a0e6345b7a..8f5708898d 100644
--- a/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.hash
+++ b/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  5b9dd02cb2dfa564903872576cd6586fbf4a02abdb8e180978bd84205ab302a7  imx-gpu-viv-6.4.3.p4.4-aarch32.bin
-sha256  5c52bd15146c24d449638c6276c07103949c8efbc53d002518541bc37c57e424  imx-gpu-viv-6.4.3.p4.4-aarch64.bin
-sha256  5bd7aab9dc380a6f9577443b2e90bd5ca73d9528175fad04b6d17da43a05a48e  COPYING
-sha256  654f0c4ce6d08f9a6d74e29c58206742cb7469a6a7c25413028a9bdbe647aa13  EULA
+sha256  6e2f3fb43d16c30fd0b23027f5205818e9d4c74d4903f1c63f265ccf8269f01d  imx-gpu-viv-6.4.11.p1.0-aarch32.bin
+sha256  4a5f2235500dc4bdfaaeaffa0e4c13cdd28436cc0d859e5be222bce990fda461  imx-gpu-viv-6.4.11.p1.0-aarch64.bin
+sha256  e17419ff1c87b5754282227f651745bd7b3986aed983e2d494505828022db4a8  COPYING
+sha256  eff6daec54c4f86eb4682eeecd3dd24ffe90398c9460c2e573dd4141bcd28652  EULA
diff --git a/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk b/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk
index f72735e093..57a6a90d6d 100644
--- a/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk
+++ b/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk
@@ -5,9 +5,9 @@
 ################################################################################
 
 ifeq ($(BR2_aarch64),y)
-IMX_GPU_VIV_VERSION = 6.4.3.p4.4-aarch64
+IMX_GPU_VIV_VERSION = 6.4.11.p1.0-aarch64
 else
-IMX_GPU_VIV_VERSION = 6.4.3.p4.4-aarch32
+IMX_GPU_VIV_VERSION = 6.4.11.p1.0-aarch32
 endif
 IMX_GPU_VIV_SITE = $(FREESCALE_IMX_SITE)
 IMX_GPU_VIV_SOURCE = imx-gpu-viv-$(IMX_GPU_VIV_VERSION).bin
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
