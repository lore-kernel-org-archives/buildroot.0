Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8161ECAAD3
	for <buildroot@archiver.kernel.org>; Sat, 17 Sep 2022 13:44:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4BCF283F33;
	Sat, 17 Sep 2022 13:44:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4BCF283F33
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TT3eqRAeXe-m; Sat, 17 Sep 2022 13:44:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7CFEC8333E;
	Sat, 17 Sep 2022 13:44:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7CFEC8333E
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 69F7C1BF405
 for <buildroot@lists.busybox.net>; Sat, 17 Sep 2022 13:44:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3297140AA8
 for <buildroot@lists.busybox.net>; Sat, 17 Sep 2022 13:44:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3297140AA8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ye6fcT0QOa5S for <buildroot@lists.busybox.net>;
 Sat, 17 Sep 2022 13:44:15 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 019F640493
 for <buildroot@buildroot.org>; Sat, 17 Sep 2022 13:44:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 019F640493
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id DFFCF84330; Sat, 17 Sep 2022 13:44:14 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sat, 17 Sep 2022 15:39:15 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b1c821b9f7bb3bbd3d104da034dd416c48082591
X-Git-Newrev: 35e8b1fd63fd38d95d64a1ec2a43f465f800a988
X-Patchwork-Hint: ignore
Message-Id: <20220917134414.DFFCF84330@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/linenoise: bump linenoise to
 latest commit
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

commit: https://git.buildroot.net/buildroot/commit/?id=35e8b1fd63fd38d95d64a1ec2a43f465f800a988
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The last (and only) release was made 7 years ago and there are 23 newer
commits since then.

This bumps linenoise to the latest commit in the git repo,
97d2850af13c ("Use unsigned int instead of uint like rest of code base.")

Cc: Quentin Schulz <foss+buildroot@0leil.net>
Signed-off-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/linenoise/linenoise.hash | 2 +-
 package/linenoise/linenoise.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/linenoise/linenoise.hash b/package/linenoise/linenoise.hash
index a1cabd9eff..9a1436eb8b 100644
--- a/package/linenoise/linenoise.hash
+++ b/package/linenoise/linenoise.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  f5054a4fe120d43d85427cf58af93e56b9bb80389d507a9bec9b75531a340014  linenoise-1.0.tar.gz
+sha256  1086f82fbf30b0618b1953b05d33db62c68fc7ce49391ce1374192f776fde72d  linenoise-97d2850af13c339369093b78abe5265845d78220.tar.gz
 sha256  efe1692aa5b869edaa0ac88f95eb0276c1125304ffc636a299db3ebbab47f62b  LICENSE
diff --git a/package/linenoise/linenoise.mk b/package/linenoise/linenoise.mk
index a8fe7674c2..fd2c4c7035 100644
--- a/package/linenoise/linenoise.mk
+++ b/package/linenoise/linenoise.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LINENOISE_VERSION = 1.0
+LINENOISE_VERSION = 97d2850af13c339369093b78abe5265845d78220
 LINENOISE_SITE = $(call github,antirez,linenoise,$(LINENOISE_VERSION))
 LINENOISE_LICENSE = BSD-2-Clause
 LINENOISE_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
