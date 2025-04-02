Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D821EC28B20
	for <buildroot@archiver.kernel.org>; Wed,  2 Apr 2025 19:08:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8AB256F7A4;
	Wed,  2 Apr 2025 19:08:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pITx5ojMBLqu; Wed,  2 Apr 2025 19:08:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C56D060A82
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C56D060A82;
	Wed,  2 Apr 2025 19:08:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 6594811F
 for <buildroot@buildroot.org>; Wed,  2 Apr 2025 19:08:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4F52040591
 for <buildroot@buildroot.org>; Wed,  2 Apr 2025 19:08:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id m97u0uevPX-o for <buildroot@buildroot.org>;
 Wed,  2 Apr 2025 19:08:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7B1CC4053F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7B1CC4053F
 for <buildroot@buildroot.org>; Wed,  2 Apr 2025 19:08:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 683EF83A8C; Wed,  2 Apr 2025 19:08:46 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Wed, 2 Apr 2025 21:07:36 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 57647739576ca542bee6e05c5c839f48e86ce98b
X-Git-Newrev: e6418ecad427f509d71f6d62920b753cf754012a
X-Patchwork-Hint: ignore
Message-Id: <20250402190846.683EF83A8C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] DEVELOPERS: change arnout's address
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
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
