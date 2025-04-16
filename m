Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66577C369C7
	for <buildroot@archiver.kernel.org>; Wed, 16 Apr 2025 21:48:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3A5F16FBCD;
	Wed, 16 Apr 2025 21:48:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id L0iq-YPhTJIZ; Wed, 16 Apr 2025 21:48:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7B5716FBDC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7B5716FBDC;
	Wed, 16 Apr 2025 21:48:41 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id DB6E920E6
 for <buildroot@buildroot.org>; Wed, 16 Apr 2025 21:48:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CC87061AB2
 for <buildroot@buildroot.org>; Wed, 16 Apr 2025 21:48:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WB8Jb4KooRbq for <buildroot@buildroot.org>;
 Wed, 16 Apr 2025 21:48:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1A2B1611F6
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1A2B1611F6
 for <buildroot@buildroot.org>; Wed, 16 Apr 2025 21:48:22 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CF602856CA; Wed, 16 Apr 2025 21:48:22 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 16 Apr 2025 10:51:12 +0200
X-Git-Refname: refs/heads/2024.11.x
X-Git-Oldrev: 3e10b465be6bddf6903dc04d8c6226f0d6146e84
X-Git-Newrev: 553b89d8952a1dd4c82c85feb332fa9aa8f7012a
X-Patchwork-Hint: ignore
Message-Id: <20250416214822.CF602856CA@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.11.x] package/mali-driver: bump
 to version 2025-04-06
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=553b89d8952a1dd4c82c85feb332fa9aa8f7012a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.11.x

This version builds up to Linux version 6.13.

Fixes:
https://autobuild.buildroot.org/results/e71/e71a5b46affe5948c16a0c83534d8f56f69b6e91/
Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 9e7e255a09eb6175d9d085e5cbae63ef4ea08e0f)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/mali-driver/mali-driver.hash | 2 +-
 package/mali-driver/mali-driver.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mali-driver/mali-driver.hash b/package/mali-driver/mali-driver.hash
index ddde56b55c..bc406e270f 100644
--- a/package/mali-driver/mali-driver.hash
+++ b/package/mali-driver/mali-driver.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  3111757a411ba216a4b8e3d88c29eb3be3182a7f0d5f8b9cfe10f85ec6693bc9  mali-driver-d40c57d81c9cf4bc6fefeaf47153fde8eed19ef2.tar.gz
+sha256  c1a9ad5dfa0d4b7978a1a6dd02d7eabd4bc65e7d6a06eda749cae720749a741c  mali-driver-4f5282b305cb0956fe2485c9e9dab0021d5538f6.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE
diff --git a/package/mali-driver/mali-driver.mk b/package/mali-driver/mali-driver.mk
index fa5a8d94d9..ccb56de81f 100644
--- a/package/mali-driver/mali-driver.mk
+++ b/package/mali-driver/mali-driver.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MALI_DRIVER_VERSION = d40c57d81c9cf4bc6fefeaf47153fde8eed19ef2
+MALI_DRIVER_VERSION = 4f5282b305cb0956fe2485c9e9dab0021d5538f6
 MALI_DRIVER_SITE = $(call github,bootlin,mali-driver,$(MALI_DRIVER_VERSION))
 MALI_DRIVER_DEPENDENCIES = linux
 MALI_DRIVER_LICENSE = GPL-2.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
