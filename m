Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2ED0DC4321E
	for <buildroot@archiver.kernel.org>; Mon,  5 Dec 2022 12:05:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C5B0A4167C;
	Mon,  5 Dec 2022 12:05:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C5B0A4167C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7AvyD3OOksSO; Mon,  5 Dec 2022 12:05:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 94B9C40330;
	Mon,  5 Dec 2022 12:05:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 94B9C40330
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6607A1BF352
 for <buildroot@lists.busybox.net>; Mon,  5 Dec 2022 11:27:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0261E40734
 for <buildroot@lists.busybox.net>; Mon,  5 Dec 2022 11:26:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0261E40734
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zRjxMnOXrBFb for <buildroot@lists.busybox.net>;
 Mon,  5 Dec 2022 11:26:08 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id CA436405E6
 for <buildroot@buildroot.org>; Mon,  5 Dec 2022 11:26:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CA436405E6
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B2E5685BA2; Mon,  5 Dec 2022 11:26:07 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 5 Nov 2022 23:38:29 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 37648d90ca5420ab5199848ac20da0d95f7d09be
X-Git-Newrev: 2ca53d27c0cff85ad50c54aab5ac72872b15c2d0
X-Patchwork-Hint: ignore
Message-Id: <20221205112607.B2E5685BA2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gitlab-runner: bump version to
 15.5.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=2ca53d27c0cff85ad50c54aab5ac72872b15c2d0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Marcin Niestroj <m.niestroj@grinn-global.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/gitlab-runner/gitlab-runner.hash | 2 +-
 package/gitlab-runner/gitlab-runner.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/gitlab-runner/gitlab-runner.hash b/package/gitlab-runner/gitlab-runner.hash
index f4fab595b5..2d39eef39b 100644
--- a/package/gitlab-runner/gitlab-runner.hash
+++ b/package/gitlab-runner/gitlab-runner.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  63a7963f750ec45a7cb34a660b7247a0aa6def98706b7bd80efc95053e66822d  gitlab-runner-14.5.1.tar.gz
+sha256  f7482926d20dbf98434e3d34662d93b601166eb784c6fb4bc56f89c1a4eff19d  gitlab-runner-15.5.0.tar.gz
 sha256  0ae968b7ddd25da0209c3c6594aac1ac74ddf90385940b02b420463e2e0734de  LICENSE
diff --git a/package/gitlab-runner/gitlab-runner.mk b/package/gitlab-runner/gitlab-runner.mk
index fde776e631..c7c2da2fe1 100644
--- a/package/gitlab-runner/gitlab-runner.mk
+++ b/package/gitlab-runner/gitlab-runner.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GITLAB_RUNNER_VERSION = 14.5.1
+GITLAB_RUNNER_VERSION = 15.5.0
 GITLAB_RUNNER_SITE = https://gitlab.com/gitlab-org/gitlab-runner/-/archive/v$(GITLAB_RUNNER_VERSION)
 GITLAB_RUNNER_LICENSE = MIT
 GITLAB_RUNNER_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
