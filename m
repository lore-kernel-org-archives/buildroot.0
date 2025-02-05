Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5549DC02192
	for <buildroot@archiver.kernel.org>; Wed,  5 Feb 2025 15:21:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 25E0683F2C;
	Wed,  5 Feb 2025 15:21:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CwxcnTF0bEol; Wed,  5 Feb 2025 15:21:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3E74683F1F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3E74683F1F;
	Wed,  5 Feb 2025 15:21:34 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 781E612A
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 15:21:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 72F344252D
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 15:21:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id o7P1ssOjdv6d for <buildroot@buildroot.org>;
 Wed,  5 Feb 2025 15:21:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 52D4F42527
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 52D4F42527
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 15:21:32 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 40531870B3; Wed,  5 Feb 2025 15:21:32 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 5 Feb 2025 16:20:52 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 315672feec151cf3a19eaf7f9932daa2c5d838ec
X-Git-Newrev: 7dbbd815f5d48e12f3aa634916b748d0b2fcb522
X-Patchwork-Hint: ignore
Message-Id: <20250205152132.40531870B3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/memtest86: bump version to 7.20
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=7dbbd815f5d48e12f3aa634916b748d0b2fcb522
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For change log since 6.20, see:
https://github.com/memtest86plus/memtest86plus/releases/tag/v7.20
https://github.com/memtest86plus/memtest86plus/releases/tag/v7.00

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/memtest86/memtest86.hash | 2 +-
 package/memtest86/memtest86.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/memtest86/memtest86.hash b/package/memtest86/memtest86.hash
index 695e6a234b..20d96dce95 100644
--- a/package/memtest86/memtest86.hash
+++ b/package/memtest86/memtest86.hash
@@ -1,3 +1,3 @@
 # locally computed using sha256sum
-sha256  463b2db66128e45c96be76136272e2ee940f1319804b1b88cc2ef04edccd01d8  memtest86-6.20.tar.gz
+sha256  8bad4b5788bc28e4dd1db78c9069bd0c65a4a6baf16409ab537c795bb04578b3  memtest86-7.20.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE
diff --git a/package/memtest86/memtest86.mk b/package/memtest86/memtest86.mk
index c0f85755fe..4f9c1b9a28 100644
--- a/package/memtest86/memtest86.mk
+++ b/package/memtest86/memtest86.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MEMTEST86_VERSION = 6.20
+MEMTEST86_VERSION = 7.20
 MEMTEST86_SITE = $(call github,memtest86plus,memtest86plus,v$(MEMTEST86_VERSION))
 MEMTEST86_LICENSE = GPL-2.0
 MEMTEST86_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
