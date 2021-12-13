Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6C11C433F5
	for <buildroot@archiver.kernel.org>; Mon, 13 Dec 2021 08:08:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6BA0A60766;
	Mon, 13 Dec 2021 08:08:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ifi52GExuz4Q; Mon, 13 Dec 2021 08:08:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B814B60753;
	Mon, 13 Dec 2021 08:08:48 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4A8F81BF3EF
 for <buildroot@lists.busybox.net>; Mon, 13 Dec 2021 08:08:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 47CA980F8E
 for <buildroot@lists.busybox.net>; Mon, 13 Dec 2021 08:08:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qHHdyVJlaWC3 for <buildroot@lists.busybox.net>;
 Mon, 13 Dec 2021 08:08:46 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1CD3380F87
 for <buildroot@buildroot.org>; Mon, 13 Dec 2021 08:08:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 791558380D; Mon, 13 Dec 2021 08:03:33 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Mon, 13 Dec 2021 09:08:17 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a1c0f17a5386e0eee9199c3ef5b63459fb459dfb
X-Git-Newrev: 656f4a3718c5c643e419718ee693109093accbd9
X-Patchwork-Hint: ignore
Message-Id: <20211213080333.791558380D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] DEVELOPERS: remove Roman Gorbenkov,
 e-mail bouncing
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

commit: https://git.buildroot.net/buildroot/commit/?id=656f4a3718c5c643e419718ee693109093accbd9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

<roman.gorbenkov@ens2m.org>: host mxd.relay.renater.fr[194.214.200.9] said: 550
    5.5.0 Requested actions not taken as the mailbox is unavailable (in reply
    to RCPT TO command)

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index adfd1b76fe..7abac2421d 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2415,9 +2415,6 @@ F:	support/testing/tests/package/test_glxinfo.py
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
