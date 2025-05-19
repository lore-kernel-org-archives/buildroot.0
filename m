Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68724C3DA6D
	for <buildroot@archiver.kernel.org>; Mon, 19 May 2025 07:58:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3404F405B5;
	Mon, 19 May 2025 07:58:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aID1BAGIAVlC; Mon, 19 May 2025 07:58:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7000F405FA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7000F405FA;
	Mon, 19 May 2025 07:58:24 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id DBB48E4
 for <buildroot@buildroot.org>; Mon, 19 May 2025 07:58:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D838F408D2
 for <buildroot@buildroot.org>; Mon, 19 May 2025 07:58:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id U6yu5MwyQ2U2 for <buildroot@buildroot.org>;
 Mon, 19 May 2025 07:58:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3A508405FA
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3A508405FA
 for <buildroot@buildroot.org>; Mon, 19 May 2025 07:58:22 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 369148015C; Mon, 19 May 2025 07:58:22 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 19 May 2025 09:57:51 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 43a74db62155d6adb727e57f29da5341eec56216
X-Git-Newrev: b55957fa65a551be367c32f2710be56dabb63632
X-Patchwork-Hint: ignore
Message-Id: <20250519075822.369148015C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] CHANGES: Update for 2025.02.3
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=b55957fa65a551be367c32f2710be56dabb63632
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
(cherry picked from commit eee9775d124d955b4146f73273ce1fddd82e8f6b)
---
 CHANGES | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/CHANGES b/CHANGES
index 14605e8eca..cdf036f7de 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,8 @@
+2025.02.3, released May 19th, 2025
+	Build issues and other problems solved for packages:
+
+        libcap
+
 2025.02.2, released May 18th, 2025
 
 	Important / security related fixes:
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
