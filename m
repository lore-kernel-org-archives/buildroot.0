Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53A67C433EF
	for <buildroot@archiver.kernel.org>; Mon, 10 Jan 2022 14:12:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 02A9A8284B;
	Mon, 10 Jan 2022 14:12:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LW2OGm1qkah2; Mon, 10 Jan 2022 14:12:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 59F888266A;
	Mon, 10 Jan 2022 14:12:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id BF03F1BF97F
 for <buildroot@lists.busybox.net>; Mon, 10 Jan 2022 14:12:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AE6DC408EB
 for <buildroot@lists.busybox.net>; Mon, 10 Jan 2022 14:12:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XrHyNhaHYSqo for <buildroot@lists.busybox.net>;
 Mon, 10 Jan 2022 14:12:28 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 134A6408F8
 for <buildroot@buildroot.org>; Mon, 10 Jan 2022 14:12:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 2CCBF83241; Mon, 10 Jan 2022 14:06:11 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Mon, 10 Jan 2022 15:11:53 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 922fdcd47d092e9d2f7000afcb7997a2a2ed2111
X-Git-Newrev: 31fd98c6ae7c39d779e7f9729e55ec65a7f847ff
X-Patchwork-Hint: ignore
Message-Id: <20220110140611.2CCBF83241@busybox.osuosl.org>
Subject: [Buildroot] [git commit] Developpers: remove Santosh Multhalli for
 valjson
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
Content-Type: multipart/mixed; boundary="===============7467611788950186133=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============7467611788950186133==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=31fd98c6ae7c39d779e7f9729e55ec65a7f847ff
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Santosh Multhalli <santosh.multhalli@rockwellcollins.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 DEVELOPERS | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index 7a9f0f7370..12777e8d61 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2503,9 +2503,6 @@ F:	support/misc/toolchainfile.cmake.in
 N:	Sam Voss <sam.voss@gmail.com>
 F:	package/ripgrep/
 
-N:	Santosh Multhalli <santosh.multhalli@collins.com>
-F:	package/valijson/
-
 N:	Sébastien Szymanski <sebastien.szymanski@armadeus.com>
 F:	package/mmc-utils/
 F:	package/python-flask-jsonrpc/

--===============7467611788950186133==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7467611788950186133==--
