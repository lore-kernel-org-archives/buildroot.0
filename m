Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 632B7C46CD2
	for <buildroot@archiver.kernel.org>; Sat, 27 Jan 2024 20:58:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 191DE60F37;
	Sat, 27 Jan 2024 20:58:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 191DE60F37
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fJlBrSNalZi2; Sat, 27 Jan 2024 20:58:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6F7D060F1C;
	Sat, 27 Jan 2024 20:58:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6F7D060F1C
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6F2021BF280
 for <buildroot@lists.busybox.net>; Sat, 27 Jan 2024 20:56:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 296BD400F8
 for <buildroot@lists.busybox.net>; Sat, 27 Jan 2024 20:56:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 296BD400F8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id neOV5pyEsOof for <buildroot@lists.busybox.net>;
 Sat, 27 Jan 2024 20:56:30 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2AF4E401F1
 for <buildroot@buildroot.org>; Sat, 27 Jan 2024 20:56:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2AF4E401F1
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 17C3F866A5; Sat, 27 Jan 2024 20:56:30 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 27 Jan 2024 21:48:34 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a1f94338856f04deca6db98426fa09209e00617f
X-Git-Newrev: 46d4f5c7519f949751b80c3e73fa055c07796c4e
X-Patchwork-Hint: ignore
Message-Id: <20240127205630.17C3F866A5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/perl-posix-strftime-compiler: bump
 to version 0.46
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

commit: https://git.buildroot.net/buildroot/commit/?id=46d4f5c7519f949751b80c3e73fa055c07796c4e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 .../perl-posix-strftime-compiler/perl-posix-strftime-compiler.hash  | 6 +++---
 .../perl-posix-strftime-compiler/perl-posix-strftime-compiler.mk    | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/perl-posix-strftime-compiler/perl-posix-strftime-compiler.hash b/package/perl-posix-strftime-compiler/perl-posix-strftime-compiler.hash
index bdc6fd45a0..cad4b03f24 100644
--- a/package/perl-posix-strftime-compiler/perl-posix-strftime-compiler.hash
+++ b/package/perl-posix-strftime-compiler/perl-posix-strftime-compiler.hash
@@ -1,6 +1,6 @@
-# retrieved by scancpan from http://cpan.metacpan.org/
-md5  3a5ae7d56a5917410c1b661e01ed1a68  POSIX-strftime-Compiler-0.44.tar.gz
-sha256  dfd3c97398dcfe51c8236b85e3dc28035667b76531f7aa0a6535f3aa5405b35a  POSIX-strftime-Compiler-0.44.tar.gz
+# retrieved by scancpan from https://cpan.metacpan.org/
+md5  e64777d20d363a1b47acf85774d108da  POSIX-strftime-Compiler-0.46.tar.gz
+sha256  bf88873248ef88cc5e68ed074493496be684ec334e11273d4654306dd9dae485  POSIX-strftime-Compiler-0.46.tar.gz
 
 # computed by scancpan
 sha256  79c2a066104e71602785fd815c5aea6f7db78c19451d68521380083f9c2a8805  LICENSE
diff --git a/package/perl-posix-strftime-compiler/perl-posix-strftime-compiler.mk b/package/perl-posix-strftime-compiler/perl-posix-strftime-compiler.mk
index c11ed58514..f7f6745ec9 100644
--- a/package/perl-posix-strftime-compiler/perl-posix-strftime-compiler.mk
+++ b/package/perl-posix-strftime-compiler/perl-posix-strftime-compiler.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_POSIX_STRFTIME_COMPILER_VERSION = 0.44
+PERL_POSIX_STRFTIME_COMPILER_VERSION = 0.46
 PERL_POSIX_STRFTIME_COMPILER_SOURCE = POSIX-strftime-Compiler-$(PERL_POSIX_STRFTIME_COMPILER_VERSION).tar.gz
 PERL_POSIX_STRFTIME_COMPILER_SITE = $(BR2_CPAN_MIRROR)/authors/id/K/KA/KAZEBURO
 PERL_POSIX_STRFTIME_COMPILER_DEPENDENCIES = host-perl-module-build-tiny
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
