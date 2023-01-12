Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87889C61DB3
	for <buildroot@archiver.kernel.org>; Thu, 12 Jan 2023 19:35:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 342BC60E56;
	Thu, 12 Jan 2023 19:35:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 342BC60E56
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lOyPLTmyxweV; Thu, 12 Jan 2023 19:35:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 74F6460E41;
	Thu, 12 Jan 2023 19:35:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 74F6460E41
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C73AD1BF46D
 for <buildroot@lists.busybox.net>; Thu, 12 Jan 2023 19:35:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A31CF60E48
 for <buildroot@lists.busybox.net>; Thu, 12 Jan 2023 19:35:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A31CF60E48
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LFvSeV5sSy3e for <buildroot@lists.busybox.net>;
 Thu, 12 Jan 2023 19:35:39 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id AD04660E33
 for <buildroot@buildroot.org>; Thu, 12 Jan 2023 19:35:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AD04660E33
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 98D0487AB7; Thu, 12 Jan 2023 19:35:39 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 12 Jan 2023 20:33:22 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 49ca11e339c41ea2dd0484556b7b5beacff9fee9
X-Git-Newrev: 9103c8f2e94f69d7ef392746aa53bbf2f468a008
X-Patchwork-Hint: ignore
Message-Id: <20230112193539.98D0487AB7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/perl: bump to version 5.36.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=9103c8f2e94f69d7ef392746aa53bbf2f468a008
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/perl/perl.hash | 8 ++++----
 package/perl/perl.mk   | 4 ++--
 utils/scancpan         | 8 ++++----
 3 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/package/perl/perl.hash b/package/perl/perl.hash
index 9ec2b42e34..b21023f730 100644
--- a/package/perl/perl.hash
+++ b/package/perl/perl.hash
@@ -1,7 +1,7 @@
-# Hashes from: https://www.cpan.org/src/5.0/perl-5.34.1.tar.xz.{md5,sha1,sha256}.txt
-md5  7d2ece7f50775ea1ff739831935a24bd  perl-5.34.1.tar.xz
-sha1  e7dbef3c1ea7caa73e2c705bba9e4bfb92ea98f0  perl-5.34.1.tar.xz
-sha256  6d52cf833ff1af27bb5e986870a2c30cec73c044b41e3458cd991f94374039f7  perl-5.34.1.tar.xz
+# Hashes from: https://www.cpan.org/src/5.0/perl-5.36.0.tar.xz.{md5,sha1,sha256}.txt
+md5  826e42da130011699172fd655e49cfa2  perl-5.36.0.tar.xz
+sha1  938c56a77ae094eb7f5019318a5e4efb2d9c74fa  perl-5.36.0.tar.xz
+sha256  0f386dccbee8e26286404b2cca144e1005be65477979beb9b1ba272d4819bcf0  perl-5.36.0.tar.xz
 
 # Hash from: https://github.com/arsv/perl-cross/releases/download/1.4/perl-cross-1.4.hash
 sha256  be9d9f9f7148edff7a2f9695ba3cb7e3975eff6b25a9a81dd311725fd757aa91  perl-cross-1.4.tar.gz
diff --git a/package/perl/perl.mk b/package/perl/perl.mk
index 27acfaeff2..9be00e1b2c 100644
--- a/package/perl/perl.mk
+++ b/package/perl/perl.mk
@@ -5,8 +5,8 @@
 ################################################################################
 
 # When updating the version here, also update utils/scancpan
-PERL_VERSION_MAJOR = 34
-PERL_VERSION = 5.$(PERL_VERSION_MAJOR).1
+PERL_VERSION_MAJOR = 36
+PERL_VERSION = 5.$(PERL_VERSION_MAJOR).0
 PERL_SITE = https://www.cpan.org/src/5.0
 PERL_SOURCE = perl-$(PERL_VERSION).tar.xz
 PERL_LICENSE = Artistic or GPL-1.0+
diff --git a/utils/scancpan b/utils/scancpan
index 48f8bd83b7..e7739a8ad1 100755
--- a/utils/scancpan
+++ b/utils/scancpan
@@ -488,9 +488,9 @@ use Digest::SHA qw(sha256_hex);
 use Text::Wrap;
 $Text::Wrap::columns = 62;
 
-# Below, 5.034 should be aligned with the version of perl actually
+# Below, 5.036 should be aligned with the version of perl actually
 # bundled in Buildroot:
-die <<"MSG" if $] < 5.034;
+die <<"MSG" if $] < 5.036;
 This script needs a host perl with the same major version as Buildroot target perl.
 
 Your current host perl is:
@@ -498,7 +498,7 @@ Your current host perl is:
     version $]
 
 You may install a local one by running:
-    perlbrew install perl-5.34.0
+    perlbrew install perl-5.36.0
 MSG
 
 my ($help, $man, $quiet, $force, $recommend, $test, $host);
@@ -967,7 +967,7 @@ in order to work with the right CoreList data.
 
 =head1 LICENSE
 
-Copyright (C) 2013-2020 by Francois Perrad <francois.perrad@gadz.org>
+Copyright (C) 2013-2023 by Francois Perrad <francois.perrad@gadz.org>
 
 This program is free software; you can redistribute it and/or modify
 it under the terms of the GNU General Public License as published by
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
