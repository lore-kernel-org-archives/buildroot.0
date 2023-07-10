Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55DF6EB64D9
	for <buildroot@archiver.kernel.org>; Mon, 10 Jul 2023 16:10:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F16E660FCB;
	Mon, 10 Jul 2023 16:10:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F16E660FCB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uZ2Bm8rquEvZ; Mon, 10 Jul 2023 16:10:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 30FAB60FF9;
	Mon, 10 Jul 2023 16:10:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 30FAB60FF9
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9305D1BF955
 for <buildroot@lists.busybox.net>; Mon, 10 Jul 2023 16:09:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6D42E81F2C
 for <buildroot@lists.busybox.net>; Mon, 10 Jul 2023 16:09:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6D42E81F2C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 66-dA_StF_gE for <buildroot@lists.busybox.net>;
 Mon, 10 Jul 2023 16:09:32 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id F2D3A81F40
 for <buildroot@buildroot.org>; Mon, 10 Jul 2023 16:09:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F2D3A81F40
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E2F0286A5A; Mon, 10 Jul 2023 16:09:31 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 10 Jul 2023 18:07:31 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ccdeeb03c3312347fcf7ad8d153dedd9ff32ba2e
X-Git-Newrev: 6e0f16e2b0a358f60a682952d45b329d8e73f670
X-Patchwork-Hint: ignore
Message-Id: <20230710160931.E2F0286A5A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/perl-uri: bump version to 5.19
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

commit: https://git.buildroot.net/buildroot/commit/?id=6e0f16e2b0a358f60a682952d45b329d8e73f670
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Removed md5 hash.

Switch to new maintainer repo as indicated by metacpan.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/perl-uri/perl-uri.hash | 3 +--
 package/perl-uri/perl-uri.mk   | 4 ++--
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/package/perl-uri/perl-uri.hash b/package/perl-uri/perl-uri.hash
index daf043347f..eaf57623b3 100644
--- a/package/perl-uri/perl-uri.hash
+++ b/package/perl-uri/perl-uri.hash
@@ -1,6 +1,5 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5  63675c429cfb1df73d7d21a9302e1000  URI-5.17.tar.gz
-sha256  5f7e42b769cb27499113cfae4b786c37d49e7c7d32dbb469602cd808308568f8  URI-5.17.tar.gz
+sha256  8fed5f819905c8a8e18f4447034322d042c3536b43c13ac1f09ba92e1a50a394  URI-5.19.tar.gz
 
 # computed by scancpan
 sha256  d4f0b7a8771dcb1eee79a38c2e466eb997e23565a6687dd1900a2027eabe12a0  LICENSE
diff --git a/package/perl-uri/perl-uri.mk b/package/perl-uri/perl-uri.mk
index d4bfcb44ef..a7fab863a6 100644
--- a/package/perl-uri/perl-uri.mk
+++ b/package/perl-uri/perl-uri.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PERL_URI_VERSION = 5.17
+PERL_URI_VERSION = 5.19
 PERL_URI_SOURCE = URI-$(PERL_URI_VERSION).tar.gz
-PERL_URI_SITE = $(BR2_CPAN_MIRROR)/authors/id/O/OA/OALDERS
+PERL_URI_SITE = $(BR2_CPAN_MIRROR)/authors/id/S/SI/SIMBABQUE
 PERL_URI_LICENSE = Artistic or GPL-1.0+
 PERL_URI_LICENSE_FILES = LICENSE
 PERL_URI_DISTNAME = URI
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
