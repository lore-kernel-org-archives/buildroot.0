Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AC25C4332F
	for <buildroot@archiver.kernel.org>; Sat,  4 Nov 2023 20:49:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 48452607E3;
	Sat,  4 Nov 2023 20:49:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 48452607E3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 09KCAMlDxUZR; Sat,  4 Nov 2023 20:49:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 85FE760A8D;
	Sat,  4 Nov 2023 20:49:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 85FE760A8D
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id CEC4F1BF5AE
 for <buildroot@lists.busybox.net>; Sat,  4 Nov 2023 20:49:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B4F2941B90
 for <buildroot@lists.busybox.net>; Sat,  4 Nov 2023 20:49:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B4F2941B90
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HPvO8pKo-Gbz for <buildroot@lists.busybox.net>;
 Sat,  4 Nov 2023 20:49:08 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 259A341B8B
 for <buildroot@buildroot.org>; Sat,  4 Nov 2023 20:49:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 259A341B8B
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 144C784460; Sat,  4 Nov 2023 20:49:08 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 4 Nov 2023 21:48:08 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f2ba95853378dc7b3325dfa96e2f8acc3b0ac537
X-Git-Newrev: 4430f52215e9c888c24de622839a5169d18920d0
X-Patchwork-Hint: ignore
Message-Id: <20231104204908.144C784460@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/perl-module-build: bump to version
 0.4234
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

commit: https://git.buildroot.net/buildroot/commit/?id=4430f52215e9c888c24de622839a5169d18920d0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

LICENSE: now filled with a real content
see https://metacpan.org/release/LEONT/Module-Build-0.4234/diff/LEONT/Module-Build-0.4232#LICENSE

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/perl-module-build/perl-module-build.hash | 8 ++++----
 package/perl-module-build/perl-module-build.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/perl-module-build/perl-module-build.hash b/package/perl-module-build/perl-module-build.hash
index a2181290ee..590307e780 100644
--- a/package/perl-module-build/perl-module-build.hash
+++ b/package/perl-module-build/perl-module-build.hash
@@ -1,6 +1,6 @@
-# retrieved by scancpan from http://cpan.metacpan.org/
-md5  144885f1cbaf9420017bbed696ec6b83  Module-Build-0.4232.tar.gz
-sha256  67c82ee245d94ba06decfa25572ab75fdcd26a9009094289d8f45bc54041771b  Module-Build-0.4232.tar.gz
+# retrieved by scancpan from https://cpan.metacpan.org/
+md5  0032d0c0bc36a3b68ef41c947829d5e3  Module-Build-0.4234.tar.gz
+sha256  66aeac6127418be5e471ead3744648c766bd01482825c5b66652675f2bc86a8f  Module-Build-0.4234.tar.gz
 
 # computed by scancpan
-sha256  f35ac2cc6b808a38c42c2d230b875217b0a24bb51e5a497ebb630cbb3d806c3e  LICENSE
+sha256  af1570e8af55af52b4e86d040e2a993cb684566275c43c4d7a8b0cc5a90e08a4  LICENSE
diff --git a/package/perl-module-build/perl-module-build.mk b/package/perl-module-build/perl-module-build.mk
index d95a30647a..972902e047 100644
--- a/package/perl-module-build/perl-module-build.mk
+++ b/package/perl-module-build/perl-module-build.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_MODULE_BUILD_VERSION = 0.4232
+PERL_MODULE_BUILD_VERSION = 0.4234
 PERL_MODULE_BUILD_SOURCE = Module-Build-$(PERL_MODULE_BUILD_VERSION).tar.gz
 PERL_MODULE_BUILD_SITE = $(BR2_CPAN_MIRROR)/authors/id/L/LE/LEONT
 PERL_MODULE_BUILD_LICENSE = Artistic or GPL-1.0+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
