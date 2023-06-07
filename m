Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D107AC7EE23
	for <buildroot@archiver.kernel.org>; Wed,  7 Jun 2023 21:33:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6101541838;
	Wed,  7 Jun 2023 21:33:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6101541838
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OMCct0ldAW2n; Wed,  7 Jun 2023 21:33:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 99CD54181E;
	Wed,  7 Jun 2023 21:33:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 99CD54181E
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id EC1C11BF3CD
 for <buildroot@lists.busybox.net>; Wed,  7 Jun 2023 21:33:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C66674181E
 for <buildroot@lists.busybox.net>; Wed,  7 Jun 2023 21:33:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C66674181E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id W8Vj2zfTELec for <buildroot@lists.busybox.net>;
 Wed,  7 Jun 2023 21:33:11 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0CC964180B
 for <buildroot@buildroot.org>; Wed,  7 Jun 2023 21:33:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0CC964180B
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id ECFA586D93; Wed,  7 Jun 2023 21:33:10 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 7 Jun 2023 23:32:45 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: dbb0b4274cdbd74cf22fb4da4c1e43084f3d3125
X-Git-Newrev: 35b1ddbe635c11c7c60f51cbe9203a8f68e24857
X-Patchwork-Hint: ignore
Message-Id: <20230607213310.ECFA586D93@busybox.osuosl.org>
Subject: [Buildroot] [git commit] docs/website/news.html: add 2023.05
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

commit: https://git.buildroot.net/buildroot/commit/?id=35b1ddbe635c11c7c60f51cbe9203a8f68e24857
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 docs/website/news.html | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/docs/website/news.html b/docs/website/news.html
index 32e9273215..1a2af7ccfc 100644
--- a/docs/website/news.html
+++ b/docs/website/news.html
@@ -20,7 +20,8 @@
 	<p>The stable 2023.05 release is out - Thanks to everyone
 	  contributing and testing the release candidates. See the
 	  <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2023.05">CHANGES</a>
-	  file for more details
+	  file for more details, read the
+	  <a href="https://lore.kernel.org/buildroot/87r0qn2c77.fsf@48ers.dk/T/#u">announcement</a>
 	  and go to the <a href="/downloads/">downloads page</a> to pick up the
 	  <a href="/downloads/buildroot-2023.05.tar.xz">2023.05 release</a>.</p>
       </div>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
