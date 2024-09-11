Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62E92EE49B0
	for <buildroot@archiver.kernel.org>; Wed, 11 Sep 2024 14:00:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1CCE540E13;
	Wed, 11 Sep 2024 14:00:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RE6BrbZNA2em; Wed, 11 Sep 2024 14:00:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D5D8F40FC0
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D5D8F40FC0;
	Wed, 11 Sep 2024 14:00:23 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 053031BF20B
 for <buildroot@lists.busybox.net>; Wed, 11 Sep 2024 13:59:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3EA8B60B2C
 for <buildroot@lists.busybox.net>; Wed, 11 Sep 2024 13:59:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id icNZ3AnZLsPQ for <buildroot@lists.busybox.net>;
 Wed, 11 Sep 2024 13:59:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9407360B46
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9407360B46
 for <buildroot@buildroot.org>; Wed, 11 Sep 2024 13:59:20 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 91CBD86E9D; Wed, 11 Sep 2024 13:59:20 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 11 Sep 2024 15:26:26 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b3dc4b00b12cd6963d1b43bef7eb55fad3f63404
X-Git-Newrev: 89370de5e09c0111d38c5e34322c5bad4327d8af
X-Patchwork-Hint: ignore
Message-Id: <20240911135920.91CBD86E9D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/perl-crypt-openssl-random: bump to
 version 0.17
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

commit: https://git.buildroot.net/buildroot/commit/?id=89370de5e09c0111d38c5e34322c5bad4327d8af
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

diff LICENSE: minor cleanup
    see https://metacpan.org/release/RURBAN/Crypt-OpenSSL-Random-0.17/diff/RURBAN/Crypt-OpenSSL-Random-0.15#LICENSE

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/perl-crypt-openssl-random/perl-crypt-openssl-random.hash | 8 ++++----
 package/perl-crypt-openssl-random/perl-crypt-openssl-random.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/perl-crypt-openssl-random/perl-crypt-openssl-random.hash b/package/perl-crypt-openssl-random/perl-crypt-openssl-random.hash
index 6c1344fb2a..f8ab405ca0 100644
--- a/package/perl-crypt-openssl-random/perl-crypt-openssl-random.hash
+++ b/package/perl-crypt-openssl-random/perl-crypt-openssl-random.hash
@@ -1,6 +1,6 @@
-# retrieved by scancpan from http://cpan.metacpan.org/
-md5  bcde8d5a822c91376deda3c4f0c75fbe  Crypt-OpenSSL-Random-0.15.tar.gz
-sha256  f0876faa1ba3111e39b86aa730c603211eff2905e460c72a57b61e8cf475cef4  Crypt-OpenSSL-Random-0.15.tar.gz
+# retrieved by scancpan from https://cpan.metacpan.org/
+md5  294f545c54a5a4855cb00c5648eb5c2b  Crypt-OpenSSL-Random-0.17.tar.gz
+sha256  a571b24181baaa76c96704e92acffc6934ff593e380dade274db4e43c140ad51  Crypt-OpenSSL-Random-0.17.tar.gz
 
 # computed by scancpan
-sha256  fdaba2134145d3e252c5930180b2bcb13b5367ad5a8713d6868f014cd25c496f  LICENSE
+sha256  076d44a82dfa5a992169d47bc5e2d44ff113a3a84bd9963a6b51c953f8d05099  LICENSE
diff --git a/package/perl-crypt-openssl-random/perl-crypt-openssl-random.mk b/package/perl-crypt-openssl-random/perl-crypt-openssl-random.mk
index e70eb7e927..b52e836981 100644
--- a/package/perl-crypt-openssl-random/perl-crypt-openssl-random.mk
+++ b/package/perl-crypt-openssl-random/perl-crypt-openssl-random.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_CRYPT_OPENSSL_RANDOM_VERSION = 0.15
+PERL_CRYPT_OPENSSL_RANDOM_VERSION = 0.17
 PERL_CRYPT_OPENSSL_RANDOM_SOURCE = Crypt-OpenSSL-Random-$(PERL_CRYPT_OPENSSL_RANDOM_VERSION).tar.gz
 PERL_CRYPT_OPENSSL_RANDOM_SITE = $(BR2_CPAN_MIRROR)/authors/id/R/RU/RURBAN
 PERL_CRYPT_OPENSSL_RANDOM_DEPENDENCIES = \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
