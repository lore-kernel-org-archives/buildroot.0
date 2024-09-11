Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51FB2EE49B0
	for <buildroot@archiver.kernel.org>; Wed, 11 Sep 2024 14:00:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 078FA40FFF;
	Wed, 11 Sep 2024 14:00:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DvcO2AhxHOC8; Wed, 11 Sep 2024 14:00:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 39332400FC
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 39332400FC;
	Wed, 11 Sep 2024 14:00:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 620241BF20B
 for <buildroot@lists.busybox.net>; Wed, 11 Sep 2024 13:59:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 96B3460B1E
 for <buildroot@lists.busybox.net>; Wed, 11 Sep 2024 13:59:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id auJ-7ctJpjSI for <buildroot@lists.busybox.net>;
 Wed, 11 Sep 2024 13:59:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 506E560B34
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 506E560B34
 for <buildroot@buildroot.org>; Wed, 11 Sep 2024 13:59:20 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4A26586E9D; Wed, 11 Sep 2024 13:59:20 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 11 Sep 2024 15:26:20 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ee13dd14be8ce54d6b0d14b4eac5180a74e2a549
X-Git-Newrev: 22d663b0c25c3fffee811d5b7d61af4aa9a80a70
X-Patchwork-Hint: ignore
Message-Id: <20240911135920.4A26586E9D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/perl-extutils-config: bump to
 version 0.010
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

commit: https://git.buildroot.net/buildroot/commit/?id=22d663b0c25c3fffee811d5b7d61af4aa9a80a70
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

diff LICENSE: use "The Perl Artistic License 1.0"
    see https://metacpan.org/release/LEONT/ExtUtils-Config-0.010/diff/LEONT/ExtUtils-Config-0.008#LICENSE

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/perl-extutils-config/perl-extutils-config.hash | 8 ++++----
 package/perl-extutils-config/perl-extutils-config.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/perl-extutils-config/perl-extutils-config.hash b/package/perl-extutils-config/perl-extutils-config.hash
index f4a4b18fc6..92ee0b63af 100644
--- a/package/perl-extutils-config/perl-extutils-config.hash
+++ b/package/perl-extutils-config/perl-extutils-config.hash
@@ -1,6 +1,6 @@
-# retrieved by scancpan from http://cpan.metacpan.org/
-md5  565a7b09c7cac5907a25bbe2c959a717  ExtUtils-Config-0.008.tar.gz
-sha256  ae5104f634650dce8a79b7ed13fb59d67a39c213a6776cfdaa3ee749e62f1a8c  ExtUtils-Config-0.008.tar.gz
+# retrieved by scancpan from https://cpan.metacpan.org/
+md5  f455b5743db7b73c80e88133effa3551  ExtUtils-Config-0.010.tar.gz
+sha256  82e7e4e90cbe380e152f5de6e3e403746982d502dd30197a123652e46610c66d  ExtUtils-Config-0.010.tar.gz
 
 # computed by scancpan
-sha256  33b39fda54675d4d681764049e27b537cac12213aa6650667abea43662264ddc  LICENSE
+sha256  bb85b6b9104be3c7b17a4ab7d7dacce239ce640312bc4cd1e78a51780128009e  LICENSE
diff --git a/package/perl-extutils-config/perl-extutils-config.mk b/package/perl-extutils-config/perl-extutils-config.mk
index f46ca3e6fd..fe41fbcdd5 100644
--- a/package/perl-extutils-config/perl-extutils-config.mk
+++ b/package/perl-extutils-config/perl-extutils-config.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_EXTUTILS_CONFIG_VERSION = 0.008
+PERL_EXTUTILS_CONFIG_VERSION = 0.010
 PERL_EXTUTILS_CONFIG_SOURCE = ExtUtils-Config-$(PERL_EXTUTILS_CONFIG_VERSION).tar.gz
 PERL_EXTUTILS_CONFIG_SITE = $(BR2_CPAN_MIRROR)/authors/id/L/LE/LEONT
 PERL_EXTUTILS_CONFIG_LICENSE = Artistic or GPL-1.0+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
