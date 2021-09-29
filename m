Return-Path: <SRS0=V5PJ=OT=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28BE0C433F5
	for <buildroot@archiver.kernel.org>; Wed, 29 Sep 2021 15:09:45 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BE1A661411
	for <buildroot@archiver.kernel.org>; Wed, 29 Sep 2021 15:09:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BE1A661411
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 949594197A;
	Wed, 29 Sep 2021 15:09:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fvf4L8ON4FsL; Wed, 29 Sep 2021 15:09:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DB5D3422B4;
	Wed, 29 Sep 2021 15:09:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 82C131BF21A
 for <buildroot@lists.busybox.net>; Wed, 29 Sep 2021 15:07:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7E47F83657
 for <buildroot@lists.busybox.net>; Wed, 29 Sep 2021 15:07:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SNZ8VFPOR3SG for <buildroot@lists.busybox.net>;
 Wed, 29 Sep 2021 15:07:23 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id D2DB88350D
 for <buildroot@buildroot.org>; Wed, 29 Sep 2021 15:07:23 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id F12C38D4FD; Wed, 29 Sep 2021 15:05:03 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 29 Sep 2021 16:59:10 +0200
X-Git-Refname: refs/heads/2021.05.x
X-Git-Oldrev: d3751ed284bfaef498127b055960e6ec49d3ea64
X-Git-Newrev: 8b540d981b2d993e8246eb8f7cc707824d947e6f
X-Patchwork-Hint: ignore
Message-Id: <20210929150503.F12C38D4FD@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.05.x]
 package/gst1-plugins-ugly: bump version to 1.18.5
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

commit: https://git.buildroot.net/buildroot/commit/?id=8b540d981b2d993e8246eb8f7cc707824d947e6f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.05.x

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 6e6d6185dc50690c0c9be32118d0532850f7529e)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.hash | 4 ++--
 package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.hash b/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.hash
index 3ca78ed1bc..93945cdecd 100644
--- a/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.hash
+++ b/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.hash
@@ -1,3 +1,3 @@
-# From https://gstreamer.freedesktop.org/src/gst-plugins-ugly/gst-plugins-ugly-1.18.4.tar.xz.sha256sum
-sha256  218df0ce0d31e8ca9cdeb01a3b0c573172cc9c21bb3d41811c7820145623d13c  gst-plugins-ugly-1.18.4.tar.xz
+# From https://gstreamer.freedesktop.org/src/gst-plugins-ugly/gst-plugins-ugly-1.18.5.tar.xz.sha256sum
+sha256  df32803e98f8a9979373fa2ca7e05e62f977b1097576d3a80619d9f5c69f66d9  gst-plugins-ugly-1.18.5.tar.xz
 sha256  6095e9ffa777dd22839f7801aa845b31c9ed07f3d6bf8a26dc5d2dec8ccc0ef3  COPYING
diff --git a/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.mk b/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.mk
index b596a0bcaf..b3dc765d07 100644
--- a/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.mk
+++ b/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST1_PLUGINS_UGLY_VERSION = 1.18.4
+GST1_PLUGINS_UGLY_VERSION = 1.18.5
 GST1_PLUGINS_UGLY_SOURCE = gst-plugins-ugly-$(GST1_PLUGINS_UGLY_VERSION).tar.xz
 GST1_PLUGINS_UGLY_SITE = https://gstreamer.freedesktop.org/src/gst-plugins-ugly
 GST1_PLUGINS_UGLY_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
