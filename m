Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B815CD13DE
	for <buildroot@archiver.kernel.org>; Sat, 31 Aug 2024 17:12:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D455D81F22;
	Sat, 31 Aug 2024 17:12:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EEtF0udxVoT1; Sat, 31 Aug 2024 17:12:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 33FFD840C3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 33FFD840C3;
	Sat, 31 Aug 2024 17:12:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 152261BF5E6
 for <buildroot@lists.busybox.net>; Sat, 31 Aug 2024 17:12:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5928560706
 for <buildroot@lists.busybox.net>; Sat, 31 Aug 2024 17:12:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yeDnaYWfC6zy for <buildroot@lists.busybox.net>;
 Sat, 31 Aug 2024 17:12:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7820A6072E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7820A6072E
 for <buildroot@buildroot.org>; Sat, 31 Aug 2024 17:12:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6636C867D4; Sat, 31 Aug 2024 17:12:28 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 31 Aug 2024 18:56:03 +0200
X-Git-Refname: refs/heads/2024.05.x
X-Git-Oldrev: 26dbdb76f7238c5220c7d2ece7fe9995f7c76935
X-Git-Newrev: 6f7d3f3b803820f6f909c32f18bfc64f90072904
X-Patchwork-Hint: ignore
Message-Id: <20240831171228.6636C867D4@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.05.x]
 board/qemu/arm-vexpress-tz: fix typos in readme file
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

commit: https://git.buildroot.net/buildroot/commit/?id=6f7d3f3b803820f6f909c32f18bfc64f90072904
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.05.x

Fix typos in QEMU arm-vexpress-tz readme file where 'i.e.' occurrences
should be replaced with 'e.g.'.

Signed-off-by: Etienne Carriere <etienne.carriere@foss.st.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit bfa3c1932fd5127b73eae1549a84b9c4125e3e0a)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 board/qemu/arm-vexpress-tz/readme.txt | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/board/qemu/arm-vexpress-tz/readme.txt b/board/qemu/arm-vexpress-tz/readme.txt
index 3e84fe6391..920777afd4 100644
--- a/board/qemu/arm-vexpress-tz/readme.txt
+++ b/board/qemu/arm-vexpress-tz/readme.txt
@@ -26,7 +26,7 @@ If you want to emulate more cores, use "-smp {1|2|3|4}" to select the
 number of cores.
 
 Note: "-netdev user,id=vmnic -device virtio-net-device,netdev=vmnic"
-brings network support that is used i.e. in OP-TEE regression tests.
+brings network support that is used e.g. in OP-TEE regression tests.
 
 
 -- Boot Details --
@@ -38,7 +38,7 @@ non-secure bootloader (BL33 stage).
 QEMU natively hosts and loads in RAM the QEMU ARM target device tree. OP-TEE
 reads and modifies its content according to OP-TEE configuration.
 
-Enable TF-A traces from LOG_LEVEL (I.e LOG_LEVEL=40) from
+Enable TF-A traces from LOG_LEVEL (e.g. LOG_LEVEL=40) from
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_VARIABLES.
 
 
@@ -53,7 +53,7 @@ serial interface.
 The OP-TEE OS uses the QEMU second serial interface.
 
 To get the OP-TEE OS traces, append a second -serial argument after
--serial stdio in the QEMU command line. I.e, the following enables 2 serial
+-serial stdio in the QEMU command line. E.g., the following enables 2 serial
 consoles over telnet connections:
 
   cd output/images && ../host/bin/qemu-system-arm \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
