Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 540BDC00140
	for <buildroot@archiver.kernel.org>; Wed, 10 Aug 2022 15:04:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D8ABE41756;
	Wed, 10 Aug 2022 15:04:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D8ABE41756
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KneMXeBrOAIq; Wed, 10 Aug 2022 15:04:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6D313416B9;
	Wed, 10 Aug 2022 15:04:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6D313416B9
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2098F1BF488
 for <buildroot@lists.busybox.net>; Wed, 10 Aug 2022 15:04:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 377F340C39
 for <buildroot@lists.busybox.net>; Wed, 10 Aug 2022 15:04:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 377F340C39
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BzGVGhyu1dDz for <buildroot@lists.busybox.net>;
 Wed, 10 Aug 2022 15:04:06 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0E78440C23
 for <buildroot@buildroot.org>; Wed, 10 Aug 2022 15:04:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0E78440C23
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id C7DD587072; Wed, 10 Aug 2022 14:49:47 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 10 Aug 2022 17:03:18 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: fbad339613f51d354e458f0503db1e6141730eb1
X-Git-Newrev: 412433539d737b4c70b33fd034b2b52be69fff9d
X-Patchwork-Hint: ignore
Message-Id: <20220810144947.C7DD587072@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/perl: bump to
 version 5.34.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=412433539d737b4c70b33fd034b2b52be69fff9d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

diff README:
-2013, 2014, 2015, 2016, 2017, 2018, 2019, 2020, 2021 by Larry Wall and others.
+2013, 2014, 2015, 2016, 2017, 2018, 2019, 2020, 2021, 2022
+by Larry Wall and others.

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit 74dbc305b28de4b73499eb76878503a71b381bd2)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/perl/perl.hash | 14 +++++++-------
 package/perl/perl.mk   |  4 ++--
 2 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/package/perl/perl.hash b/package/perl/perl.hash
index b0f60ef6f8..d8344d9754 100644
--- a/package/perl/perl.hash
+++ b/package/perl/perl.hash
@@ -1,12 +1,12 @@
-# Hashes from: https://www.cpan.org/src/5.0/perl-5.34.0.tar.xz.{md5,sha1,sha256}.txt
-md5  df7ecb0653440b26dc951ad9dbfab517  perl-5.34.0.tar.xz
-sha1  d461e206a1dca5e79d39e77debf0b564f6d77d37  perl-5.34.0.tar.xz
-sha256  82c2e5e5c71b0e10487a80d79140469ab1f8056349ca8545140a224dbbed7ded  perl-5.34.0.tar.xz
+# Hashes from: https://www.cpan.org/src/5.0/perl-5.34.1.tar.xz.{md5,sha1,sha256}.txt
+md5  7d2ece7f50775ea1ff739831935a24bd  perl-5.34.1.tar.xz
+sha1  e7dbef3c1ea7caa73e2c705bba9e4bfb92ea98f0  perl-5.34.1.tar.xz
+sha256  6d52cf833ff1af27bb5e986870a2c30cec73c044b41e3458cd991f94374039f7  perl-5.34.1.tar.xz
 
-# Hashes from: https://github.com/arsv/perl-cross/releases/download/1.3.6/perl-cross-1.3.6.hash
-sha256  4010f41870d64e3957b4b8ce70ebba10a7c4a3e86c5551acb4099c3fcbb37ce5  perl-cross-1.3.6.tar.gz
+# Hashes from: https://github.com/arsv/perl-cross/releases/download/1.3.7/perl-cross-1.3.7.hash
+sha256  77f13ca84a63025053852331b72d4046c1f90ded98bd45ccedea738621907335  perl-cross-1.3.7.tar.gz
 
 # Locally calculated
 sha256  dd90d4f42e4dcadf5a7c09eea0189d93c7b37ae560c91f0f6d5233ed3b9292a2  Artistic
 sha256  d77d235e41d54594865151f4751e835c5a82322b0e87ace266567c3391a4b912  Copying
-sha256  df6ad59aefea68676c38325f25f6707f026ddde6c71291b2ca231b6247859907  README
+sha256  06bab256e2e039c59d2ca3c5853425317b4a0f251fe4e5d5201a987b11fc4f78  README
diff --git a/package/perl/perl.mk b/package/perl/perl.mk
index d7f9c58ddd..392fb8b6e2 100644
--- a/package/perl/perl.mk
+++ b/package/perl/perl.mk
@@ -6,7 +6,7 @@
 
 # When updating the version here, also update utils/scancpan
 PERL_VERSION_MAJOR = 34
-PERL_VERSION = 5.$(PERL_VERSION_MAJOR).0
+PERL_VERSION = 5.$(PERL_VERSION_MAJOR).1
 PERL_SITE = https://www.cpan.org/src/5.0
 PERL_SOURCE = perl-$(PERL_VERSION).tar.xz
 PERL_LICENSE = Artistic or GPL-1.0+
@@ -15,7 +15,7 @@ PERL_CPE_ID_VENDOR = perl
 PERL_DEPENDENCIES = $(TARGET_NLS_DEPENDENCIES)
 PERL_INSTALL_STAGING = YES
 
-PERL_CROSS_VERSION = 1.3.6
+PERL_CROSS_VERSION = 1.3.7
 # DO NOT refactor with the github helper (the result is not the same)
 PERL_CROSS_SITE = https://github.com/arsv/perl-cross/releases/download/$(PERL_CROSS_VERSION)
 PERL_CROSS_SOURCE = perl-cross-$(PERL_CROSS_VERSION).tar.gz
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
