Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7DA9C52D7C
	for <buildroot@archiver.kernel.org>; Fri, 23 Aug 2024 14:28:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5FF6881EF3;
	Fri, 23 Aug 2024 14:28:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qz0nvOJ9vRkL; Fri, 23 Aug 2024 14:28:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F0ADC840D2
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id F0ADC840D2;
	Fri, 23 Aug 2024 14:28:14 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D76071BF2E5
 for <buildroot@lists.busybox.net>; Fri, 23 Aug 2024 14:28:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C5545612ED
 for <buildroot@lists.busybox.net>; Fri, 23 Aug 2024 14:28:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id F7UtvLTKhCJ8 for <buildroot@lists.busybox.net>;
 Fri, 23 Aug 2024 14:28:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8B585612E9
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8B585612E9
 for <buildroot@buildroot.org>; Fri, 23 Aug 2024 14:28:06 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 867D38632F; Fri, 23 Aug 2024 14:28:06 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 23 Aug 2024 16:27:46 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e2f46ed03db7f07e62ce44f22dba0db53a5d2fd4
X-Git-Newrev: 6fdbab87a2b9d00743ed9fe6caa6db365d7ca326
X-Patchwork-Hint: ignore
Message-Id: <20240823142806.867D38632F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] DEVELOPERS: drop some entries from Thomas
 Huth's section
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=6fdbab87a2b9d00743ed9fe6caa6db365d7ca326
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

I lack the time (and interest) to properly keep these entries up to
date, so drop them from my section.

Signed-off-by: Thomas Huth <huth@tuxfamily.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index d7d0af3543..426590d5c5 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3097,10 +3097,7 @@ F:	package/fluent-bit/
 F:	package/libsoup3/
 
 N:	Thomas Huth <huth@tuxfamily.org>
-F:	board/qemu/m68k-mcf5208/
-F:	configs/qemu_m68k_mcf5208_defconfig
 F:	package/ascii-invaders/
-F:	package/frotz/
 F:	package/kvm-unit-tests/
 F:	package/xorcurses/
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
