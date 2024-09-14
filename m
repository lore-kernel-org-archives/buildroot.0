Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 383B9C02194
	for <buildroot@archiver.kernel.org>; Sat, 14 Sep 2024 12:43:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CF39A40130;
	Sat, 14 Sep 2024 12:43:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ojzrf5kERV5O; Sat, 14 Sep 2024 12:43:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B2F924020B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B2F924020B;
	Sat, 14 Sep 2024 12:43:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 46C061BF232
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 12:43:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3551A60769
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 12:43:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CuONyxNtEfvc for <buildroot@lists.busybox.net>;
 Sat, 14 Sep 2024 12:43:44 +0000 (UTC)
X-Greylist: delayed 19445 seconds by postgrey-1.37 at util1.osuosl.org;
 Sat, 14 Sep 2024 12:43:43 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 0A56C606E7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0A56C606E7
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::224;
 helo=relay4-d.mail.gandi.net; envelope-from=peko@korsgaard.com;
 receiver=<UNKNOWN> 
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0A56C606E7
 for <buildroot@buildroot.org>; Sat, 14 Sep 2024 12:43:43 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id EF930E0004;
 Sat, 14 Sep 2024 12:43:40 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peko@dell.be.48ers.dk>) id 1spS7n-0052J7-0h;
 Sat, 14 Sep 2024 14:43:39 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 14 Sep 2024 14:43:19 +0200
Message-Id: <20240914124337.1200461-2-peter@korsgaard.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240914124337.1200461-1-peter@korsgaard.com>
References: <20240914124337.1200461-1-peter@korsgaard.com>
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: [Buildroot] [PATCH 02/20] package/linux-fusion: fix version typo in
 patch description
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/linux-fusion/0001-fix-for-linux-4-and-above.patch | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/linux-fusion/0001-fix-for-linux-4-and-above.patch b/package/linux-fusion/0001-fix-for-linux-4-and-above.patch
index 689d9bf107..bc9e936510 100644
--- a/package/linux-fusion/0001-fix-for-linux-4-and-above.patch
+++ b/package/linux-fusion/0001-fix-for-linux-4-and-above.patch
@@ -1,6 +1,6 @@
 Fix build for linux >= 4.x
 
-Instead of relying on testing for '3' as the linux kernel major verison,
+Instead of relying on testing for '3' as the linux kernel major version,
 check that it is 2.x to include the proper Makefile, otherwise forcibly
 include the .26 Makefile, that is good for 3.x and 4.x too.
 
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
