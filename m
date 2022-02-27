Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC5DFC433EF
	for <buildroot@archiver.kernel.org>; Sun, 27 Feb 2022 20:06:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5A20C402C3;
	Sun, 27 Feb 2022 20:06:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id f4c-94ca_IOo; Sun, 27 Feb 2022 20:06:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2C97E4053D;
	Sun, 27 Feb 2022 20:06:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C40E61BF2AA
 for <buildroot@lists.busybox.net>; Sun, 27 Feb 2022 20:04:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B6D6F605B2
 for <buildroot@lists.busybox.net>; Sun, 27 Feb 2022 20:04:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id a-shbV2soPWI for <buildroot@lists.busybox.net>;
 Sun, 27 Feb 2022 20:04:49 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1EE01606CB
 for <buildroot@buildroot.org>; Sun, 27 Feb 2022 20:04:49 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 9F5D683611; Sun, 27 Feb 2022 19:56:43 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 27 Feb 2022 20:53:12 +0100
X-Git-Refname: refs/heads/2021.11.x
X-Git-Oldrev: 9d48687bb245c5c120b5f9df82ea471b80a62997
X-Git-Newrev: 3a1d44dfa0580ae203aa0ce19c613f7a8a610160
X-Patchwork-Hint: ignore
Message-Id: <20220227195643.9F5D683611@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.11.x] DEVELOPERS: remove Martin
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

commit: https://git.buildroot.net/buildroot/commit/?id=3a1d44dfa0580ae203aa0ce19c613f7a8a610160
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.11.x

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
index 5b34f93d22..8422fad579 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1757,9 +1757,6 @@ F:	package/rpi-wifi-firmware/
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
