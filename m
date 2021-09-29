Return-Path: <SRS0=V5PJ=OT=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7355C433EF
	for <buildroot@archiver.kernel.org>; Wed, 29 Sep 2021 15:10:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 892CB61407
	for <buildroot@archiver.kernel.org>; Wed, 29 Sep 2021 15:10:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 892CB61407
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6A4FA60D94;
	Wed, 29 Sep 2021 15:10:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Csm1xhMaDSWU; Wed, 29 Sep 2021 15:10:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A689360C1B;
	Wed, 29 Sep 2021 15:10:52 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 247701BF21A
 for <buildroot@lists.busybox.net>; Wed, 29 Sep 2021 15:07:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B778F60C1C
 for <buildroot@lists.busybox.net>; Wed, 29 Sep 2021 15:07:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1Km_eICUqMR0 for <buildroot@lists.busybox.net>;
 Wed, 29 Sep 2021 15:07:18 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6052D60BE8
 for <buildroot@buildroot.org>; Wed, 29 Sep 2021 15:07:18 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 6F3008D4E9; Wed, 29 Sep 2021 15:04:58 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 29 Sep 2021 16:56:52 +0200
X-Git-Refname: refs/heads/2021.08.x
X-Git-Oldrev: a5318fa09038df7d6e8f6a94a34c93061766abb5
X-Git-Newrev: 52bd90547e457aec8baa7cf12e74e80777f177ae
X-Patchwork-Hint: ignore
Message-Id: <20210929150458.6F3008D4E9@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.08.x]
 package/gst1-plugins-base: bump version to 1.18.5
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

commit: https://git.buildroot.net/buildroot/commit/?id=52bd90547e457aec8baa7cf12e74e80777f177ae
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.08.x

- delete 0002-gstgl-Fix-build-when-Meson-0.58.0rc1.patch
  (from upstream [1])

[1] https://gitlab.freedesktop.org/gstreamer/gst-plugins-base/-/commit/90903917a8185e0f9add7af8153ae2fc9875fdcb

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 2f707103c3cf758fdccf8582bcff79849b4ddbb3)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...0002-gstgl-Fix-build-when-Meson-0.58.0rc1.patch | 51 ----------------------
 .../gst1-plugins-base/gst1-plugins-base.hash       |  4 +-
 .../gst1-plugins-base/gst1-plugins-base.mk         |  2 +-
 3 files changed, 3 insertions(+), 54 deletions(-)

diff --git a/package/gstreamer1/gst1-plugins-base/0002-gstgl-Fix-build-when-Meson-0.58.0rc1.patch b/package/gstreamer1/gst1-plugins-base/0002-gstgl-Fix-build-when-Meson-0.58.0rc1.patch
deleted file mode 100644
index 347569f71b..0000000000
--- a/package/gstreamer1/gst1-plugins-base/0002-gstgl-Fix-build-when-Meson-0.58.0rc1.patch
+++ /dev/null
@@ -1,51 +0,0 @@
-From 90903917a8185e0f9add7af8153ae2fc9875fdcb Mon Sep 17 00:00:00 2001
-From: Xavier Claessens <xavier.claessens@collabora.com>
-Date: Mon, 26 Apr 2021 14:25:03 -0400
-Subject: [PATCH] gstgl: Fix build when Meson >= 0.58.0rc1
-
-"implicit_include_directories: false" now also means that current build
-directory is not added to include paths by default any more. We have to
-add it manually because we have some custom_target() that generate
-headers in current build directory.
-
-See https://github.com/mesonbuild/meson/issues/8700.
-
-Part-of: <https://gitlab.freedesktop.org/gstreamer/gst-plugins-base/-/merge_requests/1127>
-Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
-[james.hilliard1@gmail.com: backport from upstream commit
-90903917a8185e0f9add7af8153ae2fc9875fdcb]
----
- gst-libs/gst/gl/meson.build | 15 ++++++++++++---
- 1 file changed, 12 insertions(+), 3 deletions(-)
-
-diff --git a/gst-libs/gst/gl/meson.build b/gst-libs/gst/gl/meson.build
-index db11c5e89..731ee9f5e 100644
---- a/gst-libs/gst/gl/meson.build
-+++ b/gst-libs/gst/gl/meson.build
-@@ -989,11 +989,20 @@ if build_gstgl
-     command : [mkenums, glib_mkenums, '@OUTPUT@', '@INPUT@'])
-   gen_sources = [gl_enumtypes_h]
- 
-+  common_args = gst_plugins_base_args + gl_cpp_args + ['-DBUILDING_GST_GL']
-+
-+  # We have custom_target() that generate headers in the current build dir,
-+  # but with implicit_include_directories: false, meson >= 0.58.0 won't include
-+  # it by default. We cannot use include_directories('.') here because it would
-+  # also include current source dir which is what we want to avoid because
-+  # case-insensitive FS would include gst-libs/gl/egl/egl.h as EGL/egl.h.
-+  common_args += '-I@0@'.format(meson.current_build_dir())
-+
-   gstgl = library('gstgl-' + api_version,
-     gl_sources, gl_egl_sources, gl_x11_sources, gl_wayland_sources, gl_priv_sources, gl_enumtypes_c, gl_enumtypes_h,
--    c_args : gst_plugins_base_args + gl_cpp_args + ['-DBUILDING_GST_GL'],
--    cpp_args : gst_plugins_base_args + gl_cpp_args + ['-DBUILDING_GST_GL'],
--    objc_args : gst_plugins_base_args + gl_cpp_args + gl_objc_args + ['-DBUILDING_GST_GL'],
-+    c_args : common_args,
-+    cpp_args : common_args,
-+    objc_args : common_args + gl_objc_args,
-     include_directories : [configinc, libsinc, gl_includes],
-     version : libversion,
-     soversion : soversion,
--- 
-2.25.1
-
diff --git a/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.hash b/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.hash
index dabceac8f6..200ba0fe5d 100644
--- a/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.hash
+++ b/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.hash
@@ -1,3 +1,3 @@
-# From https://gstreamer.freedesktop.org/src/gst-plugins-base/gst-plugins-base-1.18.4.tar.xz.sha256sum
-sha256  29e53229a84d01d722f6f6db13087231cdf6113dd85c25746b9b58c3d68e8323  gst-plugins-base-1.18.4.tar.xz
+# From https://gstreamer.freedesktop.org/src/gst-plugins-base/gst-plugins-base-1.18.5.tar.xz.sha256sum
+sha256  960b7af4585700db0fdd5b843554e11e2564fed9e061f591fae88a7be6446fa3  gst-plugins-base-1.18.5.tar.xz
 sha256  f445dc78b88496f7e20c7a2a461b95baba5865c8919b8289ac24ac0a80c6ce7a  COPYING
diff --git a/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk b/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk
index ccbf75a4d0..76757fd6a8 100644
--- a/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk
+++ b/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST1_PLUGINS_BASE_VERSION = 1.18.4
+GST1_PLUGINS_BASE_VERSION = 1.18.5
 GST1_PLUGINS_BASE_SOURCE = gst-plugins-base-$(GST1_PLUGINS_BASE_VERSION).tar.xz
 GST1_PLUGINS_BASE_SITE = https://gstreamer.freedesktop.org/src/gst-plugins-base
 GST1_PLUGINS_BASE_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
