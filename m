Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79156EE49AB
	for <buildroot@archiver.kernel.org>; Wed, 11 Sep 2024 14:00:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4815C41025;
	Wed, 11 Sep 2024 14:00:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0kw1VwhqOlJa; Wed, 11 Sep 2024 14:00:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C821E41011
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C821E41011;
	Wed, 11 Sep 2024 14:00:10 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9316A1BF20B
 for <buildroot@lists.busybox.net>; Wed, 11 Sep 2024 13:59:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2CCFE60B1D
 for <buildroot@lists.busybox.net>; Wed, 11 Sep 2024 13:59:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cI2-ZMKqm-YW for <buildroot@lists.busybox.net>;
 Wed, 11 Sep 2024 13:59:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F203560AB9
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id F203560AB9
 for <buildroot@buildroot.org>; Wed, 11 Sep 2024 13:59:19 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EE82786F70; Wed, 11 Sep 2024 13:59:19 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 11 Sep 2024 15:26:14 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 82f5b98f9ca774338aed20849964212a06a2afae
X-Git-Newrev: ff662a1f0825c94ef2278cab71e9fa4f58d2b417
X-Patchwork-Hint: ignore
Message-Id: <20240911135919.EE82786F70@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/perl-module-build-tiny: bump to
 version 0.051
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

commit: https://git.buildroot.net/buildroot/commit/?id=ff662a1f0825c94ef2278cab71e9fa4f58d2b417
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/perl-module-build-tiny/perl-module-build-tiny.hash | 4 ++--
 package/perl-module-build-tiny/perl-module-build-tiny.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/perl-module-build-tiny/perl-module-build-tiny.hash b/package/perl-module-build-tiny/perl-module-build-tiny.hash
index 7b503ff061..6b467c3ec1 100644
--- a/package/perl-module-build-tiny/perl-module-build-tiny.hash
+++ b/package/perl-module-build-tiny/perl-module-build-tiny.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from https://cpan.metacpan.org/
-md5  de9814b3c22825837438fc70adad58ac  Module-Build-Tiny-0.047.tar.gz
-sha256  71260e9421b93c33dd1b3e7d0cf15f759c0ca7c753fa840279ec3be70f8f8c9d  Module-Build-Tiny-0.047.tar.gz
+md5  15b4434617b61e70315c0838c020a48e  Module-Build-Tiny-0.051.tar.gz
+sha256  74fdce35e8cd4d787bc2d4fc1d43a291b7bbced4e94dc5fc592bd81ca93a98e9  Module-Build-Tiny-0.051.tar.gz
 
 # computed by scancpan
 sha256  1ce3282467869416f29b0c5f7773d1b80181fb9e08bef64e3829e8c53e19b64e  LICENSE
diff --git a/package/perl-module-build-tiny/perl-module-build-tiny.mk b/package/perl-module-build-tiny/perl-module-build-tiny.mk
index e2e3d83e7c..ca2fddeeb6 100644
--- a/package/perl-module-build-tiny/perl-module-build-tiny.mk
+++ b/package/perl-module-build-tiny/perl-module-build-tiny.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_MODULE_BUILD_TINY_VERSION = 0.047
+PERL_MODULE_BUILD_TINY_VERSION = 0.051
 PERL_MODULE_BUILD_TINY_SOURCE = Module-Build-Tiny-$(PERL_MODULE_BUILD_TINY_VERSION).tar.gz
 PERL_MODULE_BUILD_TINY_SITE = $(BR2_CPAN_MIRROR)/authors/id/L/LE/LEONT
 HOST_PERL_MODULE_BUILD_TINY_DEPENDENCIES = \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
