Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E16DC38A2D
	for <buildroot@archiver.kernel.org>; Mon, 24 Oct 2022 21:04:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DB59E4030C;
	Mon, 24 Oct 2022 21:04:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DB59E4030C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8JRKF_ksKvC7; Mon, 24 Oct 2022 21:04:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BEA984030D;
	Mon, 24 Oct 2022 21:04:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BEA984030D
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 045941BF338
 for <buildroot@lists.busybox.net>; Mon, 24 Oct 2022 21:04:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E156860ABD
 for <buildroot@lists.busybox.net>; Mon, 24 Oct 2022 21:04:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E156860ABD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CAb35vo7ayU8 for <buildroot@lists.busybox.net>;
 Mon, 24 Oct 2022 21:04:10 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id BBC3460597
 for <buildroot@buildroot.org>; Mon, 24 Oct 2022 21:04:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BBC3460597
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AAFB086FE4; Mon, 24 Oct 2022 21:04:10 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 24 Oct 2022 23:03:29 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 232ebbe3ab35861d8170ee11bc178338b6931132
X-Git-Newrev: fe56cf24b649b5e87d7a9e5a1c3c23d7740fa3f6
X-Patchwork-Hint: ignore
Message-Id: <20221024210410.AAFB086FE4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/wireguard-linux-compat: bump
 version to 1.0.20220627
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

commit: https://git.buildroot.net/buildroot/commit/?id=fe56cf24b649b5e87d7a9e5a1c3c23d7740fa3f6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For details, see the announcement:
https://lists.zx2c4.com/pipermail/wireguard/2022-June/007660.html

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/wireguard-linux-compat/wireguard-linux-compat.hash | 4 ++--
 package/wireguard-linux-compat/wireguard-linux-compat.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/wireguard-linux-compat/wireguard-linux-compat.hash b/package/wireguard-linux-compat/wireguard-linux-compat.hash
index 3072b66e92..0f5713fc34 100644
--- a/package/wireguard-linux-compat/wireguard-linux-compat.hash
+++ b/package/wireguard-linux-compat/wireguard-linux-compat.hash
@@ -1,4 +1,4 @@
-# https://lists.zx2c4.com/pipermail/wireguard/2021-December/007369.html
-sha256  c0e607138a17daac656f508d8e63ea3737b5221fa5d9288191ddeb099f5a3b92  wireguard-linux-compat-1.0.20211208.tar.xz
+# https://lists.zx2c4.com/pipermail/wireguard/2022-June/007660.html
+sha256  362d412693c8fe82de00283435818d5c5def7f15e2433a07a9fe99d0518f63c0  wireguard-linux-compat-1.0.20220627.tar.xz
 # Locally calculated
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/wireguard-linux-compat/wireguard-linux-compat.mk b/package/wireguard-linux-compat/wireguard-linux-compat.mk
index 44cc30f36e..258e184765 100644
--- a/package/wireguard-linux-compat/wireguard-linux-compat.mk
+++ b/package/wireguard-linux-compat/wireguard-linux-compat.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WIREGUARD_LINUX_COMPAT_VERSION = 1.0.20211208
+WIREGUARD_LINUX_COMPAT_VERSION = 1.0.20220627
 WIREGUARD_LINUX_COMPAT_SITE = https://git.zx2c4.com/wireguard-linux-compat/snapshot
 WIREGUARD_LINUX_COMPAT_SOURCE = wireguard-linux-compat-$(WIREGUARD_LINUX_COMPAT_VERSION).tar.xz
 WIREGUARD_LINUX_COMPAT_LICENSE = GPL-2.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
