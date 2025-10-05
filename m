Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C06E5CAC5B8
	for <buildroot@archiver.kernel.org>; Sun,  5 Oct 2025 18:07:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7733783BFC;
	Sun,  5 Oct 2025 18:07:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id i6kg3mqXPoFZ; Sun,  5 Oct 2025 18:07:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5691D83BEE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5691D83BEE;
	Sun,  5 Oct 2025 18:07:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 74854226
 for <buildroot@buildroot.org>; Sun,  5 Oct 2025 18:07:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6670A60EE2
 for <buildroot@buildroot.org>; Sun,  5 Oct 2025 18:07:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 357zYkKyRw86 for <buildroot@buildroot.org>;
 Sun,  5 Oct 2025 18:06:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B073160EE3
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id B073160EE3
 for <buildroot@buildroot.org>; Sun,  5 Oct 2025 18:06:59 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A15B88692C; Sun,  5 Oct 2025 18:06:59 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 5 Oct 2025 20:01:14 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 537555a37f53360020a11df8065450d88e9d107c
X-Git-Newrev: d2b2bab84af75465d94a2f577ac81f481aa02c2c
X-Patchwork-Hint: ignore
Message-Id: <20251005180659.A15B88692C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libbluray: bump version to 1.4.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=d2b2bab84af75465d94a2f577ac81f481aa02c2c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changelog:
https://code.videolan.org/videolan/libbluray/-/blob/1.4.0/ChangeLog

Switched _SITE to https.
Follow upstream switch to meson and xz tarball.

Depends on libudfread bump to 1.2.0.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/libbluray/libbluray.hash |  4 ++--
 package/libbluray/libbluray.mk   | 25 +++++++++++++------------
 2 files changed, 15 insertions(+), 14 deletions(-)

diff --git a/package/libbluray/libbluray.hash b/package/libbluray/libbluray.hash
index a631722bb0..cc5bb2f753 100644
--- a/package/libbluray/libbluray.hash
+++ b/package/libbluray/libbluray.hash
@@ -1,4 +1,4 @@
-# From http://download.videolan.org/pub/videolan/libbluray/1.3.4/libbluray-1.3.4.tar.bz2.sha512
-sha512  94dbf3b68d1c23fe4648c153cc2f0c251886fac0a6b6bbe3a77caabaa5322682f712afe4a7b6b16ca3f06744fbc0e1ca872209a32898dcf0ae182055d335aec1  libbluray-1.3.4.tar.bz2
+# From https://download.videolan.org/pub/videolan/libbluray/1.4.0/libbluray-1.4.0.tar.xz.sha512
+sha512  7284169b32624e5ca4fd71b260a4cc2921efafb1f63143a562568be45e373bfcbfeac63895d5659ccdcb11d7dbd0236cc46ccb15c12eff855703010e46991f27  libbluray-1.4.0.tar.xz
 # Locally computed
 sha256  b3aa400aca6d2ba1f0bd03bd98d03d1fe7489a3bbb26969d72016360af8a5c9d  COPYING
diff --git a/package/libbluray/libbluray.mk b/package/libbluray/libbluray.mk
index 54f4caa368..4b20dd404a 100644
--- a/package/libbluray/libbluray.mk
+++ b/package/libbluray/libbluray.mk
@@ -4,46 +4,47 @@
 #
 ################################################################################
 
-LIBBLURAY_VERSION = 1.3.4
-LIBBLURAY_SITE = http://download.videolan.org/pub/videolan/libbluray/$(LIBBLURAY_VERSION)
-LIBBLURAY_SOURCE = libbluray-$(LIBBLURAY_VERSION).tar.bz2
+LIBBLURAY_VERSION = 1.4.0
+LIBBLURAY_SOURCE = libbluray-$(LIBBLURAY_VERSION).tar.xz
+LIBBLURAY_SITE = https://download.videolan.org/pub/videolan/libbluray/$(LIBBLURAY_VERSION)
 LIBBLURAY_INSTALL_STAGING = YES
 LIBBLURAY_LICENSE = LGPL-2.1+
 LIBBLURAY_LICENSE_FILES = COPYING
 LIBBLURAY_CPE_ID_VENDOR = videolan
 LIBBLURAY_DEPENDENCIES = host-pkgconf
 
-LIBBLURAY_CONF_OPTS = --disable-bdjava-jar
+LIBBLURAY_CONF_OPTS = -Dbdj_jar=disabled
 
 ifeq ($(BR2_PACKAGE_LIBICONV),y)
 LIBBLURAY_DEPENDENCIES += libiconv
 endif
 
 ifeq ($(BR2_PACKAGE_LIBUDFREAD),y)
+LIBBLURAY_CONF_OPTS += -Dembed_udfread=false
 LIBBLURAY_DEPENDENCIES += libudfread
 else
-LIBBLURAY_CONF_OPTS += --without-external-libudfread
+LIBBLURAY_CONF_OPTS += -Dembed_udfread=true
 endif
 
 ifeq ($(BR2_PACKAGE_FREETYPE),y)
+LIBBLURAY_CONF_OPTS += -Dfreetype=enabled
 LIBBLURAY_DEPENDENCIES += freetype
-LIBBLURAY_CONF_OPTS += --with-freetype
 else
-LIBBLURAY_CONF_OPTS += --without-freetype
+LIBBLURAY_CONF_OPTS += -Dfreetype=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_FONTCONFIG),y)
+LIBBLURAY_CONF_OPTS += -Dfontconfig=enabled
 LIBBLURAY_DEPENDENCIES += fontconfig
-LIBBLURAY_CONF_OPTS += --with-fontconfig
 else
-LIBBLURAY_CONF_OPTS += --without-fontconfig
+LIBBLURAY_CONF_OPTS += -Dfontconfig=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_LIBXML2),y)
+LIBBLURAY_CONF_OPTS += -Dlibxml2=enabled
 LIBBLURAY_DEPENDENCIES += libxml2
-LIBBLURAY_CONF_OPTS += --with-libxml2
 else
-LIBBLURAY_CONF_OPTS += --without-libxml2
+LIBBLURAY_CONF_OPTS += -Dlibxml2=disabled
 endif
 
-$(eval $(autotools-package))
+$(eval $(meson-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
