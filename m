Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D7A2C3DA41
	for <buildroot@archiver.kernel.org>; Wed, 10 Jul 2024 13:42:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C09C560685;
	Wed, 10 Jul 2024 13:42:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UjPib2Bxvb5N; Wed, 10 Jul 2024 13:42:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D95B560688
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D95B560688;
	Wed, 10 Jul 2024 13:42:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7084B1BF82F
 for <buildroot@lists.busybox.net>; Wed, 10 Jul 2024 13:42:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5D3C94051A
 for <buildroot@lists.busybox.net>; Wed, 10 Jul 2024 13:42:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ad1jM7m6s0cX for <buildroot@lists.busybox.net>;
 Wed, 10 Jul 2024 13:42:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1250A400F6
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1250A400F6
 for <buildroot@buildroot.org>; Wed, 10 Jul 2024 13:42:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 08E0D8452E; Wed, 10 Jul 2024 13:42:25 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 10 Jul 2024 15:41:34 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8502ac71aad426792aa51923ef0f14b83c4bf2c7
X-Git-Newrev: 39d23ce823bed1ab9db25ec32a924980ef4b91c1
X-Patchwork-Hint: ignore
Message-Id: <20240710134225.08E0D8452E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] DEVELOPERS: drop Mathieu Audat
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

commit: https://git.buildroot.net/buildroot/commit/?id=39d23ce823bed1ab9db25ec32a924980ef4b91c1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Mathieu privately informed me that he no longer has access to the
TS4900 board, he is therefore unable to maintain this board moving
forward. Let's drop his entry from the DEVELOPERS file.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index bddd92d133..0e971b9beb 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2215,11 +2215,6 @@ N:	Masahiro Yamada <yamada.masahiro@socionext.com>
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
