Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67627CF9C69
	for <buildroot@archiver.kernel.org>; Fri, 20 Sep 2024 21:09:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2A01841821;
	Fri, 20 Sep 2024 21:09:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id r06p6vPZoe-Q; Fri, 20 Sep 2024 21:09:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B808741819
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B808741819;
	Fri, 20 Sep 2024 21:09:09 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DCE201BF5A6
 for <buildroot@lists.busybox.net>; Fri, 20 Sep 2024 21:08:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AA9E140420
 for <buildroot@lists.busybox.net>; Fri, 20 Sep 2024 21:08:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rmsi_yCu5OqI for <buildroot@lists.busybox.net>;
 Fri, 20 Sep 2024 21:08:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::225;
 helo=relay5-d.mail.gandi.net; envelope-from=peko@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org A9C5340111
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A9C5340111
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A9C5340111
 for <buildroot@buildroot.org>; Fri, 20 Sep 2024 21:08:48 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6E0251C0002;
 Fri, 20 Sep 2024 21:08:45 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peko@dell.be.48ers.dk>) id 1srkrs-00HApW-1n;
 Fri, 20 Sep 2024 23:08:44 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 20 Sep 2024 23:08:27 +0200
Message-Id: <20240920210836.4093091-9-peter@korsgaard.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240920210836.4093091-1-peter@korsgaard.com>
References: <20240920210836.4093091-1-peter@korsgaard.com>
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: [Buildroot] [PATCH 09/17]
 support/testing/tests/package/test_acpica.py: fix typos in comments
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
Cc: Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/testing/tests/package/test_acpica.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/support/testing/tests/package/test_acpica.py b/support/testing/tests/package/test_acpica.py
index f7dd64d7f0..adfb93d504 100644
--- a/support/testing/tests/package/test_acpica.py
+++ b/support/testing/tests/package/test_acpica.py
@@ -43,12 +43,12 @@ class TestAcpica(infra.basetest.BRTest):
         cmd += " | grep -F '\"Hello Buildroot!\"'"
         self.assertRunOk(cmd)
 
-        # INT1 is exepcted to be 12345678
+        # INT1 is expected to be 12345678
         cmd = "acpiexec -b 'evaluate INT1' dsdt.aml"
         cmd += " | grep -F 12345678"
         self.assertRunOk(cmd)
 
-        # Evalute the TEST method which prints its argument
+        # Evaluate the TEST method which prints its argument
         cmd = "acpiexec -b 'evaluate TST2 \"Hello World\"' dsdt.aml"
         cmd += " | grep -F 'Arg0=Hello World'"
         self.assertRunOk(cmd)
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
