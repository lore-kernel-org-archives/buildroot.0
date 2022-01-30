Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19870C433F5
	for <buildroot@archiver.kernel.org>; Sun, 30 Jan 2022 19:49:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 58A62408D1;
	Sun, 30 Jan 2022 19:49:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kG1q6sr7O0v6; Sun, 30 Jan 2022 19:49:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 90732408C4;
	Sun, 30 Jan 2022 19:49:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BF9D61BF57B
 for <buildroot@lists.busybox.net>; Sun, 30 Jan 2022 19:49:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B5BA060E8A
 for <buildroot@lists.busybox.net>; Sun, 30 Jan 2022 19:49:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3LK3LxkpFPJK for <buildroot@lists.busybox.net>;
 Sun, 30 Jan 2022 19:49:12 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd15177.aruba.it (smtpcmd15177.aruba.it [62.149.156.177])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9503760E89
 for <buildroot@buildroot.org>; Sun, 30 Jan 2022 19:49:12 +0000 (UTC)
Received: from localhost.localdomain ([146.241.179.156])
 by Aruba Outgoing Smtp  with ESMTPSA
 id EGCDn4RMrXfntEGCDnh4Zs; Sun, 30 Jan 2022 20:49:10 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1643572150; bh=pbj9u+CJXqFLV+r6lImEzfuQ+6P5yUS1higvmdu9C7Y=;
 h=From:To:Subject:Date:MIME-Version;
 b=KX8yLvUBrPUoma7zOWsVests08ypQC+eHrhBB7r+3cvfyG3CvzA3wWNBE01lWJkru
 Gte0HeXdoaRD9ZOf3p27rfeE3u1DOddvr/dZrJH+p3xqtJFZr5awa5853BDIIgf9Zy
 dzcMMOJrId26L2rgCowNZ4ZkOAiKKzPSup0YkKIfZ0SRO56t+CNlXSYzUBIeGxORp/
 qAIFP3YKUBo6J7GTw+6pIuiXvjY/FbQzAKp8uTRjoJVYGWnvVkK+sHD9NQjIF0dqTC
 7VqtANPF16VAPu49XCB0TBOtArLc87TqbPHG3klDaNrh2scI3ffZpQ7Kj352/dn38h
 xsskSLusrsjBg==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Sun, 30 Jan 2022 20:49:08 +0100
Message-Id: <20220130194908.1658031-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfBQHE1C44sQANO5MWSXvj3OvinnH7lnJV+o+XNqLvaxUUtc8eb9nE9Z7saxQgsGt9mElBfHYlVk0AhQTFM9RERDS5fXtm2rlzX71Pk64PCLlWfA65J7O
 85xkaF92NoHTV3+yCg9y54jUzpR8JVvgxQRPflq5inLb5QVcVNBcYU7hBCLBAvu11NvS0RSqTW6TgvTKQJfJGR5mzmabrlbGfw9yAz/X8gukMNOB2JLMQRB3
 7+38mt5GLtnLahu2sdxIVcf6shSOghFoKIP99M3feDvZ1qatk202BDXzHSOauSP4
Subject: [Buildroot] [PATCH] DEVELOPERS: add Giulio Benetti to sunxi-tools
 package
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
 DEVELOPERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 0c11a25359..38724726d4 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1110,6 +1110,7 @@ F:	package/python-uvloop/
 F:	package/rockchip-mali/
 F:	package/sunxi-mali-utgard/
 F:	package/sunxi-mali-utgard-driver/
+F:	package/sunxi-tools/
 F:	package/trace-cmd/
 F:	package/udisks/
 F:	toolchain/
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
