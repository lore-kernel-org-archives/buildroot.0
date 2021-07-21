Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BF4CC4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 22:20:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B983060EFF
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 22:20:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B983060EFF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 85D9540195;
	Tue,  3 Aug 2021 22:20:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OB7YhywWLFzF; Tue,  3 Aug 2021 22:20:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 91890403F0;
	Tue,  3 Aug 2021 22:20:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 217371BF9C2
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:11:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 71E6840552
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JVWZXY8XvxEk for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:10:21 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id CB21240582
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:10:21 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 2055481484; Tue,  3 Aug 2021 21:10:14 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Wed, 21 Jul 2021 23:34:02 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 99278e520826002dfdae61ec2d649846f43a9f36
X-Git-Newrev: 83e70c289381c2f58361270ed1384463728d3599
X-Patchwork-Hint: ignore
Message-Id: <20210803211014.2055481484@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/libgudev: bump to
 version 236
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

commit: https://git.buildroot.net/buildroot/commit/?id=83e70c289381c2f58361270ed1384463728d3599
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

- Switch to meson-package
- Update indentation in hash file (two spaces)

https://gitlab.gnome.org/GNOME/libgudev/-/blob/236/NEWS

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Reviewed-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libgudev/libgudev.hash |  6 +++---
 package/libgudev/libgudev.mk   | 10 +++++-----
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/package/libgudev/libgudev.hash b/package/libgudev/libgudev.hash
index bee394601e..1040ffb0c0 100644
--- a/package/libgudev/libgudev.hash
+++ b/package/libgudev/libgudev.hash
@@ -1,5 +1,5 @@
-# From http://ftp.gnome.org/pub/GNOME/sources/libgudev/233/libgudev-233.sha256sum
-sha256 587c4970eb23f4e2deee2cb1fb7838c94a78c578f41ce12cac0a3f4a80dabb03  libgudev-233.tar.xz
+# From http://ftp.gnome.org/pub/GNOME/sources/libgudev/236/libgudev-236.sha256sum
+sha256  e50369d06d594bae615eb7aeb787de304ebaad07a26d1043cef8e9c7ab7c9524  libgudev-236.tar.xz
 
 # Hash for license file:
-sha256 dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
+sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/libgudev/libgudev.mk b/package/libgudev/libgudev.mk
index 9aa64c2c22..eabd446d7b 100644
--- a/package/libgudev/libgudev.mk
+++ b/package/libgudev/libgudev.mk
@@ -4,20 +4,20 @@
 #
 ################################################################################
 
-LIBGUDEV_VERSION = 233
+LIBGUDEV_VERSION = 236
 LIBGUDEV_SOURCE = libgudev-$(LIBGUDEV_VERSION).tar.xz
 LIBGUDEV_SITE = http://ftp.gnome.org/pub/GNOME/sources/libgudev/$(LIBGUDEV_VERSION)
 LIBGUDEV_INSTALL_STAGING = YES
 LIBGUDEV_DEPENDENCIES = host-pkgconf udev libglib2
 LIBGUDEV_LICENSE = LGPL-2.1+
 LIBGUDEV_LICENSE_FILES = COPYING
-LIBGUDEV_CONF_OPTS = --disable-umockdev
+LIBGUDEV_CONF_OPTS = -Dtests=disabled -Dvapi=disabled
 
 ifeq ($(BR2_PACKAGE_GOBJECT_INTROSPECTION),y)
-LIBGUDEV_CONF_OPTS += --enable-introspection
+LIBGUDEV_CONF_OPTS += -Dintrospection=enabled
 LIBGUDEV_DEPENDENCIES += gobject-introspection
 else
-LIBGUDEV_CONF_OPTS += --disable-introspection
+LIBGUDEV_CONF_OPTS += -Dintrospection=disabled
 endif
 
-$(eval $(autotools-package))
+$(eval $(meson-package))
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
