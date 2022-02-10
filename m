Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8ECBFC433F5
	for <buildroot@archiver.kernel.org>; Thu, 10 Feb 2022 21:53:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4EEED40469;
	Thu, 10 Feb 2022 21:53:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bTZ-LYvuq-Iq; Thu, 10 Feb 2022 21:53:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7AC6840308;
	Thu, 10 Feb 2022 21:53:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 992E81C1135
 for <buildroot@lists.busybox.net>; Thu, 10 Feb 2022 21:51:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1E33D81D7C
 for <buildroot@lists.busybox.net>; Thu, 10 Feb 2022 21:51:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id THiVYBXLKrSy for <buildroot@lists.busybox.net>;
 Thu, 10 Feb 2022 21:51:47 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 501E8824E2
 for <buildroot@buildroot.org>; Thu, 10 Feb 2022 21:51:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 0B490826C1; Thu, 10 Feb 2022 21:44:20 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 10 Feb 2022 22:46:16 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 40d94d268e2d658304e848f66d9264795ae8f637
X-Git-Newrev: b286cd169c57eb456ff8c540cafe8b314768aa72
X-Patchwork-Hint: ignore
Message-Id: <20220210214420.0B490826C1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gst1-devtools: bump version to
 1.20.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=b286cd169c57eb456ff8c540cafe8b314768aa72
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- use new option cairo ('Build GstValidateVideo') instead pure optional
  dependency on packet cairo

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gstreamer1/gst1-devtools/gst1-devtools.hash |  4 ++--
 package/gstreamer1/gst1-devtools/gst1-devtools.mk   | 13 ++++++++++---
 2 files changed, 12 insertions(+), 5 deletions(-)

diff --git a/package/gstreamer1/gst1-devtools/gst1-devtools.hash b/package/gstreamer1/gst1-devtools/gst1-devtools.hash
index 011385e757..dd09280a9c 100644
--- a/package/gstreamer1/gst1-devtools/gst1-devtools.hash
+++ b/package/gstreamer1/gst1-devtools/gst1-devtools.hash
@@ -1,3 +1,3 @@
-# From https://gstreamer.freedesktop.org/src/gst-devtools/gst-devtools-1.18.6.tar.xz.sha256sum
-sha256  3725622c740a635452e54b79d065f963ab7706ca2403de6c43072ae7610a0de4  gst-devtools-1.18.6.tar.xz
+# From https://gstreamer.freedesktop.org/src/gst-devtools/gst-devtools-1.20.0.tar.xz.sha256sum
+sha256  69fc8756ec9d93e5c5258c99088434f203e91fdbc5af28d1f2c583fd819b7a1d  gst-devtools-1.20.0.tar.xz
 sha256  6095e9ffa777dd22839f7801aa845b31c9ed07f3d6bf8a26dc5d2dec8ccc0ef3  validate/COPYING
diff --git a/package/gstreamer1/gst1-devtools/gst1-devtools.mk b/package/gstreamer1/gst1-devtools/gst1-devtools.mk
index 9089b12188..f72df9cf71 100644
--- a/package/gstreamer1/gst1-devtools/gst1-devtools.mk
+++ b/package/gstreamer1/gst1-devtools/gst1-devtools.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST1_DEVTOOLS_VERSION = 1.18.6
+GST1_DEVTOOLS_VERSION = 1.20.0
 GST1_DEVTOOLS_SOURCE = gst-devtools-$(GST1_DEVTOOLS_VERSION).tar.xz
 GST1_DEVTOOLS_SITE = https://gstreamer.freedesktop.org/src/gst-devtools
 GST1_DEVTOOLS_LICENSE = LGPL-2.1+
@@ -16,8 +16,7 @@ GST1_DEVTOOLS_DEPENDENCIES = \
 	python3 \
 	gstreamer1 \
 	gst1-plugins-base \
-	json-glib \
-	$(if $(BR2_PACKAGE_CAIRO),cairo)
+	json-glib
 
 ifeq ($(BR2_PACKAGE_GST1_RTSP_SERVER),y)
 GST1_DEVTOOLS_DEPENDENCIES += gst1-rtsp-server
@@ -30,4 +29,12 @@ GST1_DEVTOOLS_CONF_OPTS = \
 	-Dtests=disabled \
 	-Ddoc=disabled
 
+# build GstValidateVideo
+ifeq ($(BR2_PACKAGE_CAIRO),y)
+GST1_DEVTOOLS_CONF_OPTS += -Dcairo=enabled
+GST1_DEVTOOLS_DEPENDENCIES += cairo
+else
+GST1_DEVTOOLS_CONF_OPTS += -Dcairo=disabled
+endif
+
 $(eval $(meson-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
