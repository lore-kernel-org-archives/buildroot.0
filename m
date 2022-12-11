Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D49DFC4332F
	for <buildroot@archiver.kernel.org>; Sun, 11 Dec 2022 10:38:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 67C57607C1;
	Sun, 11 Dec 2022 10:38:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 67C57607C1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ntJAckR_ZpFb; Sun, 11 Dec 2022 10:38:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id AB6EB60777;
	Sun, 11 Dec 2022 10:38:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AB6EB60777
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 98ECB1BF2A5
 for <buildroot@lists.busybox.net>; Sun, 11 Dec 2022 10:38:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7FA28408F8
 for <buildroot@lists.busybox.net>; Sun, 11 Dec 2022 10:38:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7FA28408F8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6U_-Q4eoDpqv for <buildroot@lists.busybox.net>;
 Sun, 11 Dec 2022 10:38:27 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 781AA408F5
 for <buildroot@buildroot.org>; Sun, 11 Dec 2022 10:38:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 781AA408F5
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 65EC58601A; Sun, 11 Dec 2022 10:38:27 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 11 Dec 2022 11:36:43 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1576b09b5c52b746256ca5b4b313eab9bf068b09
X-Git-Newrev: 498b9c294239d4684641df5ee60e169a4ed85383
X-Patchwork-Hint: ignore
Message-Id: <20221211103827.65EC58601A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/fuse-overlayfs: bump to version
 1.10
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

commit: https://git.buildroot.net/buildroot/commit/?id=498b9c294239d4684641df5ee60e169a4ed85383
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Contains various bugfixes.

https://github.com/containers/fuse-overlayfs/releases/tag/v1.10

Signed-off-by: Christian Stewart <christian@paral.in>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/fuse-overlayfs/fuse-overlayfs.hash | 2 +-
 package/fuse-overlayfs/fuse-overlayfs.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/fuse-overlayfs/fuse-overlayfs.hash b/package/fuse-overlayfs/fuse-overlayfs.hash
index f9473c154a..aa5438755e 100644
--- a/package/fuse-overlayfs/fuse-overlayfs.hash
+++ b/package/fuse-overlayfs/fuse-overlayfs.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256  6c81b65b71067b303aaa9871f512c2cabc23e2b793f19c6c854d01a492b5a923  fuse-overlayfs-1.5.0.tar.gz
+sha256  4351eaed7cf26a5012c14c6e0fc883ef65a7b5dcc95ba129ce485904106c25a9  fuse-overlayfs-1.10.tar.gz
 # Locally computed
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/fuse-overlayfs/fuse-overlayfs.mk b/package/fuse-overlayfs/fuse-overlayfs.mk
index 0ad7dbc51d..1633d3bd41 100644
--- a/package/fuse-overlayfs/fuse-overlayfs.mk
+++ b/package/fuse-overlayfs/fuse-overlayfs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FUSE_OVERLAYFS_VERSION = 1.5.0
+FUSE_OVERLAYFS_VERSION = 1.10
 FUSE_OVERLAYFS_SITE = $(call github,containers,fuse-overlayfs,v$(FUSE_OVERLAYFS_VERSION))
 FUSE_OVERLAYFS_LICENSE = GPL-3.0
 FUSE_OVERLAYFS_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
