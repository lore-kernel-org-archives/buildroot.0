Return-Path: <SRS0=Mf7g=P3=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92B27C433EF
	for <buildroot@archiver.kernel.org>; Mon,  8 Nov 2021 13:42:52 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5774261177
	for <buildroot@archiver.kernel.org>; Mon,  8 Nov 2021 13:42:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5774261177
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2FA3880E52;
	Mon,  8 Nov 2021 13:42:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id a5ywT5kFgD4k; Mon,  8 Nov 2021 13:42:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8797580E4A;
	Mon,  8 Nov 2021 13:42:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CE35A1BF331
 for <buildroot@lists.busybox.net>; Mon,  8 Nov 2021 13:42:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CB45380E52
 for <buildroot@lists.busybox.net>; Mon,  8 Nov 2021 13:42:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Cjhh4pkmaK3T for <buildroot@lists.busybox.net>;
 Mon,  8 Nov 2021 13:42:03 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2E11780E4E
 for <buildroot@buildroot.org>; Mon,  8 Nov 2021 13:42:03 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id AD6938B688; Mon,  8 Nov 2021 13:38:10 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 8 Nov 2021 14:15:36 +0100
X-Git-Refname: refs/heads/2021.08.x
X-Git-Oldrev: deab68d04caac3c4027f4d8377fcbfaadadabee2
X-Git-Newrev: c10bd24cbae3a10c8bc77b5bb447acfdeed3f395
X-Patchwork-Hint: ignore
Message-Id: <20211108133810.AD6938B688@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.08.x] DEVELOPERS: drop Mirza
 Krak
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

commit: https://git.buildroot.net/buildroot/commit/?id=c10bd24cbae3a10c8bc77b5bb447acfdeed3f395
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.08.x

His e-mail is no longer responding:

** Address not found **

Your message wasn't delivered to mirza.krak@northern.tech because the address couldn't be found, or is unable to receive mail.

Learn more here: https://support.google.com/mail/?p=NoSuchUser

The response from the remote server was:
550 5.1.1 The email account that you tried to reach does not exist. Please try double-checking the recipient's email address for typos or unnecessary spaces. Learn more at https://support.google.com/mail/?p=NoSuchUser bi21si292758edb.0 - gsmtp

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 2b2478dfdbfc7c9c46e867e8aeb2fcf6c056792f)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index dc3f274f92..33ceaa05dd 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1945,10 +1945,6 @@ F:	package/shadowsocks-libev/
 N:	Mircea Gliga <gliga.mircea@gmail.com>
 F:	package/mbuffer/
 
-N:	Mirza Krak <mirza.krak@northern.tech>
-F:	package/mender/
-F:	package/mender-artifact/
-
 N:	Murat Demirten <mdemirten@yh.com.tr>
 F:	package/jpeg-turbo/
 F:	package/libgeotiff/
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
