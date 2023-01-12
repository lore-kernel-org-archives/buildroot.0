Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F5D5C54EBC
	for <buildroot@archiver.kernel.org>; Thu, 12 Jan 2023 11:43:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A087E81A15;
	Thu, 12 Jan 2023 11:43:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A087E81A15
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3bbNYjvP7dqg; Thu, 12 Jan 2023 11:43:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id EE7D5819BC;
	Thu, 12 Jan 2023 11:43:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EE7D5819BC
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 61D691BF35F
 for <buildroot@lists.busybox.net>; Thu, 12 Jan 2023 11:43:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3CCC460BFB
 for <buildroot@lists.busybox.net>; Thu, 12 Jan 2023 11:43:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3CCC460BFB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2WkBcGZHhOoN for <buildroot@lists.busybox.net>;
 Thu, 12 Jan 2023 11:43:07 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3436760BDC
Received: from mailout04.t-online.de (mailout04.t-online.de [194.25.134.18])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3436760BDC
 for <buildroot@buildroot.org>; Thu, 12 Jan 2023 11:43:07 +0000 (UTC)
Received: from fwd71.dcpf.telekom.de (fwd71.aul.t-online.de [10.223.144.97])
 by mailout04.t-online.de (Postfix) with SMTP id AE1A91A6CA;
 Thu, 12 Jan 2023 12:43:04 +0100 (CET)
Received: from fli4l.lan.fli4l ([84.161.180.73]) by fwd71.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1pFvz6-0EUdpR0; Thu, 12 Jan 2023 12:43:04 +0100
Received: from bruckner.lan.fli4l ([192.168.1.1]:55010)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd.kuhls@t-online.de>) id 1pFvz6-0005Yw-0d;
 Thu, 12 Jan 2023 12:43:04 +0100
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Thu, 12 Jan 2023 12:42:59 +0100
Message-Id: <20230112114304.3007221-2-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230112114304.3007221-1-bernd.kuhls@t-online.de>
References: <20230112114304.3007221-1-bernd.kuhls@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1673523784-F27F4ECF-6EFA96C0/0/0 CLEAN NORMAL
X-TOI-MSGID: cf4d494b-f1ec-4631-9998-42bd142e79f2
Subject: [Buildroot] [PATCH 2/7] package/perl-html-parser: bump version to
 3.80
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

Updated license hash due to typo/whitespace-only fixes in license file:
https://github.com/libwww-perl/HTML-Parser/commit/96192e7cb1f31559e8ad834fd5d7642d04e35f65#diff-c693279643b8cd5d248172d9c22cb7cf4ed163a3c98c8a3f69c2717edd3eacb7

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/perl-html-parser/perl-html-parser.hash | 6 +++---
 package/perl-html-parser/perl-html-parser.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/perl-html-parser/perl-html-parser.hash b/package/perl-html-parser/perl-html-parser.hash
index 36b094a7cb..ccd115d6c9 100644
--- a/package/perl-html-parser/perl-html-parser.hash
+++ b/package/perl-html-parser/perl-html-parser.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5  60e266d5a07fbea671a0383dd8af7b6c  HTML-Parser-3.76.tar.gz
-sha256  64d9e2eb2b420f1492da01ec0e6976363245b4be9290f03f10b7d2cb63fa2f61  HTML-Parser-3.76.tar.gz
+md5  8e7151d08f30457a2ba80020b936285f  HTML-Parser-3.80.tar.gz
+sha256  63411db03016747e37c2636db11b05f8cc71608ef5bff36d04ddb0dc92f7835b  HTML-Parser-3.80.tar.gz
 
 # computed by scancpan
-sha256  0e57338bc10d5fb8891012ebee65a7b504b247f5bb485e121b8b48d7a118a60b  LICENSE
+sha256  9081922eb873ec1809c20672a7385a65f3c6b1163166bf69b2bbe986fb5b0159  LICENSE
diff --git a/package/perl-html-parser/perl-html-parser.mk b/package/perl-html-parser/perl-html-parser.mk
index 097564dbcb..1e1f8e6050 100644
--- a/package/perl-html-parser/perl-html-parser.mk
+++ b/package/perl-html-parser/perl-html-parser.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_HTML_PARSER_VERSION = 3.76
+PERL_HTML_PARSER_VERSION = 3.80
 PERL_HTML_PARSER_SOURCE = HTML-Parser-$(PERL_HTML_PARSER_VERSION).tar.gz
 PERL_HTML_PARSER_SITE = $(BR2_CPAN_MIRROR)/authors/id/O/OA/OALDERS
 PERL_HTML_PARSER_LICENSE = Artistic or GPL-1.0+
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
