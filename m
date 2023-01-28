Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 905A6C636D6
	for <buildroot@archiver.kernel.org>; Tue, 21 Feb 2023 01:16:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 40C3F617B4;
	Tue, 21 Feb 2023 01:16:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 40C3F617B4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zZUGqu_qOIRl; Tue, 21 Feb 2023 01:16:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 701296FAD4;
	Tue, 21 Feb 2023 01:16:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 701296FAD4
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 91BF91BF2E3
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 21:02:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C456A6FBD5
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C456A6FBD5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4Y_ujygqqO-Z for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:42 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id E63646FBCB
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E63646FBCB
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D736A81979; Mon, 20 Feb 2023 20:52:41 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 28 Jan 2023 22:41:18 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 11133fbf22c64906655b7269d247ceeec28d0b41
X-Git-Newrev: 6ab730250b1da4ec72569f8cf95bc9df26ecb80d
X-Patchwork-Hint: ignore
Message-Id: <20230220205241.D736A81979@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/perl-exporter-tiny:
 bump to version 1.006000
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

commit: https://git.buildroot.net/buildroot/commit/?id=6ab730250b1da4ec72569f8cf95bc9df26ecb80d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

diff LICENSE:
-This software is copyright (c) 2020 by Toby Inkster.
+This software is copyright (c) 2022 by Toby Inkster.

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/perl-exporter-tiny/perl-exporter-tiny.hash | 7 +++----
 package/perl-exporter-tiny/perl-exporter-tiny.mk   | 4 ++--
 2 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/package/perl-exporter-tiny/perl-exporter-tiny.hash b/package/perl-exporter-tiny/perl-exporter-tiny.hash
index c714ef902e..0ecdf78482 100644
--- a/package/perl-exporter-tiny/perl-exporter-tiny.hash
+++ b/package/perl-exporter-tiny/perl-exporter-tiny.hash
@@ -1,7 +1,6 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5  485897322a2514b4d6ca90b2daacb7cd  Exporter-Tiny-1.002002.tar.gz
-sha256  00f0b95716b18157132c6c118ded8ba31392563d19e490433e9a65382e707101  Exporter-Tiny-1.002002.tar.gz
+md5  2d555e289eac6450052e8683c292cbf7  Exporter-Tiny-1.006000.tar.gz
+sha256  d95479ff085699d6422f7fc8306db085e34b626438deb82ec82d41df2295f400  Exporter-Tiny-1.006000.tar.gz
 
 # computed by scancpan
-sha256  f4cb223c8ac37d6ccd0e78b2892ca54a48a6adbe6a271c3c17c0226646297e66  COPYRIGHT
-sha256  1fb7395e76eabf94c421912d7d0a4f7fa745d49e1acb76b222c21d605b66bd25  LICENSE
+sha256  a4f85c6f4d6e8bdd37b7ab08013e3e3bee1fe8e910e20f8f54d5025ffe40f384  LICENSE
diff --git a/package/perl-exporter-tiny/perl-exporter-tiny.mk b/package/perl-exporter-tiny/perl-exporter-tiny.mk
index c7abfbae2d..489ee54e17 100644
--- a/package/perl-exporter-tiny/perl-exporter-tiny.mk
+++ b/package/perl-exporter-tiny/perl-exporter-tiny.mk
@@ -4,11 +4,11 @@
 #
 ################################################################################
 
-PERL_EXPORTER_TINY_VERSION = 1.002002
+PERL_EXPORTER_TINY_VERSION = 1.006000
 PERL_EXPORTER_TINY_SOURCE = Exporter-Tiny-$(PERL_EXPORTER_TINY_VERSION).tar.gz
 PERL_EXPORTER_TINY_SITE = $(BR2_CPAN_MIRROR)/authors/id/T/TO/TOBYINK
 PERL_EXPORTER_TINY_LICENSE = Artistic or GPL-1.0+
-PERL_EXPORTER_TINY_LICENSE_FILES = COPYRIGHT LICENSE
+PERL_EXPORTER_TINY_LICENSE_FILES = LICENSE
 PERL_EXPORTER_TINY_DISTNAME = Exporter-Tiny
 
 $(eval $(perl-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
