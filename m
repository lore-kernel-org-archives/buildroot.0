Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4565EC433F5
	for <buildroot@archiver.kernel.org>; Sat, 16 Apr 2022 19:56:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E465741C2E;
	Sat, 16 Apr 2022 19:56:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lp9b6n1_hcUJ; Sat, 16 Apr 2022 19:56:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 639C241C19;
	Sat, 16 Apr 2022 19:56:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2EF9C1BF484
 for <buildroot@lists.busybox.net>; Sat, 16 Apr 2022 19:56:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B1D8084213
 for <buildroot@lists.busybox.net>; Sat, 16 Apr 2022 19:56:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UpKDb_0uzBbs for <buildroot@lists.busybox.net>;
 Sat, 16 Apr 2022 19:56:13 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id CAD1D84216
 for <buildroot@buildroot.org>; Sat, 16 Apr 2022 19:56:13 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id EFF8983C6F; Sat, 16 Apr 2022 19:46:19 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 16 Apr 2022 21:54:47 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0263b3eb534827506b311e64cea62490cbf7825c
X-Git-Newrev: 858c6a5b83ae63c1fa070495f44b1a95824daa54
X-Patchwork-Hint: ignore
Message-Id: <20220416194619.EFF8983C6F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/links: bump version to 2.26
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

commit: https://git.buildroot.net/buildroot/commit/?id=858c6a5b83ae63c1fa070495f44b1a95824daa54
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/links/links.hash | 2 +-
 package/links/links.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/links/links.hash b/package/links/links.hash
index 0f8cd32937..83b27aeb9d 100644
--- a/package/links/links.hash
+++ b/package/links/links.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  2dd78508698e8279ef4f09a3a2a21e9595040113402da6c553974414fb49dd2c  links-2.25.tar.bz2
+sha256  f05b3577f25dbe63e491c424f0ecb31f7bfadce9b2bc2f111dfed049c004c9cb  links-2.26.tar.bz2
 sha256  92deeb70791366630095d4e0714fe37d6e2bd5db0e6ef498ebb8de328f45b253  COPYING
diff --git a/package/links/links.mk b/package/links/links.mk
index 1f1a7a9189..a861fd657a 100644
--- a/package/links/links.mk
+++ b/package/links/links.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LINKS_VERSION = 2.25
+LINKS_VERSION = 2.26
 LINKS_SOURCE = links-$(LINKS_VERSION).tar.bz2
 LINKS_SITE = http://links.twibright.com/download
 LINKS_DEPENDENCIES = host-pkgconf
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
