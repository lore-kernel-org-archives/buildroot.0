Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71CB2C25B06
	for <buildroot@archiver.kernel.org>; Sun, 14 Aug 2022 19:23:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1FA4960B9A;
	Sun, 14 Aug 2022 19:23:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1FA4960B9A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ll-6Ye2NiEjW; Sun, 14 Aug 2022 19:23:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E185460D69;
	Sun, 14 Aug 2022 19:23:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E185460D69
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C5B7D1BF30C
 for <buildroot@lists.busybox.net>; Sun, 14 Aug 2022 19:23:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A09D483EDE
 for <buildroot@lists.busybox.net>; Sun, 14 Aug 2022 19:23:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A09D483EDE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 28RXkunIU633 for <buildroot@lists.busybox.net>;
 Sun, 14 Aug 2022 19:23:17 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id D40D583EDD
 for <buildroot@buildroot.org>; Sun, 14 Aug 2022 19:23:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D40D583EDD
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 324DF8755F; Sun, 14 Aug 2022 19:08:50 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 14 Aug 2022 21:23:10 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: d450168fe1e79cf9dd50ef52096e80dedf9f6632
X-Git-Newrev: ae4c3180a5e2df911514d6aaa0c057d681528e7f
X-Patchwork-Hint: ignore
Message-Id: <20220814190850.324DF8755F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] DEVELOPERS: remove Min Xu
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
Content-Type: multipart/mixed; boundary="===============1416423210646850624=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1416423210646850624==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=ae4c3180a5e2df911514d6aaa0c057d681528e7f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Min Xu has said at
https://patchwork.ozlabs.org/project/buildroot/patch/20220519074438.462-1-xuminready@gmail.com/
that they are no longer interested in maintaining this package, so
drop them from the DEVELOPERS file.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit f704ec56f85b4aebb75a76fd7dbd9db800bf1b9e)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index b4ea33adf1..2cf9d14013 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2048,9 +2048,6 @@ F:	configs/bananapi_m2_plus_defconfig
 N:	Mikhail Boiko <mikhailboiko85@gmail.com>
 F:	package/libfribidi/
 
-N:	Min Xu <xuminready@gmail.com>
-F:	package/shadowsocks-libev/
-
 N:	Miquèl Raynal <miquel.raynal@bootlin.com>
 F:	package/mali-driver/
 F:	package/rockchip-mali/

--===============1416423210646850624==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1416423210646850624==--
