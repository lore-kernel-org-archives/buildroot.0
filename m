Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD0C0C3DA6F
	for <buildroot@archiver.kernel.org>; Fri, 25 Aug 2023 16:25:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 96B5883C8E;
	Fri, 25 Aug 2023 16:25:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 96B5883C8E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Q_cl4udqOIz3; Fri, 25 Aug 2023 16:25:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E42C283C90;
	Fri, 25 Aug 2023 16:25:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E42C283C90
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id F27591BF2CB
 for <buildroot@lists.busybox.net>; Fri, 25 Aug 2023 16:25:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CA7AE83C90
 for <buildroot@lists.busybox.net>; Fri, 25 Aug 2023 16:25:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CA7AE83C90
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uEGPcgPCr0wa for <buildroot@lists.busybox.net>;
 Fri, 25 Aug 2023 16:25:06 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 08F8183C8E
 for <buildroot@buildroot.org>; Fri, 25 Aug 2023 16:25:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 08F8183C8E
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EC6C68634C; Fri, 25 Aug 2023 16:25:05 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 25 Aug 2023 18:21:48 +0200
X-Git-Refname: refs/heads/2023.05.x
X-Git-Oldrev: 7821b1e64bfe3a68e50ed404a0f5a6f4b0bf2584
X-Git-Newrev: 9eef1ed9f17017cea5e5b346e1c8c7fff5319c49
X-Patchwork-Hint: ignore
Message-Id: <20230825162505.EC6C68634C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.05.x]
 package/sunxi-mali-utgard-driver: bump to version 2023-07-13
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

commit: https://git.buildroot.net/buildroot/commit/?id=9eef1ed9f17017cea5e5b346e1c8c7fff5319c49
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.05.x

With this patch Linux 6.3 is supported.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 636264541fa14640989f308b0a5d2490c3c26e29)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/sunxi-mali-utgard-driver/sunxi-mali-utgard-driver.hash | 2 +-
 package/sunxi-mali-utgard-driver/sunxi-mali-utgard-driver.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/sunxi-mali-utgard-driver/sunxi-mali-utgard-driver.hash b/package/sunxi-mali-utgard-driver/sunxi-mali-utgard-driver.hash
index fd874f1f0a..be27a85970 100644
--- a/package/sunxi-mali-utgard-driver/sunxi-mali-utgard-driver.hash
+++ b/package/sunxi-mali-utgard-driver/sunxi-mali-utgard-driver.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  4b66f20272c63ce8ea769bf1c95f9923ed6facabe0c14a8c7644b302b9f23b58  sunxi-mali-utgard-driver-73a80d550f2f181b5fc7fc2d859e15d077d845e4.tar.gz
+sha256  f2e5e671575d9488fd19b821d70e59952b6dbbb5b2036ea5462f811eec819370  sunxi-mali-utgard-driver-c4bc3e229c0e5f30c24c20ff1fb8db0e4a450c0f.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE
diff --git a/package/sunxi-mali-utgard-driver/sunxi-mali-utgard-driver.mk b/package/sunxi-mali-utgard-driver/sunxi-mali-utgard-driver.mk
index 15d660e49d..72fade58ed 100644
--- a/package/sunxi-mali-utgard-driver/sunxi-mali-utgard-driver.mk
+++ b/package/sunxi-mali-utgard-driver/sunxi-mali-utgard-driver.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SUNXI_MALI_UTGARD_DRIVER_VERSION = 73a80d550f2f181b5fc7fc2d859e15d077d845e4
+SUNXI_MALI_UTGARD_DRIVER_VERSION = c4bc3e229c0e5f30c24c20ff1fb8db0e4a450c0f
 SUNXI_MALI_UTGARD_DRIVER_SITE = $(call github,giuliobenetti,sunxi-mali,$(SUNXI_MALI_UTGARD_DRIVER_VERSION))
 SUNXI_MALI_UTGARD_DRIVER_DEPENDENCIES = linux
 SUNXI_MALI_UTGARD_DRIVER_LICENSE = GPL-2.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
