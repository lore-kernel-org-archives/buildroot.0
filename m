Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7911CCE7AF3
	for <buildroot@archiver.kernel.org>; Fri, 29 Sep 2023 20:28:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1F5B883C11;
	Fri, 29 Sep 2023 20:28:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1F5B883C11
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KEmMgLhgBr41; Fri, 29 Sep 2023 20:28:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C419083C54;
	Fri, 29 Sep 2023 20:28:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C419083C54
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 025CE1BF995
 for <buildroot@lists.busybox.net>; Fri, 29 Sep 2023 20:28:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D0ABC41553
 for <buildroot@lists.busybox.net>; Fri, 29 Sep 2023 20:28:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D0ABC41553
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wSjNMyClQ_Au for <buildroot@lists.busybox.net>;
 Fri, 29 Sep 2023 20:28:27 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id DD5C840150
 for <buildroot@buildroot.org>; Fri, 29 Sep 2023 20:28:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DD5C840150
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C95AF83705; Fri, 29 Sep 2023 20:28:27 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 29 Sep 2023 22:15:14 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8cedb39764f70f9d467bf0cc1acc99a8bbb963d6
X-Git-Newrev: 59db0884671a9d71142ddd47de5a4532aec8ef2e
X-Patchwork-Hint: ignore
Message-Id: <20230929202827.C95AF83705@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/perl-class-method-modifiers: bump
 to version 2.15
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

commit: https://git.buildroot.net/buildroot/commit/?id=59db0884671a9d71142ddd47de5a4532aec8ef2e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

LICENSE: remove trailing spaces
see https://metacpan.org/release/ETHER/Class-Method-Modifiers-2.15/diff/ETHER/Class-Method-Modifiers-2.13#LICENSE

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../perl-class-method-modifiers/perl-class-method-modifiers.hash  | 8 ++++----
 .../perl-class-method-modifiers/perl-class-method-modifiers.mk    | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/perl-class-method-modifiers/perl-class-method-modifiers.hash b/package/perl-class-method-modifiers/perl-class-method-modifiers.hash
index ee0f5ec32c..e3e88140bc 100644
--- a/package/perl-class-method-modifiers/perl-class-method-modifiers.hash
+++ b/package/perl-class-method-modifiers/perl-class-method-modifiers.hash
@@ -1,6 +1,6 @@
-# retrieved by scancpan from http://cpan.metacpan.org/
-md5  b1398e3682aa2e075b913b9f9000b596  Class-Method-Modifiers-2.13.tar.gz
-sha256  ab5807f71018a842de6b7a4826d6c1f24b8d5b09fcce5005a3309cf6ea40fd63  Class-Method-Modifiers-2.13.tar.gz
+# retrieved by scancpan from https://cpan.metacpan.org/
+md5  1aea89d0f23c3537580cae549b5c5864  Class-Method-Modifiers-2.15.tar.gz
+sha256  65cd85bfe475d066e9186f7a8cc636070985b30b0ebb1cde8681cf062c2e15fc  Class-Method-Modifiers-2.15.tar.gz
 
 # computed by scancpan
-sha256  d17e5cba8d4039f6973d5873f73b0c8949c1cffb338fafe7a57e972767546561  LICENSE
+sha256  3a4d15d78daa7fbb8b9f90da1b8cb60a6cd5275c6a5fdb0fca5db2e74b522dee  LICENSE
diff --git a/package/perl-class-method-modifiers/perl-class-method-modifiers.mk b/package/perl-class-method-modifiers/perl-class-method-modifiers.mk
index ef688acf7e..d4a7f11b85 100644
--- a/package/perl-class-method-modifiers/perl-class-method-modifiers.mk
+++ b/package/perl-class-method-modifiers/perl-class-method-modifiers.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_CLASS_METHOD_MODIFIERS_VERSION = 2.13
+PERL_CLASS_METHOD_MODIFIERS_VERSION = 2.15
 PERL_CLASS_METHOD_MODIFIERS_SOURCE = Class-Method-Modifiers-$(PERL_CLASS_METHOD_MODIFIERS_VERSION).tar.gz
 PERL_CLASS_METHOD_MODIFIERS_SITE = $(BR2_CPAN_MIRROR)/authors/id/E/ET/ETHER
 PERL_CLASS_METHOD_MODIFIERS_LICENSE = Artistic or GPL-1.0+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
