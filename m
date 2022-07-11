Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0F14C433EF
	for <buildroot@archiver.kernel.org>; Mon, 11 Jul 2022 06:49:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5219160EBC;
	Mon, 11 Jul 2022 06:49:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5219160EBC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ahrS7AWL52M4; Mon, 11 Jul 2022 06:49:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3F55460EB7;
	Mon, 11 Jul 2022 06:49:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3F55460EB7
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 775A61BF41C
 for <buildroot@lists.busybox.net>; Mon, 11 Jul 2022 06:48:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 51DE8405BA
 for <buildroot@lists.busybox.net>; Mon, 11 Jul 2022 06:48:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 51DE8405BA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id D3tlZ9I26gwa for <buildroot@lists.busybox.net>;
 Mon, 11 Jul 2022 06:48:55 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 768FD404DF
 for <buildroot@buildroot.org>; Mon, 11 Jul 2022 06:48:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 768FD404DF
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 9DCB283669; Mon, 11 Jul 2022 06:35:46 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 11 Jul 2022 08:46:52 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c38ea2e43a90b7cc5e0c6ab6c3c44513f94ff2e3
X-Git-Newrev: 274dd1db3c92e30d2dd12e08a38a981440003b0f
X-Patchwork-Hint: ignore
Message-Id: <20220711063546.9DCB283669@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/perl-crypt-openssl-rsa: bump
 version to 0.33
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

commit: https://git.buildroot.net/buildroot/commit/?id=274dd1db3c92e30d2dd12e08a38a981440003b0f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Removed md5 hash, reformatted license hash.

Changelog:
https://github.com/toddr/Crypt-OpenSSL-RSA/blob/master/Changes

This bump fixes a build error with LibreSSL 3.5.

Fixes:
http://autobuild.buildroot.net/results/6625daef1a9d44b9925aecd6e98e3a59bc2ce8f4/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
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
