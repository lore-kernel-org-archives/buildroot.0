Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFFBBCFA45F
	for <buildroot@archiver.kernel.org>; Wed, 23 Oct 2024 19:22:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 953BB810B7;
	Wed, 23 Oct 2024 19:22:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RI-qGR5C0v5I; Wed, 23 Oct 2024 19:22:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1888F810B0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1888F810B0;
	Wed, 23 Oct 2024 19:22:11 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id D7D9A4C2A
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 19:22:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C6DE6810B3
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 19:22:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GUr0fxLyi0zw for <buildroot@buildroot.org>;
 Wed, 23 Oct 2024 19:22:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F1F13810B0
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id F1F13810B0
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 19:22:06 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EB3FA86367; Wed, 23 Oct 2024 19:22:06 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 23 Oct 2024 21:21:40 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 88ac92ff86fef6edfeb777cf2f60012878f43fc7
X-Git-Newrev: 1854a64937bda7567cb935e9b112803f3b7382a5
X-Patchwork-Hint: ignore
Message-Id: <20241023192206.EB3FA86367@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/perl-type-tiny: bump to version
 2.006000
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

commit: https://git.buildroot.net/buildroot/commit/?id=1854a64937bda7567cb935e9b112803f3b7382a5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

diff LICENSE: use "The Perl Artistic License 1.0" and update millesime
    see https://metacpan.org/release/TOBYINK/Type-Tiny-2.006000/diff/TOBYINK/Type-Tiny-2.004000#LICENSE

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/perl-type-tiny/perl-type-tiny.hash | 6 +++---
 package/perl-type-tiny/perl-type-tiny.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/perl-type-tiny/perl-type-tiny.hash b/package/perl-type-tiny/perl-type-tiny.hash
index bca5153a03..5c97fbf964 100644
--- a/package/perl-type-tiny/perl-type-tiny.hash
+++ b/package/perl-type-tiny/perl-type-tiny.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from https://cpan.metacpan.org/
-md5  08bb43feabaab97dac7a3e59b5c77ff3  Type-Tiny-2.004000.tar.gz
-sha256  697e7f775edfc85f4cf07792d04fd19b09c25285f98f5938e8efc4f74507a128  Type-Tiny-2.004000.tar.gz
+md5  afc902c6b56ab6320492cd09c689a940  Type-Tiny-2.006000.tar.gz
+sha256  4c685ebbba5145dc02944c305e8e82759811032a55e6da270a751b63b76500ea  Type-Tiny-2.006000.tar.gz
 
 # computed by scancpan
-sha256  1a2929dacaef239beca27a85f7f97b793628dfb22f07fdfb406cb6f3f0d22a6b  LICENSE
+sha256  80067f577fa565f34f833e302cac68ea1435f3863885540f94071ccd6d5e900d  LICENSE
diff --git a/package/perl-type-tiny/perl-type-tiny.mk b/package/perl-type-tiny/perl-type-tiny.mk
index 31c84a2637..a4c9cd2672 100644
--- a/package/perl-type-tiny/perl-type-tiny.mk
+++ b/package/perl-type-tiny/perl-type-tiny.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_TYPE_TINY_VERSION = 2.004000
+PERL_TYPE_TINY_VERSION = 2.006000
 PERL_TYPE_TINY_SOURCE = Type-Tiny-$(PERL_TYPE_TINY_VERSION).tar.gz
 PERL_TYPE_TINY_SITE = $(BR2_CPAN_MIRROR)/authors/id/T/TO/TOBYINK
 PERL_TYPE_TINY_LICENSE = Artistic or GPL-1.0+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
