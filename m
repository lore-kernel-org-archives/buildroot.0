Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA786C433EF
	for <buildroot@archiver.kernel.org>; Sat, 15 Jan 2022 11:04:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AF8C082865;
	Sat, 15 Jan 2022 11:04:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ataDiJmTzL1h; Sat, 15 Jan 2022 11:04:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 160228140A;
	Sat, 15 Jan 2022 11:04:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2D6C41BF95D
 for <buildroot@lists.busybox.net>; Sat, 15 Jan 2022 11:01:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2B56B80BD6
 for <buildroot@lists.busybox.net>; Sat, 15 Jan 2022 11:01:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zTIicNKYKGzX for <buildroot@lists.busybox.net>;
 Sat, 15 Jan 2022 11:01:54 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 74F3E80BF2
 for <buildroot@buildroot.org>; Sat, 15 Jan 2022 11:01:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 8E0D3829F9; Sat, 15 Jan 2022 10:55:26 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 15 Jan 2022 11:59:08 +0100
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: c0fe00a878c573663e2cb1cab3ecd8f68eecd340
X-Git-Newrev: 654d798b829c4f677fa5eca99a4a0e569ec3fa1c
X-Patchwork-Hint: ignore
Message-Id: <20220115105526.8E0D3829F9@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] DEVELOPERS: remove Roman
 Gorbenkov, e-mail bouncing
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

commit: https://git.buildroot.net/buildroot/commit/?id=654d798b829c4f677fa5eca99a4a0e569ec3fa1c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

<roman.gorbenkov@ens2m.org>: host mxd.relay.renater.fr[194.214.200.9] said: 550
    5.5.0 Requested actions not taken as the mailbox is unavailable (in reply
    to RCPT TO command)

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 656f4a3718c5c643e419718ee693109093accbd9)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index a2c4368dd0..2d7f971b25 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2284,9 +2284,6 @@ F:	support/testing/tests/package/test_glxinfo.py
 F:	support/testing/tests/package/test_openssh.py
 F:	toolchain/
 
-N:	Roman Gorbenkov <roman.gorbenkov@ens2m.org>
-F:	package/davfs2/
-
 N:	Ryan Barnett <ryan.barnett@collins.com>
 F:	package/atftp/
 F:	package/c-periphery/
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
