Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00154C46467
	for <buildroot@archiver.kernel.org>; Wed,  4 Jan 2023 11:46:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 991E140866;
	Wed,  4 Jan 2023 11:46:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 991E140866
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vuVnEUxYKjRB; Wed,  4 Jan 2023 11:46:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 87C5E417A9;
	Wed,  4 Jan 2023 11:46:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 87C5E417A9
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 100F71BF95E
 for <buildroot@lists.busybox.net>; Wed,  4 Jan 2023 11:40:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4E1AC6102A
 for <buildroot@lists.busybox.net>; Wed,  4 Jan 2023 11:40:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4E1AC6102A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ygsYq-9JhBLZ for <buildroot@lists.busybox.net>;
 Wed,  4 Jan 2023 11:40:43 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7B99560AB5
 for <buildroot@buildroot.org>; Wed,  4 Jan 2023 11:40:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7B99560AB5
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6BADD874A5; Wed,  4 Jan 2023 11:40:43 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 4 Jan 2023 12:13:01 +0100
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: fab1c8b1ce7c990b654535f42d96e085a2fcd2b4
X-Git-Newrev: 02ced88bf3d8d6225c5a81d72de257ee43c07d17
X-Patchwork-Hint: ignore
Message-Id: <20230104114043.6BADD874A5@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x]
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

commit: https://git.buildroot.net/buildroot/commit/?id=02ced88bf3d8d6225c5a81d72de257ee43c07d17
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

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
