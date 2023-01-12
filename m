Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16E7EC61DA3
	for <buildroot@archiver.kernel.org>; Tue, 21 Feb 2023 00:28:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AE14341D9E;
	Tue, 21 Feb 2023 00:28:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AE14341D9E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tLjDoEeRVNDo; Tue, 21 Feb 2023 00:28:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A7D8642CE0;
	Tue, 21 Feb 2023 00:28:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A7D8642CE0
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E40221BF27E
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:59:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DAA476FB4C
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DAA476FB4C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dTWyQSKVI5tM for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:29 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 07BF66FB00
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 07BF66FB00
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 061668648F; Mon, 20 Feb 2023 20:52:29 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 12 Jan 2023 11:44:01 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: fce9f0eea00ed9aaeca12c1529ea380617baa477
X-Git-Newrev: 24c532c9f6885174ddf1a9621cc1d55412139676
X-Patchwork-Hint: ignore
Message-Id: <20230220205229.061668648F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] DEVELOPERS: remove Bartosz
 Golaszewski
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

commit: https://git.buildroot.net/buildroot/commit/?id=24c532c9f6885174ddf1a9621cc1d55412139676
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

It's been a while since I've even used buildroot at all and I don't
really have any spare cycles to spend on maintaining its packages.
Let's face reality and drop me from the DEVELOPERS file.

Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index 86e3f0e7b1..8e1d68c026 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -283,17 +283,6 @@ F:	package/ttyd/
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
