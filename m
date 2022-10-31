Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77446FA3740
	for <buildroot@archiver.kernel.org>; Mon, 31 Oct 2022 08:39:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F03C84027A;
	Mon, 31 Oct 2022 08:39:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F03C84027A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mRCU8sMhAHzO; Mon, 31 Oct 2022 08:39:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E66C9401DB;
	Mon, 31 Oct 2022 08:39:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E66C9401DB
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7155A1BF2BF
 for <buildroot@lists.busybox.net>; Mon, 31 Oct 2022 08:39:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 59B8340154
 for <buildroot@lists.busybox.net>; Mon, 31 Oct 2022 08:39:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 59B8340154
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1AT5rOHCcYYk for <buildroot@lists.busybox.net>;
 Mon, 31 Oct 2022 08:39:39 +0000 (UTC)
X-Greylist: delayed 00:10:28 by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 01276400F2
Received: from ex01.ufhost.com (ex01.ufhost.com [61.152.239.75])
 by smtp2.osuosl.org (Postfix) with ESMTP id 01276400F2
 for <buildroot@buildroot.org>; Mon, 31 Oct 2022 08:39:38 +0000 (UTC)
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
 by ex01.ufhost.com (Postfix) with ESMTP id 675E124E203;
 Mon, 31 Oct 2022 16:28:54 +0800 (CST)
Received: from EXMBX161.cuchost.com (172.16.6.71) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.32; Mon, 31 Oct
 2022 16:28:54 +0800
Received: from localhost.localdomain (180.75.243.135) by EXMBX161.cuchost.com
 (172.16.6.71) with Microsoft SMTP Server (TLS) id 15.0.1497.32;
 Mon, 31 Oct 2022 16:28:52 +0800
From: Tan En De <ende.tan@starfivetech.com>
To: <buildroot@buildroot.org>
Date: Mon, 31 Oct 2022 16:28:41 +0800
Message-ID: <20221031082841.2781656-1-ende.tan@starfivetech.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Originating-IP: [180.75.243.135]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX161.cuchost.com
 (172.16.6.71)
X-YovoleRuleAgent: yovoleflag
Subject: [Buildroot] [1/1] DEVELOPERS: add myself for package/libkcapi
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
Cc: Tan En De <ende.tan@starfivetech.com>, thomas.petazzoni@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add myself to help maintaining package/libkcapi.

Signed-off-by: Tan En De <ende.tan@starfivetech.com>
---
As mentioned in the reply:
https://lore.kernel.org/all/20221030114529.607f4e73@windsurf/
Notice that I'm using ende.tan@starfivetech.com instead of
ende.tan@linux.starfivetech.com because my company has changed SMTP
server (the latter is still accessible).
---
 DEVELOPERS | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index c4d23cd293..90c28b375e 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2775,6 +2775,9 @@ F:	package/most/
 N:	TIAN Yuanhao <tianyuanhao3@163.com>
 F:	package/open-isns/
 
+N:	Tan En De <ende.tan@starfivetech.com>
+F:	package/libkcapi/
+
 N:	Theo Debrouwere <t.debrouwere@televic.com>
 F:	board/beagleboardx15/
 F:	configs/beagleboardx15_defconfig
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
