Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 757A1ECAAA1
	for <buildroot@archiver.kernel.org>; Fri, 28 Oct 2022 06:56:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 23B0560ABF;
	Fri, 28 Oct 2022 06:56:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 23B0560ABF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id V-nuS5Q0rG0s; Fri, 28 Oct 2022 06:56:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3A9FE60A92;
	Fri, 28 Oct 2022 06:56:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3A9FE60A92
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id F37C01BF860
 for <buildroot@lists.busybox.net>; Fri, 28 Oct 2022 06:56:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CBB914018C
 for <buildroot@lists.busybox.net>; Fri, 28 Oct 2022 06:56:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CBB914018C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oYfO6JZtRq_x for <buildroot@lists.busybox.net>;
 Fri, 28 Oct 2022 06:56:11 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id B38F840164
 for <buildroot@buildroot.org>; Fri, 28 Oct 2022 06:56:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B38F840164
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9FDA7873E7; Fri, 28 Oct 2022 06:56:11 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 28 Oct 2022 08:55:04 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1f54af8c4f814bfc0993756b82575ad581ce5318
X-Git-Newrev: 5fe9ae335f8cfa5140ef5309ac931cbd3e4cf3fb
X-Patchwork-Hint: ignore
Message-Id: <20221028065611.9FDA7873E7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/lv2: bump to version 1.18.10
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=5fe9ae335f8cfa5140ef5309ac931cbd3e4cf3fb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Update hash of COPYING (standard ISC text used since
  https://github.com/lv2/lv2/commit/0030682770cdab7069c8c96e2fdf0e99f9b42b65)
- meson must be used since
  https://github.com/lv2/lv2/commit/d4a970f6962dda28133290194832b726b566ddab

https://github.com/lv2/lv2/blob/v1.18.10/NEWS

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/lv2/lv2.hash |  6 +++---
 package/lv2/lv2.mk   | 13 ++++++-------
 2 files changed, 9 insertions(+), 10 deletions(-)

diff --git a/package/lv2/lv2.hash b/package/lv2/lv2.hash
index ed21620bee..0814958887 100644
--- a/package/lv2/lv2.hash
+++ b/package/lv2/lv2.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking signature
-# https://lv2plug.in/spec/lv2-1.18.2.tar.bz2.asc
-sha256  4e891fbc744c05855beb5dfa82e822b14917dd66e98f82b8230dbd1c7ab2e05e  lv2-1.18.2.tar.bz2
-sha256  0b0b07d852e3ce7fa04986e141f73001bd7f260683968f0a19e02dbcc4131aa6  COPYING
+# https://lv2plug.in/spec/lv2-1.18.10.tar.xz.sig
+sha256  78c51bcf21b54e58bb6329accbb4dae03b2ed79b520f9a01e734bd9de530953f  lv2-1.18.10.tar.xz
+sha256  1e6bb175e193608b767ff25a4ed68b82c4db599491cf0d2694435cf60e9a4841  COPYING
diff --git a/package/lv2/lv2.mk b/package/lv2/lv2.mk
index 13ffaa34b0..2dde9b907c 100644
--- a/package/lv2/lv2.mk
+++ b/package/lv2/lv2.mk
@@ -4,18 +4,17 @@
 #
 ################################################################################
 
-LV2_VERSION = 1.18.2
+LV2_VERSION = 1.18.10
 LV2_SITE = https://lv2plug.in/spec
-LV2_SOURCE = lv2-$(LV2_VERSION).tar.bz2
+LV2_SOURCE = lv2-$(LV2_VERSION).tar.xz
 LV2_LICENSE = ISC
 LV2_LICENSE_FILES = COPYING
 LV2_DEPENDENCIES = host-pkgconf
 LV2_INSTALL_STAGING = YES
 
 LV2_CONF_OPTS += \
-	--no-coverage \
-	--no-check-links \
-	--copy-headers
+	-Ddocs=disabled \
+	-Dtests=disabled
 
 ifeq ($(BR2_PACKAGE_CAIRO),y)
 LV2_DEPENDENCIES += cairo
@@ -30,7 +29,7 @@ LV2_DEPENDENCIES += libgtk2
 endif
 
 ifeq ($(BR2_STATIC_LIBS),y)
-LV2_CONF_OPTS += --no-plugins
+LV2_CONF_OPTS += -Dplugins=disabled
 endif
 
-$(eval $(waf-package))
+$(eval $(meson-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
