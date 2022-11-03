Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D541EC4332F
	for <buildroot@archiver.kernel.org>; Thu,  3 Nov 2022 01:51:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 64EA181CE7;
	Thu,  3 Nov 2022 01:51:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 64EA181CE7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3RE8SpAaCuOB; Thu,  3 Nov 2022 01:51:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 90AC2818CD;
	Thu,  3 Nov 2022 01:51:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 90AC2818CD
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5B5DA1BF337
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 01:51:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 43F1740168
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 01:51:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 43F1740168
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cV13nQ_cp3Lo for <buildroot@lists.busybox.net>;
 Thu,  3 Nov 2022 01:51:18 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5FBC4400D0
Received: from mail.grinn-global.com (mail.grinn-global.com [77.55.128.204])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5FBC4400D0
 for <buildroot@buildroot.org>; Thu,  3 Nov 2022 01:51:18 +0000 (UTC)
X-Virus-Scanned: by amavisd-new using ClamAV (12)
Received: from zm.lan (pub-52.182.29.194.multiplay.pl [194.29.182.52])
 by server220076.nazwa.pl (Postfix) with ESMTP id 92BC81BC465;
 Thu,  3 Nov 2022 02:41:34 +0100 (CET)
From: Marcin Niestroj <m.niestroj@grinn-global.com>
To: buildroot@buildroot.org
Date: Thu,  3 Nov 2022 02:41:32 +0100
Message-Id: <20221103014132.791440-1-m.niestroj@grinn-global.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/gitlab-runner: bump version to 15.5.0
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Marcin Niestroj <m.niestroj@grinn-global.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Marcin Niestroj <m.niestroj@grinn-global.com>
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
-- 
2.38.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
