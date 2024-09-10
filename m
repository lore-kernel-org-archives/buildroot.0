Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9823FECE582
	for <buildroot@archiver.kernel.org>; Tue, 10 Sep 2024 07:10:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6586241278;
	Tue, 10 Sep 2024 07:10:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hLR5Q6KRXhCn; Tue, 10 Sep 2024 07:10:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3962D40697
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3962D40697;
	Tue, 10 Sep 2024 07:10:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0AD411BF2C1
 for <buildroot@lists.busybox.net>; Tue, 10 Sep 2024 07:08:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 901A040556
 for <buildroot@lists.busybox.net>; Tue, 10 Sep 2024 07:08:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id do3c2XSZuVzB for <buildroot@lists.busybox.net>;
 Tue, 10 Sep 2024 07:08:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.198;
 helo=relay6-d.mail.gandi.net; envelope-from=peko@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 8690A40589
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8690A40589
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8690A40589
 for <buildroot@buildroot.org>; Tue, 10 Sep 2024 07:08:51 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 04DA9C000F;
 Tue, 10 Sep 2024 07:08:49 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peko@dell.be.48ers.dk>) id 1snuzZ-00HS3u-1r;
 Tue, 10 Sep 2024 09:08:49 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 10 Sep 2024 09:08:09 +0200
Message-Id: <20240910070823.4158894-30-peter@korsgaard.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240910070823.4158894-1-peter@korsgaard.com>
References: <20240910070823.4158894-1-peter@korsgaard.com>
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: [Buildroot] [PATCH 29/42] package/flex: fix typo in patch
 description
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
 ...3-build-make-it-possible-to-disable-the-build-of-the-d.patch | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/flex/0003-build-make-it-possible-to-disable-the-build-of-the-d.patch b/package/flex/0003-build-make-it-possible-to-disable-the-build-of-the-d.patch
index ffe30d367f..30a782ee9b 100644
--- a/package/flex/0003-build-make-it-possible-to-disable-the-build-of-the-d.patch
+++ b/package/flex/0003-build-make-it-possible-to-disable-the-build-of-the-d.patch
@@ -4,7 +4,7 @@ Date: Fri, 29 Sep 2017 18:03:51 +0200
 Subject: [PATCH] build: make it possible to disable the build of the
  documentation
 
-When targetting embedded evices, the documentation is not needed.
+When targeting embedded devices, the documentation is not needed.
 
 Building the documentation default to whether the program is built.
 
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
