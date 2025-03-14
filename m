Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46D16C282EC
	for <buildroot@archiver.kernel.org>; Fri, 14 Mar 2025 22:24:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D71B6408A1;
	Fri, 14 Mar 2025 22:24:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nLQEpWlT2KAp; Fri, 14 Mar 2025 22:24:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A891D4099E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A891D4099E;
	Fri, 14 Mar 2025 22:24:47 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 4C129EA
 for <buildroot@buildroot.org>; Fri, 14 Mar 2025 22:24:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 43B49400B5
 for <buildroot@buildroot.org>; Fri, 14 Mar 2025 22:24:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8DCM_FvbyrL3 for <buildroot@buildroot.org>;
 Fri, 14 Mar 2025 22:24:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2977F400A8
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2977F400A8
 for <buildroot@buildroot.org>; Fri, 14 Mar 2025 22:24:45 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2174A88023; Fri, 14 Mar 2025 22:24:45 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Fri, 14 Mar 2025 22:41:55 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 291a3263e0993d3cba9100cf01cb3bc0c04deee7
X-Git-Newrev: e7cbf8979845d750520accdbc8a3ca120144c38b
X-Patchwork-Hint: ignore
Message-Id: <20250314222445.2174A88023@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/libglib2: bump version
 to 2.84.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=e7cbf8979845d750520accdbc8a3ca120144c38b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Upstream changelog:
https://gitlab.gnome.org/GNOME/glib/-/blob/main/NEWS?ref_type=heads

Note that upstream is planning to require C11 starting with 2.85.x,
and encourages people who would have problems with that to file
issues: https://gitlab.gnome.org/GNOME/glib/-/merge_requests/4473

Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/libglib2/Config.in     | 2 +-
 package/libglib2/libglib2.hash | 4 ++--
 package/libglib2/libglib2.mk   | 4 ++--
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/libglib2/Config.in b/package/libglib2/Config.in
index 393a7f4405..a875203da7 100644
--- a/package/libglib2/Config.in
+++ b/package/libglib2/Config.in
@@ -12,7 +12,7 @@ config BR2_PACKAGE_LIBGLIB2
 	help
 	  Low-level core library that forms the basis of GTK+ and GNOME.
 
-	  http://www.gtk.org/
+	  https://www.gtk.org/
 
 comment "libglib2 needs a toolchain w/ wchar, threads"
 	depends on BR2_USE_MMU
diff --git a/package/libglib2/libglib2.hash b/package/libglib2/libglib2.hash
index 8bd4bf157d..9bc244ff22 100644
--- a/package/libglib2/libglib2.hash
+++ b/package/libglib2/libglib2.hash
@@ -1,4 +1,4 @@
-# https://download.gnome.org/sources/glib/2.82/glib-2.82.5.sha256sum
-sha256  05c2031f9bdf6b5aba7a06ca84f0b4aced28b19bf1b50c6ab25cc675277cbc3f  glib-2.82.5.tar.xz
+# https://download.gnome.org/sources/glib/2.84/glib-2.84.0.sha256sum
+sha256  f8823600cb85425e2815cfad82ea20fdaa538482ab74e7293d58b3f64a5aff6a  glib-2.84.0.tar.xz
 # License files, locally calculated
 sha256  fa6f36630bb1e0c571d34b2bbdf188d08495c9dbf58f28cac112f303fc1f58fb  COPYING
diff --git a/package/libglib2/libglib2.mk b/package/libglib2/libglib2.mk
index 6c012c79c7..a1a3954914 100644
--- a/package/libglib2/libglib2.mk
+++ b/package/libglib2/libglib2.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-LIBGLIB2_VERSION_MAJOR = 2.82
-LIBGLIB2_VERSION = $(LIBGLIB2_VERSION_MAJOR).5
+LIBGLIB2_VERSION_MAJOR = 2.84
+LIBGLIB2_VERSION = $(LIBGLIB2_VERSION_MAJOR).0
 LIBGLIB2_SOURCE = glib-$(LIBGLIB2_VERSION).tar.xz
 LIBGLIB2_SITE = https://download.gnome.org/sources/glib/$(LIBGLIB2_VERSION_MAJOR)
 LIBGLIB2_LICENSE = LGPL-2.1+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
