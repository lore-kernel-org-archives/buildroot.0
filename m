Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3141C54EE9
	for <buildroot@archiver.kernel.org>; Sun, 18 Sep 2022 09:35:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 670AE84407;
	Sun, 18 Sep 2022 09:35:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 670AE84407
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id t1-04bktwCah; Sun, 18 Sep 2022 09:35:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 854E4843F0;
	Sun, 18 Sep 2022 09:35:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 854E4843F0
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 74C9B1BF328
 for <buildroot@lists.busybox.net>; Sun, 18 Sep 2022 09:33:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id ABB0D4181D
 for <buildroot@lists.busybox.net>; Sun, 18 Sep 2022 09:33:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ABB0D4181D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uzWQUyXuSQ2s for <buildroot@lists.busybox.net>;
 Sun, 18 Sep 2022 09:33:46 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 941EE41811
 for <buildroot@buildroot.org>; Sun, 18 Sep 2022 09:33:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 941EE41811
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 84DED84A59; Sun, 18 Sep 2022 09:33:46 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 18 Sep 2022 11:19:24 +0200
X-Git-Refname: refs/heads/2022.05.x
X-Git-Oldrev: 5bd197f5dbe7148bea5ae702454755b53e957063
X-Git-Newrev: 82d01e72df81f29aaaa3d91573d4a552cbaec771
X-Patchwork-Hint: ignore
Message-Id: <20220918093346.84DED84A59@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.05.x] boot/mv-ddr-marvell: bump
 to latest commit
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

commit: https://git.buildroot.net/buildroot/commit/?id=82d01e72df81f29aaaa3d91573d4a552cbaec771
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.05.x

This update fixes build with gcc 11.

Update license file hash for unrelated code changes.

Tested on Macchiatobin.

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/2931841699
https://gitlab.com/buildroot.org/buildroot/-/jobs/2931841700

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
(cherry picked from commit 87ba9890c2dd0bcf6415047c3fb9053f6965d0c1)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 boot/mv-ddr-marvell/mv-ddr-marvell.hash | 4 ++--
 boot/mv-ddr-marvell/mv-ddr-marvell.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/boot/mv-ddr-marvell/mv-ddr-marvell.hash b/boot/mv-ddr-marvell/mv-ddr-marvell.hash
index 5bfae8af45..75e87d833d 100644
--- a/boot/mv-ddr-marvell/mv-ddr-marvell.hash
+++ b/boot/mv-ddr-marvell/mv-ddr-marvell.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  bfab74a625d65238c569b9df282b55c0fc9a1e2d3decedcf194d44774df2ede4  mv-ddr-marvell-305d923e6bc4236cd3b902f6679b0aef9e5fa52d.tar.gz
-sha256  48bb930b6fbc3f5db72e29c849b096df3868e4a6d2bdc0e2dd3365c768241cd5  ddr3_init.c
+sha256  16f02232e21a15979b3d9971e28f7e59562484a5c1f99c2b28c248a3b76a63fa  mv-ddr-marvell-d5acc10c287e40cc2feeb28710b92e45c93c702c.tar.gz
+sha256  907a03943ca940790e97620aca8d46b5b04c653dcf2ab6c66a25238b60cf5635  ddr3_init.c
diff --git a/boot/mv-ddr-marvell/mv-ddr-marvell.mk b/boot/mv-ddr-marvell/mv-ddr-marvell.mk
index 442b6aed53..e05192fe9b 100644
--- a/boot/mv-ddr-marvell/mv-ddr-marvell.mk
+++ b/boot/mv-ddr-marvell/mv-ddr-marvell.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-# This is the latest commit on mv-ddr-devel as of 20201207
-MV_DDR_MARVELL_VERSION = 305d923e6bc4236cd3b902f6679b0aef9e5fa52d
+# This is the latest commit on mv-ddr-devel as of 20220529
+MV_DDR_MARVELL_VERSION = d5acc10c287e40cc2feeb28710b92e45c93c702c
 MV_DDR_MARVELL_SITE = $(call github,MarvellEmbeddedProcessors,mv-ddr-marvell,$(MV_DDR_MARVELL_VERSION))
 MV_DDR_MARVELL_LICENSE = GPL-2.0+ or LGPL-2.1 with freertos-exception-2.0, BSD-3-Clause, Marvell Commercial
 MV_DDR_MARVELL_LICENSE_FILES = ddr3_init.c
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
