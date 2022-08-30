Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E18BECAAA1
	for <buildroot@archiver.kernel.org>; Tue, 30 Aug 2022 16:18:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 13CF4812D4;
	Tue, 30 Aug 2022 16:18:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 13CF4812D4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4Wp3qVVvoPRq; Tue, 30 Aug 2022 16:18:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2FF7881261;
	Tue, 30 Aug 2022 16:18:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2FF7881261
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BD3771BF3A8
 for <buildroot@lists.busybox.net>; Tue, 30 Aug 2022 16:15:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 98E3660FE6
 for <buildroot@lists.busybox.net>; Tue, 30 Aug 2022 16:15:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 98E3660FE6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5o-V7ni5_6VA for <buildroot@lists.busybox.net>;
 Tue, 30 Aug 2022 16:15:10 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id C71EF60FE3
 for <buildroot@buildroot.org>; Tue, 30 Aug 2022 16:15:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C71EF60FE3
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 10BDC880E2; Tue, 30 Aug 2022 16:00:07 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 30 Aug 2022 17:57:06 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 3ede0a9ef783bbecd278c98423c3d8382bed68e8
X-Git-Newrev: c5210469c94554e1b491f5552794190ee96097cd
X-Patchwork-Hint: ignore
Message-Id: <20220830160007.10BDC880E2@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/gdk-pixbuf: bump
 to version 2.42.8
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

commit: https://git.buildroot.net/buildroot/commit/?id=c5210469c94554e1b491f5552794190ee96097cd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

https://gitlab.gnome.org/GNOME/gdk-pixbuf/-/blob/2.42.8/NEWS

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 8237c5202e46260a945de474ecb6537d86a93991)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gdk-pixbuf/gdk-pixbuf.hash |  4 ++--
 package/gdk-pixbuf/gdk-pixbuf.mk   | 22 +++++++++++-----------
 2 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/package/gdk-pixbuf/gdk-pixbuf.hash b/package/gdk-pixbuf/gdk-pixbuf.hash
index 5e7dc7e03b..4bb246aa50 100644
--- a/package/gdk-pixbuf/gdk-pixbuf.hash
+++ b/package/gdk-pixbuf/gdk-pixbuf.hash
@@ -1,3 +1,3 @@
-# From https://ftp.gnome.org/pub/gnome/sources/gdk-pixbuf/2.42/gdk-pixbuf-2.42.4.sha256sum
-sha256  fe9c5dd88f486194ea2bc09b8814c1ed895bb6c530f37cbbf259757c4e482e4d  gdk-pixbuf-2.42.4.tar.xz
+# From https://ftp.gnome.org/pub/gnome/sources/gdk-pixbuf/2.42/gdk-pixbuf-2.42.8.sha256sum
+sha256  84acea3acb2411b29134b32015a5b1aaa62844b19c4b1ef8b8971c6b0759f4c6  gdk-pixbuf-2.42.8.tar.xz
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/gdk-pixbuf/gdk-pixbuf.mk b/package/gdk-pixbuf/gdk-pixbuf.mk
index 329c05520e..57e8bbd511 100644
--- a/package/gdk-pixbuf/gdk-pixbuf.mk
+++ b/package/gdk-pixbuf/gdk-pixbuf.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 GDK_PIXBUF_VERSION_MAJOR = 2.42
-GDK_PIXBUF_VERSION = $(GDK_PIXBUF_VERSION_MAJOR).4
+GDK_PIXBUF_VERSION = $(GDK_PIXBUF_VERSION_MAJOR).8
 GDK_PIXBUF_SOURCE = gdk-pixbuf-$(GDK_PIXBUF_VERSION).tar.xz
 GDK_PIXBUF_SITE = http://ftp.gnome.org/pub/gnome/sources/gdk-pixbuf/$(GDK_PIXBUF_VERSION_MAJOR)
 GDK_PIXBUF_LICENSE = LGPL-2.1+
@@ -41,30 +41,30 @@ GDK_PIXBUF_CONF_OPTS += -Dintrospection=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_LIBPNG),y)
-GDK_PIXBUF_CONF_OPTS += -Dpng=true
+GDK_PIXBUF_CONF_OPTS += -Dpng=enabled
 GDK_PIXBUF_DEPENDENCIES += libpng
 else
-GDK_PIXBUF_CONF_OPTS += -Dpng=false
+GDK_PIXBUF_CONF_OPTS += -Dpng=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_JPEG),y)
-GDK_PIXBUF_CONF_OPTS += -Djpeg=true
-HOST_GDK_PIXBUF_CONF_OPTS += -Djpeg=true
+GDK_PIXBUF_CONF_OPTS += -Djpeg=enabled
+HOST_GDK_PIXBUF_CONF_OPTS += -Djpeg=enabled
 GDK_PIXBUF_DEPENDENCIES += jpeg
 HOST_GDK_PIXBUF_DEPENDENCIES += host-libjpeg
 else
-GDK_PIXBUF_CONF_OPTS += -Djpeg=false
-HOST_GDK_PIXBUF_CONF_OPTS += -Djpeg=false
+GDK_PIXBUF_CONF_OPTS += -Djpeg=disabled
+HOST_GDK_PIXBUF_CONF_OPTS += -Djpeg=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_TIFF),y)
-GDK_PIXBUF_CONF_OPTS += -Dtiff=true
-HOST_GDK_PIXBUF_CONF_OPTS += -Dtiff=true
+GDK_PIXBUF_CONF_OPTS += -Dtiff=enabled
+HOST_GDK_PIXBUF_CONF_OPTS += -Dtiff=enabled
 GDK_PIXBUF_DEPENDENCIES += tiff
 HOST_GDK_PIXBUF_DEPENDENCIES += host-tiff
 else
-GDK_PIXBUF_CONF_OPTS += -Dtiff=false
-HOST_GDK_PIXBUF_CONF_OPTS += -Dtiff=false
+GDK_PIXBUF_CONF_OPTS += -Dtiff=disabled
+HOST_GDK_PIXBUF_CONF_OPTS += -Dtiff=disabled
 endif
 
 # gdk-pixbuf requires the loaders.cache file populated to work properly
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
