Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57157C433EF
	for <buildroot@archiver.kernel.org>; Tue, 17 May 2022 20:15:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 17EAB84051;
	Tue, 17 May 2022 20:15:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Qz-zqXKHARNv; Tue, 17 May 2022 20:15:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 09C2684049;
	Tue, 17 May 2022 20:15:49 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id CD9461BF83C
 for <buildroot@lists.busybox.net>; Tue, 17 May 2022 20:15:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BB9EA400D6
 for <buildroot@lists.busybox.net>; Tue, 17 May 2022 20:15:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Gg7PewRpq-51 for <buildroot@lists.busybox.net>;
 Tue, 17 May 2022 20:15:47 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 14D8B400D0
 for <buildroot@buildroot.org>; Tue, 17 May 2022 20:15:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id DDCE085F72; Tue, 17 May 2022 20:04:42 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 17 May 2022 22:15:22 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 198244b3c31029aa16ae69e1661f1e1cd173b03f
X-Git-Newrev: d0cbd53ac4a054e94bc7f055bd4087f21a317f5e
X-Patchwork-Hint: ignore
Message-Id: <20220517200442.DDCE085F72@busybox.osuosl.org>
Subject: [Buildroot] [git commit] boot/sun20i-d1-spl: update to latest
 commit 882671
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

commit: https://git.buildroot.net/buildroot/commit/?id=d0cbd53ac4a054e94bc7f055bd4087f21a317f5e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Christian Stewart <christian@paral.in>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 boot/sun20i-d1-spl/sun20i-d1-spl.hash | 2 +-
 boot/sun20i-d1-spl/sun20i-d1-spl.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/boot/sun20i-d1-spl/sun20i-d1-spl.hash b/boot/sun20i-d1-spl/sun20i-d1-spl.hash
index bb2fd66c28..11d17a9a16 100644
--- a/boot/sun20i-d1-spl/sun20i-d1-spl.hash
+++ b/boot/sun20i-d1-spl/sun20i-d1-spl.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256  3ef28affd35a37675d91d3ac50b85e3dfa356420005f69713df73c85798ff1d8  sun20i-d1-spl-4da9c518c124d6f6123bf274e449514863df3646.tar.gz
+sha256  08e2d0574e58c99734cd1d9ea89b86464242bf2db4f6769b23803bf9dcdac3c4  sun20i-d1-spl-882671fcf53137aaafc3a94fa32e682cb7b921f1.tar.gz
diff --git a/boot/sun20i-d1-spl/sun20i-d1-spl.mk b/boot/sun20i-d1-spl/sun20i-d1-spl.mk
index 3580ea4c25..6bcea0fa96 100644
--- a/boot/sun20i-d1-spl/sun20i-d1-spl.mk
+++ b/boot/sun20i-d1-spl/sun20i-d1-spl.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # Commit on the 'mainline' branch
-SUN20I_D1_SPL_VERSION = 4da9c518c124d6f6123bf274e449514863df3646
+SUN20I_D1_SPL_VERSION = 882671fcf53137aaafc3a94fa32e682cb7b921f1
 SUN20I_D1_SPL_SITE = $(call github,smaeul,sun20i_d1_spl,$(SUN20I_D1_SPL_VERSION))
 SUN20I_D1_SPL_INSTALL_TARGET = NO
 SUN20I_D1_SPL_INSTALL_IMAGES = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
