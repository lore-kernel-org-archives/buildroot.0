Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72ADDC433EF
	for <buildroot@archiver.kernel.org>; Wed, 26 Jan 2022 21:44:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1D197417F2;
	Wed, 26 Jan 2022 21:44:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cSmpf-CtKRww; Wed, 26 Jan 2022 21:44:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6F8E5417EF;
	Wed, 26 Jan 2022 21:44:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E3A3D1BF9B9
 for <buildroot@lists.busybox.net>; Wed, 26 Jan 2022 21:44:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D177E60FF1
 for <buildroot@lists.busybox.net>; Wed, 26 Jan 2022 21:44:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 82yG-z1et90T for <buildroot@lists.busybox.net>;
 Wed, 26 Jan 2022 21:44:40 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3138F60FEF
 for <buildroot@buildroot.org>; Wed, 26 Jan 2022 21:44:40 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id B8F728291D; Wed, 26 Jan 2022 21:37:46 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Wed, 26 Jan 2022 22:29:49 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 70d1858353029d4a45e5f0d4a705b07837736c21
X-Git-Newrev: 436983e0a3c075c2d8ea417c61e58b295323d15b
X-Patchwork-Hint: ignore
Message-Id: <20220126213746.B8F728291D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gocryptfs: bump to version 2.2.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=436983e0a3c075c2d8ea417c61e58b295323d15b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Christian Stewart <christian@paral.in>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/gocryptfs/gocryptfs.hash | 2 +-
 package/gocryptfs/gocryptfs.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/gocryptfs/gocryptfs.hash b/package/gocryptfs/gocryptfs.hash
index 94487815f5..ae161d1cd8 100644
--- a/package/gocryptfs/gocryptfs.hash
+++ b/package/gocryptfs/gocryptfs.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  4d89b76fe0b0c7218099f6f0ea6c1c87efe13927d95579a6ede82f20b6dbe48a  gocryptfs-2.2.0.tar.gz
+sha256  88f32bb8e18fa89e4ab666f7c8ad622281a11e423b4093e50ac260f960bc40b6  gocryptfs-2.2.1.tar.gz
 sha256  322a7e3b02cf18e38b7e6b18cafefb773df8676c65634b34e8a2beb931294a4b  LICENSE
diff --git a/package/gocryptfs/gocryptfs.mk b/package/gocryptfs/gocryptfs.mk
index 2a00e9a959..8f70dba7c3 100644
--- a/package/gocryptfs/gocryptfs.mk
+++ b/package/gocryptfs/gocryptfs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GOCRYPTFS_VERSION = 2.2.0
+GOCRYPTFS_VERSION = 2.2.1
 GOCRYPTFS_SITE = $(call github,rfjakob,gocryptfs,v$(GOCRYPTFS_VERSION))
 GOCRYPTFS_LICENSE = MIT
 GOCRYPTFS_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
