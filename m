Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 491F5D1036C
	for <buildroot@archiver.kernel.org>; Thu, 24 Oct 2024 20:41:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B641860C0A;
	Thu, 24 Oct 2024 20:41:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kteMF7AA3q8u; Thu, 24 Oct 2024 20:41:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 86CD860C10
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 86CD860C10;
	Thu, 24 Oct 2024 20:41:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id A7ABC497A
 for <buildroot@buildroot.org>; Thu, 24 Oct 2024 20:41:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 884334012A
 for <buildroot@buildroot.org>; Thu, 24 Oct 2024 20:41:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Yeyhq8fWBuSg for <buildroot@buildroot.org>;
 Thu, 24 Oct 2024 20:41:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 81C784055E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 81C784055E
 for <buildroot@buildroot.org>; Thu, 24 Oct 2024 20:41:00 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6C60A83550; Thu, 24 Oct 2024 20:41:00 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 24 Oct 2024 22:40:47 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 523f6c2ca96c971088723ff8612e1f076d647fe5
X-Git-Newrev: 1dc370cc9009b5362aad5e2e481703f0ca76b4a2
X-Patchwork-Hint: ignore
Message-Id: <20241024204100.6C60A83550@busybox.osuosl.org>
Subject: [Buildroot] [git commit] DEVELOPERS: drop my packages
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=1dc370cc9009b5362aad5e2e481703f0ca76b4a2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

I still follow Buildroot development and use it for some personal
projects, but no longer have the time to be an active contributor.
Some of these are important defconfigs and packages to have up-to-date
in Buildroot, and mostly other developers have been doing that work, so
I am dropping them so that someone from the active contributors can be
the maintainer contact for them.

Signed-off-by: Erico Nunes <nunes.erico@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index bebed80891..9afd19d406 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -926,18 +926,6 @@ N:	Eric Limpens <limpens@gmail.com>
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
