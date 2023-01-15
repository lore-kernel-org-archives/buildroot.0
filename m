Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9987BC3DA78
	for <buildroot@archiver.kernel.org>; Sun, 15 Jan 2023 20:26:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3DE2D400EF;
	Sun, 15 Jan 2023 20:26:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3DE2D400EF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 14VEqLMjaI10; Sun, 15 Jan 2023 20:26:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 72FCC40917;
	Sun, 15 Jan 2023 20:26:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 72FCC40917
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 657F91BF86C
 for <buildroot@lists.busybox.net>; Sun, 15 Jan 2023 20:26:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 41B8F60B44
 for <buildroot@lists.busybox.net>; Sun, 15 Jan 2023 20:26:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 41B8F60B44
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lRT3F3I0u_Up for <buildroot@lists.busybox.net>;
 Sun, 15 Jan 2023 20:26:20 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7E52360AE6
 for <buildroot@buildroot.org>; Sun, 15 Jan 2023 20:26:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7E52360AE6
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6974187658; Sun, 15 Jan 2023 20:26:20 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 15 Jan 2023 21:03:21 +0100
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: ba59c92c9dfc18b6c2b36761ce5925d0ff329db9
X-Git-Newrev: 517a6a41153f8cc48b2f2beee60c2e7637341f60
X-Patchwork-Hint: ignore
Message-Id: <20230115202620.6974187658@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] DEVELOPERS: remove
 Bartosz Golaszewski
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

commit: https://git.buildroot.net/buildroot/commit/?id=517a6a41153f8cc48b2f2beee60c2e7637341f60
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

It's been a while since I've even used buildroot at all and I don't
really have any spare cycles to spend on maintaining its packages.
Let's face reality and drop me from the DEVELOPERS file.

Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 24c532c9f6885174ddf1a9621cc1d55412139676)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index 22293b5d31..af12e15687 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -274,17 +274,6 @@ F:	package/ttyd/
 F:	package/qt5/qt5scxml/
 F:	package/qt5/qt5webview/
 
-N:	Bartosz Golaszewski <brgl@bgdev.pl>
-F:	package/autoconf-archive/
-F:	package/doxygen/
-F:	package/libgpiod/
-F:	package/libserialport/
-F:	package/libsigrok/
-F:	package/libsigrokdecode/
-F:	package/libzip/
-F:	package/pulseview/
-F:	package/sigrok-cli/
-
 N:	Baruch Siach <baruch@tkos.co.il>
 F:	board/solidrun/clearfog_gt_8k/
 F:	configs/solidrun_clearfog_gt_8k_defconfig
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
