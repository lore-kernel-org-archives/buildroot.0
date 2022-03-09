Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F235CC433F5
	for <buildroot@archiver.kernel.org>; Wed,  9 Mar 2022 22:40:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B151C60FB4;
	Wed,  9 Mar 2022 22:40:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 532s3m3CFMf4; Wed,  9 Mar 2022 22:40:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4C83E60FAE;
	Wed,  9 Mar 2022 22:40:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 752B61BF9C2
 for <buildroot@lists.busybox.net>; Wed,  9 Mar 2022 22:40:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 62F9A841D6
 for <buildroot@lists.busybox.net>; Wed,  9 Mar 2022 22:40:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id od4PGtNPlw4Q for <buildroot@lists.busybox.net>;
 Wed,  9 Mar 2022 22:40:05 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id A503C841CA
 for <buildroot@buildroot.org>; Wed,  9 Mar 2022 22:40:05 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 39C6683A8C; Wed,  9 Mar 2022 22:31:37 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 9 Mar 2022 23:36:44 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4accbb4655d3816fd230f9820e6aac4ee9b1d8fc
X-Git-Newrev: 11a3989dbf7ac2535fac04b24ab3d959da3686b3
X-Patchwork-Hint: ignore
Message-Id: <20220309223137.39C6683A8C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/tree: bump to version 2.0.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=11a3989dbf7ac2535fac04b24ab3d959da3686b3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update indentation in hash file (two spaces)

http://mama.indstate.edu/users/ice/tree/changes.html

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/tree/tree.hash | 4 ++--
 package/tree/tree.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/tree/tree.hash b/package/tree/tree.hash
index 6bffaa5ec0..298153c89c 100644
--- a/package/tree/tree.hash
+++ b/package/tree/tree.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256	715d5d4b434321ce74706d0dd067505bb60c5ea83b5f0b3655dae40aa6f9b7c2	tree-1.8.0.tgz
-sha256	204d8eff92f95aac4df6c8122bc1505f468f3a901e5a4cc08940e0ede1938994	LICENSE
+sha256  7d693a1d88d3c4e70a73e03b8dbbdc12c2945d482647494f2f5bd83a479eeeaf  tree-2.0.2.tgz
+sha256  204d8eff92f95aac4df6c8122bc1505f468f3a901e5a4cc08940e0ede1938994  LICENSE
diff --git a/package/tree/tree.mk b/package/tree/tree.mk
index b6c63c0244..7c111b47d2 100644
--- a/package/tree/tree.mk
+++ b/package/tree/tree.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TREE_VERSION = 1.8.0
+TREE_VERSION = 2.0.2
 TREE_SOURCE = tree-$(TREE_VERSION).tgz
 TREE_SITE = http://mama.indstate.edu/users/ice/tree/src
 TREE_LICENSE = GPL-2.0+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
