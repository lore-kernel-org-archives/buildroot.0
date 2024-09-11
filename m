Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B63D6EE49AB
	for <buildroot@archiver.kernel.org>; Wed, 11 Sep 2024 13:59:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7FCE340FE9;
	Wed, 11 Sep 2024 13:59:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id l3pWkFNdTy_I; Wed, 11 Sep 2024 13:59:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 41B5840FD2
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 41B5840FD2;
	Wed, 11 Sep 2024 13:59:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 08B931BF20B
 for <buildroot@lists.busybox.net>; Wed, 11 Sep 2024 13:59:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E771E811E8
 for <buildroot@lists.busybox.net>; Wed, 11 Sep 2024 13:59:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FjZFNEFTl6oa for <buildroot@lists.busybox.net>;
 Wed, 11 Sep 2024 13:59:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7C40A811F3
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7C40A811F3
 for <buildroot@buildroot.org>; Wed, 11 Sep 2024 13:59:20 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 799CB86F6A; Wed, 11 Sep 2024 13:59:20 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 11 Sep 2024 15:26:24 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 240395cd71f772b46076a1f19e886c6ad519afb5
X-Git-Newrev: 4c83a6fe7186af17e20397d025b6c986b77d75ae
X-Patchwork-Hint: ignore
Message-Id: <20240911135920.799CB86F6A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/perl-http-cookies: bump to version
 6.11
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

commit: https://git.buildroot.net/buildroot/commit/?id=4c83a6fe7186af17e20397d025b6c986b77d75ae
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

diff LICENSE: use "The Perl Artistic License 1.0"
    see https://metacpan.org/release/OALDERS/HTTP-Cookies-6.11/diff/OALDERS/HTTP-Cookies-6.10#LICENSE

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/perl-http-cookies/perl-http-cookies.hash | 8 ++++----
 package/perl-http-cookies/perl-http-cookies.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/perl-http-cookies/perl-http-cookies.hash b/package/perl-http-cookies/perl-http-cookies.hash
index 15d9e7a86f..d5aefaf830 100644
--- a/package/perl-http-cookies/perl-http-cookies.hash
+++ b/package/perl-http-cookies/perl-http-cookies.hash
@@ -1,6 +1,6 @@
-# retrieved by scancpan from http://cpan.metacpan.org/
-md5  b4d7804231b1dfd10999d42283e0cf06  HTTP-Cookies-6.10.tar.gz
-sha256  e36f36633c5ce6b5e4b876ffcf74787cc5efe0736dd7f487bdd73c14f0bd7007  HTTP-Cookies-6.10.tar.gz
+# retrieved by scancpan from https://cpan.metacpan.org/
+md5  80017e7e56bdc8ba16dea75789748829  HTTP-Cookies-6.11.tar.gz
+sha256  8c9a541a4a39f6c0c7e3d0b700b05dfdb830bd490a1b1942a7dedd1b50d9a8c8  HTTP-Cookies-6.11.tar.gz
 
 # computed by scancpan
-sha256  82902ce20c8ed71d7f4e7a6a5b2b26e43a7e2e90c78098fb49aa49e03ac808e0  LICENSE
+sha256  d864d8998d1ce086dc35e5644fbfcf1b46dfd08b0ce8d76d3e32bf86e6953ac3  LICENSE
diff --git a/package/perl-http-cookies/perl-http-cookies.mk b/package/perl-http-cookies/perl-http-cookies.mk
index 745fd10a7c..6d87bde2ba 100644
--- a/package/perl-http-cookies/perl-http-cookies.mk
+++ b/package/perl-http-cookies/perl-http-cookies.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_HTTP_COOKIES_VERSION = 6.10
+PERL_HTTP_COOKIES_VERSION = 6.11
 PERL_HTTP_COOKIES_SOURCE = HTTP-Cookies-$(PERL_HTTP_COOKIES_VERSION).tar.gz
 PERL_HTTP_COOKIES_SITE = $(BR2_CPAN_MIRROR)/authors/id/O/OA/OALDERS
 PERL_HTTP_COOKIES_LICENSE = Artistic or GPL-1.0+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
