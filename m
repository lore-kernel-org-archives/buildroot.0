Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B9F1C282C6
	for <buildroot@archiver.kernel.org>; Sat,  1 Mar 2025 12:49:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4649484EAE;
	Sat,  1 Mar 2025 12:49:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SAHk5I89MDBz; Sat,  1 Mar 2025 12:49:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2E9EF84EE8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2E9EF84EE8;
	Sat,  1 Mar 2025 12:49:52 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 673EB182
 for <buildroot@buildroot.org>; Sat,  1 Mar 2025 12:49:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B19CD42ECA
 for <buildroot@buildroot.org>; Sat,  1 Mar 2025 12:49:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BYo7BbS245EH for <buildroot@buildroot.org>;
 Sat,  1 Mar 2025 12:49:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D0AE342F10
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id D0AE342F10
 for <buildroot@buildroot.org>; Sat,  1 Mar 2025 12:49:23 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5F7B587E85; Sat,  1 Mar 2025 12:49:23 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sat, 1 Mar 2025 11:33:02 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 816f239e370d57a76ff388a52acbca28f84e8911
X-Git-Newrev: ab1c1c7f4919794289fdeb338647f7ca8c547fbc
X-Patchwork-Hint: ignore
Message-Id: <20250301124923.5F7B587E85@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next]
 package/freescale-imx/imx-gpu-viv: bump version to 6.4.11.p2.10
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
Content-Type: multipart/mixed; boundary="===============7669333605977353396=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============7669333605977353396==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=ab1c1c7f4919794289fdeb338647f7ca8c547fbc
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
 package/freescale-imx/imx-gpu-viv/imx-gpu-viv.hash | 9 +++++----
 package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk   | 9 +++++----
 2 files changed, 10 insertions(+), 8 deletions(-)

diff --git a/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.hash b/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.hash
index cce08e2727..87ac86ab7a 100644
--- a/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.hash
+++ b/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.hash
@@ -1,5 +1,6 @@
 # Locally calculated
-sha256  cf6e42c9c9a903cd933b767d411131390d237a4b92ecad579db57d54538707f3  imx-gpu-viv-6.4.11.p2.6-aarch32-bc7b6a2.bin
-sha256  5fe828113b9b2801b3fd60cd15eadfd0ac747e5897ef7db7fa22f80e7dd8a8e1  imx-gpu-viv-6.4.11.p2.6-aarch64-bc7b6a2.bin
-sha256  c9ee518510d72e254d62743f5098163eacdb6428c6ba4d8119afe2d12edba068  COPYING
-sha256  165f6c0eacb4d3a05289dfb79331c9a2c05207eb7a67ef28a117f246a0145428  EULA
+sha256  2242c7cbf1a2b07d40eefe5d1507747e477c54912f179ee0585a5d7965074ce0  imx-gpu-viv-6.4.11.p2.10-aarch32-accdd64.bin
+sha256  8108fd146de6986486f34860227511a5101b31072b99cd78ae38afba8939fd4e  imx-gpu-viv-6.4.11.p2.10-aarch64-accdd64.bin
+sha256  601fa790c5b4d03579bd182fb4d65a6f329a32faf49db22f98e4608221e861f7  COPYING
+sha256  c3d9a7b2a5a7db5da690e9c1081b98b665802c3efbbba7fb237339395a92f607  EULA
+sha256  ab20fa3f527fce99087d8d3cd4e2cf4b9cfdfaaa98b3d766a2b5953a981323d3  SCR-imx-gpu-viv.txt
diff --git a/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk b/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk
index a559bb7478..857a11b3b9 100644
--- a/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk
+++ b/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk
@@ -4,18 +4,19 @@
 #
 ################################################################################
 
+IMX_GPU_VIV_REVISION = accdd64
 ifeq ($(BR2_aarch64),y)
-IMX_GPU_VIV_VERSION = 6.4.11.p2.6-aarch64-bc7b6a2
+IMX_GPU_VIV_VERSION = 6.4.11.p2.10-aarch64
 else
-IMX_GPU_VIV_VERSION = 6.4.11.p2.6-aarch32-bc7b6a2
+IMX_GPU_VIV_VERSION = 6.4.11.p2.10-aarch32
 endif
 IMX_GPU_VIV_SITE = $(FREESCALE_IMX_SITE)
-IMX_GPU_VIV_SOURCE = imx-gpu-viv-$(IMX_GPU_VIV_VERSION).bin
+IMX_GPU_VIV_SOURCE = imx-gpu-viv-$(IMX_GPU_VIV_VERSION)-$(IMX_GPU_VIV_REVISION).bin
 
 IMX_GPU_VIV_INSTALL_STAGING = YES
 
 IMX_GPU_VIV_LICENSE = NXP Semiconductor Software License Agreement
-IMX_GPU_VIV_LICENSE_FILES = EULA COPYING
+IMX_GPU_VIV_LICENSE_FILES = EULA COPYING SCR-imx-gpu-viv.txt
 IMX_GPU_VIV_REDISTRIBUTE = NO
 
 IMX_GPU_VIV_PROVIDES = libegl libgles libopencl libopenvg

--===============7669333605977353396==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7669333605977353396==--
