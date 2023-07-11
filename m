Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 587F5EB64DC
	for <buildroot@archiver.kernel.org>; Tue, 11 Jul 2023 17:22:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E56F941E28;
	Tue, 11 Jul 2023 17:22:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E56F941E28
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KLJELPC97Z2S; Tue, 11 Jul 2023 17:22:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C529A41E0E;
	Tue, 11 Jul 2023 17:22:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C529A41E0E
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 06D371BF3E5
 for <buildroot@lists.busybox.net>; Tue, 11 Jul 2023 17:22:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D4347408BA
 for <buildroot@lists.busybox.net>; Tue, 11 Jul 2023 17:22:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D4347408BA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SkK_R8wOYGoJ for <buildroot@lists.busybox.net>;
 Tue, 11 Jul 2023 17:22:15 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 16EBD4013B
 for <buildroot@buildroot.org>; Tue, 11 Jul 2023 17:22:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 16EBD4013B
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 06DB086DEB; Tue, 11 Jul 2023 17:22:15 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Tue, 11 Jul 2023 19:21:56 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: adc566856e95990ede1174faa0a2ff031b15d356
X-Git-Newrev: b17ed57763c4809f4541b4abe6a7a0e2349e6f90
X-Patchwork-Hint: ignore
Message-Id: <20230711172215.06DB086DEB@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/yavta: update _SITE URL
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
Content-Type: multipart/mixed; boundary="===============0668321827166461480=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0668321827166461480==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=b17ed57763c4809f4541b4abe6a7a0e2349e6f90
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

It looks like the project moved to https://git.ideasonboard.org/yavta.git.

Update YAVA_SITE URL accordingly.

Signed-off-by: Sébastien Szymanski <sebastien.szymanski@armadeus.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
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

--===============0668321827166461480==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0668321827166461480==--
