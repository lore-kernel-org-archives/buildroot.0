Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E531FC433F5
	for <buildroot@archiver.kernel.org>; Sun, 22 May 2022 10:32:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A5F8641298;
	Sun, 22 May 2022 10:32:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jlg1DLmwut_o; Sun, 22 May 2022 10:32:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 716E8410D7;
	Sun, 22 May 2022 10:32:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8ED001BF47E
 for <buildroot@lists.busybox.net>; Sun, 22 May 2022 10:32:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8C7C283032
 for <buildroot@lists.busybox.net>; Sun, 22 May 2022 10:32:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VSalpmWpCyvc for <buildroot@lists.busybox.net>;
 Sun, 22 May 2022 10:32:07 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id C984282F51
 for <buildroot@buildroot.org>; Sun, 22 May 2022 10:32:07 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 3220686311; Sun, 22 May 2022 10:20:53 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 22 May 2022 12:27:42 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 648f58ebf7d2178d79392ef87f49e0769ed38731
X-Git-Newrev: fb517e83439cba19b9419e3145403b12a9fa1cf7
X-Patchwork-Hint: ignore
Message-Id: <20220522102053.3220686311@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] boot/sun20i-d1-spl:
 update to mainline 4da9c5
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

commit: https://git.buildroot.net/buildroot/commit/?id=fb517e83439cba19b9419e3145403b12a9fa1cf7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Update to latest (as of April 14, 2022).

Signed-off-by: Christian Stewart <christian@paral.in>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit e7a3501750706eeec7854e708bcd9a8a27b61352)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 boot/sun20i-d1-spl/sun20i-d1-spl.hash | 2 +-
 boot/sun20i-d1-spl/sun20i-d1-spl.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/boot/sun20i-d1-spl/sun20i-d1-spl.hash b/boot/sun20i-d1-spl/sun20i-d1-spl.hash
index 6ca60e5278..bb2fd66c28 100644
--- a/boot/sun20i-d1-spl/sun20i-d1-spl.hash
+++ b/boot/sun20i-d1-spl/sun20i-d1-spl.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256  69063601239a7254fb72e486b138d88a6f2b5c645b24cdfe9792123f975d4a8f  sun20i-d1-spl-771192d0b3737798d7feca87263c8fa74a449787.tar.gz
+sha256  3ef28affd35a37675d91d3ac50b85e3dfa356420005f69713df73c85798ff1d8  sun20i-d1-spl-4da9c518c124d6f6123bf274e449514863df3646.tar.gz
diff --git a/boot/sun20i-d1-spl/sun20i-d1-spl.mk b/boot/sun20i-d1-spl/sun20i-d1-spl.mk
index 2462ce2322..3580ea4c25 100644
--- a/boot/sun20i-d1-spl/sun20i-d1-spl.mk
+++ b/boot/sun20i-d1-spl/sun20i-d1-spl.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # Commit on the 'mainline' branch
-SUN20I_D1_SPL_VERSION = 771192d0b3737798d7feca87263c8fa74a449787
+SUN20I_D1_SPL_VERSION = 4da9c518c124d6f6123bf274e449514863df3646
 SUN20I_D1_SPL_SITE = $(call github,smaeul,sun20i_d1_spl,$(SUN20I_D1_SPL_VERSION))
 SUN20I_D1_SPL_INSTALL_TARGET = NO
 SUN20I_D1_SPL_INSTALL_IMAGES = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
