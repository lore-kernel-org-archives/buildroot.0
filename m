Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 100E8C04A68
	for <buildroot@archiver.kernel.org>; Wed, 27 Jul 2022 10:51:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id AAAC5404F5;
	Wed, 27 Jul 2022 10:51:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AAAC5404F5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CyCVxwAVwzkB; Wed, 27 Jul 2022 10:51:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id ADC19404EB;
	Wed, 27 Jul 2022 10:51:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ADC19404EB
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E8B551BF9D1
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 10:51:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C2EC1404A5
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 10:51:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C2EC1404A5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id W5zgGpsO-iqC for <buildroot@lists.busybox.net>;
 Wed, 27 Jul 2022 10:51:03 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id D0B2140422
 for <buildroot@buildroot.org>; Wed, 27 Jul 2022 10:51:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D0B2140422
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id F0850865D6; Wed, 27 Jul 2022 10:37:17 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 27 Jul 2022 12:50:46 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7752afbe4bb9fa1def5ba89daf21564ea58af79a
X-Git-Newrev: 9912d438afdd388d580ee094b8e1b1eb4bb6c53b
X-Patchwork-Hint: ignore
Message-Id: <20220727103717.F0850865D6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] DEVELOPERS: drop myself from Pulseaudio
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

commit: https://git.buildroot.net/buildroot/commit/?id=9912d438afdd388d580ee094b8e1b1eb4bb6c53b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

I am not using this package anymore.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS | 1 -
 1 file changed, 1 deletion(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index 1fee7554db..270fc52de1 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -429,7 +429,6 @@ F:	package/php/
 F:	package/pixman/
 F:	package/pngquant/
 F:	package/pound/
-F:	package/pulseaudio/
 F:	package/pure-ftpd/
 F:	package/python-couchdb/
 F:	package/python-cssutils/
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
