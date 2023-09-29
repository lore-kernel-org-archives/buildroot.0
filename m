Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68CEFE728F3
	for <buildroot@archiver.kernel.org>; Fri, 29 Sep 2023 20:29:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2445083D5F;
	Fri, 29 Sep 2023 20:29:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2445083D5F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WBmzFycZU5Gr; Fri, 29 Sep 2023 20:29:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5A1F483D63;
	Fri, 29 Sep 2023 20:29:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5A1F483D63
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 452BF1BF990
 for <buildroot@lists.busybox.net>; Fri, 29 Sep 2023 20:28:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 16FBF81FD1
 for <buildroot@lists.busybox.net>; Fri, 29 Sep 2023 20:28:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 16FBF81FD1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id h5lqpXUyljqv for <buildroot@lists.busybox.net>;
 Fri, 29 Sep 2023 20:28:28 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3FA3F834BB
 for <buildroot@buildroot.org>; Fri, 29 Sep 2023 20:28:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3FA3F834BB
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2D2E483709; Fri, 29 Sep 2023 20:28:28 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 29 Sep 2023 22:25:13 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3eb8d430ad771e0fce8751796ccd422c28b7495d
X-Git-Newrev: e76d46db79c9ca932cd2c0c9b829d7ed36529649
X-Patchwork-Hint: ignore
Message-Id: <20230929202828.2D2E483709@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/perl-plack: bump to version 1.0050
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

commit: https://git.buildroot.net/buildroot/commit/?id=e76d46db79c9ca932cd2c0c9b829d7ed36529649
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

LICENSE: remove trailing spaces
see https://metacpan.org/release/MIYAGAWA/Plack-1.0050/diff/MIYAGAWA/Plack-1.0048#LICENSE

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/perl-plack/perl-plack.hash | 8 ++++----
 package/perl-plack/perl-plack.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/perl-plack/perl-plack.hash b/package/perl-plack/perl-plack.hash
index c763d2c173..84d65ec525 100644
--- a/package/perl-plack/perl-plack.hash
+++ b/package/perl-plack/perl-plack.hash
@@ -1,6 +1,6 @@
-# retrieved by scancpan from http://cpan.metacpan.org/
-md5  36282b473b4521219c44a9db437b650f  Plack-1.0048.tar.gz
-sha256  30f5f25e19b437859156a2526f61ca9ab708d50d5730c279189403aabfe542a6  Plack-1.0048.tar.gz
+# retrieved by scancpan from https://cpan.metacpan.org/
+md5  0856a900a981769e3d79f0a10ccc3e65  Plack-1.0050.tar.gz
+sha256  d2651ade82ebbff7abe0a3a189fc932dadc4779186ce89468e56d0189eaa6ed4  Plack-1.0050.tar.gz
 
 # computed by scancpan
-sha256  fb67655b5d1adedef83aed2c79bf4f89c68d8595a7060815520173f663a3631d  LICENSE
+sha256  8a0c0ad4682691b5bc138e553636adfc8bb38f8885c4c44fd421ec8cc69c9a8f  LICENSE
diff --git a/package/perl-plack/perl-plack.mk b/package/perl-plack/perl-plack.mk
index b95f204d23..c39c3d8fd6 100644
--- a/package/perl-plack/perl-plack.mk
+++ b/package/perl-plack/perl-plack.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_PLACK_VERSION = 1.0048
+PERL_PLACK_VERSION = 1.0050
 PERL_PLACK_SOURCE = Plack-$(PERL_PLACK_VERSION).tar.gz
 PERL_PLACK_SITE = $(BR2_CPAN_MIRROR)/authors/id/M/MI/MIYAGAWA
 PERL_PLACK_DEPENDENCIES = host-perl-file-sharedir-install
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
