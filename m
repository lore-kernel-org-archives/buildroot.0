Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9BA4C43334
	for <buildroot@archiver.kernel.org>; Mon, 11 Jul 2022 16:40:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 61F26401E1;
	Mon, 11 Jul 2022 16:40:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 61F26401E1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VDf9Pt48-3Mo; Mon, 11 Jul 2022 16:40:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4350240445;
	Mon, 11 Jul 2022 16:40:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4350240445
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 17C551BF983
 for <buildroot@lists.busybox.net>; Mon, 11 Jul 2022 16:39:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 38E0D82B94
 for <buildroot@lists.busybox.net>; Mon, 11 Jul 2022 16:39:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 38E0D82B94
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EQiB_jK8Cxlt for <buildroot@lists.busybox.net>;
 Mon, 11 Jul 2022 16:39:12 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5C7F582B93
 for <buildroot@buildroot.org>; Mon, 11 Jul 2022 16:39:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5C7F582B93
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 8F4FE836EF; Mon, 11 Jul 2022 16:26:02 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 11 Jul 2022 18:36:10 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 83387dadf777e7828e8382bacc1a0bdf1801b99c
X-Git-Newrev: 2943aea01e4d96376dd56e110714f066c86796c6
X-Patchwork-Hint: ignore
Message-Id: <20220711162602.8F4FE836EF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libidn: bump to version 1.41
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

commit: https://git.buildroot.net/buildroot/commit/?id=2943aea01e4d96376dd56e110714f066c86796c6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update hash of COPYINGv3 (https URLs are used since
https://gitlab.com/libidn/libidn/-/commit/d66411c378a248dcbd6e610c71c16076169c5ba3)

https://gitlab.com/libidn/libidn/-/blob/v1.41/NEWS

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libidn/libidn.hash | 4 ++--
 package/libidn/libidn.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libidn/libidn.hash b/package/libidn/libidn.hash
index c6cd668bbc..837424d93e 100644
--- a/package/libidn/libidn.hash
+++ b/package/libidn/libidn.hash
@@ -1,7 +1,7 @@
 # Locally computed:
-sha256  de00b840f757cd3bb14dd9a20d5936473235ddcba06d4bc2da804654b8bbf0f6  libidn-1.38.tar.gz
+sha256  884d706364b81abdd17bee9686d8ff2ae7431c5a14651047c68adf8b31fd8945  libidn-1.41.tar.gz
 
 # Hash for license files:
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYINGv2
-sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYINGv3
+sha256  e6037104443f9a7829b2aa7c5370d0789a7bda3ca65a0b904cdc0c2e285d9195  COPYINGv3
 sha256  da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464768  COPYING.LESSERv3
diff --git a/package/libidn/libidn.mk b/package/libidn/libidn.mk
index 4a400d195d..e1a357de1b 100644
--- a/package/libidn/libidn.mk
+++ b/package/libidn/libidn.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBIDN_VERSION = 1.38
+LIBIDN_VERSION = 1.41
 LIBIDN_SITE = $(BR2_GNU_MIRROR)/libidn
 LIBIDN_INSTALL_STAGING = YES
 LIBIDN_CONF_ENV = EMACS="no" MAKEINFO=true
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
