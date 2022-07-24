Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 901E9C43334
	for <buildroot@archiver.kernel.org>; Sun, 24 Jul 2022 19:56:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 37836405CD;
	Sun, 24 Jul 2022 19:56:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 37836405CD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id H7qOdwqVGqWg; Sun, 24 Jul 2022 19:56:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4271B40441;
	Sun, 24 Jul 2022 19:56:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4271B40441
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1EC181BF982
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 19:55:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E45B24177F
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 19:55:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E45B24177F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oU84IotCHipu for <buildroot@lists.busybox.net>;
 Sun, 24 Jul 2022 19:55:31 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id DB62C4174A
 for <buildroot@buildroot.org>; Sun, 24 Jul 2022 19:55:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DB62C4174A
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 1536885CCA; Sun, 24 Jul 2022 19:41:52 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sun, 24 Jul 2022 21:44:28 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b460f31f3e54f06d7edf1fdb8fdf758e5eca3c40
X-Git-Newrev: dba2095a821ab1fa518f0b8400eda3b38aa7c8d8
X-Patchwork-Hint: ignore
Message-Id: <20220724194152.1536885CCA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/x11r7/xapp_xfs: bump version to
 1.2.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=dba2095a821ab1fa518f0b8400eda3b38aa7c8d8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/x11r7/xapp_xfs/xapp_xfs.hash | 10 ++++------
 package/x11r7/xapp_xfs/xapp_xfs.mk   |  6 +++---
 2 files changed, 7 insertions(+), 9 deletions(-)

diff --git a/package/x11r7/xapp_xfs/xapp_xfs.hash b/package/x11r7/xapp_xfs/xapp_xfs.hash
index 22ec25a1b4..ed802f86a0 100644
--- a/package/x11r7/xapp_xfs/xapp_xfs.hash
+++ b/package/x11r7/xapp_xfs/xapp_xfs.hash
@@ -1,7 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2017-November/002826.html
-md5  b4d2e644bfb35cae8858d2411501b07e  xfs-1.2.0.tar.bz2
-sha1 00848fcc2915ed8b00e75ac311c4727327324f57  xfs-1.2.0.tar.bz2
-sha256 db2212115783498f8eeaaee1349461d6c4e9d2005e142bacd3a984fe57269860  xfs-1.2.0.tar.bz2
-sha512 557b08aa07919239ce345d60b288b886640200bb1a59649fc890c3ccaa8559cc6745189614e696ab1b390ec024b393be5493787b7b0d2b3545b342d743c2e0ef  xfs-1.2.0.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2022-July/003175.html
+sha256  3d8ac3e8add7eeb1dc199dff6c59f90a2dbe7aa4332c1e12192350f2cda1c1e6  xfs-1.2.1.tar.xz
+sha512  0f8b019e0d922b3d859110154e0ec58493f66507f9787cd41a6c03ad7a05b3293f088f1004e4aaa81e017a524c06d23915669f91ed5e1c2679b33c43de15e70d  xfs-1.2.1.tar.xz
 # Locally computed
-sha256 0314ea37f40eff3c9ffe44b3924b2a768422f006a754e8286bfd1c73203d225e  COPYING
+sha256  0314ea37f40eff3c9ffe44b3924b2a768422f006a754e8286bfd1c73203d225e  COPYING
diff --git a/package/x11r7/xapp_xfs/xapp_xfs.mk b/package/x11r7/xapp_xfs/xapp_xfs.mk
index 9177a65b9c..50a0412181 100644
--- a/package/x11r7/xapp_xfs/xapp_xfs.mk
+++ b/package/x11r7/xapp_xfs/xapp_xfs.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-XAPP_XFS_VERSION = 1.2.0
-XAPP_XFS_SOURCE = xfs-$(XAPP_XFS_VERSION).tar.bz2
-XAPP_XFS_SITE = http://xorg.freedesktop.org/releases/individual/app
+XAPP_XFS_VERSION = 1.2.1
+XAPP_XFS_SOURCE = xfs-$(XAPP_XFS_VERSION).tar.xz
+XAPP_XFS_SITE = https://xorg.freedesktop.org/releases/individual/app
 XAPP_XFS_LICENSE = MIT
 XAPP_XFS_LICENSE_FILES = COPYING
 XAPP_XFS_DEPENDENCIES = xlib_libFS xlib_libXfont2 xorgproto
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
