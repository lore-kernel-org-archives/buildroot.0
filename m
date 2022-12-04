Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACDB4C61DA3
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 21:44:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 40F0F4801E;
	Mon, 20 Feb 2023 21:44:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 40F0F4801E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vJvfm8j0abVN; Mon, 20 Feb 2023 21:44:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 346104EB9D;
	Mon, 20 Feb 2023 21:44:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 346104EB9D
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 263691BF2E3
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:53:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5D431610F3
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:51:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5D431610F3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BOq7tzSbqrhV for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:51:55 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 99F41610EF
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:51:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 99F41610EF
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 92A96828C8; Mon, 20 Feb 2023 20:51:55 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 4 Dec 2022 21:31:46 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: cc1edd8c065471b5071be7e84a1bff56853a8472
X-Git-Newrev: 34c7b86224556822ce1003b639f98bf87d7496b6
X-Patchwork-Hint: ignore
Message-Id: <20230220205155.92A96828C8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] DEVELOPERS: add Jesse for the
 qt6 package
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

commit: https://git.buildroot.net/buildroot/commit/?id=34c7b86224556822ce1003b639f98bf87d7496b6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Jesse Van Gavere <jesseevg@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 DEVELOPERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index 8bcce1fd37..4f862befb0 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1468,7 +1468,7 @@ F:	package/x11r7/xdriver_xf86-video-imx/
 F:	package/x11r7/xdriver_xf86-video-imx-viv/
 
 N:	Jesse Van Gavere <jesseevg@gmail.com>
-F:	package/qt6/qt6serialport/
+F:	package/qt6/
 
 N:	Jianhui Zhao <zhaojh329@gmail.com>
 F:	package/libuhttpd/
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
