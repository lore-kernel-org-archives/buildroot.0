Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 547A5C433EF
	for <buildroot@archiver.kernel.org>; Sat, 23 Jul 2022 16:29:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C3B5160D61;
	Sat, 23 Jul 2022 16:29:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C3B5160D61
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VZokxFMI0gUp; Sat, 23 Jul 2022 16:29:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C5FB460B59;
	Sat, 23 Jul 2022 16:29:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C5FB460B59
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 39DA51BF271
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 16:29:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1E4E1404DF
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 16:29:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1E4E1404DF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1tpKRYuF3WtU for <buildroot@lists.busybox.net>;
 Sat, 23 Jul 2022 16:29:53 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4EF304018E
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 16:29:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4EF304018E
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 1C52F846E1; Sat, 23 Jul 2022 16:16:16 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 23 Jul 2022 18:29:25 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 380d9ad503d552dac2817d3a487f681530030752
X-Git-Newrev: f704ec56f85b4aebb75a76fd7dbd9db800bf1b9e
X-Patchwork-Hint: ignore
Message-Id: <20220723161616.1C52F846E1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] DEVELOPERS: remove Min Xu
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
Content-Type: multipart/mixed; boundary="===============2674742489793848535=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2674742489793848535==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=f704ec56f85b4aebb75a76fd7dbd9db800bf1b9e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Min Xu has said at
https://patchwork.ozlabs.org/project/buildroot/patch/20220519074438.462-1-xuminready@gmail.com/
that they are no longer interested in maintaining this package, so
drop them from the DEVELOPERS file.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index afd2e1ca12..b61074670a 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2092,9 +2092,6 @@ F:	configs/bananapi_m2_plus_defconfig
 N:	Mikhail Boiko <mikhailboiko85@gmail.com>
 F:	package/libfribidi/
 
-N:	Min Xu <xuminready@gmail.com>
-F:	package/shadowsocks-libev/
-
 N:	Miquèl Raynal <miquel.raynal@bootlin.com>
 F:	package/mali-driver/
 F:	package/rockchip-mali/

--===============2674742489793848535==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2674742489793848535==--
