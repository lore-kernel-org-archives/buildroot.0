Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C203C4321E
	for <buildroot@archiver.kernel.org>; Mon,  5 Dec 2022 08:20:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9930640A01;
	Mon,  5 Dec 2022 08:20:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9930640A01
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id f4QD_L92-Txj; Mon,  5 Dec 2022 08:20:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 99846409DD;
	Mon,  5 Dec 2022 08:20:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 99846409DD
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3065C1BF2EA
 for <buildroot@lists.busybox.net>; Mon,  5 Dec 2022 08:20:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0A3B8409DD
 for <buildroot@lists.busybox.net>; Mon,  5 Dec 2022 08:20:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0A3B8409DD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kTVl167G6zXE for <buildroot@lists.busybox.net>;
 Mon,  5 Dec 2022 08:20:40 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id D9FBF4095F
 for <buildroot@buildroot.org>; Mon,  5 Dec 2022 08:20:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D9FBF4095F
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C569885792; Mon,  5 Dec 2022 08:20:40 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 5 Dec 2022 09:19:48 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 15d3648df93d1113b07a63c1264ea4b5ba9662b5
X-Git-Newrev: 6aca1d4d70bfe0b8a627d9e08692b36dd19a92d2
X-Patchwork-Hint: ignore
Message-Id: <20221205082040.C569885792@busybox.osuosl.org>
Subject: [Buildroot] [git commit] DEVELOPERS: remove Derrick Lyndon Pallas
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

commit: https://git.buildroot.net/buildroot/commit/?id=6aca1d4d70bfe0b8a627d9e08692b36dd19a92d2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

His e-mail address no longer exists:

Your message wasn't delivered to derrick@meter.com because the address
couldn't be found, or is unable to receive mail.

Learn more here: https://support.google.com/mail/answer/6596

The response was:

The email account that you tried to reach does not exist. Please try
double-checking the recipient's email address for typos or unnecessary
spaces. Learn more at https://support.google.com/mail/answer/6596

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index 4f862befb0..9da61cca13 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -729,9 +729,6 @@ F:	package/tcllib/
 N:	Denis Bodor <lefinnois@lefinnois.net>
 F:	package/libstrophe/
 
-N:	Derrick Lyndon Pallas <derrick@meter.com>
-F:	package/ipcalc/
-
 N:	Dick Olsson <hi@senzilla.io>
 F:	board/aarch64-efi/
 F:	board/pc/
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
