Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81438E77188
	for <buildroot@archiver.kernel.org>; Tue, 31 Dec 2024 16:14:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 501A360590;
	Tue, 31 Dec 2024 16:14:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BvUR08-BoEnm; Tue, 31 Dec 2024 16:14:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 722936059D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 722936059D;
	Tue, 31 Dec 2024 16:14:12 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 88EF2968
 for <buildroot@buildroot.org>; Tue, 31 Dec 2024 16:14:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7619C4097F
 for <buildroot@buildroot.org>; Tue, 31 Dec 2024 16:14:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id n4TrSG1KEO8B for <buildroot@buildroot.org>;
 Tue, 31 Dec 2024 16:14:09 +0000 (UTC)
X-Greylist: delayed 388 seconds by postgrey-1.37 at util1.osuosl.org;
 Tue, 31 Dec 2024 16:14:09 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 57E2A40127
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 57E2A40127
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=77.55.128.204;
 helo=mail.grinn-global.com; envelope-from=b.bilas@grinn-global.com;
 receiver=<UNKNOWN> 
Received: from mail.grinn-global.com (mail.grinn-global.com [77.55.128.204])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 57E2A40127
 for <buildroot@buildroot.org>; Tue, 31 Dec 2024 16:14:09 +0000 (UTC)
X-Virus-Scanned: by amavisd-new using ClamAV (10)
Received: from localhost.localdomain (host-81-161-192-49.oxylion.net.pl
 [81.161.192.49])
 by server220076.nazwa.pl (Postfix) with ESMTP id 228D51BC321;
 Tue, 31 Dec 2024 17:07:39 +0100 (CET)
From: Bartosz Bilas <b.bilas@grinn-global.com>
To: buildroot@buildroot.org
Cc: Bartosz Bilas <b.bilas@grinn-global.com>
Date: Tue, 31 Dec 2024 17:07:36 +0100
Message-ID: <20241231160736.142068-1-b.bilas@grinn-global.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=grinn-global.com
Subject: [Buildroot] [PATCH] DEVELOPERS: remove Bartosz Bilas from cegui
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

I no longer use this package.

Signed-off-by: Bartosz Bilas <b.bilas@grinn-global.com>
---
 DEVELOPERS | 1 -
 1 file changed, 1 deletion(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index a5e273056d..381bc9f490 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -304,7 +304,6 @@ F:	package/git/
 N:	Bartosz Bilas <b.bilas@grinn-global.com>
 F:	board/stmicroelectronics/stm32mp157a-dk1/
 F:	configs/stm32mp157a_dk1_defconfig
-F:	package/cegui/
 F:	package/log4qt/
 F:	package/python-esptool/
 F:	package/python-pyaes/
-- 
2.47.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
