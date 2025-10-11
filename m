Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93D82CCA476
	for <buildroot@archiver.kernel.org>; Sat, 11 Oct 2025 21:29:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5E86160BD7;
	Sat, 11 Oct 2025 21:29:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1wx-Z2Wg8SVk; Sat, 11 Oct 2025 21:29:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8D13360BD8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8D13360BD8;
	Sat, 11 Oct 2025 21:29:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 45899BC
 for <buildroot@buildroot.org>; Sat, 11 Oct 2025 21:29:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2BFEB40831
 for <buildroot@buildroot.org>; Sat, 11 Oct 2025 21:29:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aiDlEKoCQyxe for <buildroot@buildroot.org>;
 Sat, 11 Oct 2025 21:29:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 515D740826
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 515D740826
 for <buildroot@buildroot.org>; Sat, 11 Oct 2025 21:29:00 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3FD5D86F11; Sat, 11 Oct 2025 21:29:00 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 11 Oct 2025 23:26:44 +0200
X-Git-Refname: refs/heads/2025.05.x
X-Git-Oldrev: 019201c6e007d80c1ab1bf65b98d9902bc767bdd
X-Git-Newrev: 85c588cdf9bafa37eb2a2c24e50ffe070e85d2b9
X-Patchwork-Hint: ignore
Message-Id: <20251011212900.3FD5D86F11@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.05.x] CHANGES: correct the date
 of 2025.05.3 release
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

commit: https://git.buildroot.net/buildroot/commit/?id=85c588cdf9bafa37eb2a2c24e50ffe070e85d2b9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.05.x

Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 CHANGES | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/CHANGES b/CHANGES
index a29d0f2dcd..87d4cf9ae4 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,6 +1,7 @@
-2025.05.3, released October XX, 2025
+2025.05.3, released October 11, 2025
 
     This is the final release on the 2025.05.x branch.
+
     Important / security related fixes:
 
     - atop: CVE-2025-31160
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
