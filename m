Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E479C433F5
	for <buildroot@archiver.kernel.org>; Thu, 27 Jan 2022 18:32:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E78D441C95;
	Thu, 27 Jan 2022 18:32:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8lrMeeupg5im; Thu, 27 Jan 2022 18:32:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2C0AB41C8F;
	Thu, 27 Jan 2022 18:32:45 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 48AC31BF3EA
 for <buildroot@lists.busybox.net>; Thu, 27 Jan 2022 18:32:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 32EA54171E
 for <buildroot@lists.busybox.net>; Thu, 27 Jan 2022 18:32:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id T15_yPYCzRjP for <buildroot@lists.busybox.net>;
 Thu, 27 Jan 2022 18:32:05 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id CCFB8417A8
 for <buildroot@buildroot.org>; Thu, 27 Jan 2022 18:32:05 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 79E2E829FE; Thu, 27 Jan 2022 18:25:10 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 27 Jan 2022 19:29:50 +0100
X-Git-Refname: refs/heads/2021.11.x
X-Git-Oldrev: a19f45e6428f538b2cce3b71ee2efde717cf4624
X-Git-Newrev: 11f988730e18fccbf3c865193ae8da929b900b40
X-Patchwork-Hint: ignore
Message-Id: <20220127182510.79E2E829FE@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.11.x] Developpers: remove
 Santosh Multhalli for valjson
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
Content-Type: multipart/mixed; boundary="===============4381206799588459978=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4381206799588459978==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=11f988730e18fccbf3c865193ae8da929b900b40
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.11.x

Signed-off-by: Santosh Multhalli <santosh.multhalli@rockwellcollins.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 31fd98c6ae7c39d779e7f9729e55ec65a7f847ff)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index 1775b75791..834419f9c5 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2425,9 +2425,6 @@ F:	support/misc/toolchainfile.cmake.in
 N:	Sam Voss <sam.voss@gmail.com>
 F:	package/ripgrep/
 
-N:	Santosh Multhalli <santosh.multhalli@collins.com>
-F:	package/valijson/
-
 N:	Sébastien Szymanski <sebastien.szymanski@armadeus.com>
 F:	package/mmc-utils/
 F:	package/python-flask-jsonrpc/

--===============4381206799588459978==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4381206799588459978==--
