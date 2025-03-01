Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30A0AC021B8
	for <buildroot@archiver.kernel.org>; Sat,  1 Mar 2025 12:49:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 07DD07038E;
	Sat,  1 Mar 2025 12:49:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cDxIkg4go4oV; Sat,  1 Mar 2025 12:49:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 04F4770391
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 04F4770391;
	Sat,  1 Mar 2025 12:49:37 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 13F1C182
 for <buildroot@buildroot.org>; Sat,  1 Mar 2025 12:49:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3EEC08494D
 for <buildroot@buildroot.org>; Sat,  1 Mar 2025 12:49:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9OT6DothgIUE for <buildroot@buildroot.org>;
 Sat,  1 Mar 2025 12:49:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5639F8494F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5639F8494F
 for <buildroot@buildroot.org>; Sat,  1 Mar 2025 12:49:23 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4449587E83; Sat,  1 Mar 2025 12:49:23 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sat, 1 Mar 2025 11:32:59 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 8f2a6c9c469a8c840a74ee9fa9312692bd2428db
X-Git-Newrev: 816f239e370d57a76ff388a52acbca28f84e8911
X-Patchwork-Hint: ignore
Message-Id: <20250301124923.4449587E83@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next]
 package/freescale-imx/imx-gpu-g2d: bump version to 6.4.11.p2.10
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
Content-Type: multipart/mixed; boundary="===============6036452848305574130=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6036452848305574130==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=816f239e370d57a76ff388a52acbca28f84e8911
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

This version is aligned with NXP Linux BSP version "lf-6.6.52-2.2.0".

License hashes changed because the LA_OPT_NXP_Software_License changed
from "v56 April 2024" to "v57 July 2024".
Add SCR.txt to _LICENSE_FILES.

Note: in this release, the package source archive name changed to
include a revision. This commit adds a new _REVISION variable with the
value published in the corresponding NXP BSP.

Signed-off-by: Sébastien Szymanski <sebastien.szymanski@armadeus.com>
[Julien: fixed the bsp version name in commit log]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/freescale-imx/imx-gpu-g2d/imx-gpu-g2d.hash | 9 +++++----
 package/freescale-imx/imx-gpu-g2d/imx-gpu-g2d.mk   | 9 +++++----
 2 files changed, 10 insertions(+), 8 deletions(-)

diff --git a/package/freescale-imx/imx-gpu-g2d/imx-gpu-g2d.hash b/package/freescale-imx/imx-gpu-g2d/imx-gpu-g2d.hash
index 922fce2236..f040e00f68 100644
--- a/package/freescale-imx/imx-gpu-g2d/imx-gpu-g2d.hash
+++ b/package/freescale-imx/imx-gpu-g2d/imx-gpu-g2d.hash
@@ -1,5 +1,6 @@
 # Locally calculated
-sha256  413610ce4730eb9adbde30c8ad4a72df3edd69d84e1154a0c29efa7f33a30663  imx-gpu-g2d-6.4.11.p2.6-arm-bc7b6a2.bin
-sha256  b2e4c580bf887042f479fde7c8b07c6215794d8123263d10ff0c167af7ba5918  imx-gpu-g2d-6.4.11.p2.6-aarch64-bc7b6a2.bin
-sha256  c9ee518510d72e254d62743f5098163eacdb6428c6ba4d8119afe2d12edba068  COPYING
-sha256  165f6c0eacb4d3a05289dfb79331c9a2c05207eb7a67ef28a117f246a0145428  EULA
+sha256  780479f19142126ed58e12222b80f8f3b882ad3d223ff61b7ea02001f517ff03  imx-gpu-g2d-6.4.11.p2.10-aarch64-accdd64.bin
+sha256  cd4fd05dd6f6880edc3255c85fe08094a07ea4cd3eee947df004dcb8f37bc8fa  imx-gpu-g2d-6.4.11.p2.10-arm-accdd64.bin
+sha256  601fa790c5b4d03579bd182fb4d65a6f329a32faf49db22f98e4608221e861f7  COPYING
+sha256  c3d9a7b2a5a7db5da690e9c1081b98b665802c3efbbba7fb237339395a92f607  EULA
+sha256  3f3b817ca9490fbe89a83395a0961122aca138bf43acd869c6ca086502a1e131  SCR-imx-gpu-g2d.txt
diff --git a/package/freescale-imx/imx-gpu-g2d/imx-gpu-g2d.mk b/package/freescale-imx/imx-gpu-g2d/imx-gpu-g2d.mk
index 213f20a7d9..1154943b3a 100644
--- a/package/freescale-imx/imx-gpu-g2d/imx-gpu-g2d.mk
+++ b/package/freescale-imx/imx-gpu-g2d/imx-gpu-g2d.mk
@@ -4,18 +4,19 @@
 #
 ################################################################################
 
+IMX_GPU_G2D_REVISION = accdd64
 ifeq ($(BR2_aarch64),y)
-IMX_GPU_G2D_VERSION = 6.4.11.p2.6-aarch64-bc7b6a2
+IMX_GPU_G2D_VERSION = 6.4.11.p2.10-aarch64
 else
-IMX_GPU_G2D_VERSION = 6.4.11.p2.6-arm-bc7b6a2
+IMX_GPU_G2D_VERSION = 6.4.11.p2.10-arm
 endif
 IMX_GPU_G2D_SITE = $(FREESCALE_IMX_SITE)
-IMX_GPU_G2D_SOURCE = imx-gpu-g2d-$(IMX_GPU_G2D_VERSION).bin
+IMX_GPU_G2D_SOURCE = imx-gpu-g2d-$(IMX_GPU_G2D_VERSION)-$(IMX_GPU_G2D_REVISION).bin
 IMX_GPU_G2D_DEPENDENCIES = imx-gpu-viv
 IMX_GPU_G2D_INSTALL_STAGING = YES
 
 IMX_GPU_G2D_LICENSE = NXP Semiconductor Software License Agreement
-IMX_GPU_G2D_LICENSE_FILES = EULA COPYING
+IMX_GPU_G2D_LICENSE_FILES = EULA COPYING SCR-imx-gpu-g2d.txt
 IMX_GPU_G2D_REDISTRIBUTE = NO
 
 define IMX_GPU_G2D_EXTRACT_CMDS

--===============6036452848305574130==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6036452848305574130==--
