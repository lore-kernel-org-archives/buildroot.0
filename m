Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2559FEB64DA
	for <buildroot@archiver.kernel.org>; Wed, 12 Jul 2023 19:28:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6A34541EAD;
	Wed, 12 Jul 2023 19:28:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6A34541EAD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kVfJmm5N1YIR; Wed, 12 Jul 2023 19:28:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 36B584194F;
	Wed, 12 Jul 2023 19:28:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 36B584194F
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id EDF021BF97D
 for <buildroot@lists.busybox.net>; Wed, 12 Jul 2023 19:27:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C787261267
 for <buildroot@lists.busybox.net>; Wed, 12 Jul 2023 19:27:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C787261267
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QeSzUHhBQT4E for <buildroot@lists.busybox.net>;
 Wed, 12 Jul 2023 19:27:45 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id E5BFA61203
 for <buildroot@buildroot.org>; Wed, 12 Jul 2023 19:27:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E5BFA61203
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D2DE986ED1; Wed, 12 Jul 2023 19:27:44 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 12 Jul 2023 21:27:28 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 13cdadb317c8b489b3dfd6c75aa0018f033c29bf
X-Git-Newrev: f2b5dc42abe5da70c09c8bdcb6cf2d5809d569a9
X-Patchwork-Hint: ignore
Message-Id: <20230712192744.D2DE986ED1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/perl-date-manip: bump to version
 6.92
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

commit: https://git.buildroot.net/buildroot/commit/?id=f2b5dc42abe5da70c09c8bdcb6cf2d5809d569a9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/perl-date-manip/perl-date-manip.hash | 6 +++---
 package/perl-date-manip/perl-date-manip.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/perl-date-manip/perl-date-manip.hash b/package/perl-date-manip/perl-date-manip.hash
index 9762e7bc6c..72741e413d 100644
--- a/package/perl-date-manip/perl-date-manip.hash
+++ b/package/perl-date-manip/perl-date-manip.hash
@@ -1,6 +1,6 @@
-# retrieved by scancpan from http://cpan.metacpan.org/
-md5  f9fe372c7abaf90e9da2ee7c3a4d32ff  Date-Manip-6.89.tar.gz
-sha256  5caaa9cd1e2b0a1b84124c373e02e89b17c89fdb8fc5bc5f75ac41d304a37617  Date-Manip-6.89.tar.gz
+# retrieved by scancpan from https://cpan.metacpan.org/
+md5  3ac4e55802837c396a30860492f33e67  Date-Manip-6.92.tar.gz
+sha256  ab962bd39ca09ec6fcfe7e5a6912af71b0c1f6f03e4ed2bef6e4471c9d367a13  Date-Manip-6.92.tar.gz
 
 # computed by scancpan
 sha256  8ba2a138654f8b59b7e1e3ad0d4c81918b9148ff95078b172ccbb45fa241431d  LICENSE
diff --git a/package/perl-date-manip/perl-date-manip.mk b/package/perl-date-manip/perl-date-manip.mk
index 6eab7790cf..8739caefd4 100644
--- a/package/perl-date-manip/perl-date-manip.mk
+++ b/package/perl-date-manip/perl-date-manip.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_DATE_MANIP_VERSION = 6.89
+PERL_DATE_MANIP_VERSION = 6.92
 PERL_DATE_MANIP_SOURCE = Date-Manip-$(PERL_DATE_MANIP_VERSION).tar.gz
 PERL_DATE_MANIP_SITE = $(BR2_CPAN_MIRROR)/authors/id/S/SB/SBECK
 PERL_DATE_MANIP_LICENSE = Artistic or GPL-1.0+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
