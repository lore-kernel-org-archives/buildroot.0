Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B747C67861
	for <buildroot@archiver.kernel.org>; Mon,  8 Apr 2024 21:39:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D837D40543;
	Mon,  8 Apr 2024 21:39:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3Esp1Xv31tkI; Mon,  8 Apr 2024 21:39:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EACBE41463
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id EACBE41463;
	Mon,  8 Apr 2024 21:39:18 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C65F91BF2A6
 for <buildroot@lists.busybox.net>; Mon,  8 Apr 2024 21:39:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C07A2405FC
 for <buildroot@lists.busybox.net>; Mon,  8 Apr 2024 21:39:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gdWd4c5_zOUQ for <buildroot@lists.busybox.net>;
 Mon,  8 Apr 2024 21:39:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0D7E340543
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0D7E340543
 for <buildroot@buildroot.org>; Mon,  8 Apr 2024 21:39:15 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B34AC85D4B; Mon,  8 Apr 2024 21:39:15 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 8 Apr 2024 23:38:29 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: dfe02734bfbbab680cd9ceb98e10d0344abbe058
X-Git-Newrev: 9f4cae383a061b52424bf37900aaa221e3a2f3c5
X-Patchwork-Hint: ignore
Message-Id: <20240408213915.B34AC85D4B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/crucible: update LICENSE
 information
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

commit: https://git.buildroot.net/buildroot/commit/?id=9f4cae383a061b52424bf37900aaa221e3a2f3c5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since crucible commit 7fe0bb96da65 ("move to BSD style license") the
license has been changed to BSD-3. This changed happened for the
2023.11.02 release of crucible, to which the Buildroot package was
bumped in Buildroot commit be3f95ed14559f8a9739a12cff604add622b0416.

Change the license type and hash accordingly.

Fixes:
  - http://autobuild.buildroot.net/results/14dfa0a47be54929c527c12fe9b95f34c1d8c7f5/

Signed-off-by: Fabio Estevam <festevam@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/crucible/crucible.hash | 2 +-
 package/crucible/crucible.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/crucible/crucible.hash b/package/crucible/crucible.hash
index d5fee0068d..3a9a716732 100644
--- a/package/crucible/crucible.hash
+++ b/package/crucible/crucible.hash
@@ -1,2 +1,2 @@
 sha256  d21842f050163765269290d72fe79d3f95005038e865138d94e247cb455098da  crucible-2023.11.02.tar.gz
-sha256  d88514630470aec9fa7abdc990a1e0a8751a752321bffa868188c49009d64d59  LICENSE
+sha256  a89c50d83be30fe7ec75be69a07f6c1b5dfaae0a6b94a678d2394fff34acb69c  LICENSE
diff --git a/package/crucible/crucible.mk b/package/crucible/crucible.mk
index 2206663e24..5eedbca8ee 100644
--- a/package/crucible/crucible.mk
+++ b/package/crucible/crucible.mk
@@ -6,7 +6,7 @@
 
 CRUCIBLE_VERSION = 2023.11.02
 CRUCIBLE_SITE = $(call github,usbarmory,crucible,v$(CRUCIBLE_VERSION))
-CRUCIBLE_LICENSE = GPL-3.0
+CRUCIBLE_LICENSE = BSD-3-Clause
 CRUCIBLE_LICENSE_FILES = LICENSE
 CRUCIBLE_GOMOD = ./cmd/crucible
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
