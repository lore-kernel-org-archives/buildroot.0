Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7311CD1288
	for <buildroot@archiver.kernel.org>; Mon,  1 Apr 2024 13:17:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A6A20400DC;
	Mon,  1 Apr 2024 13:17:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BiXUoxBj8MPD; Mon,  1 Apr 2024 13:17:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C5B4640181
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C5B4640181;
	Mon,  1 Apr 2024 13:17:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C0FDF1BF34F
 for <buildroot@lists.busybox.net>; Mon,  1 Apr 2024 13:17:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BA84481E7F
 for <buildroot@lists.busybox.net>; Mon,  1 Apr 2024 13:17:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SvaHVVCnAHYM for <buildroot@lists.busybox.net>;
 Mon,  1 Apr 2024 13:17:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F2E1381E5F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id F2E1381E5F
 for <buildroot@buildroot.org>; Mon,  1 Apr 2024 13:17:14 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E9B3784538; Mon,  1 Apr 2024 13:17:14 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Mon, 1 Apr 2024 15:12:10 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 300917542d97062a94354080fe6135155c46f256
X-Git-Newrev: 6748b4d35f37d2466c6b571b813f542d291c08ef
X-Patchwork-Hint: ignore
Message-Id: <20240401131714.E9B3784538@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/fuse-overlayfs: bump version to
 v1.13
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

commit: https://git.buildroot.net/buildroot/commit/?id=6748b4d35f37d2466c6b571b813f542d291c08ef
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Updated hash for COPYING.

The license changed to GPL-2.0+ in v1.12

https://github.com/containers/fuse-overlayfs/releases/tag/v1.13

Signed-off-by: Christian Stewart <christian@aperture.us>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/fuse-overlayfs/fuse-overlayfs.hash | 4 ++--
 package/fuse-overlayfs/fuse-overlayfs.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/fuse-overlayfs/fuse-overlayfs.hash b/package/fuse-overlayfs/fuse-overlayfs.hash
index b8df6c88a5..f1a326c82e 100644
--- a/package/fuse-overlayfs/fuse-overlayfs.hash
+++ b/package/fuse-overlayfs/fuse-overlayfs.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256  320a411425414679736dcb7f3b05146430ca4af20ded0096c69ac3c7540ebca2  fuse-overlayfs-1.11.tar.gz
+sha256  96d10344921d5796bcba7a38580ae14a53c4e60399bb90b238ac5a10b3bb65b2  fuse-overlayfs-1.13.tar.gz
 # Locally computed
-sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/fuse-overlayfs/fuse-overlayfs.mk b/package/fuse-overlayfs/fuse-overlayfs.mk
index 4db2ccd7d5..2aa208d554 100644
--- a/package/fuse-overlayfs/fuse-overlayfs.mk
+++ b/package/fuse-overlayfs/fuse-overlayfs.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-FUSE_OVERLAYFS_VERSION = 1.11
+FUSE_OVERLAYFS_VERSION = 1.13
 FUSE_OVERLAYFS_SITE = $(call github,containers,fuse-overlayfs,v$(FUSE_OVERLAYFS_VERSION))
-FUSE_OVERLAYFS_LICENSE = GPL-3.0
+FUSE_OVERLAYFS_LICENSE = GPL-2.0+
 FUSE_OVERLAYFS_LICENSE_FILES = COPYING
 
 FUSE_OVERLAYFS_AUTORECONF = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
