Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F2A6E77374
	for <buildroot@archiver.kernel.org>; Sat, 30 Sep 2023 14:24:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B7DE983E05;
	Sat, 30 Sep 2023 14:24:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B7DE983E05
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RpjrA9wbceak; Sat, 30 Sep 2023 14:24:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E1B6B83DBE;
	Sat, 30 Sep 2023 14:24:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E1B6B83DBE
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 05B851BF86C
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 14:24:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E22B082341
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 14:24:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E22B082341
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id b_J7TesG3Yki for <buildroot@lists.busybox.net>;
 Sat, 30 Sep 2023 14:24:16 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id DB73A82107
 for <buildroot@buildroot.org>; Sat, 30 Sep 2023 14:24:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DB73A82107
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C73BD83B09; Sat, 30 Sep 2023 14:24:16 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 30 Sep 2023 16:24:03 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2fcb021cc2e6d90616f10a540593abd7a90a9cd6
X-Git-Newrev: e1308d2ec36493208e9bad97e76c15d43c16ed6b
X-Patchwork-Hint: ignore
Message-Id: <20230930142416.C73BD83B09@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/perl-http-message: bump to version
 6.45
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=e1308d2ec36493208e9bad97e76c15d43c16ed6b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

LICENSE: switch to Perl Artistic
see https://metacpan.org/release/OALDERS/HTTP-Message-6.45/diff/OALDERS/HTTP-Message-6.44#LICENSE

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/perl-http-message/perl-http-message.hash | 8 ++++----
 package/perl-http-message/perl-http-message.mk   | 4 ++--
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/perl-http-message/perl-http-message.hash b/package/perl-http-message/perl-http-message.hash
index 94b5c06a4f..b33e00e33e 100644
--- a/package/perl-http-message/perl-http-message.hash
+++ b/package/perl-http-message/perl-http-message.hash
@@ -1,6 +1,6 @@
-# retrieved by scancpan from http://cpan.metacpan.org/
-md5  926a077669a7828c5ca39b5cf7735625  HTTP-Message-6.44.tar.gz
-sha256  398b647bf45aa972f432ec0111f6617742ba32fc773c6612d21f64ab4eacbca1  HTTP-Message-6.44.tar.gz
+# retrieved by scancpan from https://cpan.metacpan.org/
+md5  86c386bcc85a63c8908e6ae9967b34ee  HTTP-Message-6.45.tar.gz
+sha256  01cb8406612a3f738842d1e97313ae4d874870d1b8d6d66331f16000943d4cbe  HTTP-Message-6.45.tar.gz
 
 # computed by scancpan
-sha256  f2f428b5f8a3bf4e6a71cd5ea92558a3d123d3d7c5075d34923e71e46dea94df  LICENSE
+sha256  553ecefc0ed6d4152809da8516960b9a12352c1c0d7d289ac4ab06d0bd0e67bb  LICENSE
diff --git a/package/perl-http-message/perl-http-message.mk b/package/perl-http-message/perl-http-message.mk
index 67b68b0de2..7fdba0b29e 100644
--- a/package/perl-http-message/perl-http-message.mk
+++ b/package/perl-http-message/perl-http-message.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-PERL_HTTP_MESSAGE_VERSION = 6.44
+PERL_HTTP_MESSAGE_VERSION = 6.45
 PERL_HTTP_MESSAGE_SOURCE = HTTP-Message-$(PERL_HTTP_MESSAGE_VERSION).tar.gz
 PERL_HTTP_MESSAGE_SITE = $(BR2_CPAN_MIRROR)/authors/id/O/OA/OALDERS
-PERL_HTTP_MESSAGE_LICENSE = Artistic or GPL-1.0+
+PERL_HTTP_MESSAGE_LICENSE = Artistic-1.0-Perl or GPL-1.0+
 PERL_HTTP_MESSAGE_LICENSE_FILES = LICENSE
 PERL_HTTP_MESSAGE_DISTNAME = HTTP-Message
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
