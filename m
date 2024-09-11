Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C524EE49AB
	for <buildroot@archiver.kernel.org>; Wed, 11 Sep 2024 14:00:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 43D4E4102A;
	Wed, 11 Sep 2024 14:00:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iBIdmf4rw89O; Wed, 11 Sep 2024 14:00:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E26A341040
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E26A341040;
	Wed, 11 Sep 2024 14:00:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1923A1BF20B
 for <buildroot@lists.busybox.net>; Wed, 11 Sep 2024 13:59:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A99A060737
 for <buildroot@lists.busybox.net>; Wed, 11 Sep 2024 13:59:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rOBmHFn7_CJA for <buildroot@lists.busybox.net>;
 Wed, 11 Sep 2024 13:59:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7611E60B3E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7611E60B3E
 for <buildroot@buildroot.org>; Wed, 11 Sep 2024 13:59:20 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6DEC186E9D; Wed, 11 Sep 2024 13:59:20 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 11 Sep 2024 15:26:23 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9ae8da424b8e8efb4022d2a8c48abb428a542385
X-Git-Newrev: 240395cd71f772b46076a1f19e886c6ad519afb5
X-Patchwork-Hint: ignore
Message-Id: <20240911135920.6DEC186E9D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/perl-html-parser: bump to version
 3.83
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

commit: https://git.buildroot.net/buildroot/commit/?id=240395cd71f772b46076a1f19e886c6ad519afb5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

diff LICENSE: use "The Perl Artistic License 1.0"
    see https://metacpan.org/release/OALDERS/HTML-Parser-3.83/diff/OALDERS/HTML-Parser-3.81#LICENSE

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/perl-html-parser/perl-html-parser.hash | 7 ++++---
 package/perl-html-parser/perl-html-parser.mk   | 2 +-
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/perl-html-parser/perl-html-parser.hash b/package/perl-html-parser/perl-html-parser.hash
index fbdffa03d6..3de461c7ef 100644
--- a/package/perl-html-parser/perl-html-parser.hash
+++ b/package/perl-html-parser/perl-html-parser.hash
@@ -1,5 +1,6 @@
-# retrieved by scancpan from http://cpan.metacpan.org/
-sha256  c0910a5c8f92f8817edd06ccfd224ba1c2ebe8c10f551f032587a1fc83d62ff2  HTML-Parser-3.81.tar.gz
+# retrieved by scancpan from https://cpan.metacpan.org/
+md5  17a4c886024bfad1cffcbe6b46cda128  HTML-Parser-3.83.tar.gz
+sha256  7278ce9791256132b26a71a5719451844704bb9674b58302c3486df43584f8c0  HTML-Parser-3.83.tar.gz
 
 # computed by scancpan
-sha256  9081922eb873ec1809c20672a7385a65f3c6b1163166bf69b2bbe986fb5b0159  LICENSE
+sha256  cb797b8a92dcb2329dcde194a3032d5d94c172289e9e54ffe8dd1785bc3de2df  LICENSE
diff --git a/package/perl-html-parser/perl-html-parser.mk b/package/perl-html-parser/perl-html-parser.mk
index 50efaa273a..02ce08b567 100644
--- a/package/perl-html-parser/perl-html-parser.mk
+++ b/package/perl-html-parser/perl-html-parser.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_HTML_PARSER_VERSION = 3.81
+PERL_HTML_PARSER_VERSION = 3.83
 PERL_HTML_PARSER_SOURCE = HTML-Parser-$(PERL_HTML_PARSER_VERSION).tar.gz
 PERL_HTML_PARSER_SITE = $(BR2_CPAN_MIRROR)/authors/id/O/OA/OALDERS
 PERL_HTML_PARSER_LICENSE = Artistic or GPL-1.0+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
