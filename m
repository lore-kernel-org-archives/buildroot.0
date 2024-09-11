Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5B9DEE49B0
	for <buildroot@archiver.kernel.org>; Wed, 11 Sep 2024 13:59:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 887B940F9B;
	Wed, 11 Sep 2024 13:59:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gZ6-4T8KoORQ; Wed, 11 Sep 2024 13:59:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BD56440E7F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id BD56440E7F;
	Wed, 11 Sep 2024 13:59:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 19BFE1BF342
 for <buildroot@lists.busybox.net>; Wed, 11 Sep 2024 13:59:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A9FF460B49
 for <buildroot@lists.busybox.net>; Wed, 11 Sep 2024 13:59:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jVs1I6yU9vKb for <buildroot@lists.busybox.net>;
 Wed, 11 Sep 2024 13:59:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BF91F60737
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id BF91F60737
 for <buildroot@buildroot.org>; Wed, 11 Sep 2024 13:59:19 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B86E686F70; Wed, 11 Sep 2024 13:59:19 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 11 Sep 2024 15:26:10 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1bc046faf939ea7c9df82c5e04feea3e0431e801
X-Git-Newrev: 3134f865e9e501d5466225c193c3e1145639e04e
X-Patchwork-Hint: ignore
Message-Id: <20240911135919.B86E686F70@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/perl-devel-size: bump to version
 0.84
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

commit: https://git.buildroot.net/buildroot/commit/?id=3134f865e9e501d5466225c193c3e1145639e04e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/perl-devel-size/perl-devel-size.hash | 6 +++---
 package/perl-devel-size/perl-devel-size.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/perl-devel-size/perl-devel-size.hash b/package/perl-devel-size/perl-devel-size.hash
index c0fbcf29c5..6a5d88af4d 100644
--- a/package/perl-devel-size/perl-devel-size.hash
+++ b/package/perl-devel-size/perl-devel-size.hash
@@ -1,6 +1,6 @@
-# retrieved by scancpan from http://cpan.metacpan.org/
-md5  0b5335d69402c75d5ab9978027ae2f66  Devel-Size-0.83.tar.gz
-sha256  757a67e0aa59ae103ea5ca092cbecc025644ebdc326731688ffab6f8823ef4b3  Devel-Size-0.83.tar.gz
+# retrieved by scancpan from https://cpan.metacpan.org/
+md5  4978c07f54a730b16a705e074d7685e3  Devel-Size-0.84.tar.gz
+sha256  db2e4d65f688dbf59273b5e82101ac3f1a66f665afb0594dce168b8650a4d0e4  Devel-Size-0.84.tar.gz
 
 # computed by scancpan
 sha256  fca4ebe3a1f329aa33a4d259c0a5b136a15a40b987c60c2dd6f1007bb01a1513  README
diff --git a/package/perl-devel-size/perl-devel-size.mk b/package/perl-devel-size/perl-devel-size.mk
index 9acc67c9ea..85ee2483d9 100644
--- a/package/perl-devel-size/perl-devel-size.mk
+++ b/package/perl-devel-size/perl-devel-size.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_DEVEL_SIZE_VERSION = 0.83
+PERL_DEVEL_SIZE_VERSION = 0.84
 PERL_DEVEL_SIZE_SOURCE = Devel-Size-$(PERL_DEVEL_SIZE_VERSION).tar.gz
 PERL_DEVEL_SIZE_SITE = $(BR2_CPAN_MIRROR)/authors/id/N/NW/NWCLARK
 PERL_DEVEL_SIZE_LICENSE = Artistic or GPL-1.0+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
