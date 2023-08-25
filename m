Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45A5EC71133
	for <buildroot@archiver.kernel.org>; Fri, 25 Aug 2023 13:13:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F2A3061473;
	Fri, 25 Aug 2023 13:13:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F2A3061473
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kUSDimckWHv3; Fri, 25 Aug 2023 13:13:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4DD876146E;
	Fri, 25 Aug 2023 13:13:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4DD876146E
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C1A711BF82F
 for <buildroot@lists.busybox.net>; Fri, 25 Aug 2023 13:12:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9268061450
 for <buildroot@lists.busybox.net>; Fri, 25 Aug 2023 13:12:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9268061450
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lzYRoYOodi8g for <buildroot@lists.busybox.net>;
 Fri, 25 Aug 2023 13:12:43 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id C817261001
 for <buildroot@buildroot.org>; Fri, 25 Aug 2023 13:12:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C817261001
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B65E5862F6; Fri, 25 Aug 2023 13:12:43 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 25 Aug 2023 15:09:40 +0200
X-Git-Refname: refs/heads/2023.05.x
X-Git-Oldrev: 133d4e188b40489689cb4fe9ef9278308d1a9d9c
X-Git-Newrev: 3304de4e818d407429bc01422adc928cc9123040
X-Patchwork-Hint: ignore
Message-Id: <20230825131243.B65E5862F6@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.05.x] package/yavta: update
 _SITE URL
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
Content-Type: multipart/mixed; boundary="===============0422204074878530647=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0422204074878530647==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=3304de4e818d407429bc01422adc928cc9123040
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.05.x

It looks like the project moved to https://git.ideasonboard.org/yavta.git.

Update YAVA_SITE URL accordingly.

Signed-off-by: Sébastien Szymanski <sebastien.szymanski@armadeus.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit b17ed57763c4809f4541b4abe6a7a0e2349e6f90)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/yavta/yavta.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/yavta/yavta.mk b/package/yavta/yavta.mk
index d16bee69b1..db481b77b9 100644
--- a/package/yavta/yavta.mk
+++ b/package/yavta/yavta.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 YAVTA_VERSION = 583bedefc2a247d2cfd32d1b4a0abbe3e2015c70
-YAVTA_SITE = https://git.ideasonboard.org/git/yavta.git
+YAVTA_SITE = https://git.ideasonboard.org/yavta.git
 YAVTA_SITE_METHOD = git
 YAVTA_LICENSE = GPL-2.0+
 YAVTA_LICENSE_FILES = COPYING.GPL

--===============0422204074878530647==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0422204074878530647==--
