Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62769C4167B
	for <buildroot@archiver.kernel.org>; Thu, 30 Nov 2023 23:06:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 12E1443672;
	Thu, 30 Nov 2023 23:06:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 12E1443672
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rpzCH7WCRrB8; Thu, 30 Nov 2023 23:06:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id F280043681;
	Thu, 30 Nov 2023 23:06:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F280043681
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4DBEB1BF844
 for <buildroot@lists.busybox.net>; Thu, 30 Nov 2023 23:04:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F385660B48
 for <buildroot@lists.busybox.net>; Thu, 30 Nov 2023 23:04:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F385660B48
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 96bvcI8QCgqV for <buildroot@lists.busybox.net>;
 Thu, 30 Nov 2023 23:04:02 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 03BD26FA3B
 for <buildroot@buildroot.org>; Thu, 30 Nov 2023 23:04:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 03BD26FA3B
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id F1E4B8766E; Thu, 30 Nov 2023 23:04:01 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 1 Dec 2023 00:03:10 +0100
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: 12a55aba9567bb7dfc68aca416cd9d5828919270
X-Git-Newrev: 249f90cf253c7c20c4df19cb2f4277ca73626f68
X-Patchwork-Hint: ignore
Message-Id: <20231130230401.F1E4B8766E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/perl: bump to
 version 5.36.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=249f90cf253c7c20c4df19cb2f4277ca73626f68
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

diff README:
-Perl is Copyright (C) 1993, 1994, 1995, 1996, 1997, 1998, 1999, 2000,
-2001, 2002, 2003, 2004, 2005, 2006, 2007, 2008, 2009, 2010, 2011, 2012,
-2013, 2014, 2015, 2016, 2017, 2018, 2019, 2020, 2021, 2022
-by Larry Wall and others.
+Perl is Copyright (C) 1993 - 2023 by Larry Wall and others.

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
[yann.morin.1998@free.fr: fix spaces in hash file]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 8a289667f5dba6fffb3a21faa14517e9b49726a4)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/perl/perl.hash | 14 +++++++-------
 package/perl/perl.mk   |  4 ++--
 2 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/package/perl/perl.hash b/package/perl/perl.hash
index b21023f730..2165c8c601 100644
--- a/package/perl/perl.hash
+++ b/package/perl/perl.hash
@@ -1,12 +1,12 @@
-# Hashes from: https://www.cpan.org/src/5.0/perl-5.36.0.tar.xz.{md5,sha1,sha256}.txt
-md5  826e42da130011699172fd655e49cfa2  perl-5.36.0.tar.xz
-sha1  938c56a77ae094eb7f5019318a5e4efb2d9c74fa  perl-5.36.0.tar.xz
-sha256  0f386dccbee8e26286404b2cca144e1005be65477979beb9b1ba272d4819bcf0  perl-5.36.0.tar.xz
+# Hashes from: https://www.cpan.org/src/5.0/perl-5.36.1.tar.xz.{md5,sha1,sha256}.txt
+md5  825f6b1d7e03b22522e0bdb992fbb728  perl-5.36.1.tar.xz
+sha1  7b766266af08a6cef0487308e80b40d5d8069df7  perl-5.36.1.tar.xz
+sha256  bd91217ea8a8c8b81f21ebbb6cefdf0d13ae532013f944cdece2cd51aef4b6a7  perl-5.36.1.tar.xz
 
-# Hash from: https://github.com/arsv/perl-cross/releases/download/1.4/perl-cross-1.4.hash
-sha256  be9d9f9f7148edff7a2f9695ba3cb7e3975eff6b25a9a81dd311725fd757aa91  perl-cross-1.4.tar.gz
+# Hash from: https://github.com/arsv/perl-cross/releases/download/1.4.1/perl-cross-1.4.1.hash
+sha256  3e14bb4f28c83586c668c5f9f6b4e57b138b4ec2fae0271086e29d4e352670ca  perl-cross-1.4.1.tar.gz
 
 # Locally calculated
 sha256  dd90d4f42e4dcadf5a7c09eea0189d93c7b37ae560c91f0f6d5233ed3b9292a2  Artistic
 sha256  d77d235e41d54594865151f4751e835c5a82322b0e87ace266567c3391a4b912  Copying
-sha256  06bab256e2e039c59d2ca3c5853425317b4a0f251fe4e5d5201a987b11fc4f78  README
+sha256  810c97bea10842d2e47bc79e51acdfa1628cfee34fa0d89330f4eb3a44e3def9  README
diff --git a/package/perl/perl.mk b/package/perl/perl.mk
index 9be00e1b2c..734e8efec6 100644
--- a/package/perl/perl.mk
+++ b/package/perl/perl.mk
@@ -6,7 +6,7 @@
 
 # When updating the version here, also update utils/scancpan
 PERL_VERSION_MAJOR = 36
-PERL_VERSION = 5.$(PERL_VERSION_MAJOR).0
+PERL_VERSION = 5.$(PERL_VERSION_MAJOR).1
 PERL_SITE = https://www.cpan.org/src/5.0
 PERL_SOURCE = perl-$(PERL_VERSION).tar.xz
 PERL_LICENSE = Artistic or GPL-1.0+
@@ -15,7 +15,7 @@ PERL_CPE_ID_VENDOR = perl
 PERL_DEPENDENCIES = $(TARGET_NLS_DEPENDENCIES)
 PERL_INSTALL_STAGING = YES
 
-PERL_CROSS_VERSION = 1.4
+PERL_CROSS_VERSION = 1.4.1
 # DO NOT refactor with the github helper (the result is not the same)
 PERL_CROSS_SITE = https://github.com/arsv/perl-cross/releases/download/$(PERL_CROSS_VERSION)
 PERL_CROSS_SOURCE = perl-cross-$(PERL_CROSS_VERSION).tar.gz
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
