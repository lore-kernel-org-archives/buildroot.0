Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7073CE728F3
	for <buildroot@archiver.kernel.org>; Fri, 29 Sep 2023 20:30:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 191A260E96;
	Fri, 29 Sep 2023 20:30:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 191A260E96
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nj2faZDS3uvr; Fri, 29 Sep 2023 20:30:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 75DC060AD6;
	Fri, 29 Sep 2023 20:30:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 75DC060AD6
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 820AD1BF990
 for <buildroot@lists.busybox.net>; Fri, 29 Sep 2023 20:28:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 88F1840AA2
 for <buildroot@lists.busybox.net>; Fri, 29 Sep 2023 20:28:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 88F1840AA2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id P6or0O9SuH45 for <buildroot@lists.busybox.net>;
 Fri, 29 Sep 2023 20:28:28 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id E6E8B40A9B
 for <buildroot@buildroot.org>; Fri, 29 Sep 2023 20:28:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E6E8B40A9B
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D303C83707; Fri, 29 Sep 2023 20:28:27 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 29 Sep 2023 22:20:15 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 59db0884671a9d71142ddd47de5a4532aec8ef2e
X-Git-Newrev: 33c500fbbd66a044e6c5da169d016c71a008d3a5
X-Patchwork-Hint: ignore
Message-Id: <20230929202827.D303C83707@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/perl-exporter-tiny: bump to
 version 1.006002
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

commit: https://git.buildroot.net/buildroot/commit/?id=33c500fbbd66a044e6c5da169d016c71a008d3a5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

move homepage to https://exportertiny.github.io

LICENSE: update copyright dates & remove trailing spaces
see https://metacpan.org/release/TOBYINK/Exporter-Tiny-1.006002/diff/TOBYINK/Exporter-Tiny-1.006000#LICENSE

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/perl-exporter-tiny/Config.in               | 2 +-
 package/perl-exporter-tiny/perl-exporter-tiny.hash | 8 ++++----
 package/perl-exporter-tiny/perl-exporter-tiny.mk   | 2 +-
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/perl-exporter-tiny/Config.in b/package/perl-exporter-tiny/Config.in
index 04839ac15c..c3ac89ba28 100644
--- a/package/perl-exporter-tiny/Config.in
+++ b/package/perl-exporter-tiny/Config.in
@@ -4,4 +4,4 @@ config BR2_PACKAGE_PERL_EXPORTER_TINY
 	  an exporter with the features of Sub::Exporter but only core
 	  dependencies.
 
-	  https://metacpan.org/release/Exporter-Tiny
+	  https://exportertiny.github.io/
diff --git a/package/perl-exporter-tiny/perl-exporter-tiny.hash b/package/perl-exporter-tiny/perl-exporter-tiny.hash
index 0ecdf78482..0e16f92b1e 100644
--- a/package/perl-exporter-tiny/perl-exporter-tiny.hash
+++ b/package/perl-exporter-tiny/perl-exporter-tiny.hash
@@ -1,6 +1,6 @@
-# retrieved by scancpan from http://cpan.metacpan.org/
-md5  2d555e289eac6450052e8683c292cbf7  Exporter-Tiny-1.006000.tar.gz
-sha256  d95479ff085699d6422f7fc8306db085e34b626438deb82ec82d41df2295f400  Exporter-Tiny-1.006000.tar.gz
+# retrieved by scancpan from https://cpan.metacpan.org/
+md5  0545ee8f4edcb9dc5a87b21ed25edd74  Exporter-Tiny-1.006002.tar.gz
+sha256  6f295e2cbffb1dbc15bdb9dadc341671c1e0cd2bdf2d312b17526273c322638d  Exporter-Tiny-1.006002.tar.gz
 
 # computed by scancpan
-sha256  a4f85c6f4d6e8bdd37b7ab08013e3e3bee1fe8e910e20f8f54d5025ffe40f384  LICENSE
+sha256  1a2929dacaef239beca27a85f7f97b793628dfb22f07fdfb406cb6f3f0d22a6b  LICENSE
diff --git a/package/perl-exporter-tiny/perl-exporter-tiny.mk b/package/perl-exporter-tiny/perl-exporter-tiny.mk
index 489ee54e17..715070623e 100644
--- a/package/perl-exporter-tiny/perl-exporter-tiny.mk
+++ b/package/perl-exporter-tiny/perl-exporter-tiny.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_EXPORTER_TINY_VERSION = 1.006000
+PERL_EXPORTER_TINY_VERSION = 1.006002
 PERL_EXPORTER_TINY_SOURCE = Exporter-Tiny-$(PERL_EXPORTER_TINY_VERSION).tar.gz
 PERL_EXPORTER_TINY_SITE = $(BR2_CPAN_MIRROR)/authors/id/T/TO/TOBYINK
 PERL_EXPORTER_TINY_LICENSE = Artistic or GPL-1.0+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
