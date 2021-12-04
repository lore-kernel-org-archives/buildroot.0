Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E859C433EF
	for <buildroot@archiver.kernel.org>; Sat,  4 Dec 2021 22:12:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5C46B83E4E;
	Sat,  4 Dec 2021 22:12:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Fz-L5DGXz5Yd; Sat,  4 Dec 2021 22:12:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id CB43C83E3A;
	Sat,  4 Dec 2021 22:12:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B063A1BF3F7
 for <buildroot@lists.busybox.net>; Sat,  4 Dec 2021 22:12:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A0A1C83E26
 for <buildroot@lists.busybox.net>; Sat,  4 Dec 2021 22:12:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8PJxRZy9mE7s for <buildroot@lists.busybox.net>;
 Sat,  4 Dec 2021 22:12:32 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id F328C8345D
 for <buildroot@buildroot.org>; Sat,  4 Dec 2021 22:12:31 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id BEFD1935E8; Sat,  4 Dec 2021 22:07:38 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sat, 4 Dec 2021 23:12:21 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 764176324e4805d5e5b90e210199e216d65d82ef
X-Git-Newrev: afdd3b2afc53e114275f14eea2477e1cb3b7e94a
X-Patchwork-Hint: ignore
Message-Id: <20211204220738.BEFD1935E8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] DEVELOPERS: add Joachim Wiberg as
 maintainer for inadyn
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

commit: https://git.buildroot.net/buildroot/commit/?id=afdd3b2afc53e114275f14eea2477e1cb3b7e94a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Upstream maintainer, now also maintainer in Buildroot.

Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index b190c0f356..c9848ac428 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1343,6 +1343,7 @@ F:	package/rtty/
 N:	Joachim Wiberg <troglobit@gmail.com>
 F:	configs/globalscale_espressobin_defconfig
 F:	board/globalscale/espressobin/
+F:	package/inadyn/
 F:	package/libite/
 F:	package/libteam/
 F:	package/libuev/
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
