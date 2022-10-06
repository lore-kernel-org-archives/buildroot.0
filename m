Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2645DC433F5
	for <buildroot@archiver.kernel.org>; Thu,  6 Oct 2022 18:46:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A1270610AA;
	Thu,  6 Oct 2022 18:46:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A1270610AA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kk-71-uw_OgV; Thu,  6 Oct 2022 18:46:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CB7FC60F71;
	Thu,  6 Oct 2022 18:46:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CB7FC60F71
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1D3481C2744
 for <buildroot@lists.busybox.net>; Thu,  6 Oct 2022 18:46:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D442060E86
 for <buildroot@lists.busybox.net>; Thu,  6 Oct 2022 18:46:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D442060E86
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id i3NIrTVIbVIE for <buildroot@lists.busybox.net>;
 Thu,  6 Oct 2022 18:46:36 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0CA0860F71
 for <buildroot@buildroot.org>; Thu,  6 Oct 2022 18:46:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0CA0860F71
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EE7DD869A5; Thu,  6 Oct 2022 18:46:35 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 6 Oct 2022 20:43:25 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 343974b99528702842e8c1dad945fcd4f0defd6c
X-Git-Newrev: a9a0a0843e419a2842c1377217d7e2ac9c47d416
X-Patchwork-Hint: ignore
Message-Id: <20221006184635.EE7DD869A5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/zfs: bump version to 2.1.6
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
Content-Type: multipart/mixed; boundary="===============0146141967080840830=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0146141967080840830==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=a9a0a0843e419a2842c1377217d7e2ac9c47d416
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: José Luis Salvador Rufo <salvador.joseluis@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/zfs/zfs.hash | 4 ++--
 package/zfs/zfs.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/zfs/zfs.hash b/package/zfs/zfs.hash
index 411af974c6..b73fc3b703 100644
--- a/package/zfs/zfs.hash
+++ b/package/zfs/zfs.hash
@@ -1,5 +1,5 @@
-# From https://github.com/openzfs/zfs/releases/download/zfs-2.1.4/zfs-2.1.4.sha256.asc
-sha256  3b52c0d493f806f638dca87dde809f53861cd318c1ebb0e60daeaa061cf1acf6  zfs-2.1.4.tar.gz
+# From https://github.com/openzfs/zfs/releases/download/zfs-2.1.6/zfs-2.1.6.sha256.asc
+sha256  15339014f8d2131348eb937bf8893849806b6d2645ea607a18c7f117749dbd7a  zfs-2.1.6.tar.gz
 sha256  96a27353fe717ff2c8b95deb8b009c4eb750303c6400e2d8a2582ab1ec12b25a  bc3f12bfac152a0c28951cec92340ba14f9ccee9.patch
 
 # Hash for license files:
diff --git a/package/zfs/zfs.mk b/package/zfs/zfs.mk
index 900a72f997..f7e673c23f 100644
--- a/package/zfs/zfs.mk
+++ b/package/zfs/zfs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ZFS_VERSION = 2.1.4
+ZFS_VERSION = 2.1.6
 ZFS_SITE = https://github.com/openzfs/zfs/releases/download/zfs-$(ZFS_VERSION)
 ZFS_PATCH = https://github.com/openzfs/zfs/commit/bc3f12bfac152a0c28951cec92340ba14f9ccee9.patch
 ZFS_LICENSE = CDDL

--===============0146141967080840830==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0146141967080840830==--
