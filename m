Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C368C87FCA
	for <buildroot@archiver.kernel.org>; Thu,  7 Aug 2025 22:37:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 749BC810FE;
	Thu,  7 Aug 2025 22:37:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qoPnuwZDawV0; Thu,  7 Aug 2025 22:37:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7F2E5810BD
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7F2E5810BD;
	Thu,  7 Aug 2025 22:37:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id BA4EF9CF
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 22:37:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A08E7402F5
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 22:37:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DFIp4XnXWrVO for <buildroot@buildroot.org>;
 Thu,  7 Aug 2025 22:37:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C726440323
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id C726440323
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 22:37:24 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B621586E9F; Thu,  7 Aug 2025 22:37:24 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 8 Aug 2025 00:34:32 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5edce691885fb41252676df6b94768683a165157
X-Git-Newrev: bd5faa8a245ca04492afc4c64e2cea5de0ec26cb
X-Patchwork-Hint: ignore
Message-Id: <20250807223724.B621586E9F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/qemu: correct help menu spelling
 error
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=bd5faa8a245ca04492afc4c64e2cea5de0ec26cb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch corrects the spelling of 'Xilinx' in the help menu for the
qemu package.

Signed-off-by: Neal Frager <neal.frager@amd.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/qemu/Config.in | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/qemu/Config.in b/package/qemu/Config.in
index 2d15ab1ea9..ff7423bc4c 100644
--- a/package/qemu/Config.in
+++ b/package/qemu/Config.in
@@ -211,13 +211,13 @@ config BR2_PACKAGE_QEMU_TARGET_MICROBLAZE
 	bool "microblaze"
 	select BR2_PACKAGE_QEMU_FDT if BR2_PACKAGE_QEMU_SYSTEM
 	help
-	  Xilinix MicroBlaze soft processor.
+	  Xilinx MicroBlaze soft processor.
 
 config BR2_PACKAGE_QEMU_TARGET_MICROBLAZEEL
 	bool "microblazeel"
 	select BR2_PACKAGE_QEMU_FDT if BR2_PACKAGE_QEMU_SYSTEM
 	help
-	  Xilinix MicroBlaze EL soft processor.
+	  Xilinx MicroBlaze EL soft processor.
 
 config BR2_PACKAGE_QEMU_TARGET_MIPS
 	bool "mips"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
