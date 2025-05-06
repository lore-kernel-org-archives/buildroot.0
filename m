Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2C7BC54756
	for <buildroot@archiver.kernel.org>; Mon, 19 May 2025 10:57:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8C44281751;
	Mon, 19 May 2025 10:57:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eb4Fuj3AdNsW; Mon, 19 May 2025 10:57:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B6DB38177A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B6DB38177A;
	Mon, 19 May 2025 10:57:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id AE182D4
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:45:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 99C0E410BD
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:40:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7METlAegTIg0 for <buildroot@buildroot.org>;
 Mon, 19 May 2025 10:40:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1D71D40DF8
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1D71D40DF8
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:39:59 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 194B582A2E; Mon, 19 May 2025 10:39:59 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Tue, 6 May 2025 18:01:10 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 108af0293504d6ad8858df8e580c347da6e42498
X-Git-Newrev: 9d3c4130d799f1523d071df624124120b58016cd
X-Patchwork-Hint: ignore
Message-Id: <20250519103959.194B582A2E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] DEVELOPERS: remove Alexander
 Mukhin from tinyproxy and zfs
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

commit: https://git.buildroot.net/buildroot/commit/?id=9d3c4130d799f1523d071df624124120b58016cd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Alexander Mukhin <alexander.i.mukhin@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 DEVELOPERS | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index 5bb81ad149..d314be7946 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -131,10 +131,6 @@ F:	package/openpgm/
 N:	Aleksandr Makarov <aleksandr.o.makarov@gmail.com>
 F:	package/libest/
 
-N:	Alexander Mukhin <alexander.i.mukhin@gmail.com>
-F:	package/tinyproxy/
-F:	package/zfs/
-
 N:	Alexander Sverdlin <alexander.sverdlin@gmail.com>
 F:	package/mini-snmpd/
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
