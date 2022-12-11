Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82F5CC61DA3
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 22:52:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 26C03410CA;
	Mon, 20 Feb 2023 22:52:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 26C03410CA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id etUWYVBNds31; Mon, 20 Feb 2023 22:52:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E42734F3B4;
	Mon, 20 Feb 2023 22:52:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E42734F3B4
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E54AE1BF2E3
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:56:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AA14961293
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AA14961293
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FZqkXOY0985o for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:08 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id D80AA61288
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D80AA61288
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D3D938648F; Mon, 20 Feb 2023 20:52:08 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 11 Dec 2022 21:19:48 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: b54e0dde3009cb859ff93a704a068d4fd162a035
X-Git-Newrev: 6ba57676c52a41f9f2efa311f101eb637c39897b
X-Patchwork-Hint: ignore
Message-Id: <20230220205208.D3D938648F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/zfs: bump version to
 2.1.7
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
Content-Type: multipart/mixed; boundary="===============1421681165933652373=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1421681165933652373==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=6ba57676c52a41f9f2efa311f101eb637c39897b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: José Luis Salvador Rufo <salvador.joseluis@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/zfs/zfs.hash | 4 ++--
 package/zfs/zfs.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/zfs/zfs.hash b/package/zfs/zfs.hash
index b73fc3b703..0bce3817fe 100644
--- a/package/zfs/zfs.hash
+++ b/package/zfs/zfs.hash
@@ -1,5 +1,5 @@
-# From https://github.com/openzfs/zfs/releases/download/zfs-2.1.6/zfs-2.1.6.sha256.asc
-sha256  15339014f8d2131348eb937bf8893849806b6d2645ea607a18c7f117749dbd7a  zfs-2.1.6.tar.gz
+# From https://github.com/openzfs/zfs/releases/download/zfs-2.1.7/zfs-2.1.7.sha256.asc
+sha256  6462e63e185de6ff10c64ffa6ed773201a082f9dd13e603d7e8136fcb4aca71b  zfs-2.1.7.tar.gz
 sha256  96a27353fe717ff2c8b95deb8b009c4eb750303c6400e2d8a2582ab1ec12b25a  bc3f12bfac152a0c28951cec92340ba14f9ccee9.patch
 
 # Hash for license files:
diff --git a/package/zfs/zfs.mk b/package/zfs/zfs.mk
index f7e673c23f..84e9099ba9 100644
--- a/package/zfs/zfs.mk
+++ b/package/zfs/zfs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ZFS_VERSION = 2.1.6
+ZFS_VERSION = 2.1.7
 ZFS_SITE = https://github.com/openzfs/zfs/releases/download/zfs-$(ZFS_VERSION)
 ZFS_PATCH = https://github.com/openzfs/zfs/commit/bc3f12bfac152a0c28951cec92340ba14f9ccee9.patch
 ZFS_LICENSE = CDDL

--===============1421681165933652373==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1421681165933652373==--
