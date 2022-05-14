Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78F50C433F5
	for <buildroot@archiver.kernel.org>; Sat, 14 May 2022 17:56:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DC630827FD;
	Sat, 14 May 2022 17:56:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GC2IzdmGoyUd; Sat, 14 May 2022 17:56:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id F16FC8291D;
	Sat, 14 May 2022 17:56:22 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E98101BF3DE
 for <buildroot@lists.busybox.net>; Sat, 14 May 2022 17:56:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D4C0F40930
 for <buildroot@lists.busybox.net>; Sat, 14 May 2022 17:56:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VM5VFI7rSTAD for <buildroot@lists.busybox.net>;
 Sat, 14 May 2022 17:56:19 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mailout09.t-online.de (mailout09.t-online.de [194.25.134.84])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8FC27400A6
 for <buildroot@buildroot.org>; Sat, 14 May 2022 17:56:19 +0000 (UTC)
Received: from fwd79.dcpf.telekom.de (fwd79.aul.t-online.de [10.223.144.105])
 by mailout09.t-online.de (Postfix) with SMTP id 6001AD884;
 Sat, 14 May 2022 19:56:16 +0200 (CEST)
Received: from fli4l.lan.fli4l ([91.58.4.164]) by fwd79.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1npvzx-2ZkJXt0; Sat, 14 May 2022 19:56:13 +0200
Received: from bruckner.lan.fli4l ([192.168.1.1]:41714)
 by fli4l.lan.fli4l with esmtp (Exim 4.95)
 (envelope-from <bernd.kuhls@t-online.de>) id 1npvzx-0005N1-1J;
 Sat, 14 May 2022 19:56:13 +0200
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Sat, 14 May 2022 19:55:56 +0200
Message-Id: <20220514175612.2510884-3-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220514175612.2510884-1-bernd.kuhls@t-online.de>
References: <20220514175612.2510884-1-bernd.kuhls@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1652550973-00010BFA-7B0A6331/0/0 CLEAN NORMAL
X-TOI-MSGID: 97468581-b83f-4312-b99d-cb671ca00a1d
Subject: [Buildroot] [PATCH 03/19] package/x11r7/xdriver_xf86-video-amdgpu:
 bump version to 22.0.0
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
Cc: Gary Bisson <bisson.gary@gmail.com>, Romain Naour <romain.naour@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jezz@sysmic.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Release notes:
https://lists.x.org/archives/xorg/2022-February/060928.html

Reformatted license hash.
Switched tarball to upstream-provided .xz format.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 .../xdriver_xf86-video-amdgpu.hash                     | 10 ++++------
 .../xdriver_xf86-video-amdgpu.mk                       |  4 ++--
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
index 6423c03f5f..c34af6faf1 100644
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
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
