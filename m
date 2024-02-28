Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46E4BC5478C
	for <buildroot@archiver.kernel.org>; Wed, 28 Feb 2024 17:31:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 152E04177A;
	Wed, 28 Feb 2024 17:31:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vay7g4Rmvxty; Wed, 28 Feb 2024 17:31:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CD563417BD
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CD563417BD;
	Wed, 28 Feb 2024 17:31:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 35D6B1BF841
 for <buildroot@lists.busybox.net>; Wed, 28 Feb 2024 17:31:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 84F4F41756
 for <buildroot@lists.busybox.net>; Wed, 28 Feb 2024 17:31:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1qJjEtdnD-lp for <buildroot@lists.busybox.net>;
 Wed, 28 Feb 2024 17:31:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B89E34175F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id B89E34175F
 for <buildroot@buildroot.org>; Wed, 28 Feb 2024 17:31:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B0E2987C3A; Wed, 28 Feb 2024 17:31:11 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 28 Feb 2024 18:28:23 +0100
X-Git-Refname: refs/heads/2023.11.x
X-Git-Oldrev: 1dbda0dc13e89faf27815651af5788fd233b63b7
X-Git-Newrev: ced0540e61304c59903809f1743adfd04db29a1f
X-Patchwork-Hint: ignore
Message-Id: <20240228173111.B0E2987C3A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.11.x] package/gst-omx: bump to
 version 1.22.9
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

commit: https://git.buildroot.net/buildroot/commit/?id=ced0540e61304c59903809f1743adfd04db29a1f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.11.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 9f342e4a676dc687e30908c954fd066f4b5c9d1f)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gstreamer1/gst-omx/gst-omx.hash | 4 ++--
 package/gstreamer1/gst-omx/gst-omx.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gstreamer1/gst-omx/gst-omx.hash b/package/gstreamer1/gst-omx/gst-omx.hash
index 528ebb99c2..86f8c772c9 100644
--- a/package/gstreamer1/gst-omx/gst-omx.hash
+++ b/package/gstreamer1/gst-omx/gst-omx.hash
@@ -1,3 +1,3 @@
-# From https://gstreamer.freedesktop.org/src/gst-omx/gst-omx-1.22.8.tar.xz.sha256sum
-sha256  94df10e7713618f0c8a4223f6e047f2d8f0ccecba1d585618e791f13037762df  gst-omx-1.22.8.tar.xz
+# From https://gstreamer.freedesktop.org/src/gst-omx/gst-omx-1.22.9.tar.xz.sha256sum
+sha256  9362d6117985d09dcf6e27bdaef377dc08efb7df01d00101d04fb644addac61e  gst-omx-1.22.9.tar.xz
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/gstreamer1/gst-omx/gst-omx.mk b/package/gstreamer1/gst-omx/gst-omx.mk
index 472f929189..32891bafa6 100644
--- a/package/gstreamer1/gst-omx/gst-omx.mk
+++ b/package/gstreamer1/gst-omx/gst-omx.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST_OMX_VERSION = 1.22.8
+GST_OMX_VERSION = 1.22.9
 GST_OMX_SOURCE = gst-omx-$(GST_OMX_VERSION).tar.xz
 GST_OMX_SITE = https://gstreamer.freedesktop.org/src/gst-omx
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
