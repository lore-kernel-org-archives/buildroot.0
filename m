Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6D62C00140
	for <buildroot@archiver.kernel.org>; Sun, 31 Jul 2022 06:44:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7D3F482EA2;
	Sun, 31 Jul 2022 06:44:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7D3F482EA2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id orc15X3BDtMZ; Sun, 31 Jul 2022 06:44:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C149882CD4;
	Sun, 31 Jul 2022 06:43:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C149882CD4
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 765271BF5A0
 for <buildroot@lists.busybox.net>; Sun, 31 Jul 2022 06:42:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4FF3B4167E
 for <buildroot@lists.busybox.net>; Sun, 31 Jul 2022 06:42:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4FF3B4167E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MMJvco9nBfRB for <buildroot@lists.busybox.net>;
 Sun, 31 Jul 2022 06:42:52 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 04A994160F
 for <buildroot@buildroot.org>; Sun, 31 Jul 2022 06:42:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 04A994160F
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 44DF586AC1; Sun, 31 Jul 2022 06:28:57 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 31 Jul 2022 08:28:00 +0200
X-Git-Refname: refs/heads/2022.05.x
X-Git-Oldrev: 135672d723a223f79ff3cedb4886ae552245c5e5
X-Git-Newrev: aff92f7130a1edc92fcebb2e79023621274215a1
X-Patchwork-Hint: ignore
Message-Id: <20220731062857.44DF586AC1@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.05.x]
 package/perl-crypt-openssl-rsa: bump version to 0.33
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

commit: https://git.buildroot.net/buildroot/commit/?id=aff92f7130a1edc92fcebb2e79023621274215a1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.05.x

Removed md5 hash, reformatted license hash.

Changelog:
https://github.com/toddr/Crypt-OpenSSL-RSA/blob/master/Changes

This bump fixes a build error with LibreSSL 3.5.

Fixes:
http://autobuild.buildroot.net/results/6625daef1a9d44b9925aecd6e98e3a59bc2ce8f4/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 274dd1db3c92e30d2dd12e08a38a981440003b0f)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/perl-crypt-openssl-rsa/perl-crypt-openssl-rsa.hash | 7 +++----
 package/perl-crypt-openssl-rsa/perl-crypt-openssl-rsa.mk   | 2 +-
 2 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/package/perl-crypt-openssl-rsa/perl-crypt-openssl-rsa.hash b/package/perl-crypt-openssl-rsa/perl-crypt-openssl-rsa.hash
index fe2a578583..946f879c21 100644
--- a/package/perl-crypt-openssl-rsa/perl-crypt-openssl-rsa.hash
+++ b/package/perl-crypt-openssl-rsa/perl-crypt-openssl-rsa.hash
@@ -1,6 +1,5 @@
-# retrieved by scancpan from http://cpan.metacpan.org/
-md5    d33681e19d2094df7c26bc7a4509265e Crypt-OpenSSL-RSA-0.31.tar.gz
-sha256 4173403ad4cf76732192099f833fbfbf3cd8104e0246b3844187ae384d2c5436 Crypt-OpenSSL-RSA-0.31.tar.gz
+# From https://cpan.metacpan.org/authors/id/T/TO/TODDR/CHECKSUMS
+sha256  bdbe630f6d6f540325746ad99977272ac8664ff81bd19f0adaba6d6f45efd864  Crypt-OpenSSL-RSA-0.33.tar.gz
 
 # computed by scancpan
-sha256 8a693ad3f52daeeb5ac5deceb1e1109c9c87095ed5ba6506d6d5c106e4066f5a LICENSE
+sha256  8a693ad3f52daeeb5ac5deceb1e1109c9c87095ed5ba6506d6d5c106e4066f5a  LICENSE
diff --git a/package/perl-crypt-openssl-rsa/perl-crypt-openssl-rsa.mk b/package/perl-crypt-openssl-rsa/perl-crypt-openssl-rsa.mk
index 23fd1ac381..e1bfd6a76d 100644
--- a/package/perl-crypt-openssl-rsa/perl-crypt-openssl-rsa.mk
+++ b/package/perl-crypt-openssl-rsa/perl-crypt-openssl-rsa.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_CRYPT_OPENSSL_RSA_VERSION = 0.31
+PERL_CRYPT_OPENSSL_RSA_VERSION = 0.33
 PERL_CRYPT_OPENSSL_RSA_SOURCE = Crypt-OpenSSL-RSA-$(PERL_CRYPT_OPENSSL_RSA_VERSION).tar.gz
 PERL_CRYPT_OPENSSL_RSA_SITE = $(BR2_CPAN_MIRROR)/authors/id/T/TO/TODDR
 PERL_CRYPT_OPENSSL_RSA_DEPENDENCIES = \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
