Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F7D2C4320A
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 23:54:51 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4F76B61050
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 23:54:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4F76B61050
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2B120403A0;
	Tue,  3 Aug 2021 23:54:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5uPg2Wq-H4T8; Tue,  3 Aug 2021 23:54:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6419840378;
	Tue,  3 Aug 2021 23:54:49 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6FFE71BF349
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:18:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C61A540F71
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qRPxBSWGm_fb for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:10:25 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8EC1340EEB
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:10:18 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id DFE5686763; Tue,  3 Aug 2021 21:10:10 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Tue, 20 Jul 2021 21:29:38 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 981bc738a498cc9355fe71a54b239bc4119091c9
X-Git-Newrev: f59df804dba5dc648fa81570e7ec0d1a4890f539
X-Patchwork-Hint: ignore
Message-Id: <20210803211010.DFE5686763@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/gupnp-av: bump to
 version 0.13.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=f59df804dba5dc648fa81570e7ec0d1a4890f539
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

- License is LGPL-2.1+ since
  https://gitlab.gnome.org/GNOME/gupnp-av/-/commit/f0ff740c735bff04bb0235eb9ac57172461b71d5
- Update indentation in hash file (two spaces)
- Switch to meson-package

https://gitlab.gnome.org/GNOME/gupnp-av/-/blob/gupnp-av-0.13.0/NEWS

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/gupnp-av/gupnp-av.hash |  6 +++---
 package/gupnp-av/gupnp-av.mk   | 14 +++++++-------
 2 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/package/gupnp-av/gupnp-av.hash b/package/gupnp-av/gupnp-av.hash
index 5dc2ac1a9d..570f8ab3d0 100644
--- a/package/gupnp-av/gupnp-av.hash
+++ b/package/gupnp-av/gupnp-av.hash
@@ -1,5 +1,5 @@
-# Hash from: http://ftp.gnome.org/pub/gnome/sources/gupnp-av/0.12/gupnp-av-0.12.11.sha256sum:
-sha256	689dcf1492ab8991daea291365a32548a77d1a2294d85b33622b55cca9ce6fdc	gupnp-av-0.12.11.tar.xz
+# Hash from: http://ftp.gnome.org/pub/gnome/sources/gupnp-av/0.13/gupnp-av-0.13.0.sha256sum:
+sha256  578b8f562b0f7e908416a41efbe2b7e6b892cd2ed7eac61ac63c48fdc8d7e6c8  gupnp-av-0.13.0.tar.xz
 
 # Hash for license file:
-sha256 d245807f90032872d1438d741ed21e2490e1175dc8aa3afa5ddb6c8e529b58e5  COPYING
+sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/gupnp-av/gupnp-av.mk b/package/gupnp-av/gupnp-av.mk
index 55436d0e53..c2d3c3ba18 100644
--- a/package/gupnp-av/gupnp-av.mk
+++ b/package/gupnp-av/gupnp-av.mk
@@ -4,20 +4,20 @@
 #
 ################################################################################
 
-GUPNP_AV_VERSION_MAJOR = 0.12
-GUPNP_AV_VERSION = $(GUPNP_AV_VERSION_MAJOR).11
+GUPNP_AV_VERSION_MAJOR = 0.13
+GUPNP_AV_VERSION = $(GUPNP_AV_VERSION_MAJOR).0
 GUPNP_AV_SOURCE = gupnp-av-$(GUPNP_AV_VERSION).tar.xz
 GUPNP_AV_SITE = http://ftp.gnome.org/pub/gnome/sources/gupnp-av/$(GUPNP_AV_VERSION_MAJOR)
-GUPNP_AV_LICENSE = LGPL-2.0+
+GUPNP_AV_LICENSE = LGPL-2.1+
 GUPNP_AV_LICENSE_FILES = COPYING
 GUPNP_AV_INSTALL_STAGING = YES
 GUPNP_AV_DEPENDENCIES = host-pkgconf libglib2 libxml2 gupnp
 
 ifeq ($(BR2_PACKAGE_GOBJECT_INTROSPECTION),y)
-GUPNP_AV_CONF_OPTS += --enable-introspection
-GUPNP_AV_DEPENDENCIES += gobject-introspection
+GUPNP_AV_CONF_OPTS += -Dintrospection=true -Dvapi=true
+GUPNP_AV_DEPENDENCIES += host-vala gobject-introspection
 else
-GUPNP_AV_CONF_OPTS += --disable-introspection
+GUPNP_AV_CONF_OPTS += -Dintrospection=false -Dvapi=false
 endif
 
-$(eval $(autotools-package))
+$(eval $(meson-package))
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
