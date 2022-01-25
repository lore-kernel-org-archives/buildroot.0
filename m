Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36302C433F5
	for <buildroot@archiver.kernel.org>; Tue, 25 Jan 2022 05:51:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CD66240480;
	Tue, 25 Jan 2022 05:51:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YmxVdWBag_tw; Tue, 25 Jan 2022 05:51:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E32CF4016C;
	Tue, 25 Jan 2022 05:51:03 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3F4B01BF307
 for <buildroot@lists.busybox.net>; Tue, 25 Jan 2022 05:50:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2CED860B6F
 for <buildroot@lists.busybox.net>; Tue, 25 Jan 2022 05:50:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ieX2V43KtfEh for <buildroot@lists.busybox.net>;
 Tue, 25 Jan 2022 05:50:45 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from ATCSQR.andestech.com (atcsqr.andestech.com [60.248.187.195])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 702EE60B62
 for <buildroot@buildroot.org>; Tue, 25 Jan 2022 05:50:45 +0000 (UTC)
Received: from mail.andestech.com (ATCPCS16.andestech.com [10.0.1.222])
 by ATCSQR.andestech.com with ESMTP id 20P5oOgj084844
 for <buildroot@buildroot.org>; Tue, 25 Jan 2022 13:50:24 +0800 (GMT-8)
 (envelope-from peterlin@andestech.com)
Received: from atcfdc88.andestech.com (10.0.15.120) by ATCPCS16.andestech.com
 (10.0.1.222) with Microsoft SMTP Server id 14.3.498.0;
 Tue, 25 Jan 2022 13:50:22 +0800
From: Yu Chien Peter Lin <peterlin@andestech.com>
To: <buildroot@buildroot.org>
Date: Tue, 25 Jan 2022 13:49:56 +0800
Message-ID: <20220125054956.27492-3-peterlin@andestech.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220125054956.27492-1-peterlin@andestech.com>
References: <20220125054956.27492-1-peterlin@andestech.com>
MIME-Version: 1.0
X-Originating-IP: [10.0.15.120]
X-DNSRBL: 
X-MAIL: ATCSQR.andestech.com 20P5oOgj084844
Subject: [Buildroot] [PATCH v2 3/3] DEVELOPERS: add Yu-Chien Lin to
 board/andes
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
Cc: Yu Chien Peter Lin <peterlin@andestech.com>, alankao@andestech.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Nylon is no longer at Andes.

Signed-off-by: Yu Chien Peter Lin <peterlin@andestech.com>
Signed-off-by: Alan Kao <alankao@andestech.com>
---
 DEVELOPERS | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index dc810b6fe1..b191734d5a 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2137,10 +2137,11 @@ N:	Norbert Lange <nolange79@gmail.com>
 F:	package/systemd/
 F:	package/tcf-agent/
 
-N:	Nylon Chen <nylon7@andestech.com>
+N:	Yu Chien Peter Lin <peterlin@andestech.com>
 F:	arch/Config.in.nds32
 F:	board/andes
 F:	configs/andes_ae3xx_defconfig
+F:	configs/andes_ae350_45_defconfig
 F:	toolchain/toolchain-external/toolchain-external-andes-nds32/
 
 N:	Olaf Rempel <razzor@kopf-tisch.de>
-- 
2.17.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
