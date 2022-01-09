Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13829C433F5
	for <buildroot@archiver.kernel.org>; Sun,  9 Jan 2022 21:47:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A32E0402A6;
	Sun,  9 Jan 2022 21:47:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wEXgSri93Jo5; Sun,  9 Jan 2022 21:47:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1A8794025D;
	Sun,  9 Jan 2022 21:47:32 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 528A01BF3C0
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 21:47:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4147081959
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 21:47:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id T91W86eU-oHu for <buildroot@lists.busybox.net>;
 Sun,  9 Jan 2022 21:47:28 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd13147.aruba.it (smtpcmd13147.aruba.it [62.149.156.147])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5259381934
 for <buildroot@buildroot.org>; Sun,  9 Jan 2022 21:47:28 +0000 (UTC)
Received: from localhost.localdomain ([146.241.138.59])
 by Aruba Outgoing Smtp  with ESMTPSA
 id 6g29nEbSdydyP6g2AnG2xk; Sun, 09 Jan 2022 22:47:26 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1641764846; bh=tCAGFF6W3wRLWEgJowlpswDXxUvhM4FoZ2+3NhJlm8Q=;
 h=From:To:Subject:Date:MIME-Version;
 b=Rk1yB7mU6CBtRphSz5Z9oyC25atZ2xmoKIvoANA+VxOKiMeSbCZmWYlZKoziiLwaP
 JgiD532KwuGu0F51pFxsIioUtPuK6jjzcL3RfQFTRn1NpoJ/byPw4WhPH74n99WNrm
 w+fw4fCB7FV5loX65yCkfz5tUFQoI9zuJzR5T8AyW5FV109EnINFRX2AD84OsZBfoX
 po3WG4WdoXqdci1HhbBks7X9Vi0BbVgdQI6PFpXPpISp1ryc49V8SWVYKeYyAESous
 65dKJq8qRoT4QIBhaS+dJB+lsaA0Nm7dZgSllQU9lNplSKlRH41+KOOy7c3sLUVNk3
 qOyV9uwMhCzxQ==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Sun,  9 Jan 2022 22:47:24 +0100
Message-Id: <20220109214724.94900-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfI4k0x3aN6qd7yvvnz0FY3r6T/EhpiBM/+UbZOADxbx3q/02rdF7U7Gru0L5xE+hTVMYmaK3701mw4MypLQeMc8rTqSigUmr9Qp9rCwLFDCEEWBn7gqI
 ngCQm6dFk+HU1B8ycxwZV9FRaqFiIRYFH1hNVcHB//F6kZSSFhdOxgO4hqquJ7LS73M9PqezpZav6BnuwDRXP0Rhr72TA6W40ba4fqEbAasnzwM9hFYsczBM
 Lnzi+i1X+sGJuSZUL9WylWxMWGJA2QvTSR/XNZJyZnI=
Subject: [Buildroot] [PATCH] DEVELOPERS: add Giulio Benetti as co-maintainer
 to mali-driver and rockchip-mali packages
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 DEVELOPERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index ed65c74319..09da2dda1a 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1093,9 +1093,11 @@ F:	package/harfbuzz/
 F:	package/libfuse3/
 F:	package/libnspr/
 F:	package/libnss/
+F:	package/mali-driver/
 F:	package/minicom/
 F:	package/nfs-utils/
 F:	package/python-uvloop/
+F:	package/rockchip-mali/
 F:	package/sunxi-mali-utgard/
 F:	package/sunxi-mali-utgard-driver/
 F:	package/trace-cmd/
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
