Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DE6AC02195
	for <buildroot@archiver.kernel.org>; Sat, 14 Sep 2024 12:43:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 19580405AA;
	Sat, 14 Sep 2024 12:43:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2gdrrkQxO-zX; Sat, 14 Sep 2024 12:43:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 220CA405F0
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 220CA405F0;
	Sat, 14 Sep 2024 12:43:58 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4ABF51BF86C
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 12:43:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 43C05606E7
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 12:43:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JXJQd9fsl3Je for <buildroot@lists.busybox.net>;
 Sat, 14 Sep 2024 12:43:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::222;
 helo=relay2-d.mail.gandi.net; envelope-from=peko@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 44FBB6073B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 44FBB6073B
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 44FBB6073B
 for <buildroot@buildroot.org>; Sat, 14 Sep 2024 12:43:44 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6C67840004;
 Sat, 14 Sep 2024 12:43:41 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peko@dell.be.48ers.dk>) id 1spS7n-0052JH-2R;
 Sat, 14 Sep 2024 14:43:39 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 14 Sep 2024 14:43:20 +0200
Message-Id: <20240914124337.1200461-3-peter@korsgaard.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240914124337.1200461-1-peter@korsgaard.com>
References: <20240914124337.1200461-1-peter@korsgaard.com>
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: [Buildroot] [PATCH 03/20] package/linux-zigbee: fix these typo in
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
 package/linux-zigbee/0001-test-serial-Remove-test-serial.patch | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/linux-zigbee/0001-test-serial-Remove-test-serial.patch b/package/linux-zigbee/0001-test-serial-Remove-test-serial.patch
index 8cd9d754c0..95e52b3c95 100644
--- a/package/linux-zigbee/0001-test-serial-Remove-test-serial.patch
+++ b/package/linux-zigbee/0001-test-serial-Remove-test-serial.patch
@@ -5,7 +5,7 @@ Subject: [PATCH] test-serial: Remove test-serial
 
 This folders only contains python tests scripts which would force us to
 enable a dependency to host-python which seems kind of silly since
-theses are only tests scripts.
+these are only tests scripts.
 
 Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
 ---
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
