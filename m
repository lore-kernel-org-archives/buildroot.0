Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A45FC61DA3
	for <buildroot@archiver.kernel.org>; Tue, 21 Feb 2023 00:33:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C52A44F31B;
	Tue, 21 Feb 2023 00:33:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C52A44F31B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CE7sAXVI8azj; Tue, 21 Feb 2023 00:33:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3B7A24F2FD;
	Tue, 21 Feb 2023 00:33:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3B7A24F2FD
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 85E451BF8C7
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 21:00:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 963BD6FB5D
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 963BD6FB5D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id p2MkTyQrjqtb for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:29 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id B564F6F9F4
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B564F6F9F4
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A2411828C8; Mon, 20 Feb 2023 20:52:29 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 12 Jan 2023 20:10:24 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 7e9929e9a826d93ff47060267fe6cc1d9ec35718
X-Git-Newrev: 57a907fb3b1c303c2402268450616a13f8571a5d
X-Patchwork-Hint: ignore
Message-Id: <20230220205229.A2411828C8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/perl-file-listing:
 bump version to 6.15
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

commit: https://git.buildroot.net/buildroot/commit/?id=57a907fb3b1c303c2402268450616a13f8571a5d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Updated license hash due to typo/whitespace-only fixes in license file.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
