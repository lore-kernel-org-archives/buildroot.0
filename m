Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0420FC282DE
	for <buildroot@archiver.kernel.org>; Sun, 16 Mar 2025 20:28:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C5574607C8;
	Sun, 16 Mar 2025 20:28:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PPhvrn946_6m; Sun, 16 Mar 2025 20:28:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D5DF460833
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D5DF460833;
	Sun, 16 Mar 2025 20:28:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 85AFA61
 for <buildroot@buildroot.org>; Sun, 16 Mar 2025 20:28:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 576E8405FC
 for <buildroot@buildroot.org>; Sun, 16 Mar 2025 20:27:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id i4x4nsaUPy09 for <buildroot@buildroot.org>;
 Sun, 16 Mar 2025 20:27:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F32C3405FD
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id F32C3405FD
 for <buildroot@buildroot.org>; Sun, 16 Mar 2025 20:27:56 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EDB068807D; Sun, 16 Mar 2025 20:27:56 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 16 Mar 2025 21:06:17 +0100
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: f0b2e3f224ed72365bc3fb0d62c34603a217300b
X-Git-Newrev: 73b8529fd1a1a9a86598b06f0c5607f98a250dc0
X-Patchwork-Hint: ignore
Message-Id: <20250316202756.EDB068807D@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] boot/grub2/readme.txt:
 typo
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

commit: https://git.buildroot.net/buildroot/commit/?id=73b8529fd1a1a9a86598b06f0c5607f98a250dc0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 3fbc4e583fa97be4c68eae2c378d598286c8ee66)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
