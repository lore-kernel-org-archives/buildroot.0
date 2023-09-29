Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20206E728E2
	for <buildroot@archiver.kernel.org>; Fri, 29 Sep 2023 20:03:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CB56B813E8;
	Fri, 29 Sep 2023 20:03:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CB56B813E8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gv0MvjLsF5E0; Fri, 29 Sep 2023 20:03:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D23FF83DC7;
	Fri, 29 Sep 2023 20:03:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D23FF83DC7
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B3E731BF357
 for <buildroot@lists.busybox.net>; Fri, 29 Sep 2023 20:02:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 803AA60BB5
 for <buildroot@lists.busybox.net>; Fri, 29 Sep 2023 20:02:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 803AA60BB5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Mr02NCfDYHH9 for <buildroot@lists.busybox.net>;
 Fri, 29 Sep 2023 20:02:24 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id B705A60F17
 for <buildroot@buildroot.org>; Fri, 29 Sep 2023 20:02:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B705A60F17
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7691383608; Fri, 29 Sep 2023 20:02:24 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 29 Sep 2023 22:01:47 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0866d31e4fc39a0b38f2bac81232c910b56a0461
X-Git-Newrev: e83c9d51820d8cbcf3f33376286a77209166a9aa
X-Patchwork-Hint: ignore
Message-Id: <20230929200224.7691383608@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mali-driver: bump to version
 2023-09-29
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

commit: https://git.buildroot.net/buildroot/commit/?id=e83c9d51820d8cbcf3f33376286a77209166a9aa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

mali-driver now builds on Linux 6.5.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mali-driver/mali-driver.hash | 2 +-
 package/mali-driver/mali-driver.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mali-driver/mali-driver.hash b/package/mali-driver/mali-driver.hash
index f48450292d..ddde56b55c 100644
--- a/package/mali-driver/mali-driver.hash
+++ b/package/mali-driver/mali-driver.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  ba30a5bae498462c4e967564b3fd6e5cbc5f4a7f71bfe9d13091ac6b0504d749  mali-driver-9baa7331c8e5ba6075e3fc42c530ae7f4c320cad.tar.gz
+sha256  3111757a411ba216a4b8e3d88c29eb3be3182a7f0d5f8b9cfe10f85ec6693bc9  mali-driver-d40c57d81c9cf4bc6fefeaf47153fde8eed19ef2.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE
diff --git a/package/mali-driver/mali-driver.mk b/package/mali-driver/mali-driver.mk
index 3ab9b19f5f..fa5a8d94d9 100644
--- a/package/mali-driver/mali-driver.mk
+++ b/package/mali-driver/mali-driver.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MALI_DRIVER_VERSION = 9baa7331c8e5ba6075e3fc42c530ae7f4c320cad
+MALI_DRIVER_VERSION = d40c57d81c9cf4bc6fefeaf47153fde8eed19ef2
 MALI_DRIVER_SITE = $(call github,bootlin,mali-driver,$(MALI_DRIVER_VERSION))
 MALI_DRIVER_DEPENDENCIES = linux
 MALI_DRIVER_LICENSE = GPL-2.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
