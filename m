Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA4ABCD8CAB
	for <buildroot@archiver.kernel.org>; Mon,  8 Jun 2026 20:53:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1EAA6844F6;
	Mon,  8 Jun 2026 20:53:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dbqcym0lA4l2; Mon,  8 Jun 2026 20:53:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BC65084694
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780951998;
	bh=bnC97pqjVYb3a5r6odLt4TuVV6juZouc9cYLEGKua/8=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=k8/hQ+MnWXAJhohooqQuEM21HTTucfmABvJFZdhExmK5ycjphWKLkqBCD4hrdIsZE
	 +UITDPjNioWMAoOf5pqzA8WOknT6gTD5n5yfZbXUlochmApyWQtXyBmmDv94nbHWjD
	 /ehIVeo6ZiBl0HLrQ5YnVl9yBqwasoIz1MPtnqsVeSSdp317reWsRJMIRba8cAuZHA
	 WUyg5l7s7spLFoMAwBK5OLP9yK/wDwbs+/Z8InBBZoCR5yIvjWjiQBYv8LnFL+8Y0G
	 OzTKU/qdNl1UlEN0jiY6zjpWygvxKm+fJeZYbxSZuItym4nrcpbKBJ6sogt6EvfIsg
	 w3PD22EIBLTIg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id BC65084694;
	Mon,  8 Jun 2026 20:53:18 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 22A69323
 for <buildroot@buildroot.org>; Mon,  8 Jun 2026 20:53:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 10F6642286
 for <buildroot@buildroot.org>; Mon,  8 Jun 2026 20:53:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id w0paW5CWTtlN for <buildroot@buildroot.org>;
 Mon,  8 Jun 2026 20:53:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6416540358
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6416540358
 for <buildroot@buildroot.org>; Mon,  8 Jun 2026 20:53:15 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DB22D87CD8; Mon,  8 Jun 2026 20:52:57 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 8 Jun 2026 22:52:13 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 313414b92c2501a2bc123ffa1b6383dca464de05
X-Git-Newrev: 3a4b5e64ec761d687fb7156a7c488c3428c63721
X-Patchwork-Hint: ignore
Message-Id: <20260608205257.DB22D87CD8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] docs/website/news.html: add 2026.05
 announcement link
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/3a4b5e64ec761d687fb7156a7c488c3428c63721
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 docs/website/news.html | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/docs/website/news.html b/docs/website/news.html
index 7756b0a1fd..e7cb6b893b 100644
--- a/docs/website/news.html
+++ b/docs/website/news.html
@@ -20,7 +20,8 @@
 	<p>The stable 2026.05 release is out - Thanks to everyone
 	  contributing and testing the release candidates. See the
 	  <a href="https://gitlab.com/buildroot.org/buildroot/-/blob/2026.05/CHANGES">CHANGES</a>
-	  file for more details
+	  file for more details, read the
+	  <a href="https://lore.kernel.org/buildroot/87fr2wpxhj.fsf@dell.be.48ers.dk/T/#u">announcement</a>
 	  and go to the <a href="/downloads/">downloads page</a> to pick up the
 	  <a href="/downloads/buildroot-2026.05.tar.xz">2026.05 release</a>.</p>
       </div>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
