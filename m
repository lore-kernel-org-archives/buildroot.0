Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 673F7CE7AF3
	for <buildroot@archiver.kernel.org>; Fri, 29 Sep 2023 20:28:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1F5AB834BB;
	Fri, 29 Sep 2023 20:28:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1F5AB834BB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZqG8Gg6G9mHa; Fri, 29 Sep 2023 20:28:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0DFA783CD7;
	Fri, 29 Sep 2023 20:28:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0DFA783CD7
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 168C21BF997
 for <buildroot@lists.busybox.net>; Fri, 29 Sep 2023 20:28:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DCD70839E0
 for <buildroot@lists.busybox.net>; Fri, 29 Sep 2023 20:28:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DCD70839E0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RSa1lnOdvDHj for <buildroot@lists.busybox.net>;
 Fri, 29 Sep 2023 20:28:28 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id F2D7981FD1
 for <buildroot@buildroot.org>; Fri, 29 Sep 2023 20:28:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F2D7981FD1
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E18B983708; Fri, 29 Sep 2023 20:28:27 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 29 Sep 2023 22:20:34 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 33c500fbbd66a044e6c5da169d016c71a008d3a5
X-Git-Newrev: 5e5eaf1b69ab476be62fe48e98563c6cb2277d66
X-Patchwork-Hint: ignore
Message-Id: <20230929202827.E18B983708@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/perl-file-listing: bump to version
 6.16
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

commit: https://git.buildroot.net/buildroot/commit/?id=5e5eaf1b69ab476be62fe48e98563c6cb2277d66
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

LICENSE: update copyright dates & remove trailing spaces
see https://metacpan.org/release/PLICEASE/File-Listing-6.16/diff/PLICEASE/File-Listing-6.14#LICENSE

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/perl-file-listing/Config.in              | 2 +-
 package/perl-file-listing/perl-file-listing.hash | 8 ++++----
 package/perl-file-listing/perl-file-listing.mk   | 2 +-
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/perl-file-listing/Config.in b/package/perl-file-listing/Config.in
index acca98be22..4610618542 100644
--- a/package/perl-file-listing/Config.in
+++ b/package/perl-file-listing/Config.in
@@ -2,6 +2,6 @@ config BR2_PACKAGE_PERL_FILE_LISTING
 	bool "perl-file-listing"
 	select BR2_PACKAGE_PERL_HTTP_DATE # runtime
 	help
-	  parse directory listing.
+	  Parse directory listing.
 
 	  https://metacpan.org/release/File-Listing
diff --git a/package/perl-file-listing/perl-file-listing.hash b/package/perl-file-listing/perl-file-listing.hash
index cb52c127cd..bd2ca473ba 100644
--- a/package/perl-file-listing/perl-file-listing.hash
+++ b/package/perl-file-listing/perl-file-listing.hash
@@ -1,6 +1,6 @@
-# retrieved by scancpan from http://cpan.metacpan.org/
-md5  8ba34641a6c5a2ec1b0bf7064f68c535  File-Listing-6.15.tar.gz
-sha256  46c4fb9f9eb9635805e26b7ea55b54455e47302758a10ed2a0b92f392713770c  File-Listing-6.15.tar.gz
+# retrieved by scancpan from https://cpan.metacpan.org/
+md5  d4fc8b0c86633d1fa5bf75323720eadc  File-Listing-6.16.tar.gz
+sha256  189b3a13fc0a1ba412b9d9ec5901e9e5e444cc746b9f0156d4399370d33655c6  File-Listing-6.16.tar.gz
 
 # computed by scancpan
-sha256  287e6f0fdf2db790a24975b492cde64b210c16af7137f44373cbd03fcf844212  LICENSE
+sha256  330a553de82a111970d17fdf302bfe4af055f61bfe83d1c5617d5c3f5525a226  LICENSE
diff --git a/package/perl-file-listing/perl-file-listing.mk b/package/perl-file-listing/perl-file-listing.mk
index c8584ffa8a..583de605a4 100644
--- a/package/perl-file-listing/perl-file-listing.mk
+++ b/package/perl-file-listing/perl-file-listing.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_FILE_LISTING_VERSION = 6.15
+PERL_FILE_LISTING_VERSION = 6.16
 PERL_FILE_LISTING_SOURCE = File-Listing-$(PERL_FILE_LISTING_VERSION).tar.gz
 PERL_FILE_LISTING_SITE = $(BR2_CPAN_MIRROR)/authors/id/P/PL/PLICEASE
 PERL_FILE_LISTING_LICENSE = Artistic or GPL-1.0+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
