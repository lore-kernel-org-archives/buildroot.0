Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A51CDC004D4
	for <buildroot@archiver.kernel.org>; Sat, 21 Jan 2023 13:16:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 168E241CB3;
	Sat, 21 Jan 2023 13:16:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 168E241CB3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bdaWSR9smt50; Sat, 21 Jan 2023 13:16:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 30D6441CA1;
	Sat, 21 Jan 2023 13:16:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 30D6441CA1
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6CC821BF85D
 for <buildroot@lists.busybox.net>; Sat, 21 Jan 2023 13:16:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4A1F7405CE
 for <buildroot@lists.busybox.net>; Sat, 21 Jan 2023 13:16:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4A1F7405CE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xFTPy2djnGSJ for <buildroot@lists.busybox.net>;
 Sat, 21 Jan 2023 13:16:09 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 810B34048A
 for <buildroot@buildroot.org>; Sat, 21 Jan 2023 13:16:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 810B34048A
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6F97A86964; Sat, 21 Jan 2023 13:16:09 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 21 Jan 2023 13:52:04 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b0d9d97b3434e41879046c0994dd1b5708c46007
X-Git-Newrev: 14d70068be395f47a034e4275e9a26e19b2804db
X-Patchwork-Hint: ignore
Message-Id: <20230121131609.6F97A86964@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gdk-pixbuf-xlib: switch to https
 download
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
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
