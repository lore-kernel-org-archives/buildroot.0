Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 089DDC282D0
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 16:39:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C85AC4EEDF;
	Fri, 28 Feb 2025 16:39:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 61AeV0SaUovj; Fri, 28 Feb 2025 16:39:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 636134F5B2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 636134F5B2;
	Fri, 28 Feb 2025 16:39:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1290F68
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:31:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E5D7E424B4
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:29:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CQdQv97f42qa for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:29:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 59CB9424C1
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 59CB9424C1
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:29:41 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 51DC386D17; Fri, 28 Feb 2025 16:29:41 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sun, 15 Dec 2024 18:07:41 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: b98d283f86b2ad280e11f8d4b1f4559beb3698d9
X-Git-Newrev: 4d250ed4018fc13159a69e3af7f40ac64c178319
X-Patchwork-Hint: ignore
Message-Id: <20250228162941.51DC386D17@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/perl-html-tagset: bump
 version to 3.24
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

commit: https://git.buildroot.net/buildroot/commit/?id=4d250ed4018fc13159a69e3af7f40ac64c178319
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Updated license filename and hash due to markdown conversion and updates
to copyright years:
https://github.com/libwww-perl/HTML-Tagset/commits/dev/README.md

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/perl-html-tagset/perl-html-tagset.hash | 6 +++---
 package/perl-html-tagset/perl-html-tagset.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/perl-html-tagset/perl-html-tagset.hash b/package/perl-html-tagset/perl-html-tagset.hash
index 648f75f649..2940ed6e59 100644
--- a/package/perl-html-tagset/perl-html-tagset.hash
+++ b/package/perl-html-tagset/perl-html-tagset.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5  d2bfa18fe1904df7f683e96611e87437  HTML-Tagset-3.20.tar.gz
-sha256  adb17dac9e36cd011f5243881c9739417fd102fce760f8de4e9be4c7131108e2  HTML-Tagset-3.20.tar.gz
+md5  f8db8974f5e7fe7df2a58263a7b00552  HTML-Tagset-3.24.tar.gz
+sha256  eb89e145a608ed1f8f141a57472ee5f69e67592a432dcd2e8b1dbb445f2b230b  HTML-Tagset-3.24.tar.gz
 
 # computed by scancpan
-sha256  275cc182d78ac2db6856442c5d334c925350fb56fe83ee3577f5850317423419  README
+sha256  ffe7dd5ca8da47fbbd00d35f57b2f17fffcc2b2eb91417d1e3df68fa1841262c  README.md
diff --git a/package/perl-html-tagset/perl-html-tagset.mk b/package/perl-html-tagset/perl-html-tagset.mk
index c6b5f69134..c1a9210087 100644
--- a/package/perl-html-tagset/perl-html-tagset.mk
+++ b/package/perl-html-tagset/perl-html-tagset.mk
@@ -4,11 +4,11 @@
 #
 ################################################################################
 
-PERL_HTML_TAGSET_VERSION = 3.20
+PERL_HTML_TAGSET_VERSION = 3.24
 PERL_HTML_TAGSET_SOURCE = HTML-Tagset-$(PERL_HTML_TAGSET_VERSION).tar.gz
 PERL_HTML_TAGSET_SITE = $(BR2_CPAN_MIRROR)/authors/id/P/PE/PETDANCE
 PERL_HTML_TAGSET_LICENSE = Artistic or GPL-1.0+
-PERL_HTML_TAGSET_LICENSE_FILES = README
+PERL_HTML_TAGSET_LICENSE_FILES = README.md
 PERL_HTML_TAGSET_DISTNAME = HTML-Tagset
 
 $(eval $(perl-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
