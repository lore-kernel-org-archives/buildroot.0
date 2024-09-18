Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0EE0CDD553
	for <buildroot@archiver.kernel.org>; Wed, 18 Sep 2024 20:35:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id AFA05400F5;
	Wed, 18 Sep 2024 20:35:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id va1HjKa6wQJ4; Wed, 18 Sep 2024 20:35:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7905740364
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7905740364;
	Wed, 18 Sep 2024 20:35:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 06D321BF30C
 for <buildroot@lists.busybox.net>; Wed, 18 Sep 2024 20:34:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EA5B78495A
 for <buildroot@lists.busybox.net>; Wed, 18 Sep 2024 20:34:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rRPmrmSKro6k for <buildroot@lists.busybox.net>;
 Wed, 18 Sep 2024 20:34:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EF7208475C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id EF7208475C
 for <buildroot@buildroot.org>; Wed, 18 Sep 2024 20:34:57 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E631482128; Wed, 18 Sep 2024 20:34:57 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 18 Sep 2024 22:13:28 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: ff44a8f626af195442859ca4ebc77b38cbacb110
X-Git-Newrev: f12d22ceae7f77135bac45622943c504c897a4b2
X-Patchwork-Hint: ignore
Message-Id: <20240918203457.E631482128@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/comix-cursors:
 update COMIX_CURSORS_SITE
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

commit: https://git.buildroot.net/buildroot/commit/?id=f12d22ceae7f77135bac45622943c504c897a4b2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

The project moved to Gitlab and renamed it's archive.
Fix the download URL and update the hash.

Fixes:

 http://autobuild.buildroot.org/results/734/734917ff9f613f07e6995c1f333eab1ee8bc5760

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 62ccb5b25d421f5df5a6ee7a88db21159f3c5e23)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/comix-cursors/comix-cursors.hash | 2 +-
 package/comix-cursors/comix-cursors.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/comix-cursors/comix-cursors.hash b/package/comix-cursors/comix-cursors.hash
index b66a61423b..b3975e1e3e 100644
--- a/package/comix-cursors/comix-cursors.hash
+++ b/package/comix-cursors/comix-cursors.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  9e68ea8ff230dcc793528aa5da9a38b9bf61c478cd6868b4e4f5da659746a019  ComixCursors-0.9.1.tar.bz2
+sha256  7248f2da98fea475e590aa657d8581593516530d014a9ddbac8667d1b5f3a02b  comixcursors-0.9.1.tar.bz2
diff --git a/package/comix-cursors/comix-cursors.mk b/package/comix-cursors/comix-cursors.mk
index 7b034ccee7..3e06371182 100644
--- a/package/comix-cursors/comix-cursors.mk
+++ b/package/comix-cursors/comix-cursors.mk
@@ -5,8 +5,8 @@
 ################################################################################
 
 COMIX_CURSORS_VERSION = 0.9.1
-COMIX_CURSORS_SITE = https://limitland.gitlab.io/comixcursors
-COMIX_CURSORS_SOURCE = ComixCursors-$(COMIX_CURSORS_VERSION).tar.bz2
+COMIX_CURSORS_SITE = $(call gitlab,limitland,comixcursors,$(COMIX_CURSORS_VERSION))
+COMIX_CURSORS_SOURCE = comixcursors-$(COMIX_CURSORS_VERSION).tar.bz2
 COMIX_CURSORS_LICENSE = GPL-3.0
 COMIX_CURSORS_STRIP_COMPONENTS = 0
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
