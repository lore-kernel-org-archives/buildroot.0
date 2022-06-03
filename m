Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B898C433EF
	for <buildroot@archiver.kernel.org>; Fri,  3 Jun 2022 12:35:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7A609405E0;
	Fri,  3 Jun 2022 12:35:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id r51BJKDWwJtp; Fri,  3 Jun 2022 12:35:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A3AE44058F;
	Fri,  3 Jun 2022 12:35:24 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 54E3A1BF309
 for <buildroot@lists.busybox.net>; Fri,  3 Jun 2022 12:35:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3D6024058F
 for <buildroot@lists.busybox.net>; Fri,  3 Jun 2022 12:35:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jgeRrhY7mCji for <buildroot@lists.busybox.net>;
 Fri,  3 Jun 2022 12:35:22 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from hostingweb31-40.netsons.net (hostingweb31-40.netsons.net
 [89.40.174.40])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0F85C404C9
 for <buildroot@buildroot.org>; Fri,  3 Jun 2022 12:35:21 +0000 (UTC)
Received: from [77.244.183.192] (port=64524 helo=melee.fritz.box)
 by hostingweb31.netsons.net with esmtpa (Exim 4.95)
 (envelope-from <luca@lucaceresoli.net>) id 1nx6WM-000AVG-HS;
 Fri, 03 Jun 2022 14:35:18 +0200
From: Luca Ceresoli <luca@lucaceresoli.net>
To: buildroot@buildroot.org
Date: Fri,  3 Jun 2022 14:35:06 +0200
Message-Id: <20220603123506.1219339-1-luca@lucaceresoli.net>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - hostingweb31.netsons.net
X-AntiAbuse: Original Domain - buildroot.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - lucaceresoli.net
X-Get-Message-Sender-Via: hostingweb31.netsons.net: authenticated_id:
 luca+lucaceresoli.net/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: hostingweb31.netsons.net: luca@lucaceresoli.net
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Subject: [Buildroot] [PATCH] DEVELOPERS: update my e-mail address
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
Cc: Luca Ceresoli <luca@lucaceresoli.net>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

My Bootlin address is preferred from now on.

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 DEVELOPERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index 71cc3da6d70b..aa18de83bcb6 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1729,7 +1729,7 @@ F:	package/intel-gmmlib/
 F:	package/intel-mediadriver/
 F:	package/intel-mediasdk/
 
-N:	Luca Ceresoli <luca@lucaceresoli.net>
+N:	Luca Ceresoli <luca.ceresoli@bootlin.com>
 F:	board/olimex/a20_olinuxino/
 F:	board/zynq/
 F:	board/zynqmp/
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
