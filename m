Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79E58C3ABD8
	for <buildroot@archiver.kernel.org>; Mon, 19 May 2025 10:41:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 276FA40664;
	Mon, 19 May 2025 10:41:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eY1NAZWqa4Gj; Mon, 19 May 2025 10:41:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EDB8A41E4E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id EDB8A41E4E;
	Mon, 19 May 2025 10:40:43 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 029C2D4
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:39:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1AA9F410BB
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:39:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cQm7xVhiAuAt for <buildroot@buildroot.org>;
 Mon, 19 May 2025 10:39:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B279441005
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id B279441005
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:39:41 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AF7BB873D1; Mon, 19 May 2025 10:39:41 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Mon, 10 Mar 2025 22:30:42 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 63c2dd2d40186ca6817a5be122a2ba78033f3cfc
X-Git-Newrev: 3fbc4e583fa97be4c68eae2c378d598286c8ee66
X-Patchwork-Hint: ignore
Message-Id: <20250519103941.AF7BB873D1@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] boot/grub2/readme.txt: typo
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

commit: https://git.buildroot.net/buildroot/commit/?id=3fbc4e583fa97be4c68eae2c378d598286c8ee66
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 boot/grub2/readme.txt | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/boot/grub2/readme.txt b/boot/grub2/readme.txt
index 90866e83a9..d0999ec390 100644
--- a/boot/grub2/readme.txt
+++ b/boot/grub2/readme.txt
@@ -51,7 +51,7 @@ grub-bios-setup does but it works anyway.
 To test your BIOS image in Qemu
 -------------------------------
 
-qemu-system-{i386,x86-64} -hda disk.img
+qemu-system-{i386,x86_64} -hda disk.img
 
 Notes on using Grub2 for x86/x86_64 EFI-based platforms
 =======================================================
@@ -93,7 +93,7 @@ To test your i386/x86-64 EFI image in Qemu
 
    [0] https://github.com/retrage/edk2-nightly
 
-2. qemu-system-{i386,x86-64} -bios <path-to-OVMF.fd> -hda disk.img
+2. qemu-system-{i386,x86_64} -bios <path-to-OVMF.fd> -hda disk.img
 
 Notes on using Grub2 for ARM u-boot-based platforms
 ===================================================
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
