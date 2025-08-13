Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2991C87FCF
	for <buildroot@archiver.kernel.org>; Wed, 13 Aug 2025 21:57:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 756EC61C9C;
	Wed, 13 Aug 2025 21:57:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sBRjomPthG6W; Wed, 13 Aug 2025 21:57:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 660E461C8D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 660E461C8D;
	Wed, 13 Aug 2025 21:57:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0867C1BA
 for <buildroot@buildroot.org>; Wed, 13 Aug 2025 21:57:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E23E342AC6
 for <buildroot@buildroot.org>; Wed, 13 Aug 2025 21:57:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pJ9dJXXQQPMn for <buildroot@buildroot.org>;
 Wed, 13 Aug 2025 21:57:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 43BBC42ABC
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 43BBC42ABC
 for <buildroot@buildroot.org>; Wed, 13 Aug 2025 21:57:45 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 319BC875AD; Wed, 13 Aug 2025 21:57:45 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 13 Aug 2025 23:37:01 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: c3ceae347284e0bb018b074520e317160b3d16dc
X-Git-Newrev: 83b3dc9815144ba94a54d833e86e060fe2ff6133
X-Patchwork-Hint: ignore
Message-Id: <20250813215745.319BC875AD@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next]
 package/gstreamer1/gst1-plugins-bayer2rgb-neon: bump to v0.6.0-11-g7e06aa3
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6686945209950924483=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6686945209950924483==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=83b3dc9815144ba94a54d833e86e060fe2ff6133
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

This new version v0.6.0-11-g7e06aa3 (lastest git commit)
supports more bayer formats:
https://gitlab-ext.sigma-chemnitz.de/ensc/gst-bayer2rgb-neon/-/commit/b5ad78a1c6bfaa3adce5f0f69493efcce106e953

Signed-off-by: Sébastien Tisserand <sebastien.tisserand@armadeus.com>
Reviewed-by: Sébastien Szymanski <sebastien.szymanski@armadeus.com>
[Julien: use "git describe --tags --abbrev=40" format in _VERSION]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .../gst1-plugins-bayer2rgb-neon/gst1-plugins-bayer2rgb-neon.hash        | 2 +-
 .../gst1-plugins-bayer2rgb-neon/gst1-plugins-bayer2rgb-neon.mk          | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/gstreamer1/gst1-plugins-bayer2rgb-neon/gst1-plugins-bayer2rgb-neon.hash b/package/gstreamer1/gst1-plugins-bayer2rgb-neon/gst1-plugins-bayer2rgb-neon.hash
index 1efaf6421d..7a9a009a5d 100644
--- a/package/gstreamer1/gst1-plugins-bayer2rgb-neon/gst1-plugins-bayer2rgb-neon.hash
+++ b/package/gstreamer1/gst1-plugins-bayer2rgb-neon/gst1-plugins-bayer2rgb-neon.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  6ae89adf1979edf5760bbf2fb589dcaa905cff55bb828e6b271bc3d1e403a130  gst1-plugins-bayer2rgb-neon-b630798efcd611879e7cb1c246052e5ba1acc41d-git4.tar.gz
+sha256  e44fbe895310fd3fd0e43d02fadda3ad33bd00ec79159bf305c44f2919c68612  gst1-plugins-bayer2rgb-neon-v0.6.0-11-g7e06aa310805b1600d12f1d3bb0058aa02ab8f83-git4.tar.gz
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/gstreamer1/gst1-plugins-bayer2rgb-neon/gst1-plugins-bayer2rgb-neon.mk b/package/gstreamer1/gst1-plugins-bayer2rgb-neon/gst1-plugins-bayer2rgb-neon.mk
index 0d4aeac7f5..de9a8b4bad 100644
--- a/package/gstreamer1/gst1-plugins-bayer2rgb-neon/gst1-plugins-bayer2rgb-neon.mk
+++ b/package/gstreamer1/gst1-plugins-bayer2rgb-neon/gst1-plugins-bayer2rgb-neon.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST1_PLUGINS_BAYER2RGB_NEON_VERSION = b630798efcd611879e7cb1c246052e5ba1acc41d
+GST1_PLUGINS_BAYER2RGB_NEON_VERSION = v0.6.0-11-g7e06aa310805b1600d12f1d3bb0058aa02ab8f83
 GST1_PLUGINS_BAYER2RGB_NEON_SITE = https://gitlab-ext.sigma-chemnitz.de/ensc/gst-bayer2rgb-neon.git
 GST1_PLUGINS_BAYER2RGB_NEON_SITE_METHOD = git
 GST1_PLUGINS_BAYER2RGB_NEON_LICENSE = GPL-3.0

--===============6686945209950924483==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6686945209950924483==--
