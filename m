Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21FE1EB64DD
	for <buildroot@archiver.kernel.org>; Wed, 12 Jul 2023 19:28:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B173C404CC;
	Wed, 12 Jul 2023 19:28:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B173C404CC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2c8V7iCNG6_W; Wed, 12 Jul 2023 19:28:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5B188405A4;
	Wed, 12 Jul 2023 19:28:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5B188405A4
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 086571BF3BD
 for <buildroot@lists.busybox.net>; Wed, 12 Jul 2023 19:27:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D69A24012B
 for <buildroot@lists.busybox.net>; Wed, 12 Jul 2023 19:27:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D69A24012B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4LKde79qgkLl for <buildroot@lists.busybox.net>;
 Wed, 12 Jul 2023 19:27:45 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0264740A61
 for <buildroot@buildroot.org>; Wed, 12 Jul 2023 19:27:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0264740A61
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E583186ED3; Wed, 12 Jul 2023 19:27:44 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 12 Jul 2023 21:27:28 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 392f88becd87f12c5faf7fe4e3232ba60f50ad1a
X-Git-Newrev: 199a4d1dd1556878f6d0868ef638baa1607ad3d0
X-Patchwork-Hint: ignore
Message-Id: <20230712192744.E583186ED3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/perl-mojolicious: bump to version
 9.32
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

commit: https://git.buildroot.net/buildroot/commit/?id=199a4d1dd1556878f6d0868ef638baa1607ad3d0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/perl-mojolicious/perl-mojolicious.hash | 6 +++---
 package/perl-mojolicious/perl-mojolicious.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/perl-mojolicious/perl-mojolicious.hash b/package/perl-mojolicious/perl-mojolicious.hash
index 989eaf3419..6d8f500150 100644
--- a/package/perl-mojolicious/perl-mojolicious.hash
+++ b/package/perl-mojolicious/perl-mojolicious.hash
@@ -1,6 +1,6 @@
-# retrieved by scancpan from http://cpan.metacpan.org/
-md5  523193316a839ff56a447f0f0c2e5b36  Mojolicious-9.31.tar.gz
-sha256  cb96ccd7a5319321ec6f57633c88bf17193d45169f4d7846da254bb6f9ed8312  Mojolicious-9.31.tar.gz
+# retrieved by scancpan from https://cpan.metacpan.org/
+md5  e06ce611dd2444f2ca5b74f3a910b679  Mojolicious-9.32.tar.gz
+sha256  bc04c552ee24eaecc45feb8709d49c2901bc26fb82b4a1a8e17574e1cca083dc  Mojolicious-9.32.tar.gz
 
 # computed by scancpan
 sha256  19e2e0f2079ea1ce1576eb4ecc0575b33fe45b2b8e71f4aa589d6bedd1da4e0a  LICENSE
diff --git a/package/perl-mojolicious/perl-mojolicious.mk b/package/perl-mojolicious/perl-mojolicious.mk
index 618327d09d..63b02a5181 100644
--- a/package/perl-mojolicious/perl-mojolicious.mk
+++ b/package/perl-mojolicious/perl-mojolicious.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_MOJOLICIOUS_VERSION = 9.31
+PERL_MOJOLICIOUS_VERSION = 9.32
 PERL_MOJOLICIOUS_SOURCE = Mojolicious-$(PERL_MOJOLICIOUS_VERSION).tar.gz
 PERL_MOJOLICIOUS_SITE = $(BR2_CPAN_MIRROR)/authors/id/S/SR/SRI
 PERL_MOJOLICIOUS_LICENSE = Artistic-2.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
