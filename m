Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E649C4332F
	for <buildroot@archiver.kernel.org>; Sat,  4 Nov 2023 20:49:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4D01460B4E;
	Sat,  4 Nov 2023 20:49:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4D01460B4E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FQHhXsA-tFRQ; Sat,  4 Nov 2023 20:49:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5C9A460DA0;
	Sat,  4 Nov 2023 20:49:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5C9A460DA0
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D1CF71BF868
 for <buildroot@lists.busybox.net>; Sat,  4 Nov 2023 20:49:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AA0B6820F9
 for <buildroot@lists.busybox.net>; Sat,  4 Nov 2023 20:49:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AA0B6820F9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YxQFDN__npRA for <buildroot@lists.busybox.net>;
 Sat,  4 Nov 2023 20:49:08 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1DF98820F7
 for <buildroot@buildroot.org>; Sat,  4 Nov 2023 20:49:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1DF98820F7
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0A0D184457; Sat,  4 Nov 2023 20:49:08 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 4 Nov 2023 21:48:05 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3fa42aacf9dd45190c35456839db9ff130e9018c
X-Git-Newrev: f2ba95853378dc7b3325dfa96e2f8acc3b0ac537
X-Patchwork-Hint: ignore
Message-Id: <20231104204908.0A0D184457@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/perl-module-build-tiny: bump to
 version 0.047
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

commit: https://git.buildroot.net/buildroot/commit/?id=f2ba95853378dc7b3325dfa96e2f8acc3b0ac537
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

LICENSE: switch to Perl Artistic
see https://metacpan.org/release/LEONT/Module-Build-Tiny-0.047/diff/LEONT/Module-Build-Tiny-0.039#LICENSE

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/perl-module-build-tiny/perl-module-build-tiny.hash | 8 ++++----
 package/perl-module-build-tiny/perl-module-build-tiny.mk   | 4 ++--
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/perl-module-build-tiny/perl-module-build-tiny.hash b/package/perl-module-build-tiny/perl-module-build-tiny.hash
index 7f03f96c18..7b503ff061 100644
--- a/package/perl-module-build-tiny/perl-module-build-tiny.hash
+++ b/package/perl-module-build-tiny/perl-module-build-tiny.hash
@@ -1,6 +1,6 @@
-# retrieved by scancpan from http://cpan.metacpan.org/
-md5  2332c90c17454107fea3f2614e11a3a9  Module-Build-Tiny-0.039.tar.gz
-sha256  7d580ff6ace0cbe555bf36b86dc8ea232581530cbeaaea09bccb57b55797f11c  Module-Build-Tiny-0.039.tar.gz
+# retrieved by scancpan from https://cpan.metacpan.org/
+md5  de9814b3c22825837438fc70adad58ac  Module-Build-Tiny-0.047.tar.gz
+sha256  71260e9421b93c33dd1b3e7d0cf15f759c0ca7c753fa840279ec3be70f8f8c9d  Module-Build-Tiny-0.047.tar.gz
 
 # computed by scancpan
-sha256  09fd2bc0428920c455f10c5a6c52e2bb4615114e88966c75ce27a07af028c36b  LICENSE
+sha256  1ce3282467869416f29b0c5f7773d1b80181fb9e08bef64e3829e8c53e19b64e  LICENSE
diff --git a/package/perl-module-build-tiny/perl-module-build-tiny.mk b/package/perl-module-build-tiny/perl-module-build-tiny.mk
index cdf6ac3ec4..e2e3d83e7c 100644
--- a/package/perl-module-build-tiny/perl-module-build-tiny.mk
+++ b/package/perl-module-build-tiny/perl-module-build-tiny.mk
@@ -4,14 +4,14 @@
 #
 ################################################################################
 
-PERL_MODULE_BUILD_TINY_VERSION = 0.039
+PERL_MODULE_BUILD_TINY_VERSION = 0.047
 PERL_MODULE_BUILD_TINY_SOURCE = Module-Build-Tiny-$(PERL_MODULE_BUILD_TINY_VERSION).tar.gz
 PERL_MODULE_BUILD_TINY_SITE = $(BR2_CPAN_MIRROR)/authors/id/L/LE/LEONT
 HOST_PERL_MODULE_BUILD_TINY_DEPENDENCIES = \
 	host-perl-extutils-config \
 	host-perl-extutils-helpers \
 	host-perl-extutils-installpaths
-PERL_MODULE_BUILD_TINY_LICENSE = Artistic or GPL-1.0+
+PERL_MODULE_BUILD_TINY_LICENSE = Artistic-1.0-Perl or GPL-1.0+
 PERL_MODULE_BUILD_TINY_LICENSE_FILES = LICENSE
 PERL_MODULE_BUILD_TINY_DISTNAME = Module-Build-Tiny
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
