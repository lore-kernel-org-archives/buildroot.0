Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 202ACC433F5
	for <buildroot@archiver.kernel.org>; Sun, 27 Feb 2022 20:04:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CEA1C60670;
	Sun, 27 Feb 2022 20:04:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tCzxd_sl8piH; Sun, 27 Feb 2022 20:04:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0F2B9605B2;
	Sun, 27 Feb 2022 20:04:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 460791BF2AA
 for <buildroot@lists.busybox.net>; Sun, 27 Feb 2022 20:04:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3062B813D6
 for <buildroot@lists.busybox.net>; Sun, 27 Feb 2022 20:04:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id C0_RsusQ_2VK for <buildroot@lists.busybox.net>;
 Sun, 27 Feb 2022 20:04:42 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 87B70813D3
 for <buildroot@buildroot.org>; Sun, 27 Feb 2022 20:04:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 1849B83611; Sun, 27 Feb 2022 19:56:37 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 27 Feb 2022 20:53:03 +0100
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: 2a9bd16cbf946b71aaca3ca99ba811ec97d117f7
X-Git-Newrev: af251fb0e9c7d67c196bcd121814fcd275190f1f
X-Patchwork-Hint: ignore
Message-Id: <20220227195637.1849B83611@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] DEVELOPERS: remove Martin
 Hicks from file
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

commit: https://git.buildroot.net/buildroot/commit/?id=af251fb0e9c7d67c196bcd121814fcd275190f1f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

Martin Hicks asked to not maintain cryptsetup anymore:
https://lists.buildroot.org/pipermail/buildroot/2022-February/635413.html

Also he doesn't mantain any other package, so let's remove him from this
file.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit d06bf4a9d73e7a05e651e737e26abac86080878e)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index 0a7845a155..1370495a84 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1691,9 +1691,6 @@ F:	package/rpi-wifi-firmware/
 F:	package/tzdata/
 F:	package/zic/
 
-N:	Martin Hicks <mort@bork.org>
-F:	package/cryptsetup/
-
 N:	Martin Kepplinger <martink@posteo.de>
 F:	package/tslib/
 F:	package/x11r7/xdriver_xf86-input-tslib/
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
