Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E30D5C3DA4A
	for <buildroot@archiver.kernel.org>; Sat,  3 Aug 2024 20:37:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6092580893;
	Sat,  3 Aug 2024 20:37:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PhwquHj773t6; Sat,  3 Aug 2024 20:37:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5517980D80
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5517980D80;
	Sat,  3 Aug 2024 20:37:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D405B1BF35D
 for <buildroot@lists.busybox.net>; Sat,  3 Aug 2024 20:37:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C1A65401ED
 for <buildroot@lists.busybox.net>; Sat,  3 Aug 2024 20:37:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zIUcFi4HCnJr for <buildroot@lists.busybox.net>;
 Sat,  3 Aug 2024 20:37:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BAC8B400DD
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id BAC8B400DD
 for <buildroot@buildroot.org>; Sat,  3 Aug 2024 20:37:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B075783DAE; Sat,  3 Aug 2024 20:37:52 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 3 Aug 2024 22:35:17 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 32effe39f8260fc145f6f965482d082580716307
X-Git-Newrev: dda750dcddda3a609c6c070141638886174f2c19
X-Patchwork-Hint: ignore
Message-Id: <20240803203752.B075783DAE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/freescale-imx/imx-gpu-viv: bump to
 version 6.4.11.p2.6
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

commit: https://git.buildroot.net/buildroot/commit/?id=dda750dcddda3a609c6c070141638886174f2c19
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This version is aligned to the NXP BSP lf-6.6.23-2.0.0. See [1].

License hashes changed because the LA_OPT_NXP_Software_License changed
from "v49 September 2023" to "v56 April 2024".

[1] https://github.com/nxp-imx/meta-imx/blob/rel_imx_6.6.23_2.0.0/meta-imx-bsp/recipes-graphics/imx-gpu-viv/imx-gpu-viv_6.4.11.p2.6-aarch64.bb

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/freescale-imx/imx-gpu-viv/imx-gpu-viv.hash | 8 ++++----
 package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk   | 4 ++--
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.hash b/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.hash
index b350443a51..cce08e2727 100644
--- a/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.hash
+++ b/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  15efe6da5d4bac2a6067c2a898190be8754df6f14128c3db4756cff59c6da049  imx-gpu-viv-6.4.11.p2.2-aarch32-fd0148d.bin
-sha256  6e34f3718925ba37c362cd09a3228cc56d03cfad323ebae0932f64449dbaeb2e  imx-gpu-viv-6.4.11.p2.2-aarch64-fd0148d.bin
-sha256  24d7cb3a7e51011466a149bd99acf89387b832be2d0890ce2e183dfbc9d7cb84  COPYING
-sha256  3282d88fad766897f93b0827297a70c2707d9358db24cccd5777abf7c997da77  EULA
+sha256  cf6e42c9c9a903cd933b767d411131390d237a4b92ecad579db57d54538707f3  imx-gpu-viv-6.4.11.p2.6-aarch32-bc7b6a2.bin
+sha256  5fe828113b9b2801b3fd60cd15eadfd0ac747e5897ef7db7fa22f80e7dd8a8e1  imx-gpu-viv-6.4.11.p2.6-aarch64-bc7b6a2.bin
+sha256  c9ee518510d72e254d62743f5098163eacdb6428c6ba4d8119afe2d12edba068  COPYING
+sha256  165f6c0eacb4d3a05289dfb79331c9a2c05207eb7a67ef28a117f246a0145428  EULA
diff --git a/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk b/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk
index 3cfbfe3ccc..a559bb7478 100644
--- a/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk
+++ b/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk
@@ -5,9 +5,9 @@
 ################################################################################
 
 ifeq ($(BR2_aarch64),y)
-IMX_GPU_VIV_VERSION = 6.4.11.p2.2-aarch64-fd0148d
+IMX_GPU_VIV_VERSION = 6.4.11.p2.6-aarch64-bc7b6a2
 else
-IMX_GPU_VIV_VERSION = 6.4.11.p2.2-aarch32-fd0148d
+IMX_GPU_VIV_VERSION = 6.4.11.p2.6-aarch32-bc7b6a2
 endif
 IMX_GPU_VIV_SITE = $(FREESCALE_IMX_SITE)
 IMX_GPU_VIV_SOURCE = imx-gpu-viv-$(IMX_GPU_VIV_VERSION).bin
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
