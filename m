Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E4B5C433EF
	for <buildroot@archiver.kernel.org>; Fri, 22 Jul 2022 06:39:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D0D87409DB;
	Fri, 22 Jul 2022 06:39:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D0D87409DB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uChLyC1UbrJ0; Fri, 22 Jul 2022 06:39:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E7688409E3;
	Fri, 22 Jul 2022 06:39:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E7688409E3
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2ECD71BF855
 for <buildroot@lists.busybox.net>; Fri, 22 Jul 2022 06:34:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 10CD54091D
 for <buildroot@lists.busybox.net>; Fri, 22 Jul 2022 06:34:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 10CD54091D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MKtoTKAo43qY for <buildroot@lists.busybox.net>;
 Fri, 22 Jul 2022 06:34:13 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2467841710
 for <buildroot@buildroot.org>; Fri, 22 Jul 2022 06:34:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2467841710
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 2816983F2A; Fri, 22 Jul 2022 06:20:39 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 22 Jul 2022 08:32:32 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 431a3fd201df9b3ae125a449de9defabcda8f789
X-Git-Newrev: d1f700b3f1c6f8e38956bb561c279bb88a43314c
X-Patchwork-Hint: ignore
Message-Id: <20220722062039.2816983F2A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/gst1-python: bump
 version to 1.20.3
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

commit: https://git.buildroot.net/buildroot/commit/?id=d1f700b3f1c6f8e38956bb561c279bb88a43314c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Drop patch which is now upstream.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 613a3ac3d05f552662af49dbbb6b56296c629668)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gstreamer1/gst1-python/gst1-python.hash | 4 ++--
 package/gstreamer1/gst1-python/gst1-python.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gstreamer1/gst1-python/gst1-python.hash b/package/gstreamer1/gst1-python/gst1-python.hash
index fe1e2068b1..9501d94a97 100644
--- a/package/gstreamer1/gst1-python/gst1-python.hash
+++ b/package/gstreamer1/gst1-python/gst1-python.hash
@@ -1,3 +1,3 @@
-# From https://gstreamer.freedesktop.org/src/gst-python/gst-python-1.20.1.tar.xz.sha256sum
-sha256  ba6cd59faa3db3981d8c6982351c239d823c0b8e80b1acf58d2997b050289422  gst-python-1.20.1.tar.xz
+# From https://gstreamer.freedesktop.org/src/gst-python/gst-python-1.20.3.tar.xz.sha256sum
+sha256  db348120eae955b8cc4de3560a7ea06e36d6e1ddbaa99a7ad96b59846601cfdc  gst-python-1.20.3.tar.xz
 sha256  ea3ad127610e5ded2210b3a86a46314f2b3b28e438eccffdae19a4d6fbcdb0c2  COPYING
diff --git a/package/gstreamer1/gst1-python/gst1-python.mk b/package/gstreamer1/gst1-python/gst1-python.mk
index 3fd8059bee..0fa1f661b8 100644
--- a/package/gstreamer1/gst1-python/gst1-python.mk
+++ b/package/gstreamer1/gst1-python/gst1-python.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST1_PYTHON_VERSION = 1.20.1
+GST1_PYTHON_VERSION = 1.20.3
 GST1_PYTHON_SOURCE = gst-python-$(GST1_PYTHON_VERSION).tar.xz
 GST1_PYTHON_SITE = https://gstreamer.freedesktop.org/src/gst-python
 GST1_PYTHON_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
