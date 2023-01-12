Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A22FAC636D6
	for <buildroot@archiver.kernel.org>; Tue, 21 Feb 2023 00:32:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 448044F429;
	Tue, 21 Feb 2023 00:32:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 448044F429
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1RNgrP4wDpCM; Tue, 21 Feb 2023 00:32:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1F57F4F1DD;
	Tue, 21 Feb 2023 00:32:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1F57F4F1DD
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 76BA41BF8C7
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 21:00:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 953426FB5C
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 953426FB5C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nwmny1oi_RJt for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:29 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id C620A6FAE8
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C620A6FAE8
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B403B8648F; Mon, 20 Feb 2023 20:52:29 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 12 Jan 2023 20:10:32 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 57a907fb3b1c303c2402268450616a13f8571a5d
X-Git-Newrev: e35750b5246e1cd7bce0c53b6e32cca592c4f3ca
X-Patchwork-Hint: ignore
Message-Id: <20230220205229.B403B8648F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/perl-html-parser: bump
 version to 3.80
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=e35750b5246e1cd7bce0c53b6e32cca592c4f3ca
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Updated license hash due to typo/whitespace-only fixes in license file:
https://github.com/libwww-perl/HTML-Parser/commit/96192e7cb1f31559e8ad834fd5d7642d04e35f65#diff-c693279643b8cd5d248172d9c22cb7cf4ed163a3c98c8a3f69c2717edd3eacb7

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
