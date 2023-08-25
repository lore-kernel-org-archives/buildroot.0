Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FF9CC71133
	for <buildroot@archiver.kernel.org>; Fri, 25 Aug 2023 13:13:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 526786147D;
	Fri, 25 Aug 2023 13:13:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 526786147D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7WoRwR_KsiuC; Fri, 25 Aug 2023 13:13:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9EFEF61474;
	Fri, 25 Aug 2023 13:13:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9EFEF61474
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 25FC21BF995
 for <buildroot@lists.busybox.net>; Fri, 25 Aug 2023 13:12:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A6827607C7
 for <buildroot@lists.busybox.net>; Fri, 25 Aug 2023 13:12:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A6827607C7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lVBx3BYvApsV for <buildroot@lists.busybox.net>;
 Fri, 25 Aug 2023 13:12:43 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id D05AB6143C
 for <buildroot@buildroot.org>; Fri, 25 Aug 2023 13:12:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D05AB6143C
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C0351862F7; Fri, 25 Aug 2023 13:12:43 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 25 Aug 2023 15:10:50 +0200
X-Git-Refname: refs/heads/2023.05.x
X-Git-Oldrev: 3304de4e818d407429bc01422adc928cc9123040
X-Git-Newrev: 3782ce82913ab50ce250f56590e22c7b5cd5c3f5
X-Patchwork-Hint: ignore
Message-Id: <20230825131243.C0351862F7@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.05.x] package/mali-driver: bump
 version to 2023-07-10
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

commit: https://git.buildroot.net/buildroot/commit/?id=3782ce82913ab50ce250f56590e22c7b5cd5c3f5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.05.x

This version fixes build failure with Linux 6.2 and 6.3

Fixes:
http://autobuild.buildroot.net/results/0c043a6978fc5ea51b2c7a862de288223589926e/

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit f738d70bda9d9f57aa511c539bfc9ab1d9b43125)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mali-driver/mali-driver.hash | 2 +-
 package/mali-driver/mali-driver.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mali-driver/mali-driver.hash b/package/mali-driver/mali-driver.hash
index de3b6e69f0..f48450292d 100644
--- a/package/mali-driver/mali-driver.hash
+++ b/package/mali-driver/mali-driver.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  763d3cf76eb03584df6a13986a2877dc0ae5f310fc3d91e8a498fc5f89271dcc  mali-driver-c90627f78d58567a2acb7cbf77d565e03a131294.tar.gz
+sha256  ba30a5bae498462c4e967564b3fd6e5cbc5f4a7f71bfe9d13091ac6b0504d749  mali-driver-9baa7331c8e5ba6075e3fc42c530ae7f4c320cad.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE
diff --git a/package/mali-driver/mali-driver.mk b/package/mali-driver/mali-driver.mk
index 8e059fe8bd..3ab9b19f5f 100644
--- a/package/mali-driver/mali-driver.mk
+++ b/package/mali-driver/mali-driver.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MALI_DRIVER_VERSION = c90627f78d58567a2acb7cbf77d565e03a131294
+MALI_DRIVER_VERSION = 9baa7331c8e5ba6075e3fc42c530ae7f4c320cad
 MALI_DRIVER_SITE = $(call github,bootlin,mali-driver,$(MALI_DRIVER_VERSION))
 MALI_DRIVER_DEPENDENCIES = linux
 MALI_DRIVER_LICENSE = GPL-2.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
