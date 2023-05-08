Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A442CC77B75
	for <buildroot@archiver.kernel.org>; Mon,  8 May 2023 20:22:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3096E42892;
	Mon,  8 May 2023 20:22:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3096E42892
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id R6f1uvKrJc1B; Mon,  8 May 2023 20:22:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0AA8B4194E;
	Mon,  8 May 2023 20:22:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0AA8B4194E
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6F7C41BF34E
 for <buildroot@lists.busybox.net>; Mon,  8 May 2023 20:22:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 51F91845A7
 for <buildroot@lists.busybox.net>; Mon,  8 May 2023 20:22:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 51F91845A7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sMM-lEJ-QQWj for <buildroot@lists.busybox.net>;
 Mon,  8 May 2023 20:22:07 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 651958459B
 for <buildroot@buildroot.org>; Mon,  8 May 2023 20:22:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 651958459B
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 52D7A86219; Mon,  8 May 2023 20:22:07 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Mon, 8 May 2023 22:21:43 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e174343f6a55e2b6928d0f323116850287e015a2
X-Git-Newrev: 3e60ea997233e9c5579a1d2327364396efc762d3
X-Patchwork-Hint: ignore
Message-Id: <20230508202207.52D7A86219@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/dhcpcd: bump to version 10.0.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=3e60ea997233e9c5579a1d2327364396efc762d3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Switch to github as package site as announced here:
https://roy.marples.name/downloads/dhcpcd/

Update license hash due to update in Copyright years.

Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/dhcpcd/dhcpcd.hash | 6 +++---
 package/dhcpcd/dhcpcd.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/dhcpcd/dhcpcd.hash b/package/dhcpcd/dhcpcd.hash
index 532fbd467e..88032f05c1 100644
--- a/package/dhcpcd/dhcpcd.hash
+++ b/package/dhcpcd/dhcpcd.hash
@@ -1,4 +1,4 @@
-# sha256 from ftp://roy.marples.name/pub/dhcpcd/dhcpcd-9.4.1.tar.xz.distinfo
-sha256  819357634efed1ea5cf44ec01b24d3d3f8852fec8b4249925dcc5667c54e376c  dhcpcd-9.4.1.tar.xz
+# sha256 from https://github.com/NetworkConfiguration/dhcpcd/releases/tag/v10.0.1
+sha256  6e9f6a5c47fcd8a763cfa26f1ca6eedf1e534992224a01d6c1ab8abb154af972  dhcpcd-10.0.1.tar.xz
 # Locally calculated
-sha256  4f21ce186859516dcab9b3197f3e9533a9bd1b87932015c87f539af4a48cd592  LICENSE
+sha256  a7d6da3a202cdd38eaab0bcea4d25f60d002980f3785b3e896d9bf387f093ac8  LICENSE
diff --git a/package/dhcpcd/dhcpcd.mk b/package/dhcpcd/dhcpcd.mk
index 922d289b26..82efe10ef9 100644
--- a/package/dhcpcd/dhcpcd.mk
+++ b/package/dhcpcd/dhcpcd.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-DHCPCD_VERSION = 9.4.1
+DHCPCD_VERSION = 10.0.1
 DHCPCD_SOURCE = dhcpcd-$(DHCPCD_VERSION).tar.xz
-DHCPCD_SITE = http://roy.marples.name/downloads/dhcpcd
+DHCPCD_SITE = https://github.com/NetworkConfiguration/dhcpcd/releases/download/v$(DHCPCD_VERSION)
 DHCPCD_DEPENDENCIES = host-pkgconf
 DHCPCD_LICENSE = BSD-2-Clause
 DHCPCD_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
