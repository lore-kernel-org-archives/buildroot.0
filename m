Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27D28C433FE
	for <buildroot@archiver.kernel.org>; Mon, 28 Nov 2022 10:41:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B65B540966;
	Mon, 28 Nov 2022 10:41:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B65B540966
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tYZ6zATW3EBf; Mon, 28 Nov 2022 10:41:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B98D640912;
	Mon, 28 Nov 2022 10:41:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B98D640912
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E34271BF3BE
 for <buildroot@lists.busybox.net>; Mon, 28 Nov 2022 10:41:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CB50B81768
 for <buildroot@lists.busybox.net>; Mon, 28 Nov 2022 10:41:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CB50B81768
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9k1M2M-eE7MR for <buildroot@lists.busybox.net>;
 Mon, 28 Nov 2022 10:41:43 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 63E8681765
Received: from smtprelay04.ispgateway.de (smtprelay04.ispgateway.de
 [80.67.18.16])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 63E8681765
 for <buildroot@busybox.net>; Mon, 28 Nov 2022 10:41:43 +0000 (UTC)
Received: from [91.21.124.120] (helo=exchange.go-sys.de)
 by smtprelay04.ispgateway.de with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384 (Exim 4.94.2)
 (envelope-from <mf@go-sys.de>)
 id 1ozbZX-0004yx-4c; Mon, 28 Nov 2022 11:41:11 +0100
Received: from exchange.go-sys.local (192.168.1.17) by exchange.go-sys.local
 (192.168.1.17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.2507.16; Mon, 28
 Nov 2022 11:41:03 +0100
Received: from go-sys.de (192.168.1.127) by exchange.go-sys.de (192.168.1.17)
 with Microsoft SMTP Server id 15.1.2507.16 via Frontend Transport;
 Mon, 28 Nov 2022 11:41:03 +0100
From: Michael Fischer <mf@go-sys.de>
To: <buildroot@busybox.net>
Date: Mon, 28 Nov 2022 11:40:57 +0100
Message-ID: <20221128104057.19164-1-mf@go-sys.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-C2ProcessedOrg: 77b28032-c882-4527-ad15-de6c89cb71cd
X-CrossPremisesHeadersFilteredBySendConnector: exchange.go-sys.local
X-OrganizationHeadersPreserved: exchange.go-sys.local
X-Df-Sender: c21hcnRob3N0QGdvLXN5cy5kZQ==
Subject: [Buildroot] [PATCH] package/sdl2: bump version to 2.26.0
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
Cc: Michael Fischer <mf@go-sys.de>, "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

patch 0001: already applied upstream

Signed-off-by: Michael Fischer <mf@go-sys.de>
---
 ...t-have-a-mode-configured-use-the-pre.patch | 76 -------------------
 package/sdl2/sdl2.hash                        |  4 +-
 package/sdl2/sdl2.mk                          |  2 +-
 3 files changed, 3 insertions(+), 79 deletions(-)
 delete mode 100644 package/sdl2/0001-If-a-CRTC-doesn-t-have-a-mode-configured-use-the-pre.patch

diff --git a/package/sdl2/0001-If-a-CRTC-doesn-t-have-a-mode-configured-use-the-pre.patch b/package/sdl2/0001-If-a-CRTC-doesn-t-have-a-mode-configured-use-the-pre.patch
deleted file mode 100644
index c8be280c56..0000000000
--- a/package/sdl2/0001-If-a-CRTC-doesn-t-have-a-mode-configured-use-the-pre.patch
+++ /dev/null
@@ -1,76 +0,0 @@
-From da9ba3a2a1536017e4ce1ee0f4276578d1ce6e29 Mon Sep 17 00:00:00 2001
-From: Sam Lantinga <slouken@libsdl.org>
-Date: Fri, 18 Nov 2022 12:17:27 -0800
-Subject: [PATCH] If a CRTC doesn't have a mode configured, use the preferred
- or largest mode as the default mode
-
-Fixes https://github.com/libsdl-org/SDL/issues/6421
-
-[mf@go-sys.de: backport from upstream]
-Signed-off-by: Michael Fischer <mf@go-sys.de>
-[yann.morin.1998@free.fr: do an actual backport]
-Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
----
- src/video/kmsdrm/SDL_kmsdrmvideo.c | 35 +++++++++++++++++++++++++-----
- 1 file changed, 29 insertions(+), 6 deletions(-)
-
-diff --git a/src/video/kmsdrm/SDL_kmsdrmvideo.c b/src/video/kmsdrm/SDL_kmsdrmvideo.c
-index eae721455..eeeefef2b 100644
---- a/src/video/kmsdrm/SDL_kmsdrmvideo.c
-+++ b/src/video/kmsdrm/SDL_kmsdrmvideo.c
-@@ -666,8 +666,8 @@ KMSDRM_CrtcGetVrr(uint32_t drm_fd, uint32_t crtc_id)
- /* Gets a DRM connector, builds an SDL_Display with it, and adds it to the
-    list of SDL Displays in _this->displays[]  */
- static void
--KMSDRM_AddDisplay (_THIS, drmModeConnector *connector, drmModeRes *resources) {
--
-+KMSDRM_AddDisplay (_THIS, drmModeConnector *connector, drmModeRes *resources)
-+{
-     SDL_VideoData *viddata = ((SDL_VideoData *)_this->driverdata);
-     SDL_DisplayData *dispdata = NULL;
-     SDL_VideoDisplay display = {0};
-@@ -770,14 +770,37 @@ KMSDRM_AddDisplay (_THIS, drmModeConnector *connector, drmModeRes *resources) {
-         drmModeModeInfo *mode = &connector->modes[i];
- 
-         if (!SDL_memcmp(mode, &crtc->mode, sizeof(crtc->mode))) {
--          mode_index = i;
--          break;
-+            mode_index = i;
-+            break;
-         }
-     }
- 
-     if (mode_index == -1) {
--      ret = SDL_SetError("Failed to find index of mode attached to the CRTC.");
--      goto cleanup;
-+        int current_area, largest_area = 0;
-+
-+        /* Find the preferred mode or the highest resolution mode */
-+        for (i = 0; i < connector->count_modes; i++) {
-+            drmModeModeInfo *mode = &connector->modes[i];
-+
-+            if (mode->type & DRM_MODE_TYPE_PREFERRED) {
-+                mode_index = i;
-+                break;
-+            }
-+
-+            current_area = mode->hdisplay * mode->vdisplay;
-+            if (current_area > largest_area) {
-+                mode_index = i;
-+                largest_area = current_area;
-+            }
-+        }
-+        if (mode_index != -1) {
-+            crtc->mode = connector->modes[mode_index];
-+        }
-+    }
-+
-+    if (mode_index == -1) {
-+        ret = SDL_SetError("Failed to find index of mode attached to the CRTC.");
-+        goto cleanup;
-     }
- 
-     /*********************************************/
--- 
-2.25.1
-
diff --git a/package/sdl2/sdl2.hash b/package/sdl2/sdl2.hash
index 782c552c52..78122359a2 100644
--- a/package/sdl2/sdl2.hash
+++ b/package/sdl2/sdl2.hash
@@ -1,4 +1,4 @@
-# Locally calculated after checking http://www.libsdl.org/release/SDL2-2.24.1.tar.gz.sig
-sha256  bc121588b1105065598ce38078026a414c28ea95e66ed2adab4c44d80b309e1b  SDL2-2.24.1.tar.gz
+# Locally calculated after checking http://www.libsdl.org/release/SDL2-2.26.0.tar.gz.sig
+sha256  8000d7169febce93c84b6bdf376631f8179132fd69f7015d4dadb8b9c2bdb295  SDL2-2.26.0.tar.gz
 # Locally calculated
 sha256  fcb07e07ac6bc8b2fcf047b50431ef4ebe5b619d7ca7c82212018309a9067426  LICENSE.txt
diff --git a/package/sdl2/sdl2.mk b/package/sdl2/sdl2.mk
index 28e2c5cb36..3b897f2380 100644
--- a/package/sdl2/sdl2.mk
+++ b/package/sdl2/sdl2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SDL2_VERSION = 2.24.1
+SDL2_VERSION = 2.26.0
 SDL2_SOURCE = SDL2-$(SDL2_VERSION).tar.gz
 SDL2_SITE = http://www.libsdl.org/release
 SDL2_LICENSE = Zlib
-- 
2.20.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
