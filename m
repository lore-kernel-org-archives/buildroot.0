Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AB12C77B6C
	for <buildroot@archiver.kernel.org>; Wed,  5 Apr 2023 21:16:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 220C941735;
	Wed,  5 Apr 2023 21:16:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 220C941735
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xXGQeLC4cDz8; Wed,  5 Apr 2023 21:16:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 18C5A415E4;
	Wed,  5 Apr 2023 21:16:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 18C5A415E4
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BBA111C2BD0
 for <buildroot@lists.busybox.net>; Wed,  5 Apr 2023 21:16:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A24B64052F
 for <buildroot@lists.busybox.net>; Wed,  5 Apr 2023 21:16:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A24B64052F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6TylTt4Q-DhE for <buildroot@lists.busybox.net>;
 Wed,  5 Apr 2023 21:16:11 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id DFFCD405EB
 for <buildroot@buildroot.org>; Wed,  5 Apr 2023 21:16:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DFFCD405EB
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CEA5B8396D; Wed,  5 Apr 2023 21:16:10 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 5 Apr 2023 23:14:13 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: cbf89eb4e44fa3bd6bfdfe5284cbc8f2b39f34b7
X-Git-Newrev: 00709af66ec7056ff76a6238f22985cfa0bcc3a6
X-Patchwork-Hint: ignore
Message-Id: <20230405211610.CEA5B8396D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/squashfs: bump to version 4.6.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=00709af66ec7056ff76a6238f22985cfa0bcc3a6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/squashfs/squashfs.hash | 2 +-
 package/squashfs/squashfs.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/squashfs/squashfs.hash b/package/squashfs/squashfs.hash
index 13d5aed71f..bc45b4ab5e 100644
--- a/package/squashfs/squashfs.hash
+++ b/package/squashfs/squashfs.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256  277b6e7f75a4a57f72191295ae62766a10d627a4f5e5f19eadfbc861378deea7  squashfs-4.5.1.tar.gz
+sha256  94201754b36121a9f022a190c75f718441df15402df32c2b520ca331a107511c  squashfs-4.6.1.tar.gz
 
 # License files
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/squashfs/squashfs.mk b/package/squashfs/squashfs.mk
index 323908d94e..082104b6d4 100644
--- a/package/squashfs/squashfs.mk
+++ b/package/squashfs/squashfs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SQUASHFS_VERSION = 4.5.1
+SQUASHFS_VERSION = 4.6.1
 SQUASHFS_SITE = $(call github,plougher,squashfs-tools,$(SQUASHFS_VERSION))
 SQUASHFS_LICENSE = GPL-2.0+
 SQUASHFS_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
