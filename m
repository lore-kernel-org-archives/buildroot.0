Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12CFAC25B06
	for <buildroot@archiver.kernel.org>; Sun, 14 Aug 2022 19:24:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B552C83F04;
	Sun, 14 Aug 2022 19:24:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B552C83F04
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BCiBWtK5Rea6; Sun, 14 Aug 2022 19:24:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6D53D81CDC;
	Sun, 14 Aug 2022 19:24:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6D53D81CDC
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5303D1BF30C
 for <buildroot@lists.busybox.net>; Sun, 14 Aug 2022 19:23:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2F21940181
 for <buildroot@lists.busybox.net>; Sun, 14 Aug 2022 19:23:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2F21940181
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DNkf6uuLMxJK for <buildroot@lists.busybox.net>;
 Sun, 14 Aug 2022 19:23:28 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6C2A0400AC
 for <buildroot@buildroot.org>; Sun, 14 Aug 2022 19:23:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6C2A0400AC
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id C11A58756B; Sun, 14 Aug 2022 19:09:00 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 14 Aug 2022 21:23:21 +0200
X-Git-Refname: refs/heads/2022.05.x
X-Git-Oldrev: dba1771d4c19fc4b5cfc70f6c53d6d9ef2908859
X-Git-Newrev: 3068edf19d34bc5e3fa0b2396af281024b94fcdf
X-Patchwork-Hint: ignore
Message-Id: <20220814190900.C11A58756B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.05.x] DEVELOPERS: remove Min Xu
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
Content-Type: multipart/mixed; boundary="===============4863576798609999407=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4863576798609999407==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=3068edf19d34bc5e3fa0b2396af281024b94fcdf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.05.x

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
index 1817113b10..19da0547f1 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2067,9 +2067,6 @@ F:	configs/bananapi_m2_plus_defconfig
 N:	Mikhail Boiko <mikhailboiko85@gmail.com>
 F:	package/libfribidi/
 
-N:	Min Xu <xuminready@gmail.com>
-F:	package/shadowsocks-libev/
-
 N:	Miquèl Raynal <miquel.raynal@bootlin.com>
 F:	package/mali-driver/
 F:	package/rockchip-mali/

--===============4863576798609999407==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4863576798609999407==--
