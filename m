Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D918FC46CD2
	for <buildroot@archiver.kernel.org>; Sat, 27 Jan 2024 20:57:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 80E7B60EF1;
	Sat, 27 Jan 2024 20:57:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 80E7B60EF1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id j8fEQxukx0tA; Sat, 27 Jan 2024 20:57:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B796B60E55;
	Sat, 27 Jan 2024 20:57:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B796B60E55
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 024191BF280
 for <buildroot@lists.busybox.net>; Sat, 27 Jan 2024 20:56:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B56E0416CE
 for <buildroot@lists.busybox.net>; Sat, 27 Jan 2024 20:56:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B56E0416CE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qs_I6Ebadq74 for <buildroot@lists.busybox.net>;
 Sat, 27 Jan 2024 20:56:29 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id D4FAE414EA
 for <buildroot@buildroot.org>; Sat, 27 Jan 2024 20:56:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D4FAE414EA
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C267F866A7; Sat, 27 Jan 2024 20:56:29 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 27 Jan 2024 21:48:06 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0faa9037fcd33d96574a03e81cd99a97581833c7
X-Git-Newrev: 2ca657b77f68ee3630d1333dc529465618882ab5
X-Patchwork-Hint: ignore
Message-Id: <20240127205629.C267F866A7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/perl-devel-stacktrace: bump to
 version 2.05
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

commit: https://git.buildroot.net/buildroot/commit/?id=2ca657b77f68ee3630d1333dc529465618882ab5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

diff LICENSE:
    -This software is Copyright (c) 2000 - 2019 by David Rolsky.
    +This software is Copyright (c) 2000 - 2024 by David Rolsky.

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/perl-devel-stacktrace/perl-devel-stacktrace.hash | 8 ++++----
 package/perl-devel-stacktrace/perl-devel-stacktrace.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/perl-devel-stacktrace/perl-devel-stacktrace.hash b/package/perl-devel-stacktrace/perl-devel-stacktrace.hash
index 4e64ef1716..7525ebbb9b 100644
--- a/package/perl-devel-stacktrace/perl-devel-stacktrace.hash
+++ b/package/perl-devel-stacktrace/perl-devel-stacktrace.hash
@@ -1,6 +1,6 @@
-# retrieved by scancpan from http://cpan.metacpan.org/
-md5  a5b09f7be7f2b10b525a9740676906d8  Devel-StackTrace-2.04.tar.gz
-sha256  cd3c03ed547d3d42c61fa5814c98296139392e7971c092e09a431f2c9f5d6855  Devel-StackTrace-2.04.tar.gz
+# retrieved by scancpan from https://cpan.metacpan.org/
+md5  b8ca19bb4c76e98a04373618db9c7c3c  Devel-StackTrace-2.05.tar.gz
+sha256  63cb6196e986a7e578c4d28b3c780e7194835bfc78b68eeb8f00599d4444888c  Devel-StackTrace-2.05.tar.gz
 
 # computed by scancpan
-sha256  dbd3162d261db5b40cac4d85afba619ec6a196398003c57b85c2333e7ef4c393  LICENSE
+sha256  74f17bdbecbdfb75998f953c1dedb27d72199c8f0b612b1fca7834e4bfd87f90  LICENSE
diff --git a/package/perl-devel-stacktrace/perl-devel-stacktrace.mk b/package/perl-devel-stacktrace/perl-devel-stacktrace.mk
index 0178390141..557f21bb85 100644
--- a/package/perl-devel-stacktrace/perl-devel-stacktrace.mk
+++ b/package/perl-devel-stacktrace/perl-devel-stacktrace.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_DEVEL_STACKTRACE_VERSION = 2.04
+PERL_DEVEL_STACKTRACE_VERSION = 2.05
 PERL_DEVEL_STACKTRACE_SOURCE = Devel-StackTrace-$(PERL_DEVEL_STACKTRACE_VERSION).tar.gz
 PERL_DEVEL_STACKTRACE_SITE = $(BR2_CPAN_MIRROR)/authors/id/D/DR/DROLSKY
 PERL_DEVEL_STACKTRACE_LICENSE = Artistic-2.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
