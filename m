Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4201BC46CD2
	for <buildroot@archiver.kernel.org>; Sat, 27 Jan 2024 20:58:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F231C60A98;
	Sat, 27 Jan 2024 20:57:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F231C60A98
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WLuhJXDOzEOf; Sat, 27 Jan 2024 20:57:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 428DD60F37;
	Sat, 27 Jan 2024 20:57:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 428DD60F37
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 59BB51BF280
 for <buildroot@lists.busybox.net>; Sat, 27 Jan 2024 20:56:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EE2CE40347
 for <buildroot@lists.busybox.net>; Sat, 27 Jan 2024 20:56:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EE2CE40347
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YdsTeAGdfCGs for <buildroot@lists.busybox.net>;
 Sat, 27 Jan 2024 20:56:30 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id F2EE8401C2
 for <buildroot@buildroot.org>; Sat, 27 Jan 2024 20:56:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F2EE8401C2
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D70CA866AA; Sat, 27 Jan 2024 20:56:29 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 27 Jan 2024 21:48:14 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 588897736e30afd9e0f8713e3004c4173dccc434
X-Git-Newrev: 402fe6ae46bcc4c3a1e191d7601c4fa4ee415055
X-Patchwork-Hint: ignore
Message-Id: <20240127205629.D70CA866AA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/perl-math-int64: bump to version
 0.57
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

commit: https://git.buildroot.net/buildroot/commit/?id=402fe6ae46bcc4c3a1e191d7601c4fa4ee415055
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/perl-math-int64/perl-math-int64.hash | 6 +++---
 package/perl-math-int64/perl-math-int64.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/perl-math-int64/perl-math-int64.hash b/package/perl-math-int64/perl-math-int64.hash
index 4f2374b107..7730b722a5 100644
--- a/package/perl-math-int64/perl-math-int64.hash
+++ b/package/perl-math-int64/perl-math-int64.hash
@@ -1,6 +1,6 @@
-# retrieved by scancpan from http://cpan.metacpan.org/
-md5  1ad0ce8b5e903dfe9f7ffbabd8a43014  Math-Int64-0.54.tar.gz
-sha256  dcfc51e698437ea6b9cefe0276215c56cdb6a7f85e3e24a2b6b4189f1960d351  Math-Int64-0.54.tar.gz
+# retrieved by scancpan from https://cpan.metacpan.org/
+md5  ed431cca1c403b1078fb1b3e2860d8de  Math-Int64-0.57.tar.gz
+sha256  12c60111c1cfceb257ac2ccc5b2e1721879efa09a1b0a73e8836afca107a7d75  Math-Int64-0.57.tar.gz
 
 # computed by scancpan
 sha256  59feedfdc4f99a746c54e06ac46c4627fb1e29be3bc71756184f92333600f72b  COPYING
diff --git a/package/perl-math-int64/perl-math-int64.mk b/package/perl-math-int64/perl-math-int64.mk
index 749ff60c97..c0abcf48a1 100644
--- a/package/perl-math-int64/perl-math-int64.mk
+++ b/package/perl-math-int64/perl-math-int64.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_MATH_INT64_VERSION = 0.54
+PERL_MATH_INT64_VERSION = 0.57
 PERL_MATH_INT64_SOURCE = Math-Int64-$(PERL_MATH_INT64_VERSION).tar.gz
 PERL_MATH_INT64_SITE = $(BR2_CPAN_MIRROR)/authors/id/S/SA/SALVA
 PERL_MATH_INT64_LICENSE = Artistic or GPL-1.0+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
