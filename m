Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 265BEC4167B
	for <buildroot@archiver.kernel.org>; Sun, 26 Nov 2023 17:24:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9BF7F60B0F;
	Sun, 26 Nov 2023 17:24:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9BF7F60B0F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XuLi-zQT9nxN; Sun, 26 Nov 2023 17:24:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E6F6A607EC;
	Sun, 26 Nov 2023 17:24:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E6F6A607EC
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D6CB91BF28A
 for <buildroot@lists.busybox.net>; Sun, 26 Nov 2023 17:24:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B86D7812F7
 for <buildroot@lists.busybox.net>; Sun, 26 Nov 2023 17:24:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B86D7812F7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vrlIbz0sQg-Z for <buildroot@lists.busybox.net>;
 Sun, 26 Nov 2023 17:24:32 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 09C3881227
 for <buildroot@buildroot.org>; Sun, 26 Nov 2023 17:24:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 09C3881227
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EAB7387413; Sun, 26 Nov 2023 17:24:31 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 26 Nov 2023 18:23:34 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7fe685c510578435b8b7c0448478e71a3db4d9e4
X-Git-Newrev: acd833c8c712268ecfec1080721c6f39192bbdb2
X-Patchwork-Hint: ignore
Message-Id: <20231126172431.EAB7387413@busybox.osuosl.org>
Subject: [Buildroot] [git commit] board/raspberrypi/readme.txt: fix typos
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
Content-Type: multipart/mixed; boundary="===============9108732221013840608=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============9108732221013840608==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=acd833c8c712268ecfec1080721c6f39192bbdb2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gaël PORTAY <gael.portay@rtone.fr>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
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

--===============9108732221013840608==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============9108732221013840608==--
