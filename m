Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02DB1C3ABC9
	for <buildroot@archiver.kernel.org>; Fri, 16 May 2025 10:58:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C946941A1C;
	Fri, 16 May 2025 10:58:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c4or_FpzdchM; Fri, 16 May 2025 10:58:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E04D941A19
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E04D941A19;
	Fri, 16 May 2025 10:58:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6CE1E1C7
 for <buildroot@buildroot.org>; Fri, 16 May 2025 10:57:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 683B583C8C
 for <buildroot@buildroot.org>; Fri, 16 May 2025 10:57:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 35BdySeI2n4r for <buildroot@buildroot.org>;
 Fri, 16 May 2025 10:57:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5C8D883C8D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5C8D883C8D
 for <buildroot@buildroot.org>; Fri, 16 May 2025 10:57:58 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4CB5586A40; Fri, 16 May 2025 10:57:58 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Fri, 16 May 2025 12:49:35 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 15c91ed9b5161fb81daaa8e94df7856baff085e1
X-Git-Newrev: 20246264e5ef8a20a1cc0f2b223854ff8517f225
X-Patchwork-Hint: ignore
Message-Id: <20250516105758.4CB5586A40@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/freescale-imx/imx-gpu-g2d: bump
 version to 6.4.11.p3.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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
Content-Type: multipart/mixed; boundary="===============6687284840243459320=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6687284840243459320==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=20246264e5ef8a20a1cc0f2b223854ff8517f225
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This version is aligned with NXP Linux BSP version "lf-6.12.3-1.0.0".

License hashes changed because the LA_OPT_NXP_Software_License changed
from "v57 July 2024" to "v58 November 2024".

Signed-off-by: Sébastien Szymanski <sebastien.szymanski@armadeus.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/freescale-imx/imx-gpu-g2d/imx-gpu-g2d.hash | 8 ++++----
 package/freescale-imx/imx-gpu-g2d/imx-gpu-g2d.mk   | 6 +++---
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/package/freescale-imx/imx-gpu-g2d/imx-gpu-g2d.hash b/package/freescale-imx/imx-gpu-g2d/imx-gpu-g2d.hash
index f040e00f68..4bd83090a8 100644
--- a/package/freescale-imx/imx-gpu-g2d/imx-gpu-g2d.hash
+++ b/package/freescale-imx/imx-gpu-g2d/imx-gpu-g2d.hash
@@ -1,6 +1,6 @@
 # Locally calculated
-sha256  780479f19142126ed58e12222b80f8f3b882ad3d223ff61b7ea02001f517ff03  imx-gpu-g2d-6.4.11.p2.10-aarch64-accdd64.bin
-sha256  cd4fd05dd6f6880edc3255c85fe08094a07ea4cd3eee947df004dcb8f37bc8fa  imx-gpu-g2d-6.4.11.p2.10-arm-accdd64.bin
-sha256  601fa790c5b4d03579bd182fb4d65a6f329a32faf49db22f98e4608221e861f7  COPYING
-sha256  c3d9a7b2a5a7db5da690e9c1081b98b665802c3efbbba7fb237339395a92f607  EULA
+sha256  e6c336c0b876efab7598a2d7817111772284487f646d5d83c400692f2cdfebe3  imx-gpu-g2d-6.4.11.p3.0-aarch64-c600d03.bin
+sha256  6e1a42f2c570582b8038d1b5c86dbdcd645e75cc10a1db23e716f662d1c1329f  imx-gpu-g2d-6.4.11.p3.0-arm-c600d03.bin
+sha256  3f4a12c82a84bd1c3578c9c986d6371a61d3399525e76288ecbbae01daf0ae26  COPYING
+sha256  38f1408d6e935c564efd9119c313269e643c1a85cab1d930c3c5bd70bc261769  EULA
 sha256  3f3b817ca9490fbe89a83395a0961122aca138bf43acd869c6ca086502a1e131  SCR-imx-gpu-g2d.txt
diff --git a/package/freescale-imx/imx-gpu-g2d/imx-gpu-g2d.mk b/package/freescale-imx/imx-gpu-g2d/imx-gpu-g2d.mk
index 3d67d22f67..4d29974db1 100644
--- a/package/freescale-imx/imx-gpu-g2d/imx-gpu-g2d.mk
+++ b/package/freescale-imx/imx-gpu-g2d/imx-gpu-g2d.mk
@@ -4,11 +4,11 @@
 #
 ################################################################################
 
-IMX_GPU_G2D_REVISION = accdd64
+IMX_GPU_G2D_REVISION = c600d03
 ifeq ($(BR2_aarch64),y)
-IMX_GPU_G2D_VERSION = 6.4.11.p2.10-aarch64
+IMX_GPU_G2D_VERSION = 6.4.11.p3.0-aarch64
 else
-IMX_GPU_G2D_VERSION = 6.4.11.p2.10-arm
+IMX_GPU_G2D_VERSION = 6.4.11.p3.0-arm
 endif
 IMX_GPU_G2D_SITE = $(FREESCALE_IMX_SITE)
 IMX_GPU_G2D_SOURCE = imx-gpu-g2d-$(IMX_GPU_G2D_VERSION)-$(IMX_GPU_G2D_REVISION).bin

--===============6687284840243459320==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6687284840243459320==--
