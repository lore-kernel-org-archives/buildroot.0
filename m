Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C87F7C4332F
	for <buildroot@archiver.kernel.org>; Sat, 31 Dec 2022 16:35:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 70007814B3;
	Sat, 31 Dec 2022 16:35:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 70007814B3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ibNAlea-mdnt; Sat, 31 Dec 2022 16:35:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A6C98814A9;
	Sat, 31 Dec 2022 16:35:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A6C98814A9
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2A48E1BF855
 for <buildroot@lists.busybox.net>; Sat, 31 Dec 2022 16:35:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EFA68404CA
 for <buildroot@lists.busybox.net>; Sat, 31 Dec 2022 16:35:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EFA68404CA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ow97algmUM-r for <buildroot@lists.busybox.net>;
 Sat, 31 Dec 2022 16:35:01 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id F2B0C402A6
 for <buildroot@buildroot.org>; Sat, 31 Dec 2022 16:35:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F2B0C402A6
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E174386FB3; Sat, 31 Dec 2022 16:35:00 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 31 Dec 2022 17:22:52 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8c74c6472b8caf31b34a5a57654ab0c3d18dad36
X-Git-Newrev: f496b36995c02f81b2404ef1f450ecbfba26aace
X-Patchwork-Hint: ignore
Message-Id: <20221231163500.E174386FB3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/freescale-imx/imx-m4fwloader:
 update URLs to NXPmicro github organization
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

commit: https://git.buildroot.net/buildroot/commit/?id=f496b36995c02f81b2404ef1f450ecbfba26aace
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

imx-m4fwloader was removed from the github codeauroraforum
organization. It is now redirecting to NXPmicro. This patch
updates the link to directly point to the correct place.

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/freescale-imx/imx-m4fwloader/Config.in         | 2 +-
 package/freescale-imx/imx-m4fwloader/imx-m4fwloader.mk | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/freescale-imx/imx-m4fwloader/Config.in b/package/freescale-imx/imx-m4fwloader/Config.in
index 937f82f916..d75480a708 100644
--- a/package/freescale-imx/imx-m4fwloader/Config.in
+++ b/package/freescale-imx/imx-m4fwloader/Config.in
@@ -5,4 +5,4 @@ config BR2_PACKAGE_IMX_M4FWLOADER
 	  This package provides a tool to load a firmware to the
 	  Cortex-M4 core available in some i.MX processors.
 
-	  https://github.com/codeauroraforum/imx-m4fwloader
+	  https://github.com/NXPmicro/imx-m4fwloader
diff --git a/package/freescale-imx/imx-m4fwloader/imx-m4fwloader.mk b/package/freescale-imx/imx-m4fwloader/imx-m4fwloader.mk
index cc4849330c..320d5dc617 100644
--- a/package/freescale-imx/imx-m4fwloader/imx-m4fwloader.mk
+++ b/package/freescale-imx/imx-m4fwloader/imx-m4fwloader.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 IMX_M4FWLOADER_VERSION = 8cf4d17a09ba23250d43381b49ba00d92406fad9
-IMX_M4FWLOADER_SITE = $(call github,codeauroraforum,imx-m4fwloader,$(IMX_M4FWLOADER_VERSION))
+IMX_M4FWLOADER_SITE = $(call github,NXPmicro,imx-m4fwloader,$(IMX_M4FWLOADER_VERSION))
 IMX_M4FWLOADER_LICENSE = GPL-2.0+
 IMX_M4FWLOADER_LICENSE_FILES = LICENSE
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
