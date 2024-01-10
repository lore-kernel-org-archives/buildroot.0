Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 963FAC3DA6E
	for <buildroot@archiver.kernel.org>; Wed, 10 Jan 2024 09:52:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 44D82435DE;
	Wed, 10 Jan 2024 09:52:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 44D82435DE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AR1Pl2zwW7UF; Wed, 10 Jan 2024 09:52:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3ABB24361D;
	Wed, 10 Jan 2024 09:52:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3ABB24361D
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7B5B21BF95D
 for <buildroot@lists.busybox.net>; Wed, 10 Jan 2024 09:51:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 547C081DCA
 for <buildroot@lists.busybox.net>; Wed, 10 Jan 2024 09:51:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 547C081DCA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2ad2rEBWrQOs for <buildroot@lists.busybox.net>;
 Wed, 10 Jan 2024 09:51:32 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 63F4281DD8
 for <buildroot@buildroot.org>; Wed, 10 Jan 2024 09:51:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 63F4281DD8
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 544CF853BB; Wed, 10 Jan 2024 09:51:32 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 10 Jan 2024 10:35:13 +0100
X-Git-Refname: refs/heads/2023.11.x
X-Git-Oldrev: 1f4e5eafdf86552b5b49ac8253c0b44b25fc8bf2
X-Git-Newrev: cf70203bef206360a0cd75221034da063c5745ad
X-Patchwork-Hint: ignore
Message-Id: <20240110095132.544CF853BB@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.11.x] package/libheif: bump
 version to 1.17.5
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

commit: https://git.buildroot.net/buildroot/commit/?id=cf70203bef206360a0cd75221034da063c5745ad
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.11.x

Release notes:
https://github.com/strukturag/libheif/releases

Added configure support for new codec plugins introduced in version
1.17.0: https://github.com/strukturag/libheif/releases/tag/v1.17.0

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 5714126edac88e3adc043a482b262b319a907dd3)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libheif/libheif.hash |  2 +-
 package/libheif/libheif.mk   | 30 +++++++++++++++++++++++++++++-
 2 files changed, 30 insertions(+), 2 deletions(-)

diff --git a/package/libheif/libheif.hash b/package/libheif/libheif.hash
index 50152abde5..6ea3ba6eec 100644
--- a/package/libheif/libheif.hash
+++ b/package/libheif/libheif.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  7f97e4205c0bd9f9b8560536c8bd2e841d1c9a6d610401eb3eb87ed9cdfe78ea  libheif-1.16.2.tar.gz
+sha256  38ab01938ef419dbebb98346dc0b1c8bb503a0449ea61a0e409a988786c2af5b  libheif-1.17.5.tar.gz
 sha256  b2eb4f6588b005bebac44cfb2dfd23f6a16c5ca9b8a619a315158b0215a917a3  COPYING
diff --git a/package/libheif/libheif.mk b/package/libheif/libheif.mk
index 65e64a02f7..419a864ef3 100644
--- a/package/libheif/libheif.mk
+++ b/package/libheif/libheif.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBHEIF_VERSION = 1.16.2
+LIBHEIF_VERSION = 1.17.5
 LIBHEIF_SITE = https://github.com/strukturag/libheif/releases/download/v$(LIBHEIF_VERSION)
 LIBHEIF_LICENSE = LGPL-3.0+
 LIBHEIF_LICENSE_FILES = COPYING
@@ -30,6 +30,20 @@ else
 LIBHEIF_CONF_OPTS += -DWITH_DAV1D=OFF
 endif
 
+ifeq ($(BR2_PACKAGE_FFMPEG),y)
+LIBHEIF_CONF_OPTS += -DWITH_FFMPEG_DECODER=ON
+LIBHEIF_DEPENDENCIES += ffmpeg
+else
+LIBHEIF_CONF_OPTS += -DWITH_FFMPEG_DECODER=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_KVAZAAR),y)
+LIBHEIF_CONF_OPTS += -DWITH_KVAZAAR=ON
+LIBHEIF_DEPENDENCIES += kvazaar
+else
+LIBHEIF_CONF_OPTS += -DWITH_KVAZAAR=OFF
+endif
+
 ifeq ($(BR2_PACKAGE_LIBDE265),y)
 LIBHEIF_CONF_OPTS += -DWITH_LIBDE265=ON
 LIBHEIF_DEPENDENCIES += libde265
@@ -37,6 +51,20 @@ else
 LIBHEIF_CONF_OPTS += -DWITH_LIBDE265=OFF
 endif
 
+ifeq ($(BR2_PACKAGE_LIBJPEG),y)
+LIBHEIF_CONF_OPTS += -DWITH_JPEG_DECODER=ON -DWITH_JPEG_ENCODER=ON
+LIBHEIF_DEPENDENCIES += libjpeg
+else
+LIBHEIF_CONF_OPTS += -DWITH_JPEG_DECODER=OFF -DWITH_JPEG_ENCODER=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_OPENJPEG),y)
+LIBHEIF_CONF_OPTS += -DWITH_OpenJPEG_DECODER=ON -DWITH_OpenJPEG_ENCODER=ON
+LIBHEIF_DEPENDENCIES += openjpeg
+else
+LIBHEIF_CONF_OPTS += -DWITH_OpenJPEG_DECODER=OFF -DWITH_OpenJPEG_ENCODER=OFF
+endif
+
 ifeq ($(BR2_PACKAGE_X265),y)
 LIBHEIF_CONF_OPTS += -DWITH_X265=ON
 LIBHEIF_DEPENDENCIES += x265
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
