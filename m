Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5ED2FC433F5
	for <buildroot@archiver.kernel.org>; Wed, 23 Feb 2022 07:11:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id ED672414CD;
	Wed, 23 Feb 2022 07:11:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eH5YUcU2qrlt; Wed, 23 Feb 2022 07:11:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3225B40493;
	Wed, 23 Feb 2022 07:11:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DBF0A1BF85D
 for <buildroot@lists.busybox.net>; Wed, 23 Feb 2022 07:11:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C9E2A825FE
 for <buildroot@lists.busybox.net>; Wed, 23 Feb 2022 07:11:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gUVGeLjMhns0 for <buildroot@lists.busybox.net>;
 Wed, 23 Feb 2022 07:11:29 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from Atcsqr.andestech.com (exmail.andestech.com [60.248.187.195])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 092CE825E6
 for <buildroot@buildroot.org>; Wed, 23 Feb 2022 07:11:28 +0000 (UTC)
Received: from mail.andestech.com (ATCPCS16.andestech.com [10.0.1.222])
 by Atcsqr.andestech.com with ESMTP id 21N7BH5b017050;
 Wed, 23 Feb 2022 15:11:17 +0800 (+08)
 (envelope-from peterlin@andestech.com)
Received: from atcfdc88.andestech.com (10.0.15.120) by ATCPCS16.andestech.com
 (10.0.1.222) with Microsoft SMTP Server id 14.3.498.0;
 Wed, 23 Feb 2022 15:11:12 +0800
From: Yu Chien Peter Lin <peterlin@andestech.com>
To: <buildroot@buildroot.org>
Date: Wed, 23 Feb 2022 15:10:49 +0800
Message-ID: <20220223071049.21153-3-peterlin@andestech.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220223071049.21153-1-peterlin@andestech.com>
References: <20220223071049.21153-1-peterlin@andestech.com>
MIME-Version: 1.0
X-Originating-IP: [10.0.15.120]
X-DNSRBL: 
X-MAIL: Atcsqr.andestech.com 21N7BH5b017050
Subject: [Buildroot] [PATCH v4 3/3] DEVELOPERS: add Yu-Chien Lin to
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
Cc: Yu Chien Peter Lin <peterlin@andestech.com>, alankao@andestech.com,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Nylon is no longer at Andes.

Signed-off-by: Yu Chien Peter Lin <peterlin@andestech.com>
Signed-off-by: Alan Kao <alankao@andestech.com>
Reviewed-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 DEVELOPERS | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index ac702d8d0f..cd64159867 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2146,10 +2146,11 @@ N:	Norbert Lange <nolange79@gmail.com>
 F:	package/systemd/
 F:	package/tcf-agent/
 
-N:	Nylon Chen <nylon7@andestech.com>
+N:	Yu Chien Peter Lin <peterlin@andestech.com>
 F:	arch/Config.in.nds32
 F:	board/andes
-F:	configs/andes_ae3xx_defconfig
+F:	configs/andes_ae300_defconfig
+F:	configs/andes_ae350_45_defconfig
 F:	toolchain/toolchain-external/toolchain-external-andes-nds32/
 
 N:	Olaf Rempel <razzor@kopf-tisch.de>
-- 
2.17.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
