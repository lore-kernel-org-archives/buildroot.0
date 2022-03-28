Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C366C433EF
	for <buildroot@archiver.kernel.org>; Mon, 28 Mar 2022 19:59:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 233A540598;
	Mon, 28 Mar 2022 19:59:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZTLNAVEiAzm7; Mon, 28 Mar 2022 19:59:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3D3EE4051E;
	Mon, 28 Mar 2022 19:59:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0FE291BF2BA
 for <buildroot@lists.busybox.net>; Mon, 28 Mar 2022 19:58:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 28D1C813A4
 for <buildroot@lists.busybox.net>; Mon, 28 Mar 2022 19:58:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Cu7yHfZJhLrK for <buildroot@lists.busybox.net>;
 Mon, 28 Mar 2022 19:58:05 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6DDBE81B14
 for <buildroot@buildroot.org>; Mon, 28 Mar 2022 19:58:05 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 710FC85F3E; Mon, 28 Mar 2022 19:48:54 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Mon, 28 Mar 2022 21:22:36 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f33260685bf9dedd76db5b19f2dce0f4b5cbce2b
X-Git-Newrev: f44c5d3f54893195c731523423c01e355978ef6a
X-Patchwork-Hint: ignore
Message-Id: <20220328194854.710FC85F3E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/unclutter-xfixes: bump to version
 1.6
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

commit: https://git.buildroot.net/buildroot/commit/?id=f44c5d3f54893195c731523423c01e355978ef6a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update indentation in hash file (two spaces)

https://github.com/Airblader/unclutter-xfixes/releases/tag/v1.6

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/unclutter-xfixes/unclutter-xfixes.hash | 4 ++--
 package/unclutter-xfixes/unclutter-xfixes.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/unclutter-xfixes/unclutter-xfixes.hash b/package/unclutter-xfixes/unclutter-xfixes.hash
index 785825da7a..b0bd5532ef 100644
--- a/package/unclutter-xfixes/unclutter-xfixes.hash
+++ b/package/unclutter-xfixes/unclutter-xfixes.hash
@@ -1,3 +1,3 @@
 # locally calculated
-sha256 35c75ad24be989dd6708db1d9ce9b2a2f814b80638c0633cdb075c6df090ed11  unclutter-xfixes-1.5.tar.gz
-sha256 33e94693849b57fdb34987c95fd0076b4aa4b70fcd9a3152313d00b86a3f7bf7  LICENSE
+sha256  6f7f248f16b7d4ec7cb144b6bc5a66bd49078130513a184f4dc16c498d457db9  unclutter-xfixes-1.6.tar.gz
+sha256  33e94693849b57fdb34987c95fd0076b4aa4b70fcd9a3152313d00b86a3f7bf7  LICENSE
diff --git a/package/unclutter-xfixes/unclutter-xfixes.mk b/package/unclutter-xfixes/unclutter-xfixes.mk
index 713a84bca6..6da607b660 100644
--- a/package/unclutter-xfixes/unclutter-xfixes.mk
+++ b/package/unclutter-xfixes/unclutter-xfixes.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UNCLUTTER_XFIXES_VERSION = 1.5
+UNCLUTTER_XFIXES_VERSION = 1.6
 UNCLUTTER_XFIXES_SITE = $(call github,Airblader,unclutter-xfixes,v$(UNCLUTTER_XFIXES_VERSION))
 UNCLUTTER_XFIXES_LICENSE = MIT
 UNCLUTTER_XFIXES_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
