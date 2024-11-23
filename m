Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64E4BE6ADF0
	for <buildroot@archiver.kernel.org>; Sat, 23 Nov 2024 10:41:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CF6B642D44;
	Sat, 23 Nov 2024 10:41:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SK2r-Q45JBD4; Sat, 23 Nov 2024 10:41:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F09BE42D45
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id F09BE42D45;
	Sat, 23 Nov 2024 10:41:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 48FAE1E39
 for <buildroot@buildroot.org>; Sat, 23 Nov 2024 10:41:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 29A7742C4B
 for <buildroot@buildroot.org>; Sat, 23 Nov 2024 10:41:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P3Wr8PGf8Rqe for <buildroot@buildroot.org>;
 Sat, 23 Nov 2024 10:41:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E6B0F42D44
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id E6B0F42D44
 for <buildroot@buildroot.org>; Sat, 23 Nov 2024 10:41:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D3A59864A8; Sat, 23 Nov 2024 10:41:09 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 23 Nov 2024 11:40:14 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 366d403bedd83d1e884b6c7c60a8a4ff497a458a
X-Git-Newrev: b617eb3281ed56aa8ff63af2bb9bccafcd8b7f2b
X-Patchwork-Hint: ignore
Message-Id: <20241123104109.D3A59864A8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] docs/website/news.html: refer to gitlab
 for buildroot-test repo
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

commit: https://git.buildroot.net/buildroot/commit/?id=b617eb3281ed56aa8ff63af2bb9bccafcd8b7f2b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 docs/website/news.html | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/docs/website/news.html b/docs/website/news.html
index 141d509944..646c107680 100644
--- a/docs/website/news.html
+++ b/docs/website/news.html
@@ -7713,7 +7713,7 @@
 	  integration testing, is now online
 	  at <a href='http://autobuild.buildroot.org'>autobuild.buildroot.org</a>. The
 	  code behind it can be found
-	  in <a href='http://git.buildroot.net/buildroot-test/'>git</a>.</p>
+	  in <a href='https://gitlab.com/buildroot.org/buildroot-test'>git</a>.</p>
 
 	<p>Thanks to Thomas Petazzoni for running the web interface, and
 	  to <a href='http://gcc.gnu.org/wiki/CompileFarm'>The GCC Compile
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
