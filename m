Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7991FC87FDB
	for <buildroot@archiver.kernel.org>; Mon, 11 Aug 2025 11:26:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 389AC411BD;
	Mon, 11 Aug 2025 11:26:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9m8zMw7vaSRv; Mon, 11 Aug 2025 11:25:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 47E3341217
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 47E3341217;
	Mon, 11 Aug 2025 11:25:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id F3DEF138
 for <buildroot@buildroot.org>; Mon, 11 Aug 2025 11:25:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F11BB83E12
 for <buildroot@buildroot.org>; Mon, 11 Aug 2025 11:25:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Z8144oVtvnmS for <buildroot@buildroot.org>;
 Mon, 11 Aug 2025 11:25:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2DE5E83DCE
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2DE5E83DCE
 for <buildroot@buildroot.org>; Mon, 11 Aug 2025 11:25:57 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 25B5F873D4; Mon, 11 Aug 2025 11:25:57 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 11 Aug 2025 13:21:59 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: eac5605b576474c3619de17309fff41a7f0f1871
X-Git-Newrev: bbbe5d3343c72bd852fce16409156ccdfaff1d18
X-Patchwork-Hint: ignore
Message-Id: <20250811112557.25B5F873D4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] CHANGES: correct 2025.02.3 formatting
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

commit: https://git.buildroot.net/buildroot/commit/?id=bbbe5d3343c72bd852fce16409156ccdfaff1d18
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit b55957fa65a5 ("CHANGES: Update for 2025.02.3" added an entry for
2025.02.3, but forgot to add an empty line after the title.  Fix that.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES | 1 +
 1 file changed, 1 insertion(+)

diff --git a/CHANGES b/CHANGES
index 957a838a7e..e57ccb1c09 100644
--- a/CHANGES
+++ b/CHANGES
@@ -161,6 +161,7 @@
 	libopenh264, libssh, netsnmp, ninja, qt5base, ripgrep, sox, tinyxml
 
 2025.02.3, released May 19th, 2025
+
 	Build issues and other problems solved for packages:
 
         libcap
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
