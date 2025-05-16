Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1EFEC2D0CD
	for <buildroot@archiver.kernel.org>; Mon, 19 May 2025 10:48:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C23388401B;
	Mon, 19 May 2025 10:48:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Cvhv1Xv6FpEq; Mon, 19 May 2025 10:48:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0504E8401C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0504E8401C;
	Mon, 19 May 2025 10:48:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 3EF7CE4
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:41:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9821A4191B
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:40:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7U4X9dTuuKBh for <buildroot@buildroot.org>;
 Mon, 19 May 2025 10:40:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B934F4190C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id B934F4190C
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:40:03 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B6E69873D4; Mon, 19 May 2025 10:40:03 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Fri, 16 May 2025 12:49:35 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 33778c855248a690bbc20b581d5d9d227a46e284
X-Git-Newrev: 2f13e813c013560a4cc0de76db827774c7a34172
X-Patchwork-Hint: ignore
Message-Id: <20250519104003.B6E69873D4@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next]
 package/freescale-imx/imx-sc-firmware: bump version to 1.18.0
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
Content-Type: multipart/mixed; boundary="===============8921677413572626596=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8921677413572626596==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=2f13e813c013560a4cc0de76db827774c7a34172
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

This version is aligned with NXP Linux BSP version "lf-6.12.3-1.0.0".

License hashes changed because the LA_OPT_NXP_Software_License changed
from "v57 July 2024" to "v58 November 2024".

Signed-off-by: Sébastien Szymanski <sebastien.szymanski@armadeus.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/freescale-imx/imx-sc-firmware/imx-sc-firmware.hash | 6 +++---
 package/freescale-imx/imx-sc-firmware/imx-sc-firmware.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/freescale-imx/imx-sc-firmware/imx-sc-firmware.hash b/package/freescale-imx/imx-sc-firmware/imx-sc-firmware.hash
index 9a12383e02..d36868b7be 100644
--- a/package/freescale-imx/imx-sc-firmware/imx-sc-firmware.hash
+++ b/package/freescale-imx/imx-sc-firmware/imx-sc-firmware.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  083e86cc26f2187863513677085474149960311e7ebca36df69306014daab948  imx-sc-firmware-1.17.0-83624b9.bin
-sha256  c3d9a7b2a5a7db5da690e9c1081b98b665802c3efbbba7fb237339395a92f607  EULA
-sha256  601fa790c5b4d03579bd182fb4d65a6f329a32faf49db22f98e4608221e861f7  COPYING
+sha256  392f1e5cdf1c8d7ed75409a2c46b00a332ace677f0e2700b587fe9ae800a1ff3  imx-sc-firmware-1.18.0-654907b.bin
+sha256  38f1408d6e935c564efd9119c313269e643c1a85cab1d930c3c5bd70bc261769  EULA
+sha256  3f4a12c82a84bd1c3578c9c986d6371a61d3399525e76288ecbbae01daf0ae26  COPYING
 sha256  bfbeef332d05c9608c790a12bbbf4c66a8acc76b159145ba7ef48d3799ca8a61  SCR.txt
diff --git a/package/freescale-imx/imx-sc-firmware/imx-sc-firmware.mk b/package/freescale-imx/imx-sc-firmware/imx-sc-firmware.mk
index 1e6d6e7dd5..90bfcc6e3c 100644
--- a/package/freescale-imx/imx-sc-firmware/imx-sc-firmware.mk
+++ b/package/freescale-imx/imx-sc-firmware/imx-sc-firmware.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-IMX_SC_FIRMWARE_VERSION = 1.17.0
-IMX_SC_FIRMWARE_REVISION = 83624b9
+IMX_SC_FIRMWARE_VERSION = 1.18.0
+IMX_SC_FIRMWARE_REVISION = 654907b
 IMX_SC_FIRMWARE_SITE = $(FREESCALE_IMX_SITE)
 IMX_SC_FIRMWARE_SOURCE = imx-sc-firmware-$(IMX_SC_FIRMWARE_VERSION)-$(IMX_SC_FIRMWARE_REVISION).bin
 

--===============8921677413572626596==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8921677413572626596==--
