Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 222AEC3ABC9
	for <buildroot@archiver.kernel.org>; Fri, 16 May 2025 11:22:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E279C41992;
	Fri, 16 May 2025 11:22:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KJh5eFMHjOkY; Fri, 16 May 2025 11:22:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 162C941DB0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 162C941DB0;
	Fri, 16 May 2025 11:22:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 24F8C1C7
 for <buildroot@buildroot.org>; Fri, 16 May 2025 11:22:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 932F38128D
 for <buildroot@buildroot.org>; Fri, 16 May 2025 11:21:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id saqQcCt7jnNu for <buildroot@buildroot.org>;
 Fri, 16 May 2025 11:21:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9665081301
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9665081301
 for <buildroot@buildroot.org>; Fri, 16 May 2025 11:21:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 940C181063; Fri, 16 May 2025 11:21:54 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 14 May 2025 21:03:33 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 5ca8d709073459225b48140238ac740eeecb5d3f
X-Git-Newrev: 41f8b8daa30604c96ea904d932d54ea868bcc804
X-Patchwork-Hint: ignore
Message-Id: <20250516112154.940C181063@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x]
 package/sunxi-mali-utgard-driver: bump to version 2025-05-02
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

commit: https://git.buildroot.net/buildroot/commit/?id=41f8b8daa30604c96ea904d932d54ea868bcc804
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

It builds up to Linux 6.13

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 50c7542326aed41fc558fc7b4969ea747861f7bb)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/sunxi-mali-utgard-driver/sunxi-mali-utgard-driver.hash | 2 +-
 package/sunxi-mali-utgard-driver/sunxi-mali-utgard-driver.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/sunxi-mali-utgard-driver/sunxi-mali-utgard-driver.hash b/package/sunxi-mali-utgard-driver/sunxi-mali-utgard-driver.hash
index 5f3e001325..b8f96ae1b3 100644
--- a/package/sunxi-mali-utgard-driver/sunxi-mali-utgard-driver.hash
+++ b/package/sunxi-mali-utgard-driver/sunxi-mali-utgard-driver.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  151a56eb6a47efee19369a1c08b7aec506e48f983683a3cd05c5494cedf0fb69  sunxi-mali-utgard-driver-ad7e98bc1e81c7ac9c897f854c1a429d33e45d58.tar.gz
+sha256  ce73be1fb5f5d24f0e66516623db0b51c45adb30d845bfa8cb78aed9b6d8913f  sunxi-mali-utgard-driver-9926236a20904ecfca68f3365657c11f92695546.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE
diff --git a/package/sunxi-mali-utgard-driver/sunxi-mali-utgard-driver.mk b/package/sunxi-mali-utgard-driver/sunxi-mali-utgard-driver.mk
index ba7c50718d..9c68285256 100644
--- a/package/sunxi-mali-utgard-driver/sunxi-mali-utgard-driver.mk
+++ b/package/sunxi-mali-utgard-driver/sunxi-mali-utgard-driver.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SUNXI_MALI_UTGARD_DRIVER_VERSION = ad7e98bc1e81c7ac9c897f854c1a429d33e45d58
+SUNXI_MALI_UTGARD_DRIVER_VERSION = 9926236a20904ecfca68f3365657c11f92695546
 SUNXI_MALI_UTGARD_DRIVER_SITE = $(call github,giuliobenetti,sunxi-mali,$(SUNXI_MALI_UTGARD_DRIVER_VERSION))
 SUNXI_MALI_UTGARD_DRIVER_DEPENDENCIES = linux
 SUNXI_MALI_UTGARD_DRIVER_LICENSE = GPL-2.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
