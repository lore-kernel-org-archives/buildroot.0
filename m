Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4ED5FC4167B
	for <buildroot@archiver.kernel.org>; Thu, 30 Nov 2023 08:39:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 079C46F551;
	Thu, 30 Nov 2023 08:39:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 079C46F551
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id n27Yl5ZYO9-E; Thu, 30 Nov 2023 08:39:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5D80D6F4B1;
	Thu, 30 Nov 2023 08:39:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5D80D6F4B1
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 95DB51BF990
 for <buildroot@lists.busybox.net>; Thu, 30 Nov 2023 08:38:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 311A941571
 for <buildroot@lists.busybox.net>; Thu, 30 Nov 2023 08:38:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 311A941571
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FU7piOaiTmJ0 for <buildroot@lists.busybox.net>;
 Thu, 30 Nov 2023 08:38:15 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5B37C40900
 for <buildroot@buildroot.org>; Thu, 30 Nov 2023 08:38:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5B37C40900
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4943C87604; Thu, 30 Nov 2023 08:38:15 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 30 Nov 2023 09:18:04 +0100
X-Git-Refname: refs/heads/2023.08.x
X-Git-Oldrev: 29e2700bda27f0156f17d4dfe1293f4c7fd1efb1
X-Git-Newrev: bc63ab9623a43ef308dcfb9bc7ad776cae285995
X-Patchwork-Hint: ignore
Message-Id: <20231130083815.4943C87604@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.08.x]
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
Content-Type: multipart/mixed; boundary="===============8257084553004382161=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8257084553004382161==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=bc63ab9623a43ef308dcfb9bc7ad776cae285995
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.08.x

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

--===============8257084553004382161==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8257084553004382161==--
