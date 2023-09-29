Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79C85CE7AF3
	for <buildroot@archiver.kernel.org>; Fri, 29 Sep 2023 20:30:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 30C1880EB1;
	Fri, 29 Sep 2023 20:30:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 30C1880EB1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id I-9lY-b_x_sx; Fri, 29 Sep 2023 20:30:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 57B9B83CDF;
	Fri, 29 Sep 2023 20:30:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 57B9B83CDF
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7EF321BF995
 for <buildroot@lists.busybox.net>; Fri, 29 Sep 2023 20:28:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2820240150
 for <buildroot@lists.busybox.net>; Fri, 29 Sep 2023 20:28:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2820240150
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NricVe9CWj7C for <buildroot@lists.busybox.net>;
 Fri, 29 Sep 2023 20:28:28 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3BAA440BFB
 for <buildroot@buildroot.org>; Fri, 29 Sep 2023 20:28:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3BAA440BFB
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3683C83705; Fri, 29 Sep 2023 20:28:28 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 29 Sep 2023 22:25:48 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e76d46db79c9ca932cd2c0c9b829d7ed36529649
X-Git-Newrev: fd3288ed00be73f6cbc47b50fd2963889cfbbd7c
X-Patchwork-Hint: ignore
Message-Id: <20230929202828.3683C83705@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/perl-sub-install: bump to version
 0.929
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

commit: https://git.buildroot.net/buildroot/commit/?id=fd3288ed00be73f6cbc47b50fd2963889cfbbd7c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

LICENSE: remove trailing spaces
see https://metacpan.org/release/RJBS/Sub-Install-0.929/diff/RJBS/Sub-Install-0.928#LICENSE

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/perl-sub-install/perl-sub-install.hash | 8 ++++----
 package/perl-sub-install/perl-sub-install.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/perl-sub-install/perl-sub-install.hash b/package/perl-sub-install/perl-sub-install.hash
index bbac2a6377..834e589ee5 100644
--- a/package/perl-sub-install/perl-sub-install.hash
+++ b/package/perl-sub-install/perl-sub-install.hash
@@ -1,6 +1,6 @@
-# retrieved by scancpan from http://cpan.metacpan.org/
-md5  e1ce4f9cb6b2f6b8778b036c31afa5ab  Sub-Install-0.928.tar.gz
-sha256  61e567a7679588887b7b86d427bc476ea6d77fffe7e0d17d640f89007d98ef0f  Sub-Install-0.928.tar.gz
+# retrieved by scancpan from https://cpan.metacpan.org/
+md5  81baf186c62c71f0935c3ccf1c5964c8  Sub-Install-0.929.tar.gz
+sha256  80b1e281d8cd3b2b31dac711f5c8a1657a87cd80bbe69af3924bcbeb4e5db077  Sub-Install-0.929.tar.gz
 
 # computed by scancpan
-sha256  ad5fb5c05003488f924c60ead21694d629055c9db2ee2d9dd0cf0041b9fedaca  LICENSE
+sha256  0150501749fc390e1c747739a7c1d7661607f8f1d9a9f2ad279664f12e46104e  LICENSE
diff --git a/package/perl-sub-install/perl-sub-install.mk b/package/perl-sub-install/perl-sub-install.mk
index 85d60caf52..5e02a37ebb 100644
--- a/package/perl-sub-install/perl-sub-install.mk
+++ b/package/perl-sub-install/perl-sub-install.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_SUB_INSTALL_VERSION = 0.928
+PERL_SUB_INSTALL_VERSION = 0.929
 PERL_SUB_INSTALL_SOURCE = Sub-Install-$(PERL_SUB_INSTALL_VERSION).tar.gz
 PERL_SUB_INSTALL_SITE = $(BR2_CPAN_MIRROR)/authors/id/R/RJ/RJBS
 PERL_SUB_INSTALL_LICENSE = Artistic or GPL-1.0+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
