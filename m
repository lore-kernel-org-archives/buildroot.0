Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D7DFC54EBC
	for <buildroot@archiver.kernel.org>; Thu, 12 Jan 2023 11:43:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2F7CD414C5;
	Thu, 12 Jan 2023 11:43:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2F7CD414C5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FfsrkjUst587; Thu, 12 Jan 2023 11:43:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 28FF84051E;
	Thu, 12 Jan 2023 11:43:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 28FF84051E
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 22D761BF96B
 for <buildroot@lists.busybox.net>; Thu, 12 Jan 2023 11:43:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C09D560B77
 for <buildroot@lists.busybox.net>; Thu, 12 Jan 2023 11:43:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C09D560B77
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1meX6J8BiPvl for <buildroot@lists.busybox.net>;
 Thu, 12 Jan 2023 11:43:07 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9137C60C05
Received: from mailout02.t-online.de (mailout02.t-online.de [194.25.134.17])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9137C60C05
 for <buildroot@buildroot.org>; Thu, 12 Jan 2023 11:43:07 +0000 (UTC)
Received: from fwd86.dcpf.telekom.de (fwd86.aul.t-online.de [10.223.144.112])
 by mailout02.t-online.de (Postfix) with SMTP id B95CE5AF2;
 Thu, 12 Jan 2023 12:43:04 +0100 (CET)
Received: from fli4l.lan.fli4l ([84.161.180.73]) by fwd86.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1pFvz6-0XII9B0; Thu, 12 Jan 2023 12:43:04 +0100
Received: from bruckner.lan.fli4l ([192.168.1.1]:55010)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd.kuhls@t-online.de>) id 1pFvz6-0005Yw-0R;
 Thu, 12 Jan 2023 12:43:04 +0100
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Thu, 12 Jan 2023 12:42:58 +0100
Message-Id: <20230112114304.3007221-1-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1673523784-D924D9D3-A0293D57/0/0 CLEAN NORMAL
X-TOI-MSGID: 2359efd9-2425-4db0-a544-bcab1c92b820
Subject: [Buildroot] [PATCH 1/7] package/perl-file-listing: bump version to
 6.15
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Updated license hash due to typo/whitespace-only fixes in license file.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/perl-file-listing/perl-file-listing.hash | 6 +++---
 package/perl-file-listing/perl-file-listing.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/perl-file-listing/perl-file-listing.hash b/package/perl-file-listing/perl-file-listing.hash
index 2358965714..cb52c127cd 100644
--- a/package/perl-file-listing/perl-file-listing.hash
+++ b/package/perl-file-listing/perl-file-listing.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5  cf60a79563185391831613178a79b4cd  File-Listing-6.14.tar.gz
-sha256  15b3a4871e23164a36f226381b74d450af41f12cc94985f592a669fcac7b48ff  File-Listing-6.14.tar.gz
+md5  8ba34641a6c5a2ec1b0bf7064f68c535  File-Listing-6.15.tar.gz
+sha256  46c4fb9f9eb9635805e26b7ea55b54455e47302758a10ed2a0b92f392713770c  File-Listing-6.15.tar.gz
 
 # computed by scancpan
-sha256  7f0ccec295e6d7d2be1439cedd7caf6cc6247191f4c10ac56d91ee9bc265ba02  LICENSE
+sha256  287e6f0fdf2db790a24975b492cde64b210c16af7137f44373cbd03fcf844212  LICENSE
diff --git a/package/perl-file-listing/perl-file-listing.mk b/package/perl-file-listing/perl-file-listing.mk
index 61bbc18eb8..c8584ffa8a 100644
--- a/package/perl-file-listing/perl-file-listing.mk
+++ b/package/perl-file-listing/perl-file-listing.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_FILE_LISTING_VERSION = 6.14
+PERL_FILE_LISTING_VERSION = 6.15
 PERL_FILE_LISTING_SOURCE = File-Listing-$(PERL_FILE_LISTING_VERSION).tar.gz
 PERL_FILE_LISTING_SITE = $(BR2_CPAN_MIRROR)/authors/id/P/PL/PLICEASE
 PERL_FILE_LISTING_LICENSE = Artistic or GPL-1.0+
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
