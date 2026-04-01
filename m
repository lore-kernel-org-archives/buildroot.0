Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1860F10FCAC0
	for <buildroot@archiver.kernel.org>; Wed,  1 Apr 2026 18:41:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4F44140753;
	Wed,  1 Apr 2026 18:41:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lSKitHmrLpur; Wed,  1 Apr 2026 18:41:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 793AD40706
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775068881;
	bh=5yh7ngN1cQ4Wzl/jMb+nLgGJFjD7r8QWKzIzVrrzUOc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=SgbbWZlkbUjD2OtUwiBW8jec0ylHW+Q0wb1F5/y1KjEhrSoNbeOkpPewC1fiwJeYO
	 jfqRyUn6+t72wheGp3bjyITK5FFj41A6LBC/4bm9uP3M+w/B88hDS3yD33vbZOeQcP
	 f3pCwnfL1hzK+0w2hwL6EWZx6oq0YshKMB+E91rKl8NxPYklaOYQknwu8BZHzOL0FA
	 ZPxKx0Un37b5OBOtlqvYXQkddPp/JyszbN1yO0lASnX1qsbckmHDxcoOpiPTZ9UqtC
	 ObQTPDAbyuq5Ik4mjG0KBzr/MPiuNDQ/mMeSOgue+FvTnYFVr1YkKo057eYyGsaPiH
	 N9sELWmcldLyA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 793AD40706;
	Wed,  1 Apr 2026 18:41:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 3E025177
 for <buildroot@buildroot.org>; Wed,  1 Apr 2026 18:41:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2419040706
 for <buildroot@buildroot.org>; Wed,  1 Apr 2026 18:41:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lw4HItPCL8Ew for <buildroot@buildroot.org>;
 Wed,  1 Apr 2026 18:41:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 26C1140711
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 26C1140711
 for <buildroot@buildroot.org>; Wed,  1 Apr 2026 18:41:19 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8C2EB7FEC6; Wed,  1 Apr 2026 18:41:18 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 1 Apr 2026 19:07:13 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d6900606188dec4c100a648715d8c702e74dd7cd
X-Git-Newrev: ea698142bdd04811fd85f5c6e492d4f896b32990
X-Patchwork-Hint: ignore
Message-Id: <20260401184118.8C2EB7FEC6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/giflib: update tarball URL
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/ea698142bdd04811fd85f5c6e492d4f896b32990
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Upstream moved all tarballs to new locations:
https://sourceforge.net/p/giflib/bugs/190/

Fixes:
https://autobuild.buildroot.net/results/c7f/c7f918fe7c879706c5a5875ea11c5f8b57007a85/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/giflib/giflib.hash | 2 +-
 package/giflib/giflib.mk   | 5 +++--
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/giflib/giflib.hash b/package/giflib/giflib.hash
index f11d4f1505..dcc384a523 100644
--- a/package/giflib/giflib.hash
+++ b/package/giflib/giflib.hash
@@ -1,4 +1,4 @@
-# From http://sourceforge.net/projects/giflib/files
+# From https://sourceforge.net/projects/giflib/files/giflib-5.x/
 md5  913dd251492134e235ee3c9a91987a4d  giflib-5.2.2.tar.gz
 sha1  608ba98d2dd8d03dfa7476f434d57de50a33e10b  giflib-5.2.2.tar.gz
 # Locally computed
diff --git a/package/giflib/giflib.mk b/package/giflib/giflib.mk
index f37ec8af21..00922ce2db 100644
--- a/package/giflib/giflib.mk
+++ b/package/giflib/giflib.mk
@@ -4,8 +4,9 @@
 #
 ################################################################################
 
-GIFLIB_VERSION = 5.2.2
-GIFLIB_SITE = http://downloads.sourceforge.net/project/giflib
+GIFLIB_VERSION_MAJOR = 5
+GIFLIB_VERSION = $(GIFLIB_VERSION_MAJOR).2.2
+GIFLIB_SITE = https://sourceforge.net/projects/giflib/files/giflib-$(GIFLIB_VERSION_MAJOR).x
 GIFLIB_INSTALL_STAGING = YES
 GIFLIB_LICENSE = MIT
 GIFLIB_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
