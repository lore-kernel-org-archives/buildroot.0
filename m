Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE608C433F5
	for <buildroot@archiver.kernel.org>; Sat, 15 Jan 2022 11:02:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0A2FD40575;
	Sat, 15 Jan 2022 11:02:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id L7s2i242l2ek; Sat, 15 Jan 2022 11:02:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1B57B40571;
	Sat, 15 Jan 2022 11:02:17 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BF5661BF95E
 for <buildroot@lists.busybox.net>; Sat, 15 Jan 2022 11:01:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AE5B260AC1
 for <buildroot@lists.busybox.net>; Sat, 15 Jan 2022 11:01:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TcJ14yYt9def for <buildroot@lists.busybox.net>;
 Sat, 15 Jan 2022 11:01:50 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0C77F60A8F
 for <buildroot@buildroot.org>; Sat, 15 Jan 2022 11:01:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 32F7F82911; Sat, 15 Jan 2022 10:55:22 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 15 Jan 2022 11:59:14 +0100
X-Git-Refname: refs/heads/2021.11.x
X-Git-Oldrev: 74d578c31c67afaf9fb7a92c07b34e24cc09d1c1
X-Git-Newrev: 1de8b3afe12c40fd127011b888f1c7f55b2227ff
X-Patchwork-Hint: ignore
Message-Id: <20220115105522.32F7F82911@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.11.x] DEVELOPERS: remove Roman
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

commit: https://git.buildroot.net/buildroot/commit/?id=1de8b3afe12c40fd127011b888f1c7f55b2227ff
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.11.x

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
index c9848ac428..048d88ff55 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2402,9 +2402,6 @@ F:	support/testing/tests/package/test_glxinfo.py
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
