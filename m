Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6981FC04FDE
	for <buildroot@archiver.kernel.org>; Fri,  9 Dec 2022 17:02:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EFC4B61197;
	Fri,  9 Dec 2022 17:02:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EFC4B61197
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xshEXoOXOSuz; Fri,  9 Dec 2022 17:02:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 18CDB60F3B;
	Fri,  9 Dec 2022 17:02:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 18CDB60F3B
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6EE0C1BF37A
 for <buildroot@lists.busybox.net>; Fri,  9 Dec 2022 17:01:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E139B60EC6
 for <buildroot@lists.busybox.net>; Fri,  9 Dec 2022 17:01:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E139B60EC6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1_T0gP2XOd9Y for <buildroot@lists.busybox.net>;
 Fri,  9 Dec 2022 17:01:03 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 35AA360F31
 for <buildroot@buildroot.org>; Fri,  9 Dec 2022 17:01:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 35AA360F31
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3404985EA7; Fri,  9 Dec 2022 17:01:03 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Fri, 9 Dec 2022 17:31:43 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d39f7ecd4938158183adfc13147a9d3b61c85a8e
X-Git-Newrev: 4df6b365b77c3838858b43c201f0e2af4db7a498
X-Patchwork-Hint: ignore
Message-Id: <20221209170103.3404985EA7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/x11r7/xdriver_xf86-video-r128:
 bump version to 6.12.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=4df6b365b77c3838858b43c201f0e2af4db7a498
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://lists.x.org/archives/xorg-announce/2022-December/003275.html
Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 .../x11r7/xdriver_xf86-video-r128/xdriver_xf86-video-r128.hash    | 8 +++-----
 package/x11r7/xdriver_xf86-video-r128/xdriver_xf86-video-r128.mk  | 6 +++---
 2 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/package/x11r7/xdriver_xf86-video-r128/xdriver_xf86-video-r128.hash b/package/x11r7/xdriver_xf86-video-r128/xdriver_xf86-video-r128.hash
index 455c3d4439..cf9b21ebe8 100644
--- a/package/x11r7/xdriver_xf86-video-r128/xdriver_xf86-video-r128.hash
+++ b/package/x11r7/xdriver_xf86-video-r128/xdriver_xf86-video-r128.hash
@@ -1,7 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2018-October/002926.html
-md5  105ebcfe1bac06fe84645ac3def91184  xf86-video-r128-6.12.0.tar.bz2
-sha1  7cfa41d386fa43b5d30299203e4845d8afba4899  xf86-video-r128-6.12.0.tar.bz2
-sha256  801c86882cbd2bbb3084d471dcc5cfee2c1754dcbfb4dc446676d58a6bd9e057  xf86-video-r128-6.12.0.tar.bz2
-sha512  0e667e2cfa8a87a00846361d86528c93754c403c812b66798953fa4c857b2143b2c4c44885da467e7f910d8cb910b69492cdcb6f25e2197bae6617364d152e38  xf86-video-r128-6.12.0.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2022-December/003275.html
+sha256  7d023c2b171f1664e43d12a1d21674079d8065536f82bb95b448bfce4981c741  xf86-video-r128-6.12.1.tar.xz
+sha512  18b2408fe68161c32f84c7147717f8e6c6377e81e9d59e2f098843c54cd0ae757aab5059568da8c71ef38100807d56ee22447417c236c1b3deea292bb676e700  xf86-video-r128-6.12.1.tar.xz
 # Locally computed
 sha256  69f7c71859dc8f51aabdbe7a9ee915a480933eb81658f8af2bf4c918e65afe8b  COPYING
diff --git a/package/x11r7/xdriver_xf86-video-r128/xdriver_xf86-video-r128.mk b/package/x11r7/xdriver_xf86-video-r128/xdriver_xf86-video-r128.mk
index 1931dbecd7..49514e3d3a 100644
--- a/package/x11r7/xdriver_xf86-video-r128/xdriver_xf86-video-r128.mk
+++ b/package/x11r7/xdriver_xf86-video-r128/xdriver_xf86-video-r128.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-XDRIVER_XF86_VIDEO_R128_VERSION = 6.12.0
-XDRIVER_XF86_VIDEO_R128_SOURCE = xf86-video-r128-$(XDRIVER_XF86_VIDEO_R128_VERSION).tar.bz2
-XDRIVER_XF86_VIDEO_R128_SITE = http://xorg.freedesktop.org/releases/individual/driver
+XDRIVER_XF86_VIDEO_R128_VERSION = 6.12.1
+XDRIVER_XF86_VIDEO_R128_SOURCE = xf86-video-r128-$(XDRIVER_XF86_VIDEO_R128_VERSION).tar.xz
+XDRIVER_XF86_VIDEO_R128_SITE = https://xorg.freedesktop.org/archive/individual/driver
 XDRIVER_XF86_VIDEO_R128_LICENSE = MIT
 XDRIVER_XF86_VIDEO_R128_LICENSE_FILES = COPYING
 XDRIVER_XF86_VIDEO_R128_DEPENDENCIES = xserver_xorg-server xorgproto
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
