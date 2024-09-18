Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 854C9CDD548
	for <buildroot@archiver.kernel.org>; Wed, 18 Sep 2024 16:12:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4E8BF40FFF;
	Wed, 18 Sep 2024 16:12:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BQmkl5ET3xwq; Wed, 18 Sep 2024 16:12:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8BA51411AB
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8BA51411AB;
	Wed, 18 Sep 2024 16:12:30 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E5E8C1BF2C9
 for <buildroot@lists.busybox.net>; Wed, 18 Sep 2024 16:12:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D5208600B5
 for <buildroot@lists.busybox.net>; Wed, 18 Sep 2024 16:12:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FcEGsD9BaLPN for <buildroot@lists.busybox.net>;
 Wed, 18 Sep 2024 16:12:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2B962605D4
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2B962605D4
 for <buildroot@buildroot.org>; Wed, 18 Sep 2024 16:12:19 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1817883B0E; Wed, 18 Sep 2024 16:12:19 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 18 Sep 2024 18:02:13 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 8ed0272aa3e0afd9467ae05f5362ca1e54003d2f
X-Git-Newrev: c4535680ba89a6bdbc7cd813618e30917c11556d
X-Patchwork-Hint: ignore
Message-Id: <20240918161219.1817883B0E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] DEVELOPERS: drop some
 entries from Thomas Huth's section
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=c4535680ba89a6bdbc7cd813618e30917c11556d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

I lack the time (and interest) to properly keep these entries up to
date, so drop them from my section.

Signed-off-by: Thomas Huth <huth@tuxfamily.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 6fdbab87a2b9d00743ed9fe6caa6db365d7ca326)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index eaf1010747..fdce5c1fdc 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2975,10 +2975,7 @@ F:	package/fluent-bit/
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
