Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 657B0E77375
	for <buildroot@archiver.kernel.org>; Sat, 30 Sep 2023 14:25:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1D5AF81F57;
	Sat, 30 Sep 2023 14:25:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1D5AF81F57
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jRJO5Kj-qam3; Sat, 30 Sep 2023 14:25:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2789D81F72;
	Sat, 30 Sep 2023 14:25:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2789D81F72
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7CCFF1BF86C
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 14:24:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9CAE960F62
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 14:24:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9CAE960F62
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IW4At3foP3sN for <buildroot@lists.busybox.net>;
 Sat, 30 Sep 2023 14:24:16 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id CA3E360AD6
 for <buildroot@buildroot.org>; Sat, 30 Sep 2023 14:24:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CA3E360AD6
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B577F83A33; Sat, 30 Sep 2023 14:24:16 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 30 Sep 2023 16:24:02 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 45722700cdd2b53e1dea06c27bcba76518832093
X-Git-Newrev: 98920213b0c121227312b4d89dbf4d424d7025e6
X-Patchwork-Hint: ignore
Message-Id: <20230930142416.B577F83A33@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/perl-convert-asn1: bump to version
 0.34
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

commit: https://git.buildroot.net/buildroot/commit/?id=98920213b0c121227312b4d89dbf4d424d7025e6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

LICENSE: update copyright years & switch to Perl Artistic
see https://metacpan.org/release/TIMLEGGE/Convert-ASN1-0.34/diff/TIMLEGGE/Convert-ASN1-0.33#LICENSE

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/perl-convert-asn1/perl-convert-asn1.hash | 8 ++++----
 package/perl-convert-asn1/perl-convert-asn1.mk   | 4 ++--
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/perl-convert-asn1/perl-convert-asn1.hash b/package/perl-convert-asn1/perl-convert-asn1.hash
index 644517af51..2d1b1faa3b 100644
--- a/package/perl-convert-asn1/perl-convert-asn1.hash
+++ b/package/perl-convert-asn1/perl-convert-asn1.hash
@@ -1,6 +1,6 @@
-# retrieved by scancpan from http://cpan.metacpan.org/
-md5  80425835020da77c48c05a40e25bbf7e  Convert-ASN1-0.33.tar.gz
-sha256  1fdf004520c79e3a244cf9688616293516c11793d746c761f367496eb3d06076  Convert-ASN1-0.33.tar.gz
+# retrieved by scancpan from https://cpan.metacpan.org/
+md5  cca63088fdd5c3665a2119ee29133f6a  Convert-ASN1-0.34.tar.gz
+sha256  a628d7c9d390568fb76359975fa03f626ce57f10dc17980e8e3587d7713e4ee7  Convert-ASN1-0.34.tar.gz
 
 # computed by scancpan
-sha256  70884b19a3537bf179538c3b7d7896a56ade509dafe6b8d545c5999a9c05f8a9  LICENSE
+sha256  aa8ae28898a3e164ed5273c3e4fd4bd45b42f7958f282318df06773340e2c9d4  LICENSE
diff --git a/package/perl-convert-asn1/perl-convert-asn1.mk b/package/perl-convert-asn1/perl-convert-asn1.mk
index affe775aca..07f9b1d1bb 100644
--- a/package/perl-convert-asn1/perl-convert-asn1.mk
+++ b/package/perl-convert-asn1/perl-convert-asn1.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-PERL_CONVERT_ASN1_VERSION = 0.33
+PERL_CONVERT_ASN1_VERSION = 0.34
 PERL_CONVERT_ASN1_SOURCE = Convert-ASN1-$(PERL_CONVERT_ASN1_VERSION).tar.gz
 PERL_CONVERT_ASN1_SITE = $(BR2_CPAN_MIRROR)/authors/id/T/TI/TIMLEGGE
-PERL_CONVERT_ASN1_LICENSE = Artistic or GPL-1.0+
+PERL_CONVERT_ASN1_LICENSE = Artistic-1.0-Perl or GPL-1.0+
 PERL_CONVERT_ASN1_LICENSE_FILES = LICENSE
 PERL_CONVERT_ASN1_DISTNAME = Convert-ASN1
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
