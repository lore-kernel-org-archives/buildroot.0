Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EBB1ECAAA1
	for <buildroot@archiver.kernel.org>; Sun, 30 Oct 2022 21:25:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1532040153;
	Sun, 30 Oct 2022 21:25:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1532040153
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4MrVcrkMxhnG; Sun, 30 Oct 2022 21:25:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4103E400FD;
	Sun, 30 Oct 2022 21:25:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4103E400FD
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 002CB1BF315
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 21:25:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CF351401DA
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 21:25:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CF351401DA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VZsVACkOfmwF for <buildroot@lists.busybox.net>;
 Sun, 30 Oct 2022 21:25:05 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id E49704012F
 for <buildroot@buildroot.org>; Sun, 30 Oct 2022 21:25:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E49704012F
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CE84687699; Sun, 30 Oct 2022 21:25:04 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 30 Oct 2022 22:24:54 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b123e8887dc29eb2764162c048e8521a4072531a
X-Git-Newrev: dce3617ada3ed2a1eabab2d1dc2ed0b83bdbe536
X-Patchwork-Hint: ignore
Message-Id: <20221030212504.CE84687699@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/sunxi-mali-utgard-driver: bump
 version to fix building with Linux 6.0.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=dce3617ada3ed2a1eabab2d1dc2ed0b83bdbe536
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/sunxi-mali-utgard-driver/sunxi-mali-utgard-driver.hash | 2 +-
 package/sunxi-mali-utgard-driver/sunxi-mali-utgard-driver.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/sunxi-mali-utgard-driver/sunxi-mali-utgard-driver.hash b/package/sunxi-mali-utgard-driver/sunxi-mali-utgard-driver.hash
index ac6587b27a..fd874f1f0a 100644
--- a/package/sunxi-mali-utgard-driver/sunxi-mali-utgard-driver.hash
+++ b/package/sunxi-mali-utgard-driver/sunxi-mali-utgard-driver.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  64f15a8c7d383ac92230ef82711507a7f3a309462999f6694863fbbb4f12e0be  sunxi-mali-utgard-driver-c4cf7aabed25e0fd27159564caf588a37016870d.tar.gz
+sha256  4b66f20272c63ce8ea769bf1c95f9923ed6facabe0c14a8c7644b302b9f23b58  sunxi-mali-utgard-driver-73a80d550f2f181b5fc7fc2d859e15d077d845e4.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE
diff --git a/package/sunxi-mali-utgard-driver/sunxi-mali-utgard-driver.mk b/package/sunxi-mali-utgard-driver/sunxi-mali-utgard-driver.mk
index 594a770e61..15d660e49d 100644
--- a/package/sunxi-mali-utgard-driver/sunxi-mali-utgard-driver.mk
+++ b/package/sunxi-mali-utgard-driver/sunxi-mali-utgard-driver.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SUNXI_MALI_UTGARD_DRIVER_VERSION = c4cf7aabed25e0fd27159564caf588a37016870d
+SUNXI_MALI_UTGARD_DRIVER_VERSION = 73a80d550f2f181b5fc7fc2d859e15d077d845e4
 SUNXI_MALI_UTGARD_DRIVER_SITE = $(call github,giuliobenetti,sunxi-mali,$(SUNXI_MALI_UTGARD_DRIVER_VERSION))
 SUNXI_MALI_UTGARD_DRIVER_DEPENDENCIES = linux
 SUNXI_MALI_UTGARD_DRIVER_LICENSE = GPL-2.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
