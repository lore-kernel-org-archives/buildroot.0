Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4F13C636CC
	for <buildroot@archiver.kernel.org>; Sun,  5 Feb 2023 12:21:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 76630403B8;
	Sun,  5 Feb 2023 12:21:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 76630403B8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pt7ZfoSv9nzd; Sun,  5 Feb 2023 12:21:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 39CF4402B9;
	Sun,  5 Feb 2023 12:21:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 39CF4402B9
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E764A1BF364
 for <buildroot@lists.busybox.net>; Sun,  5 Feb 2023 12:21:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C1CF4414BF
 for <buildroot@lists.busybox.net>; Sun,  5 Feb 2023 12:21:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C1CF4414BF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ahT4ZlMrSWOa for <buildroot@lists.busybox.net>;
 Sun,  5 Feb 2023 12:21:13 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id EC4AB410D8
 for <buildroot@buildroot.org>; Sun,  5 Feb 2023 12:21:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EC4AB410D8
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D634D8377B; Sun,  5 Feb 2023 12:21:12 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 5 Feb 2023 13:20:45 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a3d7f7a73bb025152e6594ab812a2bfa893851f9
X-Git-Newrev: 6c8cda8c94e00dc4571a6ad1b3f9c1c617a63873
X-Patchwork-Hint: ignore
Message-Id: <20230205122112.D634D8377B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] DEVELOPERS: Remove openal from my list
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
Content-Type: multipart/mixed; boundary="===============5183136818466709011=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5183136818466709011==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=6c8cda8c94e00dc4571a6ad1b3f9c1c617a63873
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: André Zwing <nerv@dawncrow.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS | 1 -
 1 file changed, 1 deletion(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index e19087c577..d526451ca3 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -133,7 +133,6 @@ F:	boot/ti-k3-r5-loader/
 
 N:	André Zwing <nerv@dawncrow.de>
 F:	package/libkrb5/
-F:	package/openal/
 F:	package/p7zip/
 F:	package/wine/
 

--===============5183136818466709011==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5183136818466709011==--
