Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05F3BC369C4
	for <buildroot@archiver.kernel.org>; Wed, 16 Apr 2025 19:20:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 056D461AB2;
	Wed, 16 Apr 2025 19:20:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ntISrFJligBe; Wed, 16 Apr 2025 19:20:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 04DB060F39
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 04DB060F39;
	Wed, 16 Apr 2025 19:20:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0F9CC920
 for <buildroot@buildroot.org>; Wed, 16 Apr 2025 19:20:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 01B178128F
 for <buildroot@buildroot.org>; Wed, 16 Apr 2025 19:20:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id amzxCSY3r9Dl for <buildroot@buildroot.org>;
 Wed, 16 Apr 2025 19:20:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4C08B81008
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4C08B81008
 for <buildroot@buildroot.org>; Wed, 16 Apr 2025 19:20:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4763B84F5B; Wed, 16 Apr 2025 19:20:09 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Wed, 16 Apr 2025 21:14:24 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7ebcfe3cb99ba536b5dcce7704956aeb11b6a57b
X-Git-Newrev: dc00f366b8c1e1d54c00cf1aa9f7adae4e2fdd1b
X-Patchwork-Hint: ignore
Message-Id: <20250416192009.4763B84F5B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] board/raspberrypi/readme.txt: add missing
 Raspberry Pi Zero models
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
Content-Type: multipart/mixed; boundary="===============6656174188690246468=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6656174188690246468==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=dc00f366b8c1e1d54c00cf1aa9f7adae4e2fdd1b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This adds the missing Raspberry Pi Zero models to the list.

Signed-off-by: Gaël PORTAY <gael.portay+rtone@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
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

--===============6656174188690246468==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6656174188690246468==--
