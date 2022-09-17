Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C57FFECAAD3
	for <buildroot@archiver.kernel.org>; Sat, 17 Sep 2022 09:56:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 62D5541D91;
	Sat, 17 Sep 2022 09:56:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 62D5541D91
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TlIe8Uh49ane; Sat, 17 Sep 2022 09:56:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B846C41D5C;
	Sat, 17 Sep 2022 09:56:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B846C41D5C
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 77E661BF968
 for <buildroot@lists.busybox.net>; Sat, 17 Sep 2022 09:56:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 53AC9401CC
 for <buildroot@lists.busybox.net>; Sat, 17 Sep 2022 09:56:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 53AC9401CC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id F3luUI5PIM8g for <buildroot@lists.busybox.net>;
 Sat, 17 Sep 2022 09:56:38 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8E47440121
 for <buildroot@buildroot.org>; Sat, 17 Sep 2022 09:56:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8E47440121
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 7D0D38416D; Sat, 17 Sep 2022 09:56:38 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sat, 17 Sep 2022 11:56:29 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 05595cbeace38789a8727623d4b5b107e6157a2c
X-Git-Newrev: 67ccc49fabad87d0a2eecf4be35018a3f45b70d7
X-Patchwork-Hint: ignore
Message-Id: <20220917095638.7D0D38416D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] DEVELOPERS: Add Yann (at work) for gpsd
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

commit: https://git.buildroot.net/buildroot/commit/?id=67ccc49fabad87d0a2eecf4be35018a3f45b70d7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index a707b0e5e1..4785057d90 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3104,6 +3104,9 @@ F:	package/wtfutil/
 F:	package/zisofs-tools/
 F:	support/download/
 
+N:	Yann E. MORIN <yann.morin@orange.com>
+F:	package/gpsd/
+
 N:	Yegor Yefremov <yegorslists@googlemail.com>
 F:	configs/beaglebone_defconfig
 F:	configs/beaglebone_qt5_defconfig
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
