Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52C24C2D0CD
	for <buildroot@archiver.kernel.org>; Mon, 19 May 2025 07:43:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F23C760E51;
	Mon, 19 May 2025 07:43:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TdtRZ4a7Mc7A; Mon, 19 May 2025 07:43:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9F68F60E1B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9F68F60E1B;
	Mon, 19 May 2025 07:43:20 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 95831193
 for <buildroot@buildroot.org>; Mon, 19 May 2025 07:43:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7BDC960E21
 for <buildroot@buildroot.org>; Mon, 19 May 2025 07:43:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EVU9Md8DgZFX for <buildroot@buildroot.org>;
 Mon, 19 May 2025 07:43:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D5CFD607D6
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id D5CFD607D6
 for <buildroot@buildroot.org>; Mon, 19 May 2025 07:43:17 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BB6FC85E1A; Mon, 19 May 2025 07:43:17 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 19 May 2025 09:29:33 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 6441b3e5d007e4b92954ca8567faa10fc28fccc0
X-Git-Newrev: eee9775d124d955b4146f73273ce1fddd82e8f6b
X-Patchwork-Hint: ignore
Message-Id: <20250519074317.BB6FC85E1A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] CHANGES: Update for
 2025.02.3
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

commit: https://git.buildroot.net/buildroot/commit/?id=eee9775d124d955b4146f73273ce1fddd82e8f6b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 CHANGES | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/CHANGES b/CHANGES
index 32acdc13e7..83af598510 100644
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
