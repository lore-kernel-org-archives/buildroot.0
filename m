Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83537C433F5
	for <buildroot@archiver.kernel.org>; Fri, 21 Jan 2022 21:27:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 39A9B60FD7;
	Fri, 21 Jan 2022 21:27:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ku1aEVRcJLxD; Fri, 21 Jan 2022 21:27:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 79B9260F61;
	Fri, 21 Jan 2022 21:27:47 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 157C71BF30C
 for <buildroot@lists.busybox.net>; Fri, 21 Jan 2022 21:26:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2699260F6B
 for <buildroot@lists.busybox.net>; Fri, 21 Jan 2022 21:26:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VBF27_oPKKFn for <buildroot@lists.busybox.net>;
 Fri, 21 Jan 2022 21:26:21 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id DC8FA60F6E
 for <buildroot@buildroot.org>; Fri, 21 Jan 2022 21:26:20 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 99C1B82B4C; Fri, 21 Jan 2022 21:19:38 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Fri, 21 Jan 2022 22:23:54 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 19f318a1e1126ddc002c3ad25edfe2197bdc3500
X-Git-Newrev: 3d3a26867b4c28d66314416b4b515a9686f9c2d3
X-Patchwork-Hint: ignore
Message-Id: <20220121211938.99C1B82B4C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/perl-try-tiny: bump to version 0.31
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

commit: https://git.buildroot.net/buildroot/commit/?id=3d3a26867b4c28d66314416b4b515a9686f9c2d3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/perl-try-tiny/perl-try-tiny.hash | 6 +++---
 package/perl-try-tiny/perl-try-tiny.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/perl-try-tiny/perl-try-tiny.hash b/package/perl-try-tiny/perl-try-tiny.hash
index ed4d8ac74f..7aa88724f0 100644
--- a/package/perl-try-tiny/perl-try-tiny.hash
+++ b/package/perl-try-tiny/perl-try-tiny.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5    eb362c3cb32c42f9f28de9ddb7f2ead6 Try-Tiny-0.30.tar.gz
-sha256 da5bd0d5c903519bbf10bb9ba0cb7bcac0563882bcfe4503aee3fb143eddef6b Try-Tiny-0.30.tar.gz
+md5  993a29ee8a03c9bd9c2f7c53d1082a03  Try-Tiny-0.31.tar.gz
+sha256  3300d31d8a4075b26d8f46ce864a1d913e0e8467ceeba6655d5d2b2e206c11be  Try-Tiny-0.31.tar.gz
 
 # computed by scancpan
-sha256 f1864ede834871a1207fcd19838b6bd5e1ff0a8704f5cc523fc397126041ed0b LICENCE
+sha256  f1864ede834871a1207fcd19838b6bd5e1ff0a8704f5cc523fc397126041ed0b  LICENCE
diff --git a/package/perl-try-tiny/perl-try-tiny.mk b/package/perl-try-tiny/perl-try-tiny.mk
index f13e2ee59f..cd2421a3cb 100644
--- a/package/perl-try-tiny/perl-try-tiny.mk
+++ b/package/perl-try-tiny/perl-try-tiny.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_TRY_TINY_VERSION = 0.30
+PERL_TRY_TINY_VERSION = 0.31
 PERL_TRY_TINY_SOURCE = Try-Tiny-$(PERL_TRY_TINY_VERSION).tar.gz
 PERL_TRY_TINY_SITE = $(BR2_CPAN_MIRROR)/authors/id/E/ET/ETHER
 PERL_TRY_TINY_LICENSE = MIT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
