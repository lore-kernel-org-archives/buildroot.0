Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 844BEC433EF
	for <buildroot@archiver.kernel.org>; Fri,  8 Jul 2022 09:00:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 06DB742514;
	Fri,  8 Jul 2022 09:00:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 06DB742514
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3bI0_b8g2GOt; Fri,  8 Jul 2022 09:00:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B1B3A4250A;
	Fri,  8 Jul 2022 09:00:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B1B3A4250A
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DAC1B1BF276
 for <buildroot@lists.busybox.net>; Fri,  8 Jul 2022 09:00:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C34C640155
 for <buildroot@lists.busybox.net>; Fri,  8 Jul 2022 09:00:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C34C640155
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QYg3qzf-xrmd for <buildroot@lists.busybox.net>;
 Fri,  8 Jul 2022 09:00:28 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0F1FC4017E
 for <buildroot@buildroot.org>; Fri,  8 Jul 2022 09:00:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0F1FC4017E
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id C4278834D2; Fri,  8 Jul 2022 08:47:25 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 8 Jul 2022 10:59:19 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 73491bf4ecd573ca789ec466f8096e4afe59d571
X-Git-Newrev: 72ea8185b0fd25d02bedda24a91826d9398c6d22
X-Patchwork-Hint: ignore
Message-Id: <20220708084725.C4278834D2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ethtool: bump to version 5.18
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

commit: https://git.buildroot.net/buildroot/commit/?id=72ea8185b0fd25d02bedda24a91826d9398c6d22
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ethtool/ethtool.hash | 2 +-
 package/ethtool/ethtool.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/ethtool/ethtool.hash b/package/ethtool/ethtool.hash
index f317a1fb12..052a87d978 100644
--- a/package/ethtool/ethtool.hash
+++ b/package/ethtool/ethtool.hash
@@ -1,5 +1,5 @@
 # From https://www.kernel.org/pub/software/network/ethtool/sha256sums.asc
-sha256  64ab914b9c6b45047245d91f40b8760b2728992a9e5af22717c644238e889133  ethtool-5.17.tar.xz
+sha256  9577b2ffbce710b659fb239598ec92bced1ca400ca0f1286762bfa44e4784270  ethtool-5.18.tar.xz
 # Locally calculated
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
 sha256  5d632934396f90c82dfebe3c9512648bbb6333b406113d0cd331b0e0aa2d34a1  LICENSE
diff --git a/package/ethtool/ethtool.mk b/package/ethtool/ethtool.mk
index 10f0c802a6..9fd4c31c7b 100644
--- a/package/ethtool/ethtool.mk
+++ b/package/ethtool/ethtool.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ETHTOOL_VERSION = 5.17
+ETHTOOL_VERSION = 5.18
 ETHTOOL_SOURCE = ethtool-$(ETHTOOL_VERSION).tar.xz
 ETHTOOL_SITE = $(BR2_KERNEL_MIRROR)/software/network/ethtool
 ETHTOOL_LICENSE = GPL-2.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
