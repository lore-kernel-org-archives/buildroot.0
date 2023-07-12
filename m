Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1633DEB64DA
	for <buildroot@archiver.kernel.org>; Wed, 12 Jul 2023 19:28:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A67B541EC3;
	Wed, 12 Jul 2023 19:28:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A67B541EC3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EYFhf7I8FxAd; Wed, 12 Jul 2023 19:28:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9ABE04050E;
	Wed, 12 Jul 2023 19:28:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9ABE04050E
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 107651BF3BD
 for <buildroot@lists.busybox.net>; Wed, 12 Jul 2023 19:27:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EA2E2403A5
 for <buildroot@lists.busybox.net>; Wed, 12 Jul 2023 19:27:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EA2E2403A5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6KgNy_bGurtH for <buildroot@lists.busybox.net>;
 Wed, 12 Jul 2023 19:27:45 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id EE3CF40A55
 for <buildroot@buildroot.org>; Wed, 12 Jul 2023 19:27:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EE3CF40A55
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DC57686ED2; Wed, 12 Jul 2023 19:27:44 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 12 Jul 2023 21:27:28 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f2b5dc42abe5da70c09c8bdcb6cf2d5809d569a9
X-Git-Newrev: 392f88becd87f12c5faf7fe4e3232ba60f50ad1a
X-Patchwork-Hint: ignore
Message-Id: <20230712192744.DC57686ED2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/perl-gd: bump to version 2.77
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

commit: https://git.buildroot.net/buildroot/commit/?id=392f88becd87f12c5faf7fe4e3232ba60f50ad1a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/perl-gd/Config.in    | 2 +-
 package/perl-gd/perl-gd.hash | 6 +++---
 package/perl-gd/perl-gd.mk   | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/perl-gd/Config.in b/package/perl-gd/Config.in
index 044e601021..bff6244d98 100644
--- a/package/perl-gd/Config.in
+++ b/package/perl-gd/Config.in
@@ -4,7 +4,7 @@ config BR2_PACKAGE_PERL_GD
 	select BR2_PACKAGE_ZLIB
 	select BR2_PACKAGE_GD
 	help
-	  Perl interface to the gd2 graphics library.
+	  Perl interface to the libgd graphics library.
 
 	  https://metacpan.org/release/GD
 
diff --git a/package/perl-gd/perl-gd.hash b/package/perl-gd/perl-gd.hash
index 97f1da821a..fd9321be60 100644
--- a/package/perl-gd/perl-gd.hash
+++ b/package/perl-gd/perl-gd.hash
@@ -1,6 +1,6 @@
-# retrieved by scancpan from http://cpan.metacpan.org/
-md5  fb4bacab10ed4f28d52c2aabdaf866bb  GD-2.76.tar.gz
-sha256  693d9e3d709e9188a682cb9090a77b70aac12a04e84128677577b94e4331775b  GD-2.76.tar.gz
+# retrieved by scancpan from https://cpan.metacpan.org/
+md5  da3f969367ea2e6d217ec05d3b98bc6f  GD-2.77.tar.gz
+sha256  b56c88b8ef3be016ce29bb62dd1f1b6f6b5fbcaa57fea59e9468af6901016fb5  GD-2.77.tar.gz
 
 # computed by scancpan
 sha256  1e2250289d6df4ba1c24f7550982d7ffaff2c97cd02e847659406e1afd28e83f  LICENSE
diff --git a/package/perl-gd/perl-gd.mk b/package/perl-gd/perl-gd.mk
index cd32c7fb8f..17c24bc971 100644
--- a/package/perl-gd/perl-gd.mk
+++ b/package/perl-gd/perl-gd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_GD_VERSION = 2.76
+PERL_GD_VERSION = 2.77
 PERL_GD_SOURCE = GD-$(PERL_GD_VERSION).tar.gz
 PERL_GD_SITE = $(BR2_CPAN_MIRROR)/authors/id/R/RU/RURBAN
 PERL_GD_DEPENDENCIES = host-perl-extutils-pkgconfig zlib gd
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
