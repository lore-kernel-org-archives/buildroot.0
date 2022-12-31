Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 433B5C4332F
	for <buildroot@archiver.kernel.org>; Sat, 31 Dec 2022 16:35:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DCC5840445;
	Sat, 31 Dec 2022 16:35:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DCC5840445
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xcs2LHJ4c9pX; Sat, 31 Dec 2022 16:35:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 93E12405F5;
	Sat, 31 Dec 2022 16:35:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 93E12405F5
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BB3E01BF855
 for <buildroot@lists.busybox.net>; Sat, 31 Dec 2022 16:35:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A41B9405C7
 for <buildroot@lists.busybox.net>; Sat, 31 Dec 2022 16:35:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A41B9405C7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1B_KLwftoAVB for <buildroot@lists.busybox.net>;
 Sat, 31 Dec 2022 16:35:01 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id DE89F40347
 for <buildroot@buildroot.org>; Sat, 31 Dec 2022 16:35:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DE89F40347
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CCABD86F96; Sat, 31 Dec 2022 16:35:00 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 31 Dec 2022 17:22:48 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1ed90a96aa1f11fed19045036b4a10d9a8263a98
X-Git-Newrev: cec5a941b0867803045450688fbec8992e48d81d
X-Patchwork-Hint: ignore
Message-Id: <20221231163500.CCABD86F96@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/freescale-imx/imx-kobs: update to
 NXPmicro github organization
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

commit: https://git.buildroot.net/buildroot/commit/?id=cec5a941b0867803045450688fbec8992e48d81d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

imx-kobs was removed from the github codeauroraforum organization.
It is now redirecting to NXPmicro. This patch updates the link to
directly point to the correct place.

The commit also replaces the Config.in comment saying the package does
not have an upstream by the github.com project page.

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/freescale-imx/imx-kobs/Config.in   | 3 +--
 package/freescale-imx/imx-kobs/imx-kobs.mk | 2 +-
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/package/freescale-imx/imx-kobs/Config.in b/package/freescale-imx/imx-kobs/Config.in
index 61be9f26d4..a81842b9a5 100644
--- a/package/freescale-imx/imx-kobs/Config.in
+++ b/package/freescale-imx/imx-kobs/Config.in
@@ -5,5 +5,4 @@ config BR2_PACKAGE_IMX_KOBS
 	  The imx-kobs tool is used for writing images to NAND on i.MX
 	  platforms.
 
-	  This library is provided by Freescale as-is and doesn't have
-	  an upstream.
+	  https://github.com/NXPmicro/imx-kobs
diff --git a/package/freescale-imx/imx-kobs/imx-kobs.mk b/package/freescale-imx/imx-kobs/imx-kobs.mk
index d6a250cf72..91b39f6fa4 100644
--- a/package/freescale-imx/imx-kobs/imx-kobs.mk
+++ b/package/freescale-imx/imx-kobs/imx-kobs.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 IMX_KOBS_VERSION = a0e9adce2fb7fcd57e794d7f9a5deba0f94f521b
-IMX_KOBS_SITE = $(call github,codeauroraforum,imx-kobs,$(IMX_KOBS_VERSION))
+IMX_KOBS_SITE = $(call github,NXPmicro,imx-kobs,$(IMX_KOBS_VERSION))
 IMX_KOBS_LICENSE = GPL-2.0+
 IMX_KOBS_LICENSE_FILES = COPYING
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
