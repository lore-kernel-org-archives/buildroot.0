Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 570F9C433F5
	for <buildroot@archiver.kernel.org>; Tue, 15 Mar 2022 21:21:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1219260C30;
	Tue, 15 Mar 2022 21:21:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id z3dpGunkork0; Tue, 15 Mar 2022 21:21:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8B77160AFB;
	Tue, 15 Mar 2022 21:21:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 044DD1BF284
 for <buildroot@lists.busybox.net>; Tue, 15 Mar 2022 21:21:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C5B7040103
 for <buildroot@lists.busybox.net>; Tue, 15 Mar 2022 21:21:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RNm1o8r67ob1 for <buildroot@lists.busybox.net>;
 Tue, 15 Mar 2022 21:21:04 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id B3DEC4056D
 for <buildroot@buildroot.org>; Tue, 15 Mar 2022 21:21:04 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id C3D088408B; Tue, 15 Mar 2022 21:12:22 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Tue, 15 Mar 2022 22:10:00 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e3f25dffbcb6b4a3f3d0cad968bc5e4499529e61
X-Git-Newrev: 6e0bf309a46dcda2be8c2491ac0aabc5883f5c89
X-Patchwork-Hint: ignore
Message-Id: <20220315211222.C3D088408B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/parted: bump to version 3.4
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

commit: https://git.buildroot.net/buildroot/commit/?id=6e0bf309a46dcda2be8c2491ac0aabc5883f5c89
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update indentation in hash file (two spaces)

https://git.savannah.gnu.org/cgit/parted.git/tree/NEWS?h=v3.4

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/parted/parted.hash | 4 ++--
 package/parted/parted.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/parted/parted.hash b/package/parted/parted.hash
index 2c466eb8d2..392436ec4b 100644
--- a/package/parted/parted.hash
+++ b/package/parted/parted.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-sha256	57e2b4bd87018625c515421d4524f6e3b55175b472302056391c5f7eccb83d44  parted-3.3.tar.xz
+sha256  e1298022472da5589b7f2be1d5ee3c1b66ec3d96dfbad03dc642afd009da5342  parted-3.4.tar.xz
 
 # Locally calculated
-sha256	0abbff814cd00e2b0b6d08395af2b419c1a92026c4b4adacbb65ccda45fa58cf  COPYING
+sha256  0abbff814cd00e2b0b6d08395af2b419c1a92026c4b4adacbb65ccda45fa58cf  COPYING
diff --git a/package/parted/parted.mk b/package/parted/parted.mk
index 66940fc516..23158179e4 100644
--- a/package/parted/parted.mk
+++ b/package/parted/parted.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PARTED_VERSION = 3.3
+PARTED_VERSION = 3.4
 PARTED_SOURCE = parted-$(PARTED_VERSION).tar.xz
 PARTED_SITE = $(BR2_GNU_MIRROR)/parted
 PARTED_DEPENDENCIES = host-pkgconf util-linux
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
