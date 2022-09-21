Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F094CECAAD8
	for <buildroot@archiver.kernel.org>; Wed, 21 Sep 2022 20:39:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 94A4540566;
	Wed, 21 Sep 2022 20:39:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 94A4540566
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yvJVCQkBFbeH; Wed, 21 Sep 2022 20:39:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C01AE404B1;
	Wed, 21 Sep 2022 20:39:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C01AE404B1
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9BECB1BF34B
 for <buildroot@lists.busybox.net>; Wed, 21 Sep 2022 20:39:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 786C282EB4
 for <buildroot@lists.busybox.net>; Wed, 21 Sep 2022 20:39:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 786C282EB4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GvFmrd8ZNaEy for <buildroot@lists.busybox.net>;
 Wed, 21 Sep 2022 20:39:28 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id C235282EA4
 for <buildroot@buildroot.org>; Wed, 21 Sep 2022 20:39:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C235282EA4
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id ADB4685DB4; Wed, 21 Sep 2022 20:39:28 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 21 Sep 2022 22:37:40 +0200
X-Git-Refname: refs/heads/2022.08.x
X-Git-Oldrev: 5cba94e6025db1ef3bb092ad1fb33f80e2930ded
X-Git-Newrev: 180c928b6d39c0c2a61148bab767a07f23765a13
X-Patchwork-Hint: ignore
Message-Id: <20220921203928.ADB4685DB4@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.08.x] DEVELOPERS: Add Yann (at
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

commit: https://git.buildroot.net/buildroot/commit/?id=180c928b6d39c0c2a61148bab767a07f23765a13
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.08.x

Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 67ccc49fabad87d0a2eecf4be35018a3f45b70d7)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index d2bd0d809a..a83f7640c7 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3091,6 +3091,9 @@ F:	package/wtfutil/
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
