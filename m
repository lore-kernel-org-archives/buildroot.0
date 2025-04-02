Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1470DC3ABD8
	for <buildroot@archiver.kernel.org>; Mon, 19 May 2025 10:45:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D235B83D6C;
	Mon, 19 May 2025 10:45:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id n56dh5x6YRlE; Mon, 19 May 2025 10:45:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 156E383D5F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 156E383D5F;
	Mon, 19 May 2025 10:45:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 11505193
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:41:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B13AD411EA
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:39:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1XBO0pZf0AGy for <buildroot@buildroot.org>;
 Mon, 19 May 2025 10:39:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DD94440E0D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id DD94440E0D
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:39:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D9BE584A21; Mon, 19 May 2025 10:39:46 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Wed, 2 Apr 2025 21:07:36 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 57647739576ca542bee6e05c5c839f48e86ce98b
X-Git-Newrev: e6418ecad427f509d71f6d62920b753cf754012a
X-Patchwork-Hint: ignore
Message-Id: <20250519103946.D9BE584A21@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] DEVELOPERS: change arnout's
 address
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

commit: https://git.buildroot.net/buildroot/commit/?id=e6418ecad427f509d71f6d62920b753cf754012a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 DEVELOPERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index a26a4cbe68..1c84f95943 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -278,7 +278,7 @@ F:	package/espeak/
 N:	Arno Messiaen <arnomessiaen@gmail.com>
 F:	package/python-aiohttp-sse-client/
 
-N:	Arnout Vandecappelle <arnout@mind.be>
+N:	Arnout Vandecappelle <arnout@rnout.be>
 F:	package/arp-scan/
 F:	package/dehydrated/
 F:	package/dracut/
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
