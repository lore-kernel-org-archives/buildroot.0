Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AC61C3ABD8
	for <buildroot@archiver.kernel.org>; Mon, 19 May 2025 10:48:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 297E06F518;
	Mon, 19 May 2025 10:48:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id E8dnYuLgwIji; Mon, 19 May 2025 10:48:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B5A6461788
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B5A6461788;
	Mon, 19 May 2025 10:48:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 12553E4
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:41:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 82D1540D34
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:39:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id omGDsrZwFoRM for <buildroot@buildroot.org>;
 Mon, 19 May 2025 10:39:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4ABD140E50
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4ABD140E50
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:39:48 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 471F2873A7; Mon, 19 May 2025 10:39:48 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Tue, 8 Apr 2025 19:22:45 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 593771fafc17d001438fa946b6885422e94bd769
X-Git-Newrev: ebd2a810a75fd71b279f4b0710f73739832284d8
X-Patchwork-Hint: ignore
Message-Id: <20250519103948.471F2873A7@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/ethtool: bump version
 to 6.14
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
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8460524111402161234=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8460524111402161234==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=ebd2a810a75fd71b279f4b0710f73739832284d8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Changelog:
https://web.git.kernel.org/pub/scm/network/ethtool/ethtool.git/tree/NEWS?h=v6.14

Signed-off-by: Mattias Walström <lazzer@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/ethtool/ethtool.hash | 3 ++-
 package/ethtool/ethtool.mk   | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/ethtool/ethtool.hash b/package/ethtool/ethtool.hash
index 6fc0c13d3b..95cc14c490 100644
--- a/package/ethtool/ethtool.hash
+++ b/package/ethtool/ethtool.hash
@@ -1,5 +1,6 @@
 # From https://www.kernel.org/pub/software/network/ethtool/sha256sums.asc
-sha256  8d91f5c72ae3f25b7e88d4781279dcb320f71e30058914370b1c574c96b31202  ethtool-6.11.tar.xz
+sha256  9338bb00e492878d3bbe3cd2894e60db35813634c208db0b20f5c7ee84da69b1  ethtool-6.14.tar.xz
+
 # Locally calculated
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
 sha256  5d632934396f90c82dfebe3c9512648bbb6333b406113d0cd331b0e0aa2d34a1  LICENSE
diff --git a/package/ethtool/ethtool.mk b/package/ethtool/ethtool.mk
index fc0622c04a..654fc401b7 100644
--- a/package/ethtool/ethtool.mk
+++ b/package/ethtool/ethtool.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ETHTOOL_VERSION = 6.11
+ETHTOOL_VERSION = 6.14
 ETHTOOL_SOURCE = ethtool-$(ETHTOOL_VERSION).tar.xz
 ETHTOOL_SITE = $(BR2_KERNEL_MIRROR)/software/network/ethtool
 ETHTOOL_LICENSE = GPL-2.0

--===============8460524111402161234==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8460524111402161234==--
