Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37AE6E6ADF0
	for <buildroot@archiver.kernel.org>; Sat, 23 Nov 2024 10:41:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D8F0F42BD9;
	Sat, 23 Nov 2024 10:41:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id I5z6PGTRF2Bg; Sat, 23 Nov 2024 10:41:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C6F0C42C4B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C6F0C42C4B;
	Sat, 23 Nov 2024 10:41:12 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 3B3C41D8B
 for <buildroot@buildroot.org>; Sat, 23 Nov 2024 10:41:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2784540A97
 for <buildroot@buildroot.org>; Sat, 23 Nov 2024 10:41:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lyMUmY16qb3T for <buildroot@buildroot.org>;
 Sat, 23 Nov 2024 10:41:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DD47640A82
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id DD47640A82
 for <buildroot@buildroot.org>; Sat, 23 Nov 2024 10:41:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C756C8649C; Sat, 23 Nov 2024 10:41:09 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 23 Nov 2024 11:36:10 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 81d111dbd49fd0597fdec3924c29f7c9e09e7d89
X-Git-Newrev: 366d403bedd83d1e884b6c7c60a8a4ff497a458a
X-Patchwork-Hint: ignore
Message-Id: <20241123104109.C756C8649C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] docs/website/news.html: use gitlab for all
 CHANGES links
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

commit: https://git.buildroot.net/buildroot/commit/?id=366d403bedd83d1e884b6c7c60a8a4ff497a458a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We migrated to Gitlab a while ago, so update the CHANGES links to point to
that rather than git.buildroot.net.

Automated with:

sed -i 's|http://git.buildroot.net/buildroot/plain/CHANGES?id=\([^"]*\)|https://gitlab.com/buildroot.org/buildroot/-/blob/\1/CHANGES|g' \
 docs/website/news.html

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 docs/website/news.html | 776 ++++++++++++++++++++++++-------------------------
 1 file changed, 388 insertions(+), 388 deletions(-)

Patch is too large, so refusing to show it
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
