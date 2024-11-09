Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 779BDD5E376
	for <buildroot@archiver.kernel.org>; Sat,  9 Nov 2024 17:12:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 42E9042C19;
	Sat,  9 Nov 2024 17:12:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id g2tCf5F18Rmg; Sat,  9 Nov 2024 17:12:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0AC1742C1B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0AC1742C1B;
	Sat,  9 Nov 2024 17:12:58 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 4BD11D92
 for <buildroot@buildroot.org>; Sat,  9 Nov 2024 17:12:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5629142BD5
 for <buildroot@buildroot.org>; Sat,  9 Nov 2024 17:12:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lkRQiZm1feob for <buildroot@buildroot.org>;
 Sat,  9 Nov 2024 17:12:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7A35142BFF
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7A35142BFF
 for <buildroot@buildroot.org>; Sat,  9 Nov 2024 17:12:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7198885B25; Sat,  9 Nov 2024 17:12:25 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 9 Nov 2024 18:03:49 +0100
X-Git-Refname: refs/heads/2024.08.x
X-Git-Oldrev: b9d4a86552cdc28cdbd2bd4dc9c4fb1757a0e597
X-Git-Newrev: 29eb209010d48500f66c2f2b642beabcd1017eee
X-Patchwork-Hint: ignore
Message-Id: <20241109171225.7198885B25@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.08.x] DEVELOPERS: drop my
 packages
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

commit: https://git.buildroot.net/buildroot/commit/?id=29eb209010d48500f66c2f2b642beabcd1017eee
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.08.x

I still follow Buildroot development and use it for some personal
projects, but no longer have the time to be an active contributor.
Some of these are important defconfigs and packages to have up-to-date
in Buildroot, and mostly other developers have been doing that work, so
I am dropping them so that someone from the active contributors can be
the maintainer contact for them.

Signed-off-by: Erico Nunes <nunes.erico@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 1dc370cc9009b5362aad5e2e481703f0ca76b4a2)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index 8aee8d18ff..d5f5eb0f97 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -914,18 +914,6 @@ N:	Eric Limpens <limpens@gmail.com>
 F:	package/pifmrds/
 F:	package/ympd/
 
-N:	Erico Nunes <nunes.erico@gmail.com>
-F:	board/aarch64-efi/
-F:	configs/aarch64_efi_defconfig
-F:	package/acpica/
-F:	package/acpitool/
-F:	package/efibootmgr/
-F:	package/efivar/
-F:	package/fwts/
-F:	package/spi-tools/
-F:	package/xdotool/
-F:	configs/pc_x86_64_*
-
 N:	Erik Larsson <karl.erik.larsson@gmail.com>
 F:	package/imx-mkimage/
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
