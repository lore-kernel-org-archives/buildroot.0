Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7438C433EF
	for <buildroot@archiver.kernel.org>; Mon, 25 Apr 2022 19:08:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 645CC4167B;
	Mon, 25 Apr 2022 19:08:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id W4MME9E9HMm0; Mon, 25 Apr 2022 19:08:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3901A41621;
	Mon, 25 Apr 2022 19:08:03 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 381DA1BF2CD
 for <buildroot@lists.busybox.net>; Mon, 25 Apr 2022 19:07:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3B872415FE
 for <buildroot@lists.busybox.net>; Mon, 25 Apr 2022 19:07:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0TIG5w6h5p_J for <buildroot@lists.busybox.net>;
 Mon, 25 Apr 2022 19:07:08 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 61FD141655
 for <buildroot@buildroot.org>; Mon, 25 Apr 2022 19:07:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 445F9842EA; Mon, 25 Apr 2022 18:56:54 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Mon, 25 Apr 2022 20:25:10 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9f0c67179e55d967ae54d000d8d58dbc52cb1de3
X-Git-Newrev: b2fa94b093517b147c04be2660d6f1310ecefa54
X-Patchwork-Hint: ignore
Message-Id: <20220425185654.445F9842EA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/perl-crypt-openssl-guess: bump to
 version 0.15
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

commit: https://git.buildroot.net/buildroot/commit/?id=b2fa94b093517b147c04be2660d6f1310ecefa54
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/perl-crypt-openssl-guess/perl-crypt-openssl-guess.hash | 4 ++--
 package/perl-crypt-openssl-guess/perl-crypt-openssl-guess.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/perl-crypt-openssl-guess/perl-crypt-openssl-guess.hash b/package/perl-crypt-openssl-guess/perl-crypt-openssl-guess.hash
index e6d19cb681..b4795ed3dd 100644
--- a/package/perl-crypt-openssl-guess/perl-crypt-openssl-guess.hash
+++ b/package/perl-crypt-openssl-guess/perl-crypt-openssl-guess.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5  9e86baf96828a38c967003a5e66f0c39  Crypt-OpenSSL-Guess-0.12.tar.gz
-sha256  0a18d18768cf42b49b15c9dea626199dc74346bbbc76acd3d817b9c1d2bd471d  Crypt-OpenSSL-Guess-0.12.tar.gz
+md5  e07f470dd25023730cf8536e0cefbabd  Crypt-OpenSSL-Guess-0.15.tar.gz
+sha256  1c5033381819fdb4c9087dd291b90ec70e7810d31d57eade9b388eccfd70386d  Crypt-OpenSSL-Guess-0.15.tar.gz
 
 # computed by scancpan
 sha256  5c739f181ce7aa31d739277996ff230067dad39332e5597c0dffd36e5d784072  LICENSE
diff --git a/package/perl-crypt-openssl-guess/perl-crypt-openssl-guess.mk b/package/perl-crypt-openssl-guess/perl-crypt-openssl-guess.mk
index 4f0898cf53..56ff79d845 100644
--- a/package/perl-crypt-openssl-guess/perl-crypt-openssl-guess.mk
+++ b/package/perl-crypt-openssl-guess/perl-crypt-openssl-guess.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_CRYPT_OPENSSL_GUESS_VERSION = 0.12
+PERL_CRYPT_OPENSSL_GUESS_VERSION = 0.15
 PERL_CRYPT_OPENSSL_GUESS_SOURCE = Crypt-OpenSSL-Guess-$(PERL_CRYPT_OPENSSL_GUESS_VERSION).tar.gz
 PERL_CRYPT_OPENSSL_GUESS_SITE = $(BR2_CPAN_MIRROR)/authors/id/A/AK/AKIYM
 PERL_CRYPT_OPENSSL_GUESS_LICENSE = Artistic or GPL-1.0+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
