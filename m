Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08998C61CE8
	for <buildroot@archiver.kernel.org>; Thu, 12 Jun 2025 08:40:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C4FDC83A58;
	Thu, 12 Jun 2025 08:40:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cIpjQ-zh2dxi; Thu, 12 Jun 2025 08:40:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8539983A35
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8539983A35;
	Thu, 12 Jun 2025 08:40:37 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 497CF1BD
 for <buildroot@buildroot.org>; Thu, 12 Jun 2025 08:39:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B3968421E1
 for <buildroot@buildroot.org>; Thu, 12 Jun 2025 08:38:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TvztDuzg_lxn for <buildroot@buildroot.org>;
 Thu, 12 Jun 2025 08:38:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8CE074215C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8CE074215C
 for <buildroot@buildroot.org>; Thu, 12 Jun 2025 08:38:31 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8AACF80FF9; Thu, 12 Jun 2025 08:38:31 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sat, 31 May 2025 12:36:01 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 52e1049491294e314bacd44ef960360c0f3b521a
X-Git-Newrev: c12e81951dc3c07436cca3ea7d22039a6a9fa0ef
X-Patchwork-Hint: ignore
Message-Id: <20250612083831.8AACF80FF9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/tree: bump to version 2.2.1
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=c12e81951dc3c07436cca3ea7d22039a6a9fa0ef
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changelog:
https://github.com/Old-Man-Programmer/tree/blob/2.2.1/CHANGES

Signed-off-by: Kadambini Nema <kadambini.nema@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/tree/tree.hash | 2 +-
 package/tree/tree.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/tree/tree.hash b/package/tree/tree.hash
index 9ef48b1e77..16ada077f3 100644
--- a/package/tree/tree.hash
+++ b/package/tree/tree.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  d3c3d55f403af7c76556546325aa1eca90b918cbaaf6d3ab60a49d8367ab90d5  tree-2.1.1.tgz
+sha256  68ac45dc78c0c311ada06200ffc3c285e74223ba208061f8d15ffac25e44b2ec  tree-2.2.1.tgz
 sha256  204d8eff92f95aac4df6c8122bc1505f468f3a901e5a4cc08940e0ede1938994  LICENSE
diff --git a/package/tree/tree.mk b/package/tree/tree.mk
index 479a172a72..4b48f4cf48 100644
--- a/package/tree/tree.mk
+++ b/package/tree/tree.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TREE_VERSION = 2.1.1
+TREE_VERSION = 2.2.1
 TREE_SOURCE = tree-$(TREE_VERSION).tgz
 TREE_SITE = http://oldmanprogrammer.net/tar/tree
 TREE_LICENSE = GPL-2.0+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
