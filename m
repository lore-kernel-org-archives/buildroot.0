Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F597C433EF
	for <buildroot@archiver.kernel.org>; Mon,  6 Dec 2021 18:21:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2DD5782702;
	Mon,  6 Dec 2021 18:21:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 01IFk21Xl13y; Mon,  6 Dec 2021 18:21:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 83AC0826B4;
	Mon,  6 Dec 2021 18:21:23 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5092D1BF983
 for <buildroot@lists.busybox.net>; Mon,  6 Dec 2021 18:12:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F0D5441C29
 for <buildroot@lists.busybox.net>; Mon,  6 Dec 2021 18:12:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tKHJwL5Nbbk5 for <buildroot@lists.busybox.net>;
 Mon,  6 Dec 2021 18:12:35 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id E912841C0D
 for <buildroot@buildroot.org>; Mon,  6 Dec 2021 18:12:34 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 91ED681468; Mon,  6 Dec 2021 18:07:37 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sun, 14 Nov 2021 14:36:14 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9e767b942f5985e1f9e7125d715bdb7334e4f81c
X-Git-Newrev: ed4ec60500b4973adbc73f1e0a1e860c0c7f41df
X-Patchwork-Hint: ignore
Message-Id: <20211206180737.91ED681468@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/dehydrated: bump to version 0.7.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=ed4ec60500b4973adbc73f1e0a1e860c0c7f41df
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://github.com/dehydrated-io/dehydrated/releases/tag/v0.7.0

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/dehydrated/Config.in       | 2 +-
 package/dehydrated/dehydrated.hash | 4 ++--
 package/dehydrated/dehydrated.mk   | 4 ++--
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/dehydrated/Config.in b/package/dehydrated/Config.in
index 979938d70c..13b3632f9d 100644
--- a/package/dehydrated/Config.in
+++ b/package/dehydrated/Config.in
@@ -30,4 +30,4 @@ config BR2_PACKAGE_DEHYDRATED
 	  You probably need to install a custom /etc/dehydrated/config
 	  with the rootfs overlay.
 
-	  https://github.com/lukas2511/dehydrated
+	  https://github.com/dehydrated-io/dehydrated
diff --git a/package/dehydrated/dehydrated.hash b/package/dehydrated/dehydrated.hash
index 388dd24749..0452645256 100644
--- a/package/dehydrated/dehydrated.hash
+++ b/package/dehydrated/dehydrated.hash
@@ -1,6 +1,6 @@
 # Locally computed after verifying
-# https://github.com/lukas2511/dehydrated/releases/download/v0.6.5/dehydrated-0.6.5.tar.gz.asc
+# https://github.com/dehydrated-io/dehydrated/releases/download/v0.7.0/dehydrated-0.7.0.tar.gz.asc
 # with key 3C2F2605E078A1E18F4793909C4DBE6CF438F333 from https://keybase.io/lukas2511
-sha256  10aabd0027450bc70a18e49acaca7a9697e0cfb92368d3e508b7a4d6d69bfa35 dehydrated-0.6.5.tar.gz
+sha256  1c5f12c2e57e64b1762803f82f0f7e767a72e65a6ce68e4d1ec197e61b9dc4f9  dehydrated-0.7.0.tar.gz
 # License, locally computed
 sha256  b4583b7dd07e3e2a08906de38e7e329d41f921ed9dcb6310b3886e013a6b8723  LICENSE
diff --git a/package/dehydrated/dehydrated.mk b/package/dehydrated/dehydrated.mk
index 17c67b8478..28fb5a4912 100644
--- a/package/dehydrated/dehydrated.mk
+++ b/package/dehydrated/dehydrated.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-DEHYDRATED_VERSION = 0.6.5
-DEHYDRATED_SITE = https://github.com/lukas2511/dehydrated/releases/download/v$(DEHYDRATED_VERSION)
+DEHYDRATED_VERSION = 0.7.0
+DEHYDRATED_SITE = https://github.com/dehydrated-io/dehydrated/releases/download/v$(DEHYDRATED_VERSION)
 
 DEHYDRATED_LICENSE = MIT
 DEHYDRATED_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
