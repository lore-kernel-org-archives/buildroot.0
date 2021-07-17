Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BD97C4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 23:35:15 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4741560F70
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 23:35:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4741560F70
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1FF5640137;
	Tue,  3 Aug 2021 23:35:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iQQvDDWI-Q40; Tue,  3 Aug 2021 23:35:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 05476421FC;
	Tue,  3 Aug 2021 23:35:12 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1382E1BF349
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:16:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EE4ED40EF6
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ku6HCObOOw1E for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:10:17 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6838540552
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:10:13 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id B0EA787F55; Tue,  3 Aug 2021 21:10:05 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sat, 17 Jul 2021 10:08:19 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: aade2fd293fc8a13bc5665fa70a4002ddac9aae6
X-Git-Newrev: f11128b779a7e285665902d09977f268b1bbee77
X-Patchwork-Hint: ignore
Message-Id: <20210803211005.B0EA787F55@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/libnice: bump to
 version 0.1.18
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

commit: https://git.buildroot.net/buildroot/commit/?id=f11128b779a7e285665902d09977f268b1bbee77
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

- Update indentation in hash file (two spaces)
- Switch to meson-package

https://github.com/libnice/libnice/blob/0.1.18/NEWS

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libnice/libnice.hash |  8 ++++----
 package/libnice/libnice.mk   | 22 +++++++++++-----------
 2 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/package/libnice/libnice.hash b/package/libnice/libnice.hash
index 61be9517e3..55785cd5ff 100644
--- a/package/libnice/libnice.hash
+++ b/package/libnice/libnice.hash
@@ -1,7 +1,7 @@
 # Locally computed after checking pgp signature
-sha256 06b678066f94dde595a4291588ed27acd085ee73775b8c4e8399e28c01eeefdf libnice-0.1.16.tar.gz
+sha256  5eabd25ba2b54e817699832826269241abaa1cf78f9b240d1435f936569273f4  libnice-0.1.18.tar.gz
 
 # Hash for license files:
-sha256 9246b2ee8b1db30cf03d5d9719ad8bb5edce1cadc85f8cfef319c23d24d950b5 COPYING
-sha256 3b3c75ae6c663c4f93987647eb5463d33dc1602a1aded3ac479773f2c3928e3a COPYING.MPL
-sha256 a9bdde5616ecdd1e980b44f360600ee8783b1f99b8cc83a2beb163a0a390e861 COPYING.LGPL
+sha256  9246b2ee8b1db30cf03d5d9719ad8bb5edce1cadc85f8cfef319c23d24d950b5  COPYING
+sha256  3b3c75ae6c663c4f93987647eb5463d33dc1602a1aded3ac479773f2c3928e3a  COPYING.MPL
+sha256  a9bdde5616ecdd1e980b44f360600ee8783b1f99b8cc83a2beb163a0a390e861  COPYING.LGPL
diff --git a/package/libnice/libnice.mk b/package/libnice/libnice.mk
index 8292250938..5889b24ba2 100644
--- a/package/libnice/libnice.mk
+++ b/package/libnice/libnice.mk
@@ -4,36 +4,36 @@
 #
 ################################################################################
 
-LIBNICE_VERSION = 0.1.16
+LIBNICE_VERSION = 0.1.18
 LIBNICE_SITE = http://nice.freedesktop.org/releases
 LIBNICE_LICENSE = MPL-1.1 or LGPL-2.1
 LIBNICE_LICENSE_FILES = COPYING COPYING.MPL COPYING.LGPL
 LIBNICE_DEPENDENCIES = libglib2 host-pkgconf
 LIBNICE_INSTALL_STAGING = YES
-LIBNICE_CONF_OPTS = --without-gstreamer-0.10
+LIBNICE_CONF_OPTS = \
+	-Dexamples=disabled \
+	-Dtests=disabled
 
 ifeq ($(BR2_PACKAGE_GNUTLS),y)
-LIBNICE_CONF_OPTS += --with-crypto-library=gnutls
+LIBNICE_CONF_OPTS += -Dcrypto-library=gnutls
 LIBNICE_DEPENDENCIES += gnutls
 else
-LIBNICE_CONF_OPTS += \
-	--with-crypto-library=openssl \
-	--with-openssl=$(STAGING_DIR)/usr
+LIBNICE_CONF_OPTS += -Dcrypto-library=openssl
 LIBNICE_DEPENDENCIES += openssl
 endif
 
 ifeq ($(BR2_PACKAGE_GOBJECT_INTROSPECTION),y)
-LIBNICE_CONF_OPTS += --enable-introspection
+LIBNICE_CONF_OPTS += -Dintrospection=enabled
 LIBNICE_DEPENDENCIES += gobject-introspection
 else
-LIBNICE_CONF_OPTS += --disable-introspection
+LIBNICE_CONF_OPTS += -Dintrospection=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BASE),y)
-LIBNICE_CONF_OPTS += --with-gstreamer
+LIBNICE_CONF_OPTS += -Dgstreamer=enabled
 LIBNICE_DEPENDENCIES += gst1-plugins-base
 else
-LIBNICE_CONF_OPTS += --without-gstreamer
+LIBNICE_CONF_OPTS += -Dgstreamer=disabled
 endif
 
-$(eval $(autotools-package))
+$(eval $(meson-package))
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
