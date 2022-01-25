Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6803AC433EF
	for <buildroot@archiver.kernel.org>; Tue, 25 Jan 2022 05:50:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D581E84CDC;
	Tue, 25 Jan 2022 05:50:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QlYEwTZgPZza; Tue, 25 Jan 2022 05:50:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 379DC84C81;
	Tue, 25 Jan 2022 05:50:39 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2792C1BF307
 for <buildroot@lists.busybox.net>; Tue, 25 Jan 2022 05:50:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 20B8240204
 for <buildroot@lists.busybox.net>; Tue, 25 Jan 2022 05:50:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id giGrV3-B2kYN for <buildroot@lists.busybox.net>;
 Tue, 25 Jan 2022 05:50:37 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from ATCSQR.andestech.com (exmail.andestech.com [60.248.187.195])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DE3474016C
 for <buildroot@buildroot.org>; Tue, 25 Jan 2022 05:50:36 +0000 (UTC)
Received: from mail.andestech.com (ATCPCS16.andestech.com [10.0.1.222])
 by ATCSQR.andestech.com with ESMTP id 20P5oDdV084840
 for <buildroot@buildroot.org>; Tue, 25 Jan 2022 13:50:13 +0800 (GMT-8)
 (envelope-from peterlin@andestech.com)
Received: from atcfdc88.andestech.com (10.0.15.120) by ATCPCS16.andestech.com
 (10.0.1.222) with Microsoft SMTP Server id 14.3.498.0;
 Tue, 25 Jan 2022 13:50:11 +0800
From: Yu Chien Peter Lin <peterlin@andestech.com>
To: <buildroot@buildroot.org>
Date: Tue, 25 Jan 2022 13:49:54 +0800
Message-ID: <20220125054956.27492-1-peterlin@andestech.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.0.15.120]
X-DNSRBL: 
X-MAIL: ATCSQR.andestech.com 20P5oDdV084840
Subject: [Buildroot] [PATCH v2 1/3] board/andes: rearrange nds32 folder
 structure
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

Signed-off-by: Yu Chien Peter Lin <peterlin@andestech.com>
Signed-off-by: Alan Kao <alankao@andestech.com>
---
 .../patches/linux/0001-nds32-Fix-boot-messages-garbled.patch    | 0
 board/andes/{ => ae3xx}/readme.txt                              | 0
 configs/andes_ae3xx_defconfig                                   | 2 +-
 3 files changed, 1 insertion(+), 1 deletion(-)
 rename board/andes/{ => ae3xx}/patches/linux/0001-nds32-Fix-boot-messages-garbled.patch (100%)
 rename board/andes/{ => ae3xx}/readme.txt (100%)

diff --git a/board/andes/patches/linux/0001-nds32-Fix-boot-messages-garbled.patch b/board/andes/ae3xx/patches/linux/0001-nds32-Fix-boot-messages-garbled.patch
similarity index 100%
rename from board/andes/patches/linux/0001-nds32-Fix-boot-messages-garbled.patch
rename to board/andes/ae3xx/patches/linux/0001-nds32-Fix-boot-messages-garbled.patch
diff --git a/board/andes/readme.txt b/board/andes/ae3xx/readme.txt
similarity index 100%
rename from board/andes/readme.txt
rename to board/andes/ae3xx/readme.txt
diff --git a/configs/andes_ae3xx_defconfig b/configs/andes_ae3xx_defconfig
index 52634caa50..18051115c3 100644
--- a/configs/andes_ae3xx_defconfig
+++ b/configs/andes_ae3xx_defconfig
@@ -1,5 +1,5 @@
 BR2_nds32=y
-BR2_GLOBAL_PATCH_DIR="board/andes/patches/"
+BR2_GLOBAL_PATCH_DIR="board/andes/ae3xx/patches"
 BR2_TOOLCHAIN_EXTERNAL=y
 BR2_TOOLCHAIN_EXTERNAL_ANDES_NDS32=y
 BR2_LINUX_KERNEL=y
-- 
2.17.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
