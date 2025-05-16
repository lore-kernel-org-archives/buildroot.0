Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 159B2C3ABD8
	for <buildroot@archiver.kernel.org>; Fri, 16 May 2025 10:58:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D771841A4E;
	Fri, 16 May 2025 10:58:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id e9-7GFzNKn3h; Fri, 16 May 2025 10:58:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BBECD41A15
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id BBECD41A15;
	Fri, 16 May 2025 10:58:03 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 9D4221AB
 for <buildroot@buildroot.org>; Fri, 16 May 2025 10:57:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 82A516104E
 for <buildroot@buildroot.org>; Fri, 16 May 2025 10:57:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uRJPTW9D5rUd for <buildroot@buildroot.org>;
 Fri, 16 May 2025 10:57:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 654F2608B0
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 654F2608B0
 for <buildroot@buildroot.org>; Fri, 16 May 2025 10:57:58 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 555B886A43; Fri, 16 May 2025 10:57:58 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Fri, 16 May 2025 12:49:35 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 20246264e5ef8a20a1cc0f2b223854ff8517f225
X-Git-Newrev: 9d0e9e07a8d4a5a51594f5f0db89d22ba2a5972e
X-Patchwork-Hint: ignore
Message-Id: <20250516105758.555B886A43@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/freescale-imx/firmware-ele-imx:
 bump to version 2.0.1
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
Content-Type: multipart/mixed; boundary="===============8176041703420231273=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8176041703420231273==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=9d0e9e07a8d4a5a51594f5f0db89d22ba2a5972e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This version is aligned with NXP Linux BSP version "lf-6.12.3-1.0.0".

License hashes changed because the LA_OPT_NXP_Software_License changed
from "v57 July 2024" to "v58 November 2024".

Signed-off-by: Sébastien Szymanski <sebastien.szymanski@armadeus.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/freescale-imx/firmware-ele-imx/firmware-ele-imx.hash | 6 +++---
 package/freescale-imx/firmware-ele-imx/firmware-ele-imx.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/freescale-imx/firmware-ele-imx/firmware-ele-imx.hash b/package/freescale-imx/firmware-ele-imx/firmware-ele-imx.hash
index 6182dc57be..55e1864e31 100644
--- a/package/freescale-imx/firmware-ele-imx/firmware-ele-imx.hash
+++ b/package/freescale-imx/firmware-ele-imx/firmware-ele-imx.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  8791109824767346237e53ac2c712824e54608e2092859161e6bb3e5385a7595  firmware-ele-imx-1.3.0-17945fc.bin
-sha256  601fa790c5b4d03579bd182fb4d65a6f329a32faf49db22f98e4608221e861f7  COPYING
-sha256  c3d9a7b2a5a7db5da690e9c1081b98b665802c3efbbba7fb237339395a92f607  EULA
+sha256  a2f16e43e8aff9cf018d0962b70313940f77079b314331ab3980c4c5f44249cb  firmware-ele-imx-2.0.1-0a66c34.bin
+sha256  3f4a12c82a84bd1c3578c9c986d6371a61d3399525e76288ecbbae01daf0ae26  COPYING
+sha256  38f1408d6e935c564efd9119c313269e643c1a85cab1d930c3c5bd70bc261769  EULA
 sha256  8721a617a5d4c7f366aaf857ebda21eb4c9fc9175dc92b70f627c611d403ec8e  SCR.txt
diff --git a/package/freescale-imx/firmware-ele-imx/firmware-ele-imx.mk b/package/freescale-imx/firmware-ele-imx/firmware-ele-imx.mk
index 4225805d50..8f25f4b5b5 100644
--- a/package/freescale-imx/firmware-ele-imx/firmware-ele-imx.mk
+++ b/package/freescale-imx/firmware-ele-imx/firmware-ele-imx.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-FIRMWARE_ELE_IMX_VERSION = 1.3.0
-FIRMWARE_ELE_IMX_REVISION = 17945fc
+FIRMWARE_ELE_IMX_VERSION = 2.0.1
+FIRMWARE_ELE_IMX_REVISION = 0a66c34
 FIRMWARE_ELE_IMX_SITE = $(FREESCALE_IMX_SITE)
 FIRMWARE_ELE_IMX_SOURCE = firmware-ele-imx-$(FIRMWARE_ELE_IMX_VERSION)-$(FIRMWARE_ELE_IMX_REVISION).bin
 

--===============8176041703420231273==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8176041703420231273==--
