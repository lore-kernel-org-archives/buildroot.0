Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 158B2E77374
	for <buildroot@archiver.kernel.org>; Sat, 30 Sep 2023 14:25:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C143181EA3;
	Sat, 30 Sep 2023 14:25:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C143181EA3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vKUFZlcN8xu0; Sat, 30 Sep 2023 14:25:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DF63B81F29;
	Sat, 30 Sep 2023 14:25:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DF63B81F29
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 701851BF2A3
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 14:24:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 44D0B41B4C
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 14:24:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 44D0B41B4C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dPWIRntfC8-i for <buildroot@lists.busybox.net>;
 Sat, 30 Sep 2023 14:24:17 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id D2A0C41F12
 for <buildroot@buildroot.org>; Sat, 30 Sep 2023 14:24:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D2A0C41F12
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BE64383B08; Sat, 30 Sep 2023 14:24:16 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 30 Sep 2023 16:24:03 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 98920213b0c121227312b4d89dbf4d424d7025e6
X-Git-Newrev: 2fcb021cc2e6d90616f10a540593abd7a90a9cd6
X-Patchwork-Hint: ignore
Message-Id: <20230930142416.BE64383B08@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/perl-http-date: bump to version
 6.06
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

commit: https://git.buildroot.net/buildroot/commit/?id=2fcb021cc2e6d90616f10a540593abd7a90a9cd6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

LICENSE: update copyright dates & switch to Perl Artistic
see https://metacpan.org/release/TIMLEGGE/Convert-ASN1-0.34/diff/TIMLEGGE/Convert-ASN1-0.33#LICENSE

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/perl-http-date/perl-http-date.hash | 8 ++++----
 package/perl-http-date/perl-http-date.mk   | 4 ++--
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/perl-http-date/perl-http-date.hash b/package/perl-http-date/perl-http-date.hash
index b278423002..a6f7701829 100644
--- a/package/perl-http-date/perl-http-date.hash
+++ b/package/perl-http-date/perl-http-date.hash
@@ -1,6 +1,6 @@
-# retrieved by scancpan from http://cpan.metacpan.org/
-md5  2ecbb3aedf6aef062605191813ca3027  HTTP-Date-6.05.tar.gz
-sha256  365d6294dfbd37ebc51def8b65b81eb79b3934ecbc95a2ec2d4d827efe6a922b  HTTP-Date-6.05.tar.gz
+# retrieved by scancpan from https://cpan.metacpan.org/
+md5  60462359bfeb1e6d14602508cfd07885  HTTP-Date-6.06.tar.gz
+sha256  7b685191c6acc3e773d1fc02c95ee1f9fae94f77783175f5e78c181cc92d2b52  HTTP-Date-6.06.tar.gz
 
 # computed by scancpan
-sha256  305b71c4d2fd6380585689c5f1c620737a36a318ce0f9c772badce0fe293a44e  LICENSE
+sha256  6186a79a305a0e62c5087f9737b4f66fa5793fa1b396da0126e3c8722c460245  LICENSE
diff --git a/package/perl-http-date/perl-http-date.mk b/package/perl-http-date/perl-http-date.mk
index 43583be303..2f1aeb7da0 100644
--- a/package/perl-http-date/perl-http-date.mk
+++ b/package/perl-http-date/perl-http-date.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-PERL_HTTP_DATE_VERSION = 6.05
+PERL_HTTP_DATE_VERSION = 6.06
 PERL_HTTP_DATE_SOURCE = HTTP-Date-$(PERL_HTTP_DATE_VERSION).tar.gz
 PERL_HTTP_DATE_SITE = $(BR2_CPAN_MIRROR)/authors/id/O/OA/OALDERS
-PERL_HTTP_DATE_LICENSE = Artistic or GPL-1.0+
+PERL_HTTP_DATE_LICENSE = Artistic-1.0-Perl or GPL-1.0+
 PERL_HTTP_DATE_LICENSE_FILES = LICENSE
 PERL_HTTP_DATE_DISTNAME = HTTP-Date
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
