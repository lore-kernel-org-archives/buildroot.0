Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7E23C6FD19
	for <buildroot@archiver.kernel.org>; Sun, 12 Mar 2023 22:13:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4ED4B41C9D;
	Sun, 12 Mar 2023 22:13:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4ED4B41C9D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Y4wums7JlN5C; Sun, 12 Mar 2023 22:13:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 242A241C8E;
	Sun, 12 Mar 2023 22:13:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 242A241C8E
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4DBEB1BF334
 for <buildroot@lists.busybox.net>; Sun, 12 Mar 2023 22:13:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 25606607C1
 for <buildroot@lists.busybox.net>; Sun, 12 Mar 2023 22:13:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 25606607C1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LFaGGpgrXA5x for <buildroot@lists.busybox.net>;
 Sun, 12 Mar 2023 22:13:26 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 610C6607F6
 for <buildroot@buildroot.org>; Sun, 12 Mar 2023 22:13:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 610C6607F6
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4EE388703F; Sun, 12 Mar 2023 22:13:26 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 12 Mar 2023 23:12:37 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 655b18053a344927b9372ff88302b082b1dba2f0
X-Git-Newrev: 6dfa40b9ab3d0425c7760f0b27e5ecc91c659bac
X-Patchwork-Hint: ignore
Message-Id: <20230312221326.4EE388703F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/guile: bump to version 3.0.9
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

commit: https://git.buildroot.net/buildroot/commit/?id=6dfa40b9ab3d0425c7760f0b27e5ecc91c659bac
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Pedro Aguilar <paguilar@paguilar.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/guile/guile.hash | 2 +-
 package/guile/guile.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/guile/guile.hash b/package/guile/guile.hash
index e9ae5b6e51..b671edad9d 100644
--- a/package/guile/guile.hash
+++ b/package/guile/guile.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-sha256  daa7060a56f2804e9b74c8d7e7fe8beed12b43aab2789a38585183fcc17b8a13  guile-3.0.8.tar.xz
+sha256  1a2625ac72b2366e95792f3fe758fd2df775b4044a90a4a9787326e66c0d750d  guile-3.0.9.tar.xz
 # Locally computed
 sha256  b51c6f20e6d029cb5b3e5bf235ac562c9a188c5bdc4ffcdc663897772d6e0260  LICENSE
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/guile/guile.mk b/package/guile/guile.mk
index 9478e75b41..1d2e8038f0 100644
--- a/package/guile/guile.mk
+++ b/package/guile/guile.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GUILE_VERSION = 3.0.8
+GUILE_VERSION = 3.0.9
 GUILE_SOURCE = guile-$(GUILE_VERSION).tar.xz
 GUILE_SITE = $(BR2_GNU_MIRROR)/guile
 GUILE_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
