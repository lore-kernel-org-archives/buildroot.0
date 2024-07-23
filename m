Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEB3CC3DA63
	for <buildroot@archiver.kernel.org>; Tue, 23 Jul 2024 15:00:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6D5F3404A9;
	Tue, 23 Jul 2024 15:00:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fnKXWTxXG8OC; Tue, 23 Jul 2024 15:00:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 38B1E404D4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 38B1E404D4;
	Tue, 23 Jul 2024 15:00:51 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A1E9F1BF4E5
 for <buildroot@lists.busybox.net>; Tue, 23 Jul 2024 15:00:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8F7A96069C
 for <buildroot@lists.busybox.net>; Tue, 23 Jul 2024 15:00:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XUz_ITxat7yR for <buildroot@lists.busybox.net>;
 Tue, 23 Jul 2024 15:00:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DCB116069A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id DCB116069A
 for <buildroot@buildroot.org>; Tue, 23 Jul 2024 15:00:48 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BFA6D873DC; Tue, 23 Jul 2024 15:00:48 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 23 Jul 2024 16:47:03 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: ecd49f45520dd92a05ed29e06f2d688110252a22
X-Git-Newrev: 51f827e9303e23ba9b72cd7171576d4d67cd9712
X-Patchwork-Hint: ignore
Message-Id: <20240723150048.BFA6D873DC@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] DEVELOPERS: drop Mathieu
 Audat
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

commit: https://git.buildroot.net/buildroot/commit/?id=51f827e9303e23ba9b72cd7171576d4d67cd9712
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

Mathieu privately informed me that he no longer has access to the
TS4900 board, he is therefore unable to maintain this board moving
forward. Let's drop his entry from the DEVELOPERS file.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 39d23ce823bed1ab9db25ec32a924980ef4b91c1)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index fab383707f..af1749b23b 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2167,11 +2167,6 @@ N:	Masahiro Yamada <yamada.masahiro@socionext.com>
 F:	board/arm/foundation-v8/
 F:	configs/arm_foundationv8_defconfig
 
-N:	Mathieu Audat <mathieuaudat@gmail.com>
-F:	board/technologic/ts4900/
-F:	configs/ts4900_defconfig
-F:	package/ts4900-fpga/
-
 N:	Matt Silva <dev@matt-silva.com>
 F:	package/rlwrap/
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
