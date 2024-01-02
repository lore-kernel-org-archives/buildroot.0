Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3325C46CD2
	for <buildroot@archiver.kernel.org>; Tue,  2 Jan 2024 21:16:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A0AAB40A69;
	Tue,  2 Jan 2024 21:16:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A0AAB40A69
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ddwxzZDlctBT; Tue,  2 Jan 2024 21:16:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9622A40A76;
	Tue,  2 Jan 2024 21:16:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9622A40A76
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 504F21BF311
 for <buildroot@lists.busybox.net>; Tue,  2 Jan 2024 21:16:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 26D37818CD
 for <buildroot@lists.busybox.net>; Tue,  2 Jan 2024 21:16:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 26D37818CD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sb2BScsBDaAC for <buildroot@lists.busybox.net>;
 Tue,  2 Jan 2024 21:16:10 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 41E8E81E70
 for <buildroot@buildroot.org>; Tue,  2 Jan 2024 21:16:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 41E8E81E70
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2E52383D19; Tue,  2 Jan 2024 21:16:10 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 2 Jan 2024 22:15:56 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 951c9a8ebce22f5ff00003fea5ee1ed5d9856fef
X-Git-Newrev: 00d55c07306b385eea41d4bf98350d0e2405c3bf
X-Patchwork-Hint: ignore
Message-Id: <20240102211610.2E52383D19@busybox.osuosl.org>
Subject: [Buildroot] [git commit] DEVELOPERS: Remove
 adam.duskett@amarulasolutions non-flutter related packages
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

commit: https://git.buildroot.net/buildroot/commit/?id=00d55c07306b385eea41d4bf98350d0e2405c3bf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

I will only be supporting Flutter and other packages needed by Amarula Solution
in a professional related capacity from now on.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index 42a8ed2993..646b8ee5a2 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -36,10 +36,7 @@ F:	package/flutter-gallery/
 F:	package/flutter-pi/
 F:	package/flutter-sdk-bin/
 F:	package/libutempter/
-F:	package/python-kmod/
-F:	package/python-versioneer/
 F:	package/tllist/
-F:	support/testing/tests/package/test_firewalld.py
 F:	support/testing/tests/package/test_flutter.py
 
 N:	Adam Heinrich <adam@adamh.cz>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
