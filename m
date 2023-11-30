Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8440C4167B
	for <buildroot@archiver.kernel.org>; Thu, 30 Nov 2023 08:31:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 28C956F4D2;
	Thu, 30 Nov 2023 08:31:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 28C956F4D2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uq_zLYM5yhGp; Thu, 30 Nov 2023 08:31:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7BD286F4B1;
	Thu, 30 Nov 2023 08:31:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7BD286F4B1
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4E63F1BF23B
 for <buildroot@lists.busybox.net>; Thu, 30 Nov 2023 08:31:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 25A77416B6
 for <buildroot@lists.busybox.net>; Thu, 30 Nov 2023 08:31:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 25A77416B6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qtxhN4OGAxD0 for <buildroot@lists.busybox.net>;
 Thu, 30 Nov 2023 08:31:34 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 10CDF40490
 for <buildroot@buildroot.org>; Thu, 30 Nov 2023 08:31:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 10CDF40490
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id F260487604; Thu, 30 Nov 2023 08:31:33 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 30 Nov 2023 09:17:48 +0100
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: 819a4ba019020780142d71c6ebebdb091d3ed173
X-Git-Newrev: 30f8dd83e6ce798e0e636d762e4f5c3ff9caa387
X-Patchwork-Hint: ignore
Message-Id: <20231130083133.F260487604@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x]
 board/raspberrypi/readme.txt: fix typos
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
Content-Type: multipart/mixed; boundary="===============5653804130105544755=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5653804130105544755==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=30f8dd83e6ce798e0e636d762e4f5c3ff9caa387
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

Signed-off-by: Gaël PORTAY <gael.portay@rtone.fr>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit acd833c8c712268ecfec1080721c6f39192bbdb2)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 board/raspberrypi/readme.txt | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/board/raspberrypi/readme.txt b/board/raspberrypi/readme.txt
index c81fd801ae..21a136eb83 100644
--- a/board/raspberrypi/readme.txt
+++ b/board/raspberrypi/readme.txt
@@ -17,8 +17,8 @@ How to build it
 Configure Buildroot
 -------------------
 
-There are two RaspberryPi defconfig files in Buildroot, one for each
-major variant, which you should base your work on:
+There are several Raspberry Pi defconfig files in Buildroot, one for
+each major variant, which you should base your work on:
 
 For models A, B, A+ or B+:
 
@@ -133,7 +133,7 @@ How to write to CM4 eMMC memory
 ===============================
 
 For CM4 modules without eMMC memory see above for booting from SD card,
-for CM4 moduels with eMMC memory proceed as following:
+for CM4 modules with eMMC memory proceed as following:
 
 - fit jumper on IO Board header J2 to disable eMMC boot
 - connect IO Board micro USB port (J11 USB slave) to your host linux system

--===============5653804130105544755==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5653804130105544755==--
