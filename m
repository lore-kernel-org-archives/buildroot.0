Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75DF2C433EF
	for <buildroot@archiver.kernel.org>; Sun, 23 Jan 2022 19:11:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 02F84405EA;
	Sun, 23 Jan 2022 19:11:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DET50GdSFGoS; Sun, 23 Jan 2022 19:11:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CF5E640603;
	Sun, 23 Jan 2022 19:11:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C24241BF97A
 for <buildroot@lists.busybox.net>; Sun, 23 Jan 2022 19:10:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B044F408CF
 for <buildroot@lists.busybox.net>; Sun, 23 Jan 2022 19:10:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5ZkOSo0rnaV3 for <buildroot@lists.busybox.net>;
 Sun, 23 Jan 2022 19:10:48 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 11DF4408CD
 for <buildroot@buildroot.org>; Sun, 23 Jan 2022 19:10:48 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 7D7B28136B; Sun, 23 Jan 2022 19:04:01 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 23 Jan 2022 20:04:49 +0100
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: 815d8f10bcb431151da10434bec034d62e9d287c
X-Git-Newrev: d7836d25c38fc0566dde7547bc1efd70b012413a
X-Patchwork-Hint: ignore
Message-Id: <20220123190401.7D7B28136B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] DEVELOPERS: remove Evan
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

commit: https://git.buildroot.net/buildroot/commit/?id=d7836d25c38fc0566dde7547bc1efd70b012413a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

Evan has privately requested to no longer receive e-mails related to
this Buildroot package.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit acc0d51c53d5da45fc0da725513cd0ab8a2d4107)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index f90224989f..e1e526a666 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -761,9 +761,6 @@ F:	package/optee-test/
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
