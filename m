Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D295EB64DD
	for <buildroot@archiver.kernel.org>; Tue, 25 Jul 2023 21:15:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A251F418A0;
	Tue, 25 Jul 2023 21:15:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A251F418A0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KxAXnCYybU2f; Tue, 25 Jul 2023 21:15:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 360B64192B;
	Tue, 25 Jul 2023 21:15:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 360B64192B
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 134B91BF980
 for <buildroot@lists.busybox.net>; Tue, 25 Jul 2023 21:15:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DF81C418AD
 for <buildroot@lists.busybox.net>; Tue, 25 Jul 2023 21:15:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DF81C418AD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Fx3U3OR_XmHI for <buildroot@lists.busybox.net>;
 Tue, 25 Jul 2023 21:15:01 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id CDCC84190A
 for <buildroot@buildroot.org>; Tue, 25 Jul 2023 21:15:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CDCC84190A
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BAC0D834A7; Tue, 25 Jul 2023 21:15:01 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Tue, 25 Jul 2023 23:09:07 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7612f8abc55f01f5851cc7ee435d2f990b844213
X-Git-Newrev: 64f2a35417e42ea8739b9926caf77eaf1f085c6a
X-Patchwork-Hint: ignore
Message-Id: <20230725211501.BAC0D834A7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/tree: bump to version 2.1.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=64f2a35417e42ea8739b9926caf77eaf1f085c6a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/tree/tree.hash | 2 +-
 package/tree/tree.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/tree/tree.hash b/package/tree/tree.hash
index 298153c89c..9ef48b1e77 100644
--- a/package/tree/tree.hash
+++ b/package/tree/tree.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  7d693a1d88d3c4e70a73e03b8dbbdc12c2945d482647494f2f5bd83a479eeeaf  tree-2.0.2.tgz
+sha256  d3c3d55f403af7c76556546325aa1eca90b918cbaaf6d3ab60a49d8367ab90d5  tree-2.1.1.tgz
 sha256  204d8eff92f95aac4df6c8122bc1505f468f3a901e5a4cc08940e0ede1938994  LICENSE
diff --git a/package/tree/tree.mk b/package/tree/tree.mk
index da0acbae49..83a427b74d 100644
--- a/package/tree/tree.mk
+++ b/package/tree/tree.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TREE_VERSION = 2.0.2
+TREE_VERSION = 2.1.1
 TREE_SOURCE = tree-$(TREE_VERSION).tgz
 TREE_SITE = http://mama.indstate.edu/users/ice/tree/src
 TREE_LICENSE = GPL-2.0+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
