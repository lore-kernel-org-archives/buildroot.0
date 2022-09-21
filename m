Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA053C6FA82
	for <buildroot@archiver.kernel.org>; Wed, 21 Sep 2022 20:39:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 61B1A82F40;
	Wed, 21 Sep 2022 20:39:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 61B1A82F40
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kre8IMIAhZMY; Wed, 21 Sep 2022 20:39:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 887D382F32;
	Wed, 21 Sep 2022 20:39:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 887D382F32
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 54E6D1BF34B
 for <buildroot@lists.busybox.net>; Wed, 21 Sep 2022 20:39:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 30EB260FC0
 for <buildroot@lists.busybox.net>; Wed, 21 Sep 2022 20:39:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 30EB260FC0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SOXiEe2qvaxF for <buildroot@lists.busybox.net>;
 Wed, 21 Sep 2022 20:39:28 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6D30E61055
 for <buildroot@buildroot.org>; Wed, 21 Sep 2022 20:39:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6D30E61055
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5CE6685DB4; Wed, 21 Sep 2022 20:39:28 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 21 Sep 2022 22:37:36 +0200
X-Git-Refname: refs/heads/2022.05.x
X-Git-Oldrev: f43e0cd311790e3ebfad2217b7ccaaf95b7a19ff
X-Git-Newrev: ca65c931898451bc08714cf5a2c59a6c93d47d00
X-Patchwork-Hint: ignore
Message-Id: <20220921203928.5CE6685DB4@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.05.x] DEVELOPERS: Add Yann (at
 work) for gpsd
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

commit: https://git.buildroot.net/buildroot/commit/?id=ca65c931898451bc08714cf5a2c59a6c93d47d00
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.05.x

Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 67ccc49fabad87d0a2eecf4be35018a3f45b70d7)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index adacc680f7..72bb621dfc 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2995,6 +2995,9 @@ F:	package/wtfutil/
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
