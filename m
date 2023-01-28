Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D6FBC61DA3
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 23:44:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C6BAA84029;
	Mon, 20 Feb 2023 23:44:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C6BAA84029
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9ZuRtWA1u_UI; Mon, 20 Feb 2023 23:44:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D90F484017;
	Mon, 20 Feb 2023 23:44:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D90F484017
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 820121BF2E3
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:58:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C65044176F
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C65044176F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yPvNqp4ngyrC for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:42 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id F260F41772
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F260F41772
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EE3918648F; Mon, 20 Feb 2023 20:52:41 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 28 Jan 2023 22:41:21 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 8e1dde2258755213710d3f5afd716025d2140f16
X-Git-Newrev: e235a1daa4e24f1eb9f1d9307003fa29cfeedd88
X-Patchwork-Hint: ignore
Message-Id: <20230220205241.EE3918648F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/perl-module-build:
 bump to version 0.4232
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

commit: https://git.buildroot.net/buildroot/commit/?id=e235a1daa4e24f1eb9f1d9307003fa29cfeedd88
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/perl-module-build/perl-module-build.hash | 4 ++--
 package/perl-module-build/perl-module-build.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/perl-module-build/perl-module-build.hash b/package/perl-module-build/perl-module-build.hash
index 09bc5f374a..a2181290ee 100644
--- a/package/perl-module-build/perl-module-build.hash
+++ b/package/perl-module-build/perl-module-build.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5  066b193e461d7dfe1eca17a139353001  Module-Build-0.4231.tar.gz
-sha256  7e0f4c692c1740c1ac84ea14d7ea3d8bc798b2fb26c09877229e04f430b2b717  Module-Build-0.4231.tar.gz
+md5  144885f1cbaf9420017bbed696ec6b83  Module-Build-0.4232.tar.gz
+sha256  67c82ee245d94ba06decfa25572ab75fdcd26a9009094289d8f45bc54041771b  Module-Build-0.4232.tar.gz
 
 # computed by scancpan
 sha256  f35ac2cc6b808a38c42c2d230b875217b0a24bb51e5a497ebb630cbb3d806c3e  LICENSE
diff --git a/package/perl-module-build/perl-module-build.mk b/package/perl-module-build/perl-module-build.mk
index f5cab36890..d95a30647a 100644
--- a/package/perl-module-build/perl-module-build.mk
+++ b/package/perl-module-build/perl-module-build.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_MODULE_BUILD_VERSION = 0.4231
+PERL_MODULE_BUILD_VERSION = 0.4232
 PERL_MODULE_BUILD_SOURCE = Module-Build-$(PERL_MODULE_BUILD_VERSION).tar.gz
 PERL_MODULE_BUILD_SITE = $(BR2_CPAN_MIRROR)/authors/id/L/LE/LEONT
 PERL_MODULE_BUILD_LICENSE = Artistic or GPL-1.0+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
