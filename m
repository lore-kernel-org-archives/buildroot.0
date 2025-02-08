Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43B1FC282D0
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 17:16:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8455D70C5D;
	Fri, 28 Feb 2025 17:16:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uM7l7P2ksXLU; Fri, 28 Feb 2025 17:16:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7476170C67
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7476170C67;
	Fri, 28 Feb 2025 17:16:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 068D71DD
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:45:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1C1BB4256A
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:31:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xdPjrF1pmys7 for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:31:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 86D4744731
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 86D4744731
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 80F1287AD6; Fri, 28 Feb 2025 16:30:37 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sat, 8 Feb 2025 22:48:27 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 912a8458a96a7ee3fb391a507244a9084b03fb72
X-Git-Newrev: 170642b68d00014a69ea88451303e264a37e85c2
X-Patchwork-Hint: ignore
Message-Id: <20250228163037.80F1287AD6@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/perl: bump to version
 5.40.1
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

commit: https://git.buildroot.net/buildroot/commit/?id=170642b68d00014a69ea88451303e264a37e85c2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

For release note, see:
https://perldoc.perl.org/5.40.1/perldelta

diff README:
    -Perl is Copyright (C) 1993 - 2024 by Larry Wall and others.
    +Perl is Copyright (C) 1993 - 2025 by Larry Wall and others.

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
[Julien: add link to release note]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/perl/perl.hash | 14 +++++++-------
 package/perl/perl.mk   |  4 ++--
 2 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/package/perl/perl.hash b/package/perl/perl.hash
index aba2844036..04ebf83b33 100644
--- a/package/perl/perl.hash
+++ b/package/perl/perl.hash
@@ -1,12 +1,12 @@
-# Hashes from: https://www.cpan.org/src/5.0/perl-5.40.0.tar.xz.{md5,sha1,sha256}.txt
-md5  cfe14ef0709b9687f9c514042e8e1e82  perl-5.40.0.tar.xz
-sha1  4a3af1f62afc611aa1552adc6c7ec389e9723bce  perl-5.40.0.tar.xz
-sha256  d5325300ad267624cb0b7d512cfdfcd74fa7fe00c455c5b51a6bd53e5e199ef9  perl-5.40.0.tar.xz
+# Hashes from: https://www.cpan.org/src/5.0/perl-5.40.1.tar.xz.{md5,sha1,sha256}.txt
+md5  bab3547a5cdf2302ee0396419d74a42e  perl-5.40.1.tar.xz
+sha1  4ffe5246c791df884363aed05ba81ba41cb02084  perl-5.40.1.tar.xz
+sha256  dfa20c2eef2b4af133525610bbb65dd13777ecf998c9c5b1ccf0d308e732ee3f  perl-5.40.1.tar.xz
 
-# Hash from: https://github.com/arsv/perl-cross/releases/download/1.6/perl-cross-1.6.hash
-sha256  5abf198ee50ce9e69eb68fede68c87f65241caa744e4203e97490fa59b45ed69  perl-cross-1.6.tar.gz
+# Hash from: https://github.com/arsv/perl-cross/releases/download/1.6.1/perl-cross-1.6.1.hash
+sha256  b5f4b4457bbd7be37adac8ee423beedbcdba8963a85f79770f5e701dabc5550f  perl-cross-1.6.1.tar.gz
 
 # Locally calculated
 sha256  dd90d4f42e4dcadf5a7c09eea0189d93c7b37ae560c91f0f6d5233ed3b9292a2  Artistic
 sha256  d77d235e41d54594865151f4751e835c5a82322b0e87ace266567c3391a4b912  Copying
-sha256  05fcf86432bd78754c7e325d4be44a5968344c01cc08c004b685172ea508ec23  README
+sha256  af805523b88a8ebb60afc009caaf247a498208502f7b8b3d9d3e329fcfb1dc3b  README
diff --git a/package/perl/perl.mk b/package/perl/perl.mk
index dc7c0b8d42..37b9fe185d 100644
--- a/package/perl/perl.mk
+++ b/package/perl/perl.mk
@@ -6,7 +6,7 @@
 
 # When updating the version here, also update utils/scancpan
 PERL_VERSION_MAJOR = 40
-PERL_VERSION = 5.$(PERL_VERSION_MAJOR).0
+PERL_VERSION = 5.$(PERL_VERSION_MAJOR).1
 PERL_SITE = https://www.cpan.org/src/5.0
 PERL_SOURCE = perl-$(PERL_VERSION).tar.xz
 PERL_LICENSE = Artistic or GPL-1.0+
@@ -15,7 +15,7 @@ PERL_CPE_ID_VENDOR = perl
 PERL_DEPENDENCIES = $(TARGET_NLS_DEPENDENCIES)
 PERL_INSTALL_STAGING = YES
 
-PERL_CROSS_VERSION = 1.6
+PERL_CROSS_VERSION = 1.6.1
 # DO NOT refactor with the github helper (the result is not the same)
 PERL_CROSS_SITE = https://github.com/arsv/perl-cross/releases/download/$(PERL_CROSS_VERSION)
 PERL_CROSS_SOURCE = perl-cross-$(PERL_CROSS_VERSION).tar.gz
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
