Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2042EE49AB
	for <buildroot@archiver.kernel.org>; Wed, 11 Sep 2024 13:59:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9DA9740F7D;
	Wed, 11 Sep 2024 13:59:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uapwj9Fx-mI8; Wed, 11 Sep 2024 13:59:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 225B140FB6
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 225B140FB6;
	Wed, 11 Sep 2024 13:59:48 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id EBF0E1BF20B
 for <buildroot@lists.busybox.net>; Wed, 11 Sep 2024 13:59:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 39156811EE
 for <buildroot@lists.busybox.net>; Wed, 11 Sep 2024 13:59:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WCTnd6ELt2Ax for <buildroot@lists.busybox.net>;
 Wed, 11 Sep 2024 13:59:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 581FB811F0
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 581FB811F0
 for <buildroot@buildroot.org>; Wed, 11 Sep 2024 13:59:20 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5568A86F6A; Wed, 11 Sep 2024 13:59:20 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 11 Sep 2024 15:26:21 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 22d663b0c25c3fffee811d5b7d61af4aa9a80a70
X-Git-Newrev: f8e21d1c415b69e0fc5543b5340e4fba4b5f83c1
X-Patchwork-Hint: ignore
Message-Id: <20240911135920.5568A86F6A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/perl-extutils-helpers: bump to
 version 0.028
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

commit: https://git.buildroot.net/buildroot/commit/?id=f8e21d1c415b69e0fc5543b5340e4fba4b5f83c1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

diff LICENSE: use "The Perl Artistic License 1.0"
    see https://metacpan.org/release/LEONT/ExtUtils-Helpers-0.028/diff/LEONT/ExtUtils-Helpers-0.026#LICENSE

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/perl-extutils-helpers/perl-extutils-helpers.hash | 8 ++++----
 package/perl-extutils-helpers/perl-extutils-helpers.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/perl-extutils-helpers/perl-extutils-helpers.hash b/package/perl-extutils-helpers/perl-extutils-helpers.hash
index 3f80a96e6d..15c81df01e 100644
--- a/package/perl-extutils-helpers/perl-extutils-helpers.hash
+++ b/package/perl-extutils-helpers/perl-extutils-helpers.hash
@@ -1,6 +1,6 @@
-# retrieved by scancpan from http://cpan.metacpan.org/
-md5  83b00c1e401321c425ae5db6b2b2fd12  ExtUtils-Helpers-0.026.tar.gz
-sha256  de901b6790a4557cf4ec908149e035783b125bf115eb9640feb1bc1c24c33416  ExtUtils-Helpers-0.026.tar.gz
+# retrieved by scancpan from https://cpan.metacpan.org/
+md5  0687f20ac896a7d01219646908ccdf89  ExtUtils-Helpers-0.028.tar.gz
+sha256  c8574875cce073e7dc5345a7b06d502e52044d68894f9160203fcaab379514fe  ExtUtils-Helpers-0.028.tar.gz
 
 # computed by scancpan
-sha256  e5530d0ebc8662df3a970644d867faf12760b1a95ca6e2bf1c5f9af410a418e0  LICENSE
+sha256  7de2a12de1b294281e50d260e6532d656473ad3e1be6bd4ef76ef7b4c21a898a  LICENSE
diff --git a/package/perl-extutils-helpers/perl-extutils-helpers.mk b/package/perl-extutils-helpers/perl-extutils-helpers.mk
index d3b14d88ce..2ac9ceec08 100644
--- a/package/perl-extutils-helpers/perl-extutils-helpers.mk
+++ b/package/perl-extutils-helpers/perl-extutils-helpers.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_EXTUTILS_HELPERS_VERSION = 0.026
+PERL_EXTUTILS_HELPERS_VERSION = 0.028
 PERL_EXTUTILS_HELPERS_SOURCE = ExtUtils-Helpers-$(PERL_EXTUTILS_HELPERS_VERSION).tar.gz
 PERL_EXTUTILS_HELPERS_SITE = $(BR2_CPAN_MIRROR)/authors/id/L/LE/LEONT
 PERL_EXTUTILS_HELPERS_LICENSE = Artistic or GPL-1.0+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
