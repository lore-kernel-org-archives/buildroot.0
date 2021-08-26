Return-Path: <SRS0=2pYX=NR=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,URI_HEX autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B00ABC432BE
	for <buildroot@archiver.kernel.org>; Thu, 26 Aug 2021 22:20:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7DF7F60FE7
	for <buildroot@archiver.kernel.org>; Thu, 26 Aug 2021 22:20:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7DF7F60FE7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 55E1F80E13;
	Thu, 26 Aug 2021 22:20:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8r35lmQKcB21; Thu, 26 Aug 2021 22:20:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 133C182BF4;
	Thu, 26 Aug 2021 22:20:21 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E8F371C113E
 for <buildroot@lists.busybox.net>; Thu, 26 Aug 2021 22:02:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 35B1C6149D
 for <buildroot@lists.busybox.net>; Thu, 26 Aug 2021 22:02:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6sbf9EVHVjHe for <buildroot@lists.busybox.net>;
 Thu, 26 Aug 2021 22:02:38 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id DCEB6614B4
 for <buildroot@buildroot.org>; Thu, 26 Aug 2021 22:02:35 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 3D8998DC50; Thu, 26 Aug 2021 22:01:34 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Thu, 26 Aug 2021 23:09:17 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 42a3fee35e67d8d946f52a82bfa88ee6fd9f04b6
X-Git-Newrev: fa1a4bbf09e8650cc73773fe2cf08d0b5216d6c1
X-Patchwork-Hint: ignore
Message-Id: <20210826220134.3D8998DC50@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] docs/website: use lore for ml
 search
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

commit: https://git.buildroot.net/buildroot/commit/?id=fa1a4bbf09e8650cc73773fe2cf08d0b5216d6c1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

the nabble.com link is dead and lore has a good search.
So use lore for the search form.

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 docs/website/support.html | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/docs/website/support.html b/docs/website/support.html
index 97ca296836..90231f601c 100644
--- a/docs/website/support.html
+++ b/docs/website/support.html
@@ -59,11 +59,8 @@
 		    list, since there is a good chance someone else has asked the same question
 		    before.</p>
 
-		  <form method="get" action="http://buildroot-busybox.2317881.n4.nabble.com/template/NamlServlet.jtp">
-		    <input type="text" name="query">
-		    <input type="hidden" name="macro" value="search_page">
-		    <input type="hidden" name="node" value="2">
-		    <input type="hidden" name="sort" value="date">
+		  <form method="get" action="https://lore.kernel.org/buildroot/">
+		    <input type="text" name="q">
 		    <button type="submit" class="btn btn-default">Submit</button>
 		  </form>
 		</div>
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
