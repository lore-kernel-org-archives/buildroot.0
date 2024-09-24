Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D4B0CF9C6B
	for <buildroot@archiver.kernel.org>; Tue, 24 Sep 2024 12:24:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0980840DF1;
	Tue, 24 Sep 2024 12:24:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id E-uiA7OE02jA; Tue, 24 Sep 2024 12:24:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3219340DD8
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3219340DD8;
	Tue, 24 Sep 2024 12:24:40 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 552851BF966
 for <buildroot@lists.busybox.net>; Tue, 24 Sep 2024 12:24:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 38BFE40BDD
 for <buildroot@lists.busybox.net>; Tue, 24 Sep 2024 12:24:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pRRhl0MZ-9_1 for <buildroot@lists.busybox.net>;
 Tue, 24 Sep 2024 12:24:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.201;
 helo=relay8-d.mail.gandi.net; envelope-from=peko@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 22B7C40C3E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 22B7C40C3E
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 22B7C40C3E
 for <buildroot@buildroot.org>; Tue, 24 Sep 2024 12:24:14 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id CE7271BF208;
 Tue, 24 Sep 2024 12:24:11 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peko@dell.be.48ers.dk>) id 1st4aR-004ill-0r;
 Tue, 24 Sep 2024 14:24:11 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 24 Sep 2024 14:23:52 +0200
Message-Id: <20240924122406.1125261-9-peter@korsgaard.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240924122406.1125261-1-peter@korsgaard.com>
References: <20240924122406.1125261-1-peter@korsgaard.com>
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: [Buildroot] [PATCH 09/22] package/redis: fix 'defaults' typo in
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
Cc: Titouan Christophe <titouanchristophe@gmail.com>,
 Daniel Price <daniel.price@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../redis/0003-redis.conf-adjust-defauts-for-buildroot.patch    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/redis/0003-redis.conf-adjust-defauts-for-buildroot.patch b/package/redis/0003-redis.conf-adjust-defauts-for-buildroot.patch
index 6ad81a493d..c1fc8acf6f 100644
--- a/package/redis/0003-redis.conf-adjust-defauts-for-buildroot.patch
+++ b/package/redis/0003-redis.conf-adjust-defauts-for-buildroot.patch
@@ -1,7 +1,7 @@
 From f79d1d1bf9e6f54b67e5482602084fbff7fd9cc9 Mon Sep 17 00:00:00 2001
 From: Gustavo Zacarias <gustavo@zacarias.com.ar>
 Date: Fri, 28 Oct 2016 12:50:34 -0300
-Subject: [PATCH] redis.conf: adjust defauts for buildroot
+Subject: [PATCH] redis.conf: adjust defaults for buildroot
 
 Based on Martin Bark's patch hence archlinux package.
 We just need to specify a proper db directory.
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
