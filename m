Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 369F5C54755
	for <buildroot@archiver.kernel.org>; Fri, 16 May 2025 10:58:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0804D41A19;
	Fri, 16 May 2025 10:58:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id v85hlYouCYt1; Fri, 16 May 2025 10:58:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2281141A3B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2281141A3B;
	Fri, 16 May 2025 10:58:08 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 7129B13D
 for <buildroot@buildroot.org>; Fri, 16 May 2025 10:58:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 61F00419A5
 for <buildroot@buildroot.org>; Fri, 16 May 2025 10:58:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mSNu0qB_NW8G for <buildroot@buildroot.org>;
 Fri, 16 May 2025 10:57:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6DB86419D4
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6DB86419D4
 for <buildroot@buildroot.org>; Fri, 16 May 2025 10:57:58 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 664CB86A48; Fri, 16 May 2025 10:57:58 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Fri, 16 May 2025 12:49:35 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 05b20d572c852d88c693c474ea5ca70b38891b9a
X-Git-Newrev: 4fe62351263071263ece8f9dcaaee830d82fc8d4
X-Patchwork-Hint: ignore
Message-Id: <20250516105758.664CB86A48@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/freescale-imx/imx-vpu-hantro: bump
 version to 1.36.0
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
Content-Type: multipart/mixed; boundary="===============5680995469105937613=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5680995469105937613==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=4fe62351263071263ece8f9dcaaee830d82fc8d4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This version is aligned with NXP Linux BSP version "lf-6.12.3-1.0.0".

License hashes changed because the LA_OPT_NXP_Software_License changed
from "v57 July 2024" to "v58 November 2024".

Signed-off-by: Sébastien Szymanski <sebastien.szymanski@armadeus.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/freescale-imx/imx-vpu-hantro/imx-vpu-hantro.hash | 6 +++---
 package/freescale-imx/imx-vpu-hantro/imx-vpu-hantro.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/freescale-imx/imx-vpu-hantro/imx-vpu-hantro.hash b/package/freescale-imx/imx-vpu-hantro/imx-vpu-hantro.hash
index f103970893..6b267b3ef0 100644
--- a/package/freescale-imx/imx-vpu-hantro/imx-vpu-hantro.hash
+++ b/package/freescale-imx/imx-vpu-hantro/imx-vpu-hantro.hash
@@ -1,5 +1,5 @@
 # Locally computed:
-sha256  c4730cb996a3eafbc06ed0765cd509caa63cdeecdc0c4958efbc91383e0501fd  imx-vpu-hantro-1.35.0-98ff183.bin
-sha256  601fa790c5b4d03579bd182fb4d65a6f329a32faf49db22f98e4608221e861f7  COPYING
-sha256  c3d9a7b2a5a7db5da690e9c1081b98b665802c3efbbba7fb237339395a92f607  EULA
+sha256  0ef1fb5c6653c08f2d2812c72dedf3e8beb091dd5b3d70d6e26f41bac4ebffa7  imx-vpu-hantro-1.36.0-194a305.bin
+sha256  3f4a12c82a84bd1c3578c9c986d6371a61d3399525e76288ecbbae01daf0ae26  COPYING
+sha256  38f1408d6e935c564efd9119c313269e643c1a85cab1d930c3c5bd70bc261769  EULA
 sha256  5d06ff9de56f0788f6b090c93226dd951764124635c687cef64f29776c2e8cf8  SCR-imx-vpu-hantro.txt
diff --git a/package/freescale-imx/imx-vpu-hantro/imx-vpu-hantro.mk b/package/freescale-imx/imx-vpu-hantro/imx-vpu-hantro.mk
index 256153892b..dbd50bfae8 100644
--- a/package/freescale-imx/imx-vpu-hantro/imx-vpu-hantro.mk
+++ b/package/freescale-imx/imx-vpu-hantro/imx-vpu-hantro.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-IMX_VPU_HANTRO_VERSION = 1.35.0
-IMX_VPU_HANTRO_REVISION = 98ff183
+IMX_VPU_HANTRO_VERSION = 1.36.0
+IMX_VPU_HANTRO_REVISION = 194a305
 IMX_VPU_HANTRO_SITE = $(FREESCALE_IMX_SITE)
 IMX_VPU_HANTRO_SOURCE = imx-vpu-hantro-$(IMX_VPU_HANTRO_VERSION)-$(IMX_VPU_HANTRO_REVISION).bin
 IMX_VPU_HANTRO_DEPENDENCIES = linux

--===============5680995469105937613==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5680995469105937613==--
