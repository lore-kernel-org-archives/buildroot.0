Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66DBAC6FA86
	for <buildroot@archiver.kernel.org>; Sat, 17 Sep 2022 08:45:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0D35084343;
	Sat, 17 Sep 2022 08:45:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0D35084343
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QnrenWqyq2XZ; Sat, 17 Sep 2022 08:45:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 14EF8842F4;
	Sat, 17 Sep 2022 08:45:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 14EF8842F4
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 054F41BF968
 for <buildroot@lists.busybox.net>; Sat, 17 Sep 2022 08:45:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E2BDA60D4E
 for <buildroot@lists.busybox.net>; Sat, 17 Sep 2022 08:45:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E2BDA60D4E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6zXGRxGJPqHu for <buildroot@lists.busybox.net>;
 Sat, 17 Sep 2022 08:45:11 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0E46560A8A
 for <buildroot@buildroot.org>; Sat, 17 Sep 2022 08:45:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0E46560A8A
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id EFC9284092; Sat, 17 Sep 2022 08:45:10 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sat, 17 Sep 2022 10:38:59 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 63727d9a54b81e7dbeb87802bb9c9032ae6a3d71
X-Git-Newrev: acefa946ddb523539692393fbadd180255463477
X-Patchwork-Hint: ignore
Message-Id: <20220917084510.EFC9284092@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/perl-date-manip: bump to version
 6.89
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

commit: https://git.buildroot.net/buildroot/commit/?id=acefa946ddb523539692393fbadd180255463477
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/perl-date-manip/Config.in            | 2 +-
 package/perl-date-manip/perl-date-manip.hash | 4 ++--
 package/perl-date-manip/perl-date-manip.mk   | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/perl-date-manip/Config.in b/package/perl-date-manip/Config.in
index 4ebcd4da43..d1aae7efde 100644
--- a/package/perl-date-manip/Config.in
+++ b/package/perl-date-manip/Config.in
@@ -3,4 +3,4 @@ config BR2_PACKAGE_PERL_DATE_MANIP
 	help
 	  Date manipulation routines.
 
-	  https://metacpan.org/release/Date-Manip
+	  https://github.com/SBECK-github/Date-Manip
diff --git a/package/perl-date-manip/perl-date-manip.hash b/package/perl-date-manip/perl-date-manip.hash
index dc267f525e..9762e7bc6c 100644
--- a/package/perl-date-manip/perl-date-manip.hash
+++ b/package/perl-date-manip/perl-date-manip.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5  77123a4cc874f72d7188f859626bdd84  Date-Manip-6.86.tar.gz
-sha256  b5203782d03c79aa5822cf33d1828aaa3b4db93a275d4a428c89f56f4713361f  Date-Manip-6.86.tar.gz
+md5  f9fe372c7abaf90e9da2ee7c3a4d32ff  Date-Manip-6.89.tar.gz
+sha256  5caaa9cd1e2b0a1b84124c373e02e89b17c89fdb8fc5bc5f75ac41d304a37617  Date-Manip-6.89.tar.gz
 
 # computed by scancpan
 sha256  8ba2a138654f8b59b7e1e3ad0d4c81918b9148ff95078b172ccbb45fa241431d  LICENSE
diff --git a/package/perl-date-manip/perl-date-manip.mk b/package/perl-date-manip/perl-date-manip.mk
index 35bce456e2..6eab7790cf 100644
--- a/package/perl-date-manip/perl-date-manip.mk
+++ b/package/perl-date-manip/perl-date-manip.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_DATE_MANIP_VERSION = 6.86
+PERL_DATE_MANIP_VERSION = 6.89
 PERL_DATE_MANIP_SOURCE = Date-Manip-$(PERL_DATE_MANIP_VERSION).tar.gz
 PERL_DATE_MANIP_SITE = $(BR2_CPAN_MIRROR)/authors/id/S/SB/SBECK
 PERL_DATE_MANIP_LICENSE = Artistic or GPL-1.0+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
