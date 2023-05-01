Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36760C77B61
	for <buildroot@archiver.kernel.org>; Mon,  1 May 2023 08:07:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E5C5F821A2;
	Mon,  1 May 2023 08:07:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E5C5F821A2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CdABj2GW3WXE; Mon,  1 May 2023 08:07:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 179AB822CC;
	Mon,  1 May 2023 08:07:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 179AB822CC
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 416D71BF336
 for <buildroot@lists.busybox.net>; Mon,  1 May 2023 08:06:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1BE094063E
 for <buildroot@lists.busybox.net>; Mon,  1 May 2023 08:06:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1BE094063E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pUzOWREEDwzX for <buildroot@lists.busybox.net>;
 Mon,  1 May 2023 08:06:41 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5526340289
 for <buildroot@buildroot.org>; Mon,  1 May 2023 08:06:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5526340289
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 42E9D84996; Mon,  1 May 2023 08:06:41 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 1 May 2023 10:03:01 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7812b591252652d35903cfc36b767a6339dbf343
X-Git-Newrev: 9b279b66991bcdcfca3d1fed6cd1865c244a558a
X-Patchwork-Hint: ignore
Message-Id: <20230501080641.42E9D84996@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gst1-plugins-good: bump version to
 1.22.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=9b279b66991bcdcfca3d1fed6cd1865c244a558a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gstreamer1/gst1-plugins-good/gst1-plugins-good.hash | 4 ++--
 package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.hash b/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.hash
index 3e219faad8..604e74b57d 100644
--- a/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.hash
+++ b/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.hash
@@ -1,3 +1,3 @@
-# From https://gstreamer.freedesktop.org/src/gst-plugins-good/gst-plugins-good-1.22.0.tar.xz.sha256sum
-sha256  582e617271e7f314d1a2211e3e3856ae2e4303c8c0d6114e9c4a5ea5719294b0  gst-plugins-good-1.22.0.tar.xz
+# From https://gstreamer.freedesktop.org/src/gst-plugins-good/gst-plugins-good-1.22.2.tar.xz.sha256sum
+sha256  7c8cc59425f2b232f60ca7d13e56edd615da4f711e73dd01a7cffa46e6bc0cdd  gst-plugins-good-1.22.2.tar.xz
 sha256  6095e9ffa777dd22839f7801aa845b31c9ed07f3d6bf8a26dc5d2dec8ccc0ef3  COPYING
diff --git a/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk b/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk
index 93c2328bda..bbcd3aecab 100644
--- a/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk
+++ b/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST1_PLUGINS_GOOD_VERSION = 1.22.0
+GST1_PLUGINS_GOOD_VERSION = 1.22.2
 GST1_PLUGINS_GOOD_SOURCE = gst-plugins-good-$(GST1_PLUGINS_GOOD_VERSION).tar.xz
 GST1_PLUGINS_GOOD_SITE = https://gstreamer.freedesktop.org/src/gst-plugins-good
 GST1_PLUGINS_GOOD_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
