Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1DB4C282C6
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 16:35:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AC7F14F17D;
	Fri, 28 Feb 2025 16:35:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JDhnXrp8zTNm; Fri, 28 Feb 2025 16:35:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 15AF643B5B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 15AF643B5B;
	Fri, 28 Feb 2025 16:35:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 077B168
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 33B56419B1
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:29:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RNsqoz_BOdFP for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:29:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BD1E84199A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id BD1E84199A
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:29:33 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9EBA086307; Fri, 28 Feb 2025 16:29:33 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 8 Dec 2024 13:59:35 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 8f9ce0c913bc00127126456df89379daf9c1e03a
X-Git-Newrev: ef33e6bce6820199d6b518aca8c0f75f0744d591
X-Patchwork-Hint: ignore
Message-Id: <20250228162933.9EBA086307@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] docs/website/news.html: add
 2024.11 announcement link
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

commit: https://git.buildroot.net/buildroot/commit/?id=ef33e6bce6820199d6b518aca8c0f75f0744d591
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 docs/website/news.html | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/docs/website/news.html b/docs/website/news.html
index c646f1c37a..bf48b626a0 100644
--- a/docs/website/news.html
+++ b/docs/website/news.html
@@ -20,7 +20,8 @@
 	<p>The stable 2024.11 release is out - Thanks to everyone
 	  contributing and testing the release candidates. See the
 	  <a href="https://gitlab.com/buildroot.org/buildroot/-/blob/2024.11/CHANGES">CHANGES</a>
-	  file for more details
+	  file for more details, read the
+	  <a href="https://lore.kernel.org/buildroot/871pyi2uye.fsf@dell.be.48ers.dk/T/#u">announcement</a>.
 	  and go to the <a href="/downloads/">downloads page</a> to pick up the
 	  <a href="/downloads/buildroot-2024.11.tar.xz">2024.11 release</a>.</p>
       </div>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
