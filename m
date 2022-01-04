Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB30BC433F5
	for <buildroot@archiver.kernel.org>; Tue,  4 Jan 2022 18:09:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A4D9A4096A;
	Tue,  4 Jan 2022 18:09:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KRVAaLJ95IF6; Tue,  4 Jan 2022 18:09:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B10F640937;
	Tue,  4 Jan 2022 18:09:28 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0A5D61BF9B2
 for <buildroot@lists.busybox.net>; Tue,  4 Jan 2022 18:09:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EC16F40966
 for <buildroot@lists.busybox.net>; Tue,  4 Jan 2022 18:09:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XEuzeYmnIGUw for <buildroot@lists.busybox.net>;
 Tue,  4 Jan 2022 18:09:00 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id DA49740963
 for <buildroot@buildroot.org>; Tue,  4 Jan 2022 18:09:00 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 3F1E482BA6; Tue,  4 Jan 2022 18:02:57 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Tue, 4 Jan 2022 18:49:20 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 06f10a88f30b73aaea5c0e0888d7ba9d9a6420f3
X-Git-Newrev: 7c1ef8129f37200b046750c6405ecd304fd4f1bf
X-Patchwork-Hint: ignore
Message-Id: <20220104180257.3F1E482BA6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/perl: bump to version 5.34.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=7c1ef8129f37200b046750c6405ecd304fd4f1bf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/perl/perl.hash | 12 ++++++------
 package/perl/perl.mk   |  6 +++---
 2 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/package/perl/perl.hash b/package/perl/perl.hash
index 42b7cc66c7..b0f60ef6f8 100644
--- a/package/perl/perl.hash
+++ b/package/perl/perl.hash
@@ -1,10 +1,10 @@
-# Hashes from: https://www.cpan.org/src/5.0/perl-5.32.1.tar.xz.{md5,sha1,sha256}.txt
-md5  7f104064b906ad8c7329ca5e409a32d7  perl-5.32.1.tar.xz
-sha1  1fb4f710d139da1e1a3e1fa4eaba201fcaa8e18e  perl-5.32.1.tar.xz
-sha256  57cc47c735c8300a8ce2fa0643507b44c4ae59012bfdad0121313db639e02309  perl-5.32.1.tar.xz
+# Hashes from: https://www.cpan.org/src/5.0/perl-5.34.0.tar.xz.{md5,sha1,sha256}.txt
+md5  df7ecb0653440b26dc951ad9dbfab517  perl-5.34.0.tar.xz
+sha1  d461e206a1dca5e79d39e77debf0b564f6d77d37  perl-5.34.0.tar.xz
+sha256  82c2e5e5c71b0e10487a80d79140469ab1f8056349ca8545140a224dbbed7ded  perl-5.34.0.tar.xz
 
-# Hashes from: https://github.com/arsv/perl-cross/releases/download/1.3.5/perl-cross-1.3.5.hash
-sha256  91c66f6b2b99fccfd4fee14660b677380b0c98f9456359e91449798c2ad2ef25  perl-cross-1.3.5.tar.gz
+# Hashes from: https://github.com/arsv/perl-cross/releases/download/1.3.6/perl-cross-1.3.6.hash
+sha256  4010f41870d64e3957b4b8ce70ebba10a7c4a3e86c5551acb4099c3fcbb37ce5  perl-cross-1.3.6.tar.gz
 
 # Locally calculated
 sha256  dd90d4f42e4dcadf5a7c09eea0189d93c7b37ae560c91f0f6d5233ed3b9292a2  Artistic
diff --git a/package/perl/perl.mk b/package/perl/perl.mk
index f661fef013..d7f9c58ddd 100644
--- a/package/perl/perl.mk
+++ b/package/perl/perl.mk
@@ -5,8 +5,8 @@
 ################################################################################
 
 # When updating the version here, also update utils/scancpan
-PERL_VERSION_MAJOR = 32
-PERL_VERSION = 5.$(PERL_VERSION_MAJOR).1
+PERL_VERSION_MAJOR = 34
+PERL_VERSION = 5.$(PERL_VERSION_MAJOR).0
 PERL_SITE = https://www.cpan.org/src/5.0
 PERL_SOURCE = perl-$(PERL_VERSION).tar.xz
 PERL_LICENSE = Artistic or GPL-1.0+
@@ -15,7 +15,7 @@ PERL_CPE_ID_VENDOR = perl
 PERL_DEPENDENCIES = $(TARGET_NLS_DEPENDENCIES)
 PERL_INSTALL_STAGING = YES
 
-PERL_CROSS_VERSION = 1.3.5
+PERL_CROSS_VERSION = 1.3.6
 # DO NOT refactor with the github helper (the result is not the same)
 PERL_CROSS_SITE = https://github.com/arsv/perl-cross/releases/download/$(PERL_CROSS_VERSION)
 PERL_CROSS_SOURCE = perl-cross-$(PERL_CROSS_VERSION).tar.gz
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
