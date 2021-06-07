Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51F37C4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 22:58:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 03EBC604AC
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 22:58:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 03EBC604AC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D1ABB608F2;
	Tue,  3 Aug 2021 22:58:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mzgQzNRzATHl; Tue,  3 Aug 2021 22:58:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 271E1600C9;
	Tue,  3 Aug 2021 22:58:35 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 54B8A1BF349
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:12:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D81A940637
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:09:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id n8bvRSupiwpJ for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:09:58 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 89CEA40588
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:09:56 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id DCC7C85F62; Tue,  3 Aug 2021 21:09:48 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 7 Jun 2021 11:19:43 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 69f79f2a2ee1417e19c1ead2c9226e11753c06cb
X-Git-Newrev: 7741d86a7d84fd7d32698e77378f6299297493a8
X-Patchwork-Hint: ignore
Message-Id: <20210803210948.DCC7C85F62@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] docs/website/news.html: add
 2021.05 announcement link
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=7741d86a7d84fd7d32698e77378f6299297493a8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 docs/website/news.html | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/docs/website/news.html b/docs/website/news.html
index 2a27508bde..f2eef15c31 100644
--- a/docs/website/news.html
+++ b/docs/website/news.html
@@ -20,7 +20,8 @@
 	<p>The stable 2021.05 release is out - Thanks to everyone
 	  contributing and testing the release candidates. See the
 	  <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2021.05">CHANGES</a>
-	  file for more details
+	  file for more details, read the
+	  <a href="http://lists.busybox.net/pipermail/buildroot/2021-June/311946.html">announcement</a>
 	  and go to the <a href="/downloads/">downloads page</a> to pick up the
 	  <a href="/downloads/buildroot-2021.05.tar.bz2">2021.05 release</a>.</p>
       </div>
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
