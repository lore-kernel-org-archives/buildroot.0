Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8A14C433F5
	for <buildroot@archiver.kernel.org>; Sun, 23 Jan 2022 19:12:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 55C28405CB;
	Sun, 23 Jan 2022 19:12:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id w9X_5D2L_O05; Sun, 23 Jan 2022 19:12:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6253A40106;
	Sun, 23 Jan 2022 19:12:26 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 752D81BF97A
 for <buildroot@lists.busybox.net>; Sun, 23 Jan 2022 19:10:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 64742408CF
 for <buildroot@lists.busybox.net>; Sun, 23 Jan 2022 19:10:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8ZYBzv_1_iPD for <buildroot@lists.busybox.net>;
 Sun, 23 Jan 2022 19:10:54 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id BA3AC408CD
 for <buildroot@buildroot.org>; Sun, 23 Jan 2022 19:10:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 31FCF82B2E; Sun, 23 Jan 2022 19:04:08 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 23 Jan 2022 20:04:57 +0100
X-Git-Refname: refs/heads/2021.11.x
X-Git-Oldrev: 535541bd4c674c717921be6bc9330134c504c1e8
X-Git-Newrev: a5737ed3478278b66125b8bcf403a3cffa6488a4
X-Patchwork-Hint: ignore
Message-Id: <20220123190408.31FCF82B2E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.11.x] DEVELOPERS: remove Evan
 Zelkowitz
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

commit: https://git.buildroot.net/buildroot/commit/?id=a5737ed3478278b66125b8bcf403a3cffa6488a4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.11.x

Evan has privately requested to no longer receive e-mails related to
this Buildroot package.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit acc0d51c53d5da45fc0da725513cd0ab8a2d4107)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index a4fdf3eddd..a9179fc154 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -787,9 +787,6 @@ F:	package/optee-test/
 N:	Eugene Tarassov <eugene@largest.net>
 F:	package/tcf-agent/
 
-N:	Evan Zelkowitz <evan.zelkowitz@gmail.com>
-F:	package/sdl_gfx/
-
 N:	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
 F:	board/ci20/
 F:	configs/ci20_defconfig
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
