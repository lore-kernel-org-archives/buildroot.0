Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68C42C433EF
	for <buildroot@archiver.kernel.org>; Fri, 21 Jan 2022 21:27:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1CF3D60F61;
	Fri, 21 Jan 2022 21:27:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kmY59YMCozjv; Fri, 21 Jan 2022 21:27:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5C75160FD0;
	Fri, 21 Jan 2022 21:27:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id CEFF01BF30C
 for <buildroot@lists.busybox.net>; Fri, 21 Jan 2022 21:26:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B8D424012F
 for <buildroot@lists.busybox.net>; Fri, 21 Jan 2022 21:26:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mwa8V9U_loQP for <buildroot@lists.busybox.net>;
 Fri, 21 Jan 2022 21:26:20 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id DE8BE4019D
 for <buildroot@buildroot.org>; Fri, 21 Jan 2022 21:26:20 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 914798353E; Fri, 21 Jan 2022 21:19:38 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Fri, 21 Jan 2022 22:23:51 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7b9961c6e15661f74140dd7656ca4485a059bb73
X-Git-Newrev: 19f318a1e1126ddc002c3ad25edfe2197bdc3500
X-Patchwork-Hint: ignore
Message-Id: <20220121211938.914798353E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/perl-path-tiny: bump to version
 0.122
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

commit: https://git.buildroot.net/buildroot/commit/?id=19f318a1e1126ddc002c3ad25edfe2197bdc3500
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/perl-path-tiny/perl-path-tiny.hash | 4 ++--
 package/perl-path-tiny/perl-path-tiny.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/perl-path-tiny/perl-path-tiny.hash b/package/perl-path-tiny/perl-path-tiny.hash
index 6899d5c6b4..16f1a9a222 100644
--- a/package/perl-path-tiny/perl-path-tiny.hash
+++ b/package/perl-path-tiny/perl-path-tiny.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5  046d14dde6e3568aee5085487dd4769e  Path-Tiny-0.120.tar.gz
-sha256  66a1164981d449da46cc88383fe37f9e352e87e9570bfb960e43fe8ff016ee1b  Path-Tiny-0.120.tar.gz
+md5  f746d8da5d049a5523b1880666bb0992  Path-Tiny-0.122.tar.gz
+sha256  4bc6f76d0548ccd8b38cb66291a885bf0de453d0167562c7b82e8861afdcfb7c  Path-Tiny-0.122.tar.gz
 
 # computed by scancpan
 sha256  c1a19c0d83f668a784640c0b41e024f37b182ad38011b170f9200123e57f6070  LICENSE
diff --git a/package/perl-path-tiny/perl-path-tiny.mk b/package/perl-path-tiny/perl-path-tiny.mk
index cd4c3bc496..310feed98b 100644
--- a/package/perl-path-tiny/perl-path-tiny.mk
+++ b/package/perl-path-tiny/perl-path-tiny.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_PATH_TINY_VERSION = 0.120
+PERL_PATH_TINY_VERSION = 0.122
 PERL_PATH_TINY_SOURCE = Path-Tiny-$(PERL_PATH_TINY_VERSION).tar.gz
 PERL_PATH_TINY_SITE = $(BR2_CPAN_MIRROR)/authors/id/D/DA/DAGOLDEN
 PERL_PATH_TINY_LICENSE = Apache-2.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
