Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AABCC433FE
	for <buildroot@archiver.kernel.org>; Tue, 29 Nov 2022 22:20:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EF28760D57;
	Tue, 29 Nov 2022 22:20:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EF28760D57
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0KuzE8sROdGG; Tue, 29 Nov 2022 22:20:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 350BD60C34;
	Tue, 29 Nov 2022 22:20:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 350BD60C34
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 541E11BF5AD
 for <buildroot@lists.busybox.net>; Tue, 29 Nov 2022 22:20:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2FECC8125D
 for <buildroot@lists.busybox.net>; Tue, 29 Nov 2022 22:20:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2FECC8125D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CiJX9fGqFtWs for <buildroot@lists.busybox.net>;
 Tue, 29 Nov 2022 22:20:30 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5B47380FA4
 for <buildroot@buildroot.org>; Tue, 29 Nov 2022 22:20:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5B47380FA4
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4899784E41; Tue, 29 Nov 2022 22:20:30 +0000 (UTC)
From: Arnout Vandecappelle <arnout@mind.be>
To: buildroot@buildroot.org
Date: Tue, 29 Nov 2022 23:19:41 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 059c61a18f6a1fb8f0580c0475983fe37fa69e44
X-Git-Newrev: fb894b2e98e944e517cb74278df555fa4147d3b3
X-Patchwork-Hint: ignore
Message-Id: <20221129222030.4899784E41@busybox.osuosl.org>
Subject: [Buildroot] [git commit] board/freescale/imx6ul(l)evk: fix
 repetition of "to" string
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

commit: https://git.buildroot.net/buildroot/commit/?id=fb894b2e98e944e517cb74278df555fa4147d3b3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 board/freescale/imx6ulevk/readme.txt  | 2 +-
 board/freescale/imx6ullevk/readme.txt | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/board/freescale/imx6ulevk/readme.txt b/board/freescale/imx6ulevk/readme.txt
index 90355f354f..5bc03771f2 100644
--- a/board/freescale/imx6ulevk/readme.txt
+++ b/board/freescale/imx6ulevk/readme.txt
@@ -12,7 +12,7 @@ Build
 
 First, configure Buildroot for your i.MX6UL EVK board:
 
-In order to to do so there are two supported options:
+In order to do so there are two supported options:
 
   make freescale_imx6ulevk_defconfig
 
diff --git a/board/freescale/imx6ullevk/readme.txt b/board/freescale/imx6ullevk/readme.txt
index 77acec2615..dc7c5f3678 100644
--- a/board/freescale/imx6ullevk/readme.txt
+++ b/board/freescale/imx6ullevk/readme.txt
@@ -9,7 +9,7 @@ Build
 
 First, configure Buildroot for your i.MX6ULL EVK board:
 
-In order to to do so there are two supported options:
+In order to do so there are two supported options:
 
   make freescale_imx6ullevk_defconfig
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
