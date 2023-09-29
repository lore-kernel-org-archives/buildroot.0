Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2F66CE7AF3
	for <buildroot@archiver.kernel.org>; Fri, 29 Sep 2023 20:29:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9134381F6C;
	Fri, 29 Sep 2023 20:29:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9134381F6C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IEWVuGr1dufx; Fri, 29 Sep 2023 20:29:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D9D8D81F3B;
	Fri, 29 Sep 2023 20:29:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D9D8D81F3B
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6EAFE1BF997
 for <buildroot@lists.busybox.net>; Fri, 29 Sep 2023 20:28:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E4BA440223
 for <buildroot@lists.busybox.net>; Fri, 29 Sep 2023 20:28:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E4BA440223
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fBC7FeSsJGE7 for <buildroot@lists.busybox.net>;
 Fri, 29 Sep 2023 20:28:28 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0AD3640AA2
 for <buildroot@buildroot.org>; Fri, 29 Sep 2023 20:28:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0AD3640AA2
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id ED32083709; Fri, 29 Sep 2023 20:28:27 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 29 Sep 2023 22:20:50 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5e5eaf1b69ab476be62fe48e98563c6cb2277d66
X-Git-Newrev: f1de978fc29fd3a4bfc23ae33fa286e19a5cdafe
X-Patchwork-Hint: ignore
Message-Id: <20230929202827.ED32083709@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/perl-file-sharedir-install: bump
 to version 0.14
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

commit: https://git.buildroot.net/buildroot/commit/?id=f1de978fc29fd3a4bfc23ae33fa286e19a5cdafe
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

LICENSE: remove trailing spaces
see https://metacpan.org/release/ETHER/File-ShareDir-Install-0.14/diff/ETHER/File-ShareDir-Install-0.13#LICENSE

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../perl-file-sharedir-install/perl-file-sharedir-install.hash    | 8 ++++----
 package/perl-file-sharedir-install/perl-file-sharedir-install.mk  | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/perl-file-sharedir-install/perl-file-sharedir-install.hash b/package/perl-file-sharedir-install/perl-file-sharedir-install.hash
index b462d8e683..bfc06ab22a 100644
--- a/package/perl-file-sharedir-install/perl-file-sharedir-install.hash
+++ b/package/perl-file-sharedir-install/perl-file-sharedir-install.hash
@@ -1,6 +1,6 @@
-# retrieved by scancpan from http://cpan.metacpan.org/
-md5  5eabd44a5d7d84bf2e8e502491226287  File-ShareDir-Install-0.13.tar.gz
-sha256  45befdf0d95cbefe7c25a1daf293d85f780d6d2576146546e6828aad26e580f9  File-ShareDir-Install-0.13.tar.gz
+# retrieved by scancpan from https://cpan.metacpan.org/
+md5  bac4d924f3d863b00648ab56ec0dcbdc  File-ShareDir-Install-0.14.tar.gz
+sha256  8f9533b198f2d4a9a5288cbc7d224f7679ad05a7a8573745599789428bc5aea0  File-ShareDir-Install-0.14.tar.gz
 
 # computed by scancpan
-sha256  c207ca1c71c16a443d875a78d8aeccfbe550da502cd7fda24819548afb04fb5c  LICENSE
+sha256  6b5ade128fd47c452beec6dc31b3386482379fafb88f7f1962c7355db322d2ac  LICENSE
diff --git a/package/perl-file-sharedir-install/perl-file-sharedir-install.mk b/package/perl-file-sharedir-install/perl-file-sharedir-install.mk
index 3653a4bade..4f152e1b5d 100644
--- a/package/perl-file-sharedir-install/perl-file-sharedir-install.mk
+++ b/package/perl-file-sharedir-install/perl-file-sharedir-install.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_FILE_SHAREDIR_INSTALL_VERSION = 0.13
+PERL_FILE_SHAREDIR_INSTALL_VERSION = 0.14
 PERL_FILE_SHAREDIR_INSTALL_SOURCE = File-ShareDir-Install-$(PERL_FILE_SHAREDIR_INSTALL_VERSION).tar.gz
 PERL_FILE_SHAREDIR_INSTALL_SITE = $(BR2_CPAN_MIRROR)/authors/id/E/ET/ETHER
 PERL_FILE_SHAREDIR_INSTALL_LICENSE = Artistic or GPL-1.0+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
