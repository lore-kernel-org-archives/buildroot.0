Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E72FC36018
	for <buildroot@archiver.kernel.org>; Mon,  7 Apr 2025 18:58:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6688161076;
	Mon,  7 Apr 2025 18:58:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jBJiIBx91EWU; Mon,  7 Apr 2025 18:58:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9136D61085
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9136D61085;
	Mon,  7 Apr 2025 18:58:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 55A8C1DE
 for <buildroot@buildroot.org>; Mon,  7 Apr 2025 18:58:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 64455410E0
 for <buildroot@buildroot.org>; Mon,  7 Apr 2025 18:58:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bYiq6ZyurQ6x for <buildroot@buildroot.org>;
 Mon,  7 Apr 2025 18:58:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9DB9D415B3
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9DB9D415B3
 for <buildroot@buildroot.org>; Mon,  7 Apr 2025 18:58:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9AEAA83D9E; Mon,  7 Apr 2025 18:58:37 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Mon, 7 Apr 2025 20:14:22 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 906249f4a8a535e70a6f89284327c3dfa64a25e1
X-Git-Newrev: 82846474fe07be00d0ed931c1832e75f95d13e7c
X-Patchwork-Hint: ignore
Message-Id: <20250407185837.9AEAA83D9E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gstreamer1/gst1-plugins-good: bump
 version to 1.24.11
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=82846474fe07be00d0ed931c1832e75f95d13e7c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

AMR NB and WB have been moved from ugly to good.
For more details, see the release notes:

    https://gstreamer.freedesktop.org/releases/1.24/

Signed-off-by: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/gstreamer1/gst1-plugins-good/gst1-plugins-good.hash | 4 ++--
 package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk   | 6 +++++-
 2 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.hash b/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.hash
index 1e1b83e115..0c5192c515 100644
--- a/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.hash
+++ b/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.hash
@@ -1,3 +1,3 @@
-# From https://gstreamer.freedesktop.org/src/gst-plugins-good/gst-plugins-good-1.22.12.tar.xz.sha256sum
-sha256  9c1913f981900bd8867182639b20907b28ed78ef7a222cfbf2d8ba9dab992fa7  gst-plugins-good-1.22.12.tar.xz
+# From https://gstreamer.freedesktop.org/src/gst-plugins-good/gst-plugins-good-1.24.11.tar.xz.sha256sum
+sha256  94bf3b5118dd4213af66048faac830569cc9a94a8c8e59e8a6d33b315f518462  gst-plugins-good-1.24.11.tar.xz
 sha256  6095e9ffa777dd22839f7801aa845b31c9ed07f3d6bf8a26dc5d2dec8ccc0ef3  COPYING
diff --git a/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk b/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk
index 7ba2667792..a7ab9a0326 100644
--- a/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk
+++ b/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST1_PLUGINS_GOOD_VERSION = 1.22.12
+GST1_PLUGINS_GOOD_VERSION = 1.24.11
 GST1_PLUGINS_GOOD_SOURCE = gst-plugins-good-$(GST1_PLUGINS_GOOD_VERSION).tar.xz
 GST1_PLUGINS_GOOD_SITE = https://gstreamer.freedesktop.org/src/gst-plugins-good
 GST1_PLUGINS_GOOD_LICENSE_FILES = COPYING
@@ -27,6 +27,10 @@ GST1_PLUGINS_GOOD_CONF_OPTS = \
 	-Dosxvideo=disabled \
 	-Daalib=disabled \
 	-Dlibcaca=disabled \
+	-Damrnb=disabled \
+	-Damrwbdec=disabled \
+	-Dsoup=disabled \
+	-Dximagesrc-navigation=disabled \
 	-Ddoc=disabled
 
 # Options which require currently unpackaged libraries
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
