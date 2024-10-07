Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60D6BCFB442
	for <buildroot@archiver.kernel.org>; Mon,  7 Oct 2024 06:39:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EE7F180C96;
	Mon,  7 Oct 2024 06:39:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id s-jAcd1BLkfx; Mon,  7 Oct 2024 06:39:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A95CC80C9A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A95CC80C9A;
	Mon,  7 Oct 2024 06:39:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B86AA1BF471
 for <buildroot@lists.busybox.net>; Mon,  7 Oct 2024 06:39:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A6DD940273
 for <buildroot@lists.busybox.net>; Mon,  7 Oct 2024 06:39:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BVuFHaAIRFvM for <buildroot@lists.busybox.net>;
 Mon,  7 Oct 2024 06:39:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9D4E740209
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9D4E740209
 for <buildroot@buildroot.org>; Mon,  7 Oct 2024 06:39:33 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 91530857AC; Mon,  7 Oct 2024 06:39:33 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 7 Oct 2024 08:30:48 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8e419a1472008c82ab09160ca7cbe6bbc4ec1c9f
X-Git-Newrev: 47b8264fdacb400966adb4aee3f5ed0fdd6b8d18
X-Patchwork-Hint: ignore
Message-Id: <20241007063933.91530857AC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/tk: bump to version 8.6.15
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

commit: https://git.buildroot.net/buildroot/commit/?id=47b8264fdacb400966adb4aee3f5ed0fdd6b8d18
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For release note, see:
https://sourceforge.net/projects/tcl/files/Tcl/8.6.15/tcltk-release-notes-8.6.15.txt

Note: commit 1af4eae90 "package/tcl: bump version to 8.6.15" updated
the tcl package. This commit updates the tk package, which is released
alongside tcl.

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/tk/tk.hash | 2 +-
 package/tk/tk.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/tk/tk.hash b/package/tk/tk.hash
index aee03a152e..77195582cf 100644
--- a/package/tk/tk.hash
+++ b/package/tk/tk.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  8ffdb720f47a6ca6107eac2dd877e30b0ef7fac14f3a84ebbd0b3612cee41a94  tk8.6.14-src.tar.gz
+sha256  550969f35379f952b3020f3ab7b9dd5bfd11c1ef7c9b7c6a75f5c49aca793fec  tk8.6.15-src.tar.gz
 sha256  2cde822b93ca16ae535c954b7dfe658b4ad10df2a193628d1b358f1765e8b198  license.terms
diff --git a/package/tk/tk.mk b/package/tk/tk.mk
index c8dd7bc32c..3efabd5ec4 100644
--- a/package/tk/tk.mk
+++ b/package/tk/tk.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 TK_VERSION_MAJOR = 8.6
-TK_VERSION = $(TK_VERSION_MAJOR).14
+TK_VERSION = $(TK_VERSION_MAJOR).15
 TK_SOURCE = tk$(TK_VERSION)-src.tar.gz
 TK_SITE = http://downloads.sourceforge.net/project/tcl/Tcl/$(TK_VERSION)
 TK_LICENSE = TCL
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
