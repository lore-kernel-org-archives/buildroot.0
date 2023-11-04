Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 904D6C4332F
	for <buildroot@archiver.kernel.org>; Sat,  4 Nov 2023 18:48:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3FE5960F75;
	Sat,  4 Nov 2023 18:48:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3FE5960F75
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Mu0AaetCelPW; Sat,  4 Nov 2023 18:48:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8FC0A60F35;
	Sat,  4 Nov 2023 18:48:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8FC0A60F35
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 91E181BF285
 for <buildroot@lists.busybox.net>; Sat,  4 Nov 2023 18:48:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 63EF541BF8
 for <buildroot@lists.busybox.net>; Sat,  4 Nov 2023 18:48:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 63EF541BF8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id a5d_qtcbsh3u for <buildroot@lists.busybox.net>;
 Sat,  4 Nov 2023 18:48:35 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9275141BF7
 for <buildroot@buildroot.org>; Sat,  4 Nov 2023 18:48:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9275141BF7
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7E338866F1; Sat,  4 Nov 2023 18:48:35 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 4 Nov 2023 19:47:45 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1b8d7e7bedb204b6fb1094a57822a4652206b44a
X-Git-Newrev: 29a66292f80a1fbd509ae71190cdd55b7f3329c7
X-Patchwork-Hint: ignore
Message-Id: <20231104184835.7E338866F1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] DEVELOPERS: add missing entries for
 configs/sipeed_licheepi_nano_defconfig
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=29a66292f80a1fbd509ae71190cdd55b7f3329c7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This should have been part of commit
9a51a07a9175cd564fffa89a6b8b851c258384a0 ("configs/sipeed_licheepi_nano:
new board")

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index d26fddd9b1..de4cd7168e 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1089,7 +1089,9 @@ N:	Francisco Gonzalez <gzmorell@gmail.com>
 F:	package/ser2net/
 
 N:	Francois Dugast <francois.dugast.foss@gmail.com>
+F:	board/sipeed/licheepi_nano/
 F:	board/visionfive2/
+F:	configs/sipeed_licheepi_nano_defconfig
 F:	configs/visionfive2_defconfig
 
 N:	Francois Perrad <francois.perrad@gadz.org>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
