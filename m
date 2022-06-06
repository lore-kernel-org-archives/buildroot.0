Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3ADEEC43334
	for <buildroot@archiver.kernel.org>; Mon,  6 Jun 2022 20:38:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AF26D41C19;
	Mon,  6 Jun 2022 20:38:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id f_c6YjajsU1x; Mon,  6 Jun 2022 20:38:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0F28F41C16;
	Mon,  6 Jun 2022 20:38:11 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 065A01BF990
 for <buildroot@lists.busybox.net>; Mon,  6 Jun 2022 20:37:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E851B415CB
 for <buildroot@lists.busybox.net>; Mon,  6 Jun 2022 20:37:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sicAPoZw2SP2 for <buildroot@lists.busybox.net>;
 Mon,  6 Jun 2022 20:37:29 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id D93CA41582
 for <buildroot@buildroot.org>; Mon,  6 Jun 2022 20:37:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id ECD7F86DDD; Mon,  6 Jun 2022 20:25:39 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Mon, 6 Jun 2022 21:29:15 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: e3245e3eba03f9ec64597afbebdeb90dd3064b26
X-Git-Newrev: bd0a0da7dfd6dee5e0125e04a361fd8051a2a3cd
X-Patchwork-Hint: ignore
Message-Id: <20220606202539.ECD7F86DDD@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next]
 package/x11r7/xdriver_xf86-video-amdgpu: bump version to 22.0.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=bd0a0da7dfd6dee5e0125e04a361fd8051a2a3cd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Release notes:
https://lists.x.org/archives/xorg/2022-February/060928.html

Reformatted license hash.
Switched tarball to upstream-provided .xz format.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 .../xdriver_xf86-video-amdgpu/xdriver_xf86-video-amdgpu.hash   | 10 ++++------
 .../xdriver_xf86-video-amdgpu/xdriver_xf86-video-amdgpu.mk     |  4 ++--
 2 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/package/x11r7/xdriver_xf86-video-amdgpu/xdriver_xf86-video-amdgpu.hash b/package/x11r7/xdriver_xf86-video-amdgpu/xdriver_xf86-video-amdgpu.hash
index 4bbfb0de71..c45ae59ee4 100644
--- a/package/x11r7/xdriver_xf86-video-amdgpu/xdriver_xf86-video-amdgpu.hash
+++ b/package/x11r7/xdriver_xf86-video-amdgpu/xdriver_xf86-video-amdgpu.hash
@@ -1,7 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2019-October/003026.html
-md5 55ad19b858e186a2cf4e91ed832c05e7  xf86-video-amdgpu-19.1.0.tar.bz2
-sha1 044a97ea2f36dd3d2d4844bb503dd4e2b2854d56  xf86-video-amdgpu-19.1.0.tar.bz2
-sha256 4f0ea4e0ae61995ac2b7c72433d31deab63b60c78763020aaa1b28696124fe5d  xf86-video-amdgpu-19.1.0.tar.bz2
-sha512 ccdaa2378492da1a2f3d18fedacd1318c4708da534a8a959276a82730d5420619d83ad1ec8d7835c55655fe56123cd9bffb44e6223c5a97033c01f598af4a173  xf86-video-amdgpu-19.1.0.tar.bz2
+# From https://lists.x.org/archives/xorg/2022-February/060928.html
+sha256  9d23fb602915dc3ccde92aa4d1e9485e7e54eaae2f41f485e55eb20761778266  xf86-video-amdgpu-22.0.0.tar.xz
+sha512  95c64e3fef7729ced6e7adc5e81c60cc218f6d8b6604f7b290e86ff52c917426b5102decbf8be8a66c9181ccde6e5dff7083dca8cc0c493a39e82625b5c7cb2a  xf86-video-amdgpu-22.0.0.tar.xz
 # Locally computed
-sha256 58847c8e97190c401afa84b3f0b8b147379c876a184e99af2cb51bfd40ac8936  COPYING
+sha256  58847c8e97190c401afa84b3f0b8b147379c876a184e99af2cb51bfd40ac8936  COPYING
diff --git a/package/x11r7/xdriver_xf86-video-amdgpu/xdriver_xf86-video-amdgpu.mk b/package/x11r7/xdriver_xf86-video-amdgpu/xdriver_xf86-video-amdgpu.mk
index e7196956a3..23452fe417 100644
--- a/package/x11r7/xdriver_xf86-video-amdgpu/xdriver_xf86-video-amdgpu.mk
+++ b/package/x11r7/xdriver_xf86-video-amdgpu/xdriver_xf86-video-amdgpu.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-XDRIVER_XF86_VIDEO_AMDGPU_VERSION = 19.1.0
-XDRIVER_XF86_VIDEO_AMDGPU_SOURCE = xf86-video-amdgpu-$(XDRIVER_XF86_VIDEO_AMDGPU_VERSION).tar.bz2
+XDRIVER_XF86_VIDEO_AMDGPU_VERSION = 22.0.0
+XDRIVER_XF86_VIDEO_AMDGPU_SOURCE = xf86-video-amdgpu-$(XDRIVER_XF86_VIDEO_AMDGPU_VERSION).tar.xz
 XDRIVER_XF86_VIDEO_AMDGPU_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_VIDEO_AMDGPU_LICENSE = MIT
 XDRIVER_XF86_VIDEO_AMDGPU_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
