Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E46CECE564
	for <buildroot@archiver.kernel.org>; Tue, 10 Sep 2024 07:09:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5D3E640622;
	Tue, 10 Sep 2024 07:09:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id v9dWNSR9vsuD; Tue, 10 Sep 2024 07:09:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 38699406F9
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 38699406F9;
	Tue, 10 Sep 2024 07:09:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 14E851BF2C1
 for <buildroot@lists.busybox.net>; Tue, 10 Sep 2024 07:08:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3FBE040531
 for <buildroot@lists.busybox.net>; Tue, 10 Sep 2024 07:08:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OW0XTRAKu2U1 for <buildroot@lists.busybox.net>;
 Tue, 10 Sep 2024 07:08:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.178.240;
 helo=mslow1.mail.gandi.net; envelope-from=peko@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org AAAEE4039F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AAAEE4039F
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AAAEE4039F
 for <buildroot@buildroot.org>; Tue, 10 Sep 2024 07:08:41 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (unknown [217.70.183.198])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id 2BB38C3551
 for <buildroot@buildroot.org>; Tue, 10 Sep 2024 07:08:39 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7A3A1C0002;
 Tue, 10 Sep 2024 07:08:33 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peko@dell.be.48ers.dk>) id 1snuzI-00HRwz-2m;
 Tue, 10 Sep 2024 09:08:32 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 10 Sep 2024 09:07:41 +0200
Message-Id: <20240910070823.4158894-2-peter@korsgaard.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240910070823.4158894-1-peter@korsgaard.com>
References: <20240910070823.4158894-1-peter@korsgaard.com>
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: [Buildroot] [PATCH 01/42]
 docs/manual/adding-packages-asciidoc.adoc: fix resources typo in example
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

As FOO_RESOURCES hints, the correct spelling is resources so use that.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 docs/manual/adding-packages-asciidoc.adoc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/docs/manual/adding-packages-asciidoc.adoc b/docs/manual/adding-packages-asciidoc.adoc
index d68978b1cb..c34b9ffc2a 100644
--- a/docs/manual/adding-packages-asciidoc.adoc
+++ b/docs/manual/adding-packages-asciidoc.adoc
@@ -112,7 +112,7 @@ Here is a complete example that uses all variables and all hooks:
 05: ################################################################################
 06:
 07: FOO_SOURCES = $(sort $(wildcard $(FOO_DOCDIR)/*))
-08: FOO_RESOURCES = $(sort $(wildcard $(FOO_DOCDIR)/ressources))
+08: FOO_RESOURCES = $(sort $(wildcard $(FOO_DOCDIR)/resources))
 09:
 10: FOO_TOC_DEPTH = 2
 11: FOO_TOC_DEPTH_HTML = 1
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
