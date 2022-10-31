Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 417BEECAAA1
	for <buildroot@archiver.kernel.org>; Mon, 31 Oct 2022 14:01:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 151D160C19;
	Mon, 31 Oct 2022 14:01:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 151D160C19
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id he6jdv3E53US; Mon, 31 Oct 2022 14:01:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8F65160BE9;
	Mon, 31 Oct 2022 14:01:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8F65160BE9
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D9B621BF401
 for <buildroot@lists.busybox.net>; Mon, 31 Oct 2022 14:01:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B2EA581454
 for <buildroot@lists.busybox.net>; Mon, 31 Oct 2022 14:01:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B2EA581454
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id W0c5U7sytbrt for <buildroot@lists.busybox.net>;
 Mon, 31 Oct 2022 14:01:24 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id AAC208140A
 for <buildroot@buildroot.org>; Mon, 31 Oct 2022 14:01:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AAC208140A
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 92F0287931; Mon, 31 Oct 2022 14:01:24 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 31 Oct 2022 13:55:10 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 43f96ced67c9a1f84d3f0edf5cd632178eb176b8
X-Git-Newrev: 2d5a94b742d5b21f480d299c319a58a5c989b382
X-Patchwork-Hint: ignore
Message-Id: <20221031140124.92F0287931@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/docopt-cpp: fix comment header in
 .mk file
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

commit: https://git.buildroot.net/buildroot/commit/?id=2d5a94b742d5b21f480d299c319a58a5c989b382
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This was missed in commit
43f96ced67c9a1f84d3f0edf5cd632178eb176b8 ("package/docopt-cpp: new
package")

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/docopt-cpp/docopt-cpp.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/docopt-cpp/docopt-cpp.mk b/package/docopt-cpp/docopt-cpp.mk
index d90b82820f..897b907822 100644
--- a/package/docopt-cpp/docopt-cpp.mk
+++ b/package/docopt-cpp/docopt-cpp.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# docopt.cpp
+# docopt-cpp
 #
 ################################################################################
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
