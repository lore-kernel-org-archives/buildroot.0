Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D50BC3DA66
	for <buildroot@archiver.kernel.org>; Fri, 25 Aug 2023 13:15:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 06C6F6145E;
	Fri, 25 Aug 2023 13:15:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 06C6F6145E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id k7KNXM8tnbgO; Fri, 25 Aug 2023 13:15:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 48D506146C;
	Fri, 25 Aug 2023 13:15:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 48D506146C
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 847901BF82F
 for <buildroot@lists.busybox.net>; Fri, 25 Aug 2023 13:13:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4F44A402E0
 for <buildroot@lists.busybox.net>; Fri, 25 Aug 2023 13:13:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4F44A402E0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DfaYraP72MCP for <buildroot@lists.busybox.net>;
 Fri, 25 Aug 2023 13:13:56 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id B157840993
 for <buildroot@buildroot.org>; Fri, 25 Aug 2023 13:13:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B157840993
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A07CD8630A; Fri, 25 Aug 2023 13:13:56 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 25 Aug 2023 15:09:34 +0200
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: 63bea3d49f521cbbbd31b1a76853aae4f1d1dcdb
X-Git-Newrev: cf058768356597b655e9c118076078a17780665f
X-Patchwork-Hint: ignore
Message-Id: <20230825131356.A07CD8630A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/yavta: update
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
Content-Type: multipart/mixed; boundary="===============2876929876147825879=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2876929876147825879==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=cf058768356597b655e9c118076078a17780665f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

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

--===============2876929876147825879==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2876929876147825879==--
