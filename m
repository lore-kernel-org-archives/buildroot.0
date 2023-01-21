Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FA6BC61DA3
	for <buildroot@archiver.kernel.org>; Tue, 21 Feb 2023 01:05:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2B69C610B1;
	Tue, 21 Feb 2023 01:05:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2B69C610B1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HmmIi7EVC6Eh; Tue, 21 Feb 2023 01:05:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 51E77612A5;
	Tue, 21 Feb 2023 01:05:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 51E77612A5
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B15301BF2E3
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 21:01:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 972B16FBA8
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 972B16FBA8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8VMeDE0_4eqq for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:37 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id CA2BC6FB8C
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CA2BC6FB8C
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B5224828C8; Mon, 20 Feb 2023 20:52:37 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 21 Jan 2023 13:52:04 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: b0d9d97b3434e41879046c0994dd1b5708c46007
X-Git-Newrev: 14d70068be395f47a034e4275e9a26e19b2804db
X-Patchwork-Hint: ignore
Message-Id: <20230220205237.B5224828C8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/gdk-pixbuf-xlib:
 switch to https download
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

commit: https://git.buildroot.net/buildroot/commit/?id=14d70068be395f47a034e4275e9a26e19b2804db
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Daniel Lang <d.lang@abatec.at>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/gdk-pixbuf-xlib/gdk-pixbuf-xlib.hash | 2 +-
 package/gdk-pixbuf-xlib/gdk-pixbuf-xlib.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/gdk-pixbuf-xlib/gdk-pixbuf-xlib.hash b/package/gdk-pixbuf-xlib/gdk-pixbuf-xlib.hash
index e7f74e2b4b..7298ef50c4 100644
--- a/package/gdk-pixbuf-xlib/gdk-pixbuf-xlib.hash
+++ b/package/gdk-pixbuf-xlib/gdk-pixbuf-xlib.hash
@@ -1,4 +1,4 @@
-# From https://ftp.gnome.org/pub/gnome/sources/gdk-pixbuf-xlib/2.40/gdk-pixbuf-xlib-2.40.2.sha256sum
+# From https://download.gnome.org/sources/gdk-pixbuf-xlib/2.40/gdk-pixbuf-xlib-2.40.2.sha256sum
 sha256  8b8e1c270ec16a06f665ea841f8e4e167eaa0118d0cbfeeade43745f09198ff7  gdk-pixbuf-xlib-2.40.2.tar.xz
 
 # Hash for license file
diff --git a/package/gdk-pixbuf-xlib/gdk-pixbuf-xlib.mk b/package/gdk-pixbuf-xlib/gdk-pixbuf-xlib.mk
index 3e61373b3a..5af33c6aea 100644
--- a/package/gdk-pixbuf-xlib/gdk-pixbuf-xlib.mk
+++ b/package/gdk-pixbuf-xlib/gdk-pixbuf-xlib.mk
@@ -7,7 +7,7 @@
 GDK_PIXBUF_XLIB_VERSION_MAJOR = 2.40
 GDK_PIXBUF_XLIB_VERSION = $(GDK_PIXBUF_XLIB_VERSION_MAJOR).2
 GDK_PIXBUF_XLIB_SOURCE = gdk-pixbuf-xlib-$(GDK_PIXBUF_XLIB_VERSION).tar.xz
-GDK_PIXBUF_XLIB_SITE = http://ftp.gnome.org/pub/gnome/sources/gdk-pixbuf-xlib/$(GDK_PIXBUF_XLIB_VERSION_MAJOR)
+GDK_PIXBUF_XLIB_SITE = https://download.gnome.org/sources/gdk-pixbuf-xlib/$(GDK_PIXBUF_XLIB_VERSION_MAJOR)
 GDK_PIXBUF_XLIB_LICENSE = LGPL-2.1+
 GDK_PIXBUF_XLIB_LICENSE_FILES = COPYING
 GDK_PIXBUF_XLIB_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
