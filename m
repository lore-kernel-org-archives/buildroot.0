Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 006B6C001E0
	for <buildroot@archiver.kernel.org>; Sat, 29 Jul 2023 09:03:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9AA1A400C6;
	Sat, 29 Jul 2023 09:03:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9AA1A400C6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wnkz7lkQbYyl; Sat, 29 Jul 2023 09:03:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 81FD441B61;
	Sat, 29 Jul 2023 09:03:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 81FD441B61
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id EA56C1BF3FC
 for <buildroot@lists.busybox.net>; Sat, 29 Jul 2023 09:03:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D19A981E1E
 for <buildroot@lists.busybox.net>; Sat, 29 Jul 2023 09:03:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D19A981E1E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rpOMPzrRQJBj for <buildroot@lists.busybox.net>;
 Sat, 29 Jul 2023 09:03:00 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 015D0818C0
 for <buildroot@buildroot.org>; Sat, 29 Jul 2023 09:02:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 015D0818C0
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E283183860; Sat, 29 Jul 2023 09:02:59 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 29 Jul 2023 11:02:40 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d0e2e420c9cc4f05f7c8c0ca5bfb09fa5263bb69
X-Git-Newrev: f868fd9e3d5cb15c089b201b07c3062b3b176f34
X-Patchwork-Hint: ignore
Message-Id: <20230729090259.E283183860@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/vuejs: bump to version 3.3.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=f868fd9e3d5cb15c089b201b07c3062b3b176f34
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This is only a bugfix release, to fix the bugs introduced by the
recent 3.3 release.

List of fixes here:
https://github.com/vuejs/core/blob/main/CHANGELOG.md#332-2023-05-12

Signed-off-by: Thomas Claveirole <thomas.claveirole@green-communications.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/vuejs/vuejs.hash | 2 +-
 package/vuejs/vuejs.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/vuejs/vuejs.hash b/package/vuejs/vuejs.hash
index 7960b594ce..488608bc4c 100644
--- a/package/vuejs/vuejs.hash
+++ b/package/vuejs/vuejs.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  c2e4197818c64d6ad9f344141a8adee354cbc321f63be7eef6802b4b02cf19f3  vue-3.3.1.tgz
+sha256  b4d0234f0806a723d79a89426c7dbb351cf6cf554c323cf2625a3e078a93d065  vue-3.3.2.tgz
 sha256  1bb85cc9b13b81ef41c81c51866172fc345e0503c86726a6755b796590b70175  LICENSE
diff --git a/package/vuejs/vuejs.mk b/package/vuejs/vuejs.mk
index a9058b0d44..50b7100b8a 100644
--- a/package/vuejs/vuejs.mk
+++ b/package/vuejs/vuejs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-VUEJS_VERSION = 3.3.1
+VUEJS_VERSION = 3.3.2
 VUEJS_SOURCE = vue-$(VUEJS_VERSION).tgz
 VUEJS_SITE = https://registry.npmjs.org/vue/-
 VUEJS_LICENSE = MIT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
