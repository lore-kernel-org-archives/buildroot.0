Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A61A7C282EC
	for <buildroot@archiver.kernel.org>; Tue, 18 Mar 2025 15:04:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6A5D383323;
	Tue, 18 Mar 2025 15:04:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id APKG6S1ydyBo; Tue, 18 Mar 2025 15:04:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B962B832E7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B962B832E7;
	Tue, 18 Mar 2025 15:04:29 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id B4B36D5
 for <buildroot@buildroot.org>; Tue, 18 Mar 2025 15:02:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CEB8040BB0
 for <buildroot@buildroot.org>; Tue, 18 Mar 2025 15:02:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WFklaq73IHTl for <buildroot@buildroot.org>;
 Tue, 18 Mar 2025 15:02:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 741F0408B6
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 741F0408B6
 for <buildroot@buildroot.org>; Tue, 18 Mar 2025 15:02:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 70C38880ED; Tue, 18 Mar 2025 15:02:42 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sat, 1 Mar 2025 11:32:45 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f3350d1af2cfca8f48756843e964168b5bb7718e
X-Git-Newrev: fe08ec9efa6ec9a2506f7e3ffcb83c14b96b55ec
X-Patchwork-Hint: ignore
Message-Id: <20250318150242.70C38880ED@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/freescale-imx/imx-vpu-hantro-vc:
 bump version to 1.10.1
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
Content-Type: multipart/mixed; boundary="===============8070163252069263706=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8070163252069263706==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=fe08ec9efa6ec9a2506f7e3ffcb83c14b96b55ec
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This version is aligned with NXP Linux BSP version "lf-6.6.52-2.2.0".

License hashes changed because the LA_OPT_NXP_Software_License changed
from "v48 July 2023" to "v57 July 2024".
Add SCR-imx-vpu-hantro.txt to _LICENSE_FILES.

Note: in this release, the package source archive name changed to
include a revision. This commit adds a new _REVISION variable with the
value published in the corresponding NXP BSP.

Signed-off-by: Sébastien Szymanski <sebastien.szymanski@armadeus.com>
[Julien: fixed the bsp version name in commit log]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/freescale-imx/imx-vpu-hantro-vc/imx-vpu-hantro-vc.hash | 7 ++++---
 package/freescale-imx/imx-vpu-hantro-vc/imx-vpu-hantro-vc.mk   | 7 ++++---
 2 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/package/freescale-imx/imx-vpu-hantro-vc/imx-vpu-hantro-vc.hash b/package/freescale-imx/imx-vpu-hantro-vc/imx-vpu-hantro-vc.hash
index 7f6193e397..1b1447c34e 100644
--- a/package/freescale-imx/imx-vpu-hantro-vc/imx-vpu-hantro-vc.hash
+++ b/package/freescale-imx/imx-vpu-hantro-vc/imx-vpu-hantro-vc.hash
@@ -1,4 +1,5 @@
 # Locally computed:
-sha256  84fcefa0619def2f009ca6651c5cffcda57fed29cd7060ef68be48c5d0d7814b  imx-vpu-hantro-vc-1.9.1.bin
-sha256  de37a0bcbf1717b910c1a53ea6eab853c404e61e8143bb6c081d39f532571e54  COPYING
-sha256  b158adaac5e2d1c7fa6e739ff168ab498957e3303070f1c0b0e66d9a8f02a354  EULA
+sha256  713ba375f25490727fcc62bab5d5508f74de03204b4c153464b696b652c5c7df  imx-vpu-hantro-vc-1.10.1-c0244a1.bin
+sha256  601fa790c5b4d03579bd182fb4d65a6f329a32faf49db22f98e4608221e861f7  COPYING
+sha256  c3d9a7b2a5a7db5da690e9c1081b98b665802c3efbbba7fb237339395a92f607  EULA
+sha256  a6f0297ad8ab4906229957c2c7c4bf825d543d99ffb5bdafc2de5a8d884eb88b  SCR.txt
diff --git a/package/freescale-imx/imx-vpu-hantro-vc/imx-vpu-hantro-vc.mk b/package/freescale-imx/imx-vpu-hantro-vc/imx-vpu-hantro-vc.mk
index de88ebf32c..b28e61bd8a 100644
--- a/package/freescale-imx/imx-vpu-hantro-vc/imx-vpu-hantro-vc.mk
+++ b/package/freescale-imx/imx-vpu-hantro-vc/imx-vpu-hantro-vc.mk
@@ -4,14 +4,15 @@
 #
 ################################################################################
 
-IMX_VPU_HANTRO_VC_VERSION = 1.9.1
+IMX_VPU_HANTRO_VC_VERSION = 1.10.1
+IMX_VPU_HANTRO_VC_REVISION = c0244a1
 IMX_VPU_HANTRO_VC_SITE = $(FREESCALE_IMX_SITE)
-IMX_VPU_HANTRO_VC_SOURCE = imx-vpu-hantro-vc-$(IMX_VPU_HANTRO_VC_VERSION).bin
+IMX_VPU_HANTRO_VC_SOURCE = imx-vpu-hantro-vc-$(IMX_VPU_HANTRO_VC_VERSION)-$(IMX_VPU_HANTRO_VC_REVISION).bin
 IMX_VPU_HANTRO_VC_DEPENDENCIES = linux
 IMX_VPU_HANTRO_VC_INSTALL_STAGING = YES
 
 IMX_VPU_HANTRO_VC_LICENSE = NXP Semiconductor Software License Agreement
-IMX_VPU_HANTRO_VC_LICENSE_FILES = EULA COPYING
+IMX_VPU_HANTRO_VC_LICENSE_FILES = EULA COPYING SCR.txt
 IMX_VPU_HANTRO_VC_REDISTRIBUTE = NO
 
 define IMX_VPU_HANTRO_VC_EXTRACT_CMDS

--===============8070163252069263706==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8070163252069263706==--
