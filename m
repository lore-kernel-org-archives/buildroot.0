Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CED9CC433EF
	for <buildroot@archiver.kernel.org>; Mon,  4 Apr 2022 18:49:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8AF2A60FE6;
	Mon,  4 Apr 2022 18:49:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fLDepmUC5cuj; Mon,  4 Apr 2022 18:49:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id ADA9E60FDE;
	Mon,  4 Apr 2022 18:49:24 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 73B961BF9AD
 for <buildroot@lists.busybox.net>; Mon,  4 Apr 2022 18:49:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6305D60FE2
 for <buildroot@lists.busybox.net>; Mon,  4 Apr 2022 18:49:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8S15qMp8WpyQ for <buildroot@lists.busybox.net>;
 Mon,  4 Apr 2022 18:49:03 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id B113560B0D
 for <buildroot@buildroot.org>; Mon,  4 Apr 2022 18:49:03 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 212DA818C0; Mon,  4 Apr 2022 18:39:37 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Mon, 4 Apr 2022 20:41:32 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6a11646968011c7209cfadb17d0714949e174f21
X-Git-Newrev: 3204fe4b4e0e60e6b9b9f1e63559c374544f2db4
X-Patchwork-Hint: ignore
Message-Id: <20220404183937.212DA818C0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/quazip: bump to version 1.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=3204fe4b4e0e60e6b9b9f1e63559c374544f2db4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update hash of COPYING which has been "clearly marked" as the definitive
license source:
https://github.com/stachenov/quazip/commit/0d1aedb0fba343a196c124541b4d6938b16cf6ee

https://github.com/stachenov/quazip/releases/tag/v1.2

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/quazip/quazip.hash | 4 ++--
 package/quazip/quazip.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/quazip/quazip.hash b/package/quazip/quazip.hash
index 5eff5cfb3d..bcb16acdc0 100644
--- a/package/quazip/quazip.hash
+++ b/package/quazip/quazip.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  54edce9c11371762bd4f0003c2937b5d8806a2752dd9c0fd9085e90792612ad0  quazip-1.1.tar.gz
-sha256  3aab586a5bdc8ffbbf033c7106550fd3e849fd8888e33cbc9bfd30a433c4b1cb  COPYING
+sha256  2dfb911d6b27545de0b98798d967c40430312377e6ade57096d6ec80c720cb61  quazip-1.2.tar.gz
+sha256  b455b21b0d31d6e51993f1fb7e0694c75fa0eb0519a9ea62e4815fcf48b140b0  COPYING
diff --git a/package/quazip/quazip.mk b/package/quazip/quazip.mk
index 44645ec9b9..7731e59d94 100644
--- a/package/quazip/quazip.mk
+++ b/package/quazip/quazip.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-QUAZIP_VERSION = 1.1
+QUAZIP_VERSION = 1.2
 QUAZIP_SITE = $(call github,stachenov,quazip,v$(QUAZIP_VERSION))
 QUAZIP_INSTALL_STAGING = YES
 QUAZIP_DEPENDENCIES = \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
