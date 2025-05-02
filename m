Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9860C3ABAA
	for <buildroot@archiver.kernel.org>; Fri,  2 May 2025 11:13:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 74E23424A8;
	Fri,  2 May 2025 11:13:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6CJoEyJYwkxU; Fri,  2 May 2025 11:13:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9746E423B5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9746E423B5;
	Fri,  2 May 2025 11:13:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0E03F229
 for <buildroot@buildroot.org>; Fri,  2 May 2025 11:11:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 77E9741521
 for <buildroot@buildroot.org>; Fri,  2 May 2025 11:11:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BwpFvQGlCmzQ for <buildroot@buildroot.org>;
 Fri,  2 May 2025 11:11:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E2319417BF
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id E2319417BF
 for <buildroot@buildroot.org>; Fri,  2 May 2025 11:11:35 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E02F9864AE; Fri,  2 May 2025 11:11:35 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 2 May 2025 12:11:16 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 0d3ad6c583bcda5497a08c17ce3fceb43f4d5c17
X-Git-Newrev: 5d15476ee3f9457697c7048b0a31ba19e8cf1786
X-Patchwork-Hint: ignore
Message-Id: <20250502111135.E02F9864AE@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x]
 board/raspberrypi/readme.txt: add missing Raspberry Pi Zero models
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
Content-Type: multipart/mixed; boundary="===============8160466182902378144=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8160466182902378144==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=5d15476ee3f9457697c7048b0a31ba19e8cf1786
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

This adds the missing Raspberry Pi Zero models to the list.

Signed-off-by: Gaël PORTAY <gael.portay+rtone@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit dc00f366b8c1e1d54c00cf1aa9f7adae4e2fdd1b)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 board/raspberrypi/readme.txt | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/board/raspberrypi/readme.txt b/board/raspberrypi/readme.txt
index c12a8969f1..4a0903578b 100644
--- a/board/raspberrypi/readme.txt
+++ b/board/raspberrypi/readme.txt
@@ -6,6 +6,9 @@ Intro
 These instructions apply to all models of the Raspberry Pi:
   - the original models A and B,
   - the "enhanced" models A+ and B+,
+  - the model Zero (aka Raspberry Pi Zero)
+  - the model Zero W (aka Raspberry Pi Zero W)
+  - the model Zero 2 W (aka Raspberry Pi Zero 2 W)
   - the model B2 (aka Raspberry Pi 2)
   - the model B3 (aka Raspberry Pi 3).
   - the model B4 (aka Raspberry Pi 4).

--===============8160466182902378144==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8160466182902378144==--
