Return-Path: <SRS0=nMnf=MU=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80C0BC4338F
	for <buildroot@archiver.kernel.org>; Wed, 28 Jul 2021 19:13:28 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3EA9C60C51
	for <buildroot@archiver.kernel.org>; Wed, 28 Jul 2021 19:13:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3EA9C60C51
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0EDF2400ED;
	Wed, 28 Jul 2021 19:13:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GHafNLsevHgx; Wed, 28 Jul 2021 19:13:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C6E214012E;
	Wed, 28 Jul 2021 19:13:25 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2412E1C116E
 for <buildroot@lists.busybox.net>; Wed, 28 Jul 2021 19:12:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1FDA6608B5
 for <buildroot@lists.busybox.net>; Wed, 28 Jul 2021 19:12:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sMfs0Rrf_2nm for <buildroot@lists.busybox.net>;
 Wed, 28 Jul 2021 19:12:07 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4504F608B6
 for <buildroot@buildroot.org>; Wed, 28 Jul 2021 19:12:07 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id EE33F88EB0; Wed, 28 Jul 2021 18:37:20 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Wed, 28 Jul 2021 21:05:27 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 42b46562a286d0082638f9bac5346c523877b5c2
X-Git-Newrev: 4a1cd7581ae81e6b04b8f6182efa25ecb65e58c9
X-Patchwork-Hint: ignore
Message-Id: <20210728183720.EE33F88EB0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gupnp: bump to version 1.3.0
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=4a1cd7581ae81e6b04b8f6182efa25ecb65e58c9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Drop patch (already in version)
- Update license to LGPL-2.1+:
  https://gitlab.gnome.org/GNOME/gupnp/-/commit/37b22d0a050842d91dc64678518c425b1e2a3451

https://gitlab.gnome.org/GNOME/gupnp/-/blob/gupnp-1.3.0/NEWS

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...eck-for-stylesheet-existence-on-doc-build.patch | 73 ----------------------
 package/gupnp/gupnp.hash                           |  6 +-
 package/gupnp/gupnp.mk                             |  6 +-
 3 files changed, 6 insertions(+), 79 deletions(-)

diff --git a/package/gupnp/0001-doc-Check-for-stylesheet-existence-on-doc-build.patch b/package/gupnp/0001-doc-Check-for-stylesheet-existence-on-doc-build.patch
deleted file mode 100644
index 448996da04..0000000000
--- a/package/gupnp/0001-doc-Check-for-stylesheet-existence-on-doc-build.patch
+++ /dev/null
@@ -1,73 +0,0 @@
-From 7ce37c94596029358a67d732a82e4313f7b89135 Mon Sep 17 00:00:00 2001
-From: Jens Georg <mail@jensge.org>
-Date: Sun, 30 May 2021 13:13:00 +0200
-Subject: [PATCH] doc: Check for stylesheet existence on doc build
-
-Checking for xsltproc is not enough
-
-Fixes #17
-
-[Retrieved from:
-https://gitlab.gnome.org/GNOME/gupnp/-/commit/7ce37c94596029358a67d732a82e4313f7b89135]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- doc/meson.build | 34 +++++++++++++++++++++++++---------
- 1 file changed, 25 insertions(+), 9 deletions(-)
-
-diff --git a/doc/meson.build b/doc/meson.build
-index 26c32c9..eb69d07 100644
---- a/doc/meson.build
-+++ b/doc/meson.build
-@@ -30,6 +30,8 @@ endif
- 
- xsltproc = find_program('xsltproc', required: false)
- if xsltproc.found()
-+    stylesheet = 'http://docbook.sourceforge.net/release/xsl/current/manpages/docbook.xsl'
-+
-     xlstproc_flags = [
-         '--nonet',
-         '--xinclude',
-@@ -45,17 +47,31 @@ if xsltproc.found()
-         xsltproc,
-         xlstproc_flags,
-         '-o', '@OUTPUT@',
--        'http://docbook.sourceforge.net/release/xsl/current/manpages/docbook.xsl',
-+        stylesheet,
-         '@INPUT@'
-     ]
- 
--    custom_target(
--        'man 1 pages',
--        input: 'gupnp-binding-tool.xml',
--        output: 'gupnp-binding-tool-1.2.1',
--        command: xsltproc_args,
--        depend_files : version_xml,
--        install: true,
--        install_dir: join_paths(get_option('mandir'), 'man1')
-+    stylesheet_check = run_command(
-+        [
-+            xsltproc,
-+            xlstproc_flags,
-+            '--noout',
-+            stylesheet,
-+            'gupnp-binding-tool.xml'
-+        ]
-     )
-+    if (stylesheet_check.returncode() == 0)
-+        message('Stylesheet ' + stylesheet + ' available')
-+        custom_target(
-+            'man 1 pages',
-+            input: 'gupnp-binding-tool.xml',
-+            output: 'gupnp-binding-tool-1.2.1',
-+            command: xsltproc_args,
-+            depend_files : version_xml,
-+            install: true,
-+            install_dir: join_paths(get_option('mandir'), 'man1')
-+        )
-+    else
-+        message('Stylesheet ' + stylesheet + ' not found, not building man page')
-+    endif
- endif
--- 
-GitLab
-
diff --git a/package/gupnp/gupnp.hash b/package/gupnp/gupnp.hash
index 7064c9f6b8..d7868b99b9 100644
--- a/package/gupnp/gupnp.hash
+++ b/package/gupnp/gupnp.hash
@@ -1,5 +1,5 @@
-# Hash from: http://ftp.gnome.org/pub/gnome/sources/gupnp/1.2/gupnp-1.2.6.sha256sum:
-sha256  00b20f1e478a72deac92c34723693a2ac55789ed1e4bb4eed99eb4d62092aafd  gupnp-1.2.6.tar.xz
+# Hash from: http://ftp.gnome.org/pub/gnome/sources/gupnp/1.3/gupnp-1.3.0.sha256sum:
+sha256  df8279293aae45ea6bb6de1b13bf1988285c8f2f4f25569fb0d79325a8471666  gupnp-1.3.0.tar.xz
 
 # Hash for license file:
-sha256  d245807f90032872d1438d741ed21e2490e1175dc8aa3afa5ddb6c8e529b58e5  COPYING
+sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/gupnp/gupnp.mk b/package/gupnp/gupnp.mk
index 7ec0e6388c..421d12d3d2 100644
--- a/package/gupnp/gupnp.mk
+++ b/package/gupnp/gupnp.mk
@@ -4,11 +4,11 @@
 #
 ################################################################################
 
-GUPNP_VERSION_MAJOR = 1.2
-GUPNP_VERSION = $(GUPNP_VERSION_MAJOR).6
+GUPNP_VERSION_MAJOR = 1.3
+GUPNP_VERSION = $(GUPNP_VERSION_MAJOR).0
 GUPNP_SOURCE = gupnp-$(GUPNP_VERSION).tar.xz
 GUPNP_SITE = http://ftp.gnome.org/pub/gnome/sources/gupnp/$(GUPNP_VERSION_MAJOR)
-GUPNP_LICENSE = LGPL-2.0+
+GUPNP_LICENSE = LGPL-2.1+
 GUPNP_LICENSE_FILES = COPYING
 GUPNP_INSTALL_STAGING = YES
 GUPNP_DEPENDENCIES = host-pkgconf libglib2 libxml2 gssdp util-linux
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
