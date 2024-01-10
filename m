Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4ACCDC4707B
	for <buildroot@archiver.kernel.org>; Wed, 10 Jan 2024 17:24:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 045D7828F2;
	Wed, 10 Jan 2024 17:24:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 045D7828F2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id D6E_Z4Vi7tqS; Wed, 10 Jan 2024 17:24:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5E1A582FB1;
	Wed, 10 Jan 2024 17:24:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5E1A582FB1
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 23D581BF5D7
 for <buildroot@lists.busybox.net>; Wed, 10 Jan 2024 17:22:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6D7AE614D1
 for <buildroot@lists.busybox.net>; Wed, 10 Jan 2024 17:22:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6D7AE614D1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tlGEQLDcT-uZ for <buildroot@lists.busybox.net>;
 Wed, 10 Jan 2024 17:22:15 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 97CA7614B2
 for <buildroot@buildroot.org>; Wed, 10 Jan 2024 17:22:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 97CA7614B2
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 85B7C85C4B; Wed, 10 Jan 2024 17:22:15 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 10 Jan 2024 18:08:51 +0100
X-Git-Refname: refs/heads/2023.11.x
X-Git-Oldrev: ea4538688ce9b74cd5869183eb7f64ae8c1a38aa
X-Git-Newrev: 5aab043b788987872ce0622135e5cec2f642fe70
X-Patchwork-Hint: ignore
Message-Id: <20240110172215.85B7C85C4B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.11.x]
 package/gst1-plugins-ugly: bump to version 1.22.8
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

commit: https://git.buildroot.net/buildroot/commit/?id=5aab043b788987872ce0622135e5cec2f642fe70
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.11.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit f93be77769f2a4c29e0b4223ed858b2e2d12ba95)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.hash | 4 ++--
 package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.hash b/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.hash
index 7faf0fe689..7b85301280 100644
--- a/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.hash
+++ b/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.hash
@@ -1,3 +1,3 @@
-# From https://gstreamer.freedesktop.org/src/gst-plugins-ugly/gst-plugins-ugly-1.22.7.tar.xz.sha256sum
-sha256  520b46bca637189ad86a298ff245b2d89375dbcac8b05d74daea910f81a9e9da  gst-plugins-ugly-1.22.7.tar.xz
+# From https://gstreamer.freedesktop.org/src/gst-plugins-ugly/gst-plugins-ugly-1.22.8.tar.xz.sha256sum
+sha256  0761d96ba508e01c0271881b26828c2bffd7d8afd50872219f088f755b252ca7  gst-plugins-ugly-1.22.8.tar.xz
 sha256  6095e9ffa777dd22839f7801aa845b31c9ed07f3d6bf8a26dc5d2dec8ccc0ef3  COPYING
diff --git a/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.mk b/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.mk
index f5df83bed0..90be791e0c 100644
--- a/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.mk
+++ b/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST1_PLUGINS_UGLY_VERSION = 1.22.7
+GST1_PLUGINS_UGLY_VERSION = 1.22.8
 GST1_PLUGINS_UGLY_SOURCE = gst-plugins-ugly-$(GST1_PLUGINS_UGLY_VERSION).tar.xz
 GST1_PLUGINS_UGLY_SITE = https://gstreamer.freedesktop.org/src/gst-plugins-ugly
 GST1_PLUGINS_UGLY_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
