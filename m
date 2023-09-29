Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4987EE728F3
	for <buildroot@archiver.kernel.org>; Fri, 29 Sep 2023 20:29:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 082F283C28;
	Fri, 29 Sep 2023 20:29:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 082F283C28
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id d8Rc5iTWS_Zt; Fri, 29 Sep 2023 20:29:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2BFCC83CE7;
	Fri, 29 Sep 2023 20:29:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2BFCC83CE7
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 647731BF990
 for <buildroot@lists.busybox.net>; Fri, 29 Sep 2023 20:28:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4AABC42EC7
 for <buildroot@lists.busybox.net>; Fri, 29 Sep 2023 20:28:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4AABC42EC7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Y_J2AFvpgr1g for <buildroot@lists.busybox.net>;
 Fri, 29 Sep 2023 20:28:28 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 31CFB42EB6
 for <buildroot@buildroot.org>; Fri, 29 Sep 2023 20:28:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 31CFB42EB6
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 207628370A; Fri, 29 Sep 2023 20:28:28 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 29 Sep 2023 22:24:27 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6c5eaa14e3031db776d94ca128db94739c3cf565
X-Git-Newrev: 3eb8d430ad771e0fce8751796ccd422c28b7495d
X-Patchwork-Hint: ignore
Message-Id: <20230929202828.207628370A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/perl-package-stash: bump to
 version 0.40
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

commit: https://git.buildroot.net/buildroot/commit/?id=3eb8d430ad771e0fce8751796ccd422c28b7495d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

LICENSE: update copyright dates && remove trailing spaces
see https://metacpan.org/release/ETHER/Package-Stash-0.40/diff/ETHER/Package-Stash-0.39#LICENSE

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/perl-package-stash/Config.in               | 4 ++--
 package/perl-package-stash/perl-package-stash.hash | 8 ++++----
 package/perl-package-stash/perl-package-stash.mk   | 2 +-
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/package/perl-package-stash/Config.in b/package/perl-package-stash/Config.in
index 6b7ca24782..05506c2424 100644
--- a/package/perl-package-stash/Config.in
+++ b/package/perl-package-stash/Config.in
@@ -3,6 +3,6 @@ config BR2_PACKAGE_PERL_PACKAGE_STASH
 	select BR2_PACKAGE_PERL_DIST_CHECKCONFLICTS # runtime
 	select BR2_PACKAGE_PERL_MODULE_IMPLEMENTATION # runtime
 	help
-	  routines for manipulating stashes.
+	  Routines for manipulating stashes.
 
-	  http://metacpan.org/release/Package-Stash
+	  https://github.com/moose/Package-Stash
diff --git a/package/perl-package-stash/perl-package-stash.hash b/package/perl-package-stash/perl-package-stash.hash
index 0bbac515e2..329d2dbbbf 100644
--- a/package/perl-package-stash/perl-package-stash.hash
+++ b/package/perl-package-stash/perl-package-stash.hash
@@ -1,6 +1,6 @@
-# retrieved by scancpan from http://cpan.metacpan.org/
-md5  287d80c9115c9230912aca684f8ca92e  Package-Stash-0.39.tar.gz
-sha256  9165f555112e080493ce0e9129de0886da30b2593fb353a2abd1c76b2d2621b5  Package-Stash-0.39.tar.gz
+# retrieved by scancpan from https://cpan.metacpan.org/
+md5  7a2922941cc2aad6a52642e4fb13d07b  Package-Stash-0.40.tar.gz
+sha256  5a9722c6d9cb29ee133e5f7b08a5362762a0b5633ff5170642a5b0686e95e066  Package-Stash-0.40.tar.gz
 
 # computed by scancpan
-sha256  810b319a6f4a53c9cbbef513da17b2f0c872accd149bb889f153f4b78cf8cbb8  LICENSE
+sha256  5f82745d355b43f451c557642618cbd903251192b89f31ca53eaab90c35aeb7c  LICENSE
diff --git a/package/perl-package-stash/perl-package-stash.mk b/package/perl-package-stash/perl-package-stash.mk
index bc116abca3..dd93314d82 100644
--- a/package/perl-package-stash/perl-package-stash.mk
+++ b/package/perl-package-stash/perl-package-stash.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_PACKAGE_STASH_VERSION = 0.39
+PERL_PACKAGE_STASH_VERSION = 0.40
 PERL_PACKAGE_STASH_SOURCE = Package-Stash-$(PERL_PACKAGE_STASH_VERSION).tar.gz
 PERL_PACKAGE_STASH_SITE = $(BR2_CPAN_MIRROR)/authors/id/E/ET/ETHER
 PERL_PACKAGE_STASH_LICENSE = Artistic or GPL-1.0+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
