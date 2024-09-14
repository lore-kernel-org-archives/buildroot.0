Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADC13C02182
	for <buildroot@archiver.kernel.org>; Sat, 14 Sep 2024 07:19:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1A1046076F;
	Sat, 14 Sep 2024 07:19:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Wtgqgm8JuMYg; Sat, 14 Sep 2024 07:19:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C677660765
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C677660765;
	Sat, 14 Sep 2024 07:19:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 334321BF2EC
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 07:19:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 22552846F5
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 07:19:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RMPe-SLsVGD7 for <buildroot@lists.busybox.net>;
 Sat, 14 Sep 2024 07:19:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.201;
 helo=relay8-d.mail.gandi.net; envelope-from=peko@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 03F96846E9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 03F96846E9
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 03F96846E9
 for <buildroot@buildroot.org>; Sat, 14 Sep 2024 07:19:39 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 083AD1BF206;
 Sat, 14 Sep 2024 07:19:34 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peko@dell.be.48ers.dk>) id 1spN4A-004zVe-08;
 Sat, 14 Sep 2024 09:19:34 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 14 Sep 2024 09:19:09 +0200
Message-Id: <20240914071930.1189715-2-peter@korsgaard.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240914071930.1189715-1-peter@korsgaard.com>
References: <20240914071930.1189715-1-peter@korsgaard.com>
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: [Buildroot] [PATCH 02/23] package/irda-utils: fix typos in patch
 descriptions
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
 package/irda-utils/0001-daemon.patch | 2 +-
 package/irda-utils/0002-nommu.patch  | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/irda-utils/0001-daemon.patch b/package/irda-utils/0001-daemon.patch
index f6034a75b4..9f01de20ae 100644
--- a/package/irda-utils/0001-daemon.patch
+++ b/package/irda-utils/0001-daemon.patch
@@ -2,7 +2,7 @@ written by Mike Frysinger
 
 https://sourceforge.net/tracker/?func=detail&aid=3132053&group_id=5616&atid=305616
 
-Rather than using the fork function (which doesnt work on nommu
+Rather than using the fork function (which doesn't work on nommu
 systems), simply use the daemon() function instead (which does
 work). this should work the same before and after for all systems.
 
diff --git a/package/irda-utils/0002-nommu.patch b/package/irda-utils/0002-nommu.patch
index bc76bd3957..019cec3619 100644
--- a/package/irda-utils/0002-nommu.patch
+++ b/package/irda-utils/0002-nommu.patch
@@ -3,8 +3,8 @@ written by Mike Frysinger
 https://sourceforge.net/tracker/?func=detail&aid=3132056&group_id=5616&atid=305616
 
 nommu systems cannot fork() as the hardware cannot support
-it. irattach uses it as a minor optimization, but it isnt
-necessary for correct functioning of the utility. so add a
+it. irattach uses it as a minor optimization, but it isn't
+necessary for correct functioning of the utility. o add a
 NO_FORK define so we nommu peeps can do CFLAGS="... -DNO_FORK=1
 ..." and use it in our embedded systems.
 
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
