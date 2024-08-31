Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7A2DCD13DD
	for <buildroot@archiver.kernel.org>; Sat, 31 Aug 2024 17:14:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4DE6C8446E;
	Sat, 31 Aug 2024 17:14:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VRqGQXyV86Ht; Sat, 31 Aug 2024 17:14:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9E09784366
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9E09784366;
	Sat, 31 Aug 2024 17:14:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id EA27E1BF5E6
 for <buildroot@lists.busybox.net>; Sat, 31 Aug 2024 17:13:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E03FB40021
 for <buildroot@lists.busybox.net>; Sat, 31 Aug 2024 17:13:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1xIvvwKcNe4Y for <buildroot@lists.busybox.net>;
 Sat, 31 Aug 2024 17:13:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D08A3400B9
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id D08A3400B9
 for <buildroot@buildroot.org>; Sat, 31 Aug 2024 17:13:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BDC42867F1; Sat, 31 Aug 2024 17:13:43 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 31 Aug 2024 18:56:07 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 1ba78a69fd34f99282f47b78891e98d7c9c62b2f
X-Git-Newrev: e62c13c91ee988d2b057fda5f57b971b3a2daee9
X-Patchwork-Hint: ignore
Message-Id: <20240831171343.BDC42867F1@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x]
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

commit: https://git.buildroot.net/buildroot/commit/?id=e62c13c91ee988d2b057fda5f57b971b3a2daee9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

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
