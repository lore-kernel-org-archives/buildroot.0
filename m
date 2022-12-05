Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C60EC4321E
	for <buildroot@archiver.kernel.org>; Mon,  5 Dec 2022 08:02:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D27D981926;
	Mon,  5 Dec 2022 08:02:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D27D981926
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id a6fPzgBHmITX; Mon,  5 Dec 2022 08:02:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 280E4818EC;
	Mon,  5 Dec 2022 08:02:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 280E4818EC
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E77361BF8C7
 for <buildroot@lists.busybox.net>; Mon,  5 Dec 2022 08:01:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C1AED410BA
 for <buildroot@lists.busybox.net>; Mon,  5 Dec 2022 08:01:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C1AED410BA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kTLxV-I-KAU0 for <buildroot@lists.busybox.net>;
 Mon,  5 Dec 2022 08:01:44 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id C597C40A01
 for <buildroot@buildroot.org>; Mon,  5 Dec 2022 08:01:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C597C40A01
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B05A485788; Mon,  5 Dec 2022 08:01:44 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 5 Dec 2022 08:59:51 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 40bd4a32aadaa1d041a8525628ecaaf7f5a7fde6
X-Git-Newrev: 45c6747faed26a92b142b19a00062032c5c0f542
X-Patchwork-Hint: ignore
Message-Id: <20221205080144.B05A485788@busybox.osuosl.org>
Subject: [Buildroot] [git commit] docs/website/news.html: add 2022.11
 announcement link
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

commit: https://git.buildroot.net/buildroot/commit/?id=45c6747faed26a92b142b19a00062032c5c0f542
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 docs/website/news.html | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/docs/website/news.html b/docs/website/news.html
index 9be00982cb..8f7e22a0b9 100644
--- a/docs/website/news.html
+++ b/docs/website/news.html
@@ -20,7 +20,8 @@
 	<p>The stable 2022.11 release is out - Thanks to everyone
 	  contributing and testing the release candidates. See the
 	  <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2022.11">CHANGES</a>
-	  file for more details
+	  file for more details, read the
+	  <a href="http://lists.busybox.net/pipermail/buildroot/2022-December/656980.html">announcement</a>
 	  and go to the <a href="/downloads/">downloads page</a> to pick up the
 	  <a href="/downloads/buildroot-2022.11.tar.xz">2022.11 release</a>.</p>
       </div>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
