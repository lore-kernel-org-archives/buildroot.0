Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99A99C433F5
	for <buildroot@archiver.kernel.org>; Sun, 13 Feb 2022 11:29:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 435F1402AA;
	Sun, 13 Feb 2022 11:29:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vpF17miOVntN; Sun, 13 Feb 2022 11:29:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8CE9440297;
	Sun, 13 Feb 2022 11:29:35 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4F8101BF964
 for <buildroot@lists.busybox.net>; Sun, 13 Feb 2022 11:29:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4BAC240181
 for <buildroot@lists.busybox.net>; Sun, 13 Feb 2022 11:29:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id W9tx_Suf3U06 for <buildroot@lists.busybox.net>;
 Sun, 13 Feb 2022 11:29:06 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 70D1D400D1
 for <buildroot@buildroot.org>; Sun, 13 Feb 2022 11:29:06 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 5EDEA82817; Sun, 13 Feb 2022 11:21:33 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sun, 13 Feb 2022 12:24:02 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a5e72ca9e7e490c2f94c574b29f34d17cc79d816
X-Git-Newrev: d06bf4a9d73e7a05e651e737e26abac86080878e
X-Patchwork-Hint: ignore
Message-Id: <20220213112133.5EDEA82817@busybox.osuosl.org>
Subject: [Buildroot] [git commit] DEVELOPERS: remove Martin Hicks from file
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

commit: https://git.buildroot.net/buildroot/commit/?id=d06bf4a9d73e7a05e651e737e26abac86080878e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Martin Hicks asked to not maintain cryptsetup anymore:
https://lists.buildroot.org/pipermail/buildroot/2022-February/635413.html

Also he doesn't mantain any other package, so let's remove him from this
file.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 DEVELOPERS | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index d4b8da55ac..ac702d8d0f 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1849,9 +1849,6 @@ F:	package/rpi-firmware/
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
