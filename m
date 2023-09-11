Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CC90C71153
	for <buildroot@archiver.kernel.org>; Mon, 11 Sep 2023 19:44:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DFB9281EC3;
	Mon, 11 Sep 2023 19:44:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DFB9281EC3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KevZmrS33Pex; Mon, 11 Sep 2023 19:44:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 17D8C81EBC;
	Mon, 11 Sep 2023 19:44:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 17D8C81EBC
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 189281BF2BB
 for <buildroot@lists.busybox.net>; Mon, 11 Sep 2023 19:44:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E55DF60D52
 for <buildroot@lists.busybox.net>; Mon, 11 Sep 2023 19:44:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E55DF60D52
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QM0v1B8PyDFS for <buildroot@lists.busybox.net>;
 Mon, 11 Sep 2023 19:44:47 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2A8C6605A6
 for <buildroot@buildroot.org>; Mon, 11 Sep 2023 19:44:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2A8C6605A6
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1348F86CF9; Mon, 11 Sep 2023 19:44:47 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 11 Sep 2023 21:43:53 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8d55b912d762809e24a09bb7f47ddcd4c238f7b6
X-Git-Newrev: 9318e583ada4c72e7a67f1bfe19f33ae5ec49374
X-Patchwork-Hint: ignore
Message-Id: <20230911194447.1348F86CF9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/freescale-imx/imx-kobs: bump to
 version ff13a99a22aa73cca0e09a33c2ebb6a94ad698da
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=9318e583ada4c72e7a67f1bfe19f33ae5ec49374
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update github organization name to nxp-imx which is being
redirected to.

Rename COPYING TO LICENSE.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/freescale-imx/imx-kobs/imx-kobs.hash | 4 ++--
 package/freescale-imx/imx-kobs/imx-kobs.mk   | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/freescale-imx/imx-kobs/imx-kobs.hash b/package/freescale-imx/imx-kobs/imx-kobs.hash
index 39f02ea04a..39ab2b6545 100644
--- a/package/freescale-imx/imx-kobs/imx-kobs.hash
+++ b/package/freescale-imx/imx-kobs/imx-kobs.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  5855c8964f908ad30e5d4500180ee57c51af68186289ef1bdf8553ee60d3b1f5  imx-kobs-a0e9adce2fb7fcd57e794d7f9a5deba0f94f521b.tar.gz
-sha256  204d8eff92f95aac4df6c8122bc1505f468f3a901e5a4cc08940e0ede1938994  COPYING
+sha256  e83c9bca2706a33832174fc609b434d513a39b54ca90a714a6d0bb6f7a0386f7  imx-kobs-ff13a99a22aa73cca0e09a33c2ebb6a94ad698da.tar.gz
+sha256  204d8eff92f95aac4df6c8122bc1505f468f3a901e5a4cc08940e0ede1938994  LICENSE
diff --git a/package/freescale-imx/imx-kobs/imx-kobs.mk b/package/freescale-imx/imx-kobs/imx-kobs.mk
index 91b39f6fa4..d33d3a1b77 100644
--- a/package/freescale-imx/imx-kobs/imx-kobs.mk
+++ b/package/freescale-imx/imx-kobs/imx-kobs.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-IMX_KOBS_VERSION = a0e9adce2fb7fcd57e794d7f9a5deba0f94f521b
-IMX_KOBS_SITE = $(call github,NXPmicro,imx-kobs,$(IMX_KOBS_VERSION))
+IMX_KOBS_VERSION = ff13a99a22aa73cca0e09a33c2ebb6a94ad698da
+IMX_KOBS_SITE = $(call github,nxp-imx,imx-kobs,$(IMX_KOBS_VERSION))
 IMX_KOBS_LICENSE = GPL-2.0+
-IMX_KOBS_LICENSE_FILES = COPYING
+IMX_KOBS_LICENSE_FILES = LICENSE
 
 $(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
