Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B83CC46467
	for <buildroot@archiver.kernel.org>; Wed,  4 Jan 2023 11:39:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C5A0C4035B;
	Wed,  4 Jan 2023 11:39:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C5A0C4035B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id msFucyDQcdkM; Wed,  4 Jan 2023 11:39:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CCA0E40305;
	Wed,  4 Jan 2023 11:39:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CCA0E40305
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 922101BF2F9
 for <buildroot@lists.busybox.net>; Wed,  4 Jan 2023 11:39:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6D087817D3
 for <buildroot@lists.busybox.net>; Wed,  4 Jan 2023 11:39:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6D087817D3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5mFhF7ekFg0n for <buildroot@lists.busybox.net>;
 Wed,  4 Jan 2023 11:39:33 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9F063812E7
 for <buildroot@buildroot.org>; Wed,  4 Jan 2023 11:39:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9F063812E7
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 88C078742E; Wed,  4 Jan 2023 11:39:33 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 4 Jan 2023 08:47:06 +0100
X-Git-Refname: refs/heads/2022.11.x
X-Git-Oldrev: ab24990c5554729b48ac395004dd15a899f19f32
X-Git-Newrev: 67290befeecd326bdf0d3f2f99aaa35eec2549fd
X-Patchwork-Hint: ignore
Message-Id: <20230104113933.88C078742E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.11.x]
 package/freescale-imx/imx-m4fwloader: update URLs to NXPmicro github
 organization
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

commit: https://git.buildroot.net/buildroot/commit/?id=67290befeecd326bdf0d3f2f99aaa35eec2549fd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.11.x

imx-m4fwloader was removed from the github codeauroraforum
organization. It is now redirecting to NXPmicro. This patch
updates the link to directly point to the correct place.

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit f496b36995c02f81b2404ef1f450ecbfba26aace)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
