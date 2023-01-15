Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C3A7C3DA78
	for <buildroot@archiver.kernel.org>; Sun, 15 Jan 2023 20:28:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AF4A781E9D;
	Sun, 15 Jan 2023 20:28:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AF4A781E9D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MW7etBUOtUVy; Sun, 15 Jan 2023 20:28:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id EB80681E88;
	Sun, 15 Jan 2023 20:28:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EB80681E88
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id AFD8A1BF25F
 for <buildroot@lists.busybox.net>; Sun, 15 Jan 2023 20:28:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8B9DD400EF
 for <buildroot@lists.busybox.net>; Sun, 15 Jan 2023 20:28:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8B9DD400EF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xt_AhlNs17Iy for <buildroot@lists.busybox.net>;
 Sun, 15 Jan 2023 20:28:05 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id C6F99403B8
 for <buildroot@buildroot.org>; Sun, 15 Jan 2023 20:28:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C6F99403B8
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B298287B1F; Sun, 15 Jan 2023 20:28:05 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 15 Jan 2023 21:03:15 +0100
X-Git-Refname: refs/heads/2022.11.x
X-Git-Oldrev: 260a94a43426544166fad33a30d83b9d06849542
X-Git-Newrev: 7b5e4591840a65d37f187bba93f607cf125b98ea
X-Patchwork-Hint: ignore
Message-Id: <20230115202805.B298287B1F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.11.x] DEVELOPERS: remove
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

commit: https://git.buildroot.net/buildroot/commit/?id=7b5e4591840a65d37f187bba93f607cf125b98ea
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.11.x

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
index cca29525e0..fbe4b51037 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -276,17 +276,6 @@ F:	package/ttyd/
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
