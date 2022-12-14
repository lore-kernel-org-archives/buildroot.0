Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 118A3C4332F
	for <buildroot@archiver.kernel.org>; Wed, 14 Dec 2022 22:14:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B555460BAB;
	Wed, 14 Dec 2022 22:14:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B555460BAB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8PiqpnoAISIr; Wed, 14 Dec 2022 22:14:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0C67860F36;
	Wed, 14 Dec 2022 22:14:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0C67860F36
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8750A1BF425
 for <buildroot@lists.busybox.net>; Wed, 14 Dec 2022 22:14:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6D4A840BC4
 for <buildroot@lists.busybox.net>; Wed, 14 Dec 2022 22:14:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6D4A840BC4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id moGFis1vqAvN for <buildroot@lists.busybox.net>;
 Wed, 14 Dec 2022 22:14:45 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id A94DC40328
 for <buildroot@buildroot.org>; Wed, 14 Dec 2022 22:14:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A94DC40328
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9593C866F7; Wed, 14 Dec 2022 22:14:45 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 14 Dec 2022 23:12:46 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f83377b7b30c82da363c7937f693fe979318f598
X-Git-Newrev: aa409d82fc64ee28e7ef9a649875fc577c33f01b
X-Patchwork-Hint: ignore
Message-Id: <20221214221445.9593C866F7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] DEVELOPERS: add Bernd Kuhls to package
 intel-microcode
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

commit: https://git.buildroot.net/buildroot/commit/?id=aa409d82fc64ee28e7ef9a649875fc577c33f01b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 831e60982e..3a0e3c14ab 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -353,6 +353,7 @@ F:	package/inih/
 F:	package/intel-gmmlib/
 F:	package/intel-mediadriver/
 F:	package/intel-mediasdk/
+F:	package/intel-microcode/
 F:	package/jsoncpp/
 F:	package/kodi*
 F:	package/lame/
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
