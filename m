Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CBC3C433EF
	for <buildroot@archiver.kernel.org>; Sat, 14 May 2022 17:57:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 25FFF40915;
	Sat, 14 May 2022 17:57:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kwfXcPuN9LWd; Sat, 14 May 2022 17:57:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D48DC4090E;
	Sat, 14 May 2022 17:57:38 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 498791BF909
 for <buildroot@lists.busybox.net>; Sat, 14 May 2022 17:56:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A4B48409E8
 for <buildroot@lists.busybox.net>; Sat, 14 May 2022 17:56:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZMf4Wf8xVlhV for <buildroot@lists.busybox.net>;
 Sat, 14 May 2022 17:56:20 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mailout07.t-online.de (mailout07.t-online.de [194.25.134.83])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D465F414CB
 for <buildroot@buildroot.org>; Sat, 14 May 2022 17:56:19 +0000 (UTC)
Received: from fwd84.dcpf.telekom.de (fwd84.aul.t-online.de [10.223.144.110])
 by mailout07.t-online.de (Postfix) with SMTP id 5CCD2DFF9;
 Sat, 14 May 2022 19:56:17 +0200 (CEST)
Received: from fli4l.lan.fli4l ([91.58.4.164]) by fwd84.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1npvzx-1aPaCn0; Sat, 14 May 2022 19:56:13 +0200
Received: from bruckner.lan.fli4l ([192.168.1.1]:41714)
 by fli4l.lan.fli4l with esmtp (Exim 4.95)
 (envelope-from <bernd.kuhls@t-online.de>) id 1npvzw-0005N1-Pe;
 Sat, 14 May 2022 19:56:12 +0200
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Sat, 14 May 2022 19:55:54 +0200
Message-Id: <20220514175612.2510884-1-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1652550973-00009E39-CECC053C/0/0 CLEAN NORMAL
X-TOI-MSGID: 7624feb0-433f-4a91-9a51-b0aafef332ae
Subject: [Buildroot] [PATCH 01/19] package/x11r7/xserver_xorg-server: bump
 version to 21.1.3
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
https://lists.x.org/archives/xorg-announce/2022-January/003127.html

Removed patch which was applied upstream:
https://gitlab.freedesktop.org/xorg/xserver/-/commit/9c66d910cae107cbcda02a8502ac5324a6eca052

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 ...error-when-built-without-logind-plat.patch | 90 -------------------
 .../xserver_xorg-server.hash                  |  6 +-
 .../xserver_xorg-server.mk                    |  2 +-
 3 files changed, 4 insertions(+), 94 deletions(-)
 delete mode 100644 package/x11r7/xserver_xorg-server/0002-Fix-compilation-error-when-built-without-logind-plat.patch

diff --git a/package/x11r7/xserver_xorg-server/0002-Fix-compilation-error-when-built-without-logind-plat.patch b/package/x11r7/xserver_xorg-server/0002-Fix-compilation-error-when-built-without-logind-plat.patch
deleted file mode 100644
index 164c0039bd..0000000000
--- a/package/x11r7/xserver_xorg-server/0002-Fix-compilation-error-when-built-without-logind-plat.patch
+++ /dev/null
@@ -1,90 +0,0 @@
-From 17b6ab4d8cecf55a3784dbefbef9bfcf84ee3b1b Mon Sep 17 00:00:00 2001
-From: Jocelyn Falempe <jfalempe@redhat.com>
-Date: Thu, 16 Dec 2021 15:46:43 +0100
-Subject: [PATCH] Fix compilation error when built without logind/platform bus
-
-This was introduced by commit 8eb1396d
-
-Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
-[Peter: from https://gitlab.freedesktop.org/xorg/xserver/-/merge_requests/827]
-Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
----
- hw/xfree86/common/xf86Events.c               |  9 +--------
- hw/xfree86/os-support/linux/systemd-logind.c | 16 +++++++++++-----
- include/systemd-logind.h                     |  4 ++--
- 3 files changed, 14 insertions(+), 15 deletions(-)
-
-diff --git a/hw/xfree86/common/xf86Events.c b/hw/xfree86/common/xf86Events.c
-index 6076efa80..395bbc7b3 100644
---- a/hw/xfree86/common/xf86Events.c
-+++ b/hw/xfree86/common/xf86Events.c
-@@ -383,14 +383,7 @@ xf86VTLeave(void)
-         xf86GPUScreens[i]->LeaveVT(xf86GPUScreens[i]);
- 
-     if (systemd_logind_controls_session()) {
--        for (i = 0; i < xf86_num_platform_devices; i++) {
--            if (xf86_platform_devices[i].flags & XF86_PDEV_SERVER_FD) {
--                int major, minor;
--                major = xf86_platform_odev_attributes(i)->major;
--                minor = xf86_platform_odev_attributes(i)->minor;
--                systemd_logind_drop_master(major, minor);
--            }
--        }
-+        systemd_logind_drop_master();
-     }
- 
-     if (!xf86VTSwitchAway())
-diff --git a/hw/xfree86/os-support/linux/systemd-logind.c b/hw/xfree86/os-support/linux/systemd-logind.c
-index 35d5cc75b..f6a223a55 100644
---- a/hw/xfree86/os-support/linux/systemd-logind.c
-+++ b/hw/xfree86/os-support/linux/systemd-logind.c
-@@ -308,13 +308,19 @@ cleanup:
-  * and ensure the drm_drop_master is done before
-  * VT_RELDISP when switching VT
-  */
--void systemd_logind_drop_master(int _major, int _minor)
-+void systemd_logind_drop_master(void)
- {
--    struct systemd_logind_info *info = &logind_info;
--    dbus_int32_t major = _major;
--    dbus_int32_t minor = _minor;
-+    int i;
-+    for (i = 0; i < xf86_num_platform_devices; i++) {
-+        if (xf86_platform_devices[i].flags & XF86_PDEV_SERVER_FD) {
-+            dbus_int32_t major, minor;
-+            struct systemd_logind_info *info = &logind_info;
- 
--    systemd_logind_ack_pause(info, minor, major);
-+            major = xf86_platform_odev_attributes(i)->major;
-+            minor = xf86_platform_odev_attributes(i)->minor;
-+            systemd_logind_ack_pause(info, minor, major);
-+        }
-+    }
- }
- 
- static DBusHandlerResult
-diff --git a/include/systemd-logind.h b/include/systemd-logind.h
-index a8af2b96d..5c04d0130 100644
---- a/include/systemd-logind.h
-+++ b/include/systemd-logind.h
-@@ -33,7 +33,7 @@ int systemd_logind_take_fd(int major, int minor, const char *path, Bool *paus);
- void systemd_logind_release_fd(int major, int minor, int fd);
- int systemd_logind_controls_session(void);
- void systemd_logind_vtenter(void);
--void systemd_logind_drop_master(int major, int minor);
-+void systemd_logind_drop_master(void);
- #else
- #define systemd_logind_init()
- #define systemd_logind_fini()
-@@ -41,7 +41,7 @@ void systemd_logind_drop_master(int major, int minor);
- #define systemd_logind_release_fd(major, minor, fd) close(fd)
- #define systemd_logind_controls_session() 0
- #define systemd_logind_vtenter()
--#define systemd_logind_drop_master(major, minor)
-+#define systemd_logind_drop_master()
- #endif
- 
- #endif
--- 
-2.20.1
-
diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server.hash b/package/x11r7/xserver_xorg-server/xserver_xorg-server.hash
index 6008661db1..b5635b9afa 100644
--- a/package/x11r7/xserver_xorg-server/xserver_xorg-server.hash
+++ b/package/x11r7/xserver_xorg-server/xserver_xorg-server.hash
@@ -1,6 +1,6 @@
-# From https://lists.x.org/archives/xorg-announce/2021-December/003125.html
-sha256  c20bf46a9fe8e74bf4e75430637e58d49a02d806609dc161462bceb1ef7e8db0  xorg-server-21.1.2.tar.xz
-sha512  6d7a0d29d5be09f80ed505c4d6ae964795127525a0ab73a4eab4f601788ab3627033143e5aeb4c2565c6683dd3402084d13acab5554606fbd519c4aec0a79def  xorg-server-21.1.2.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2022-January/003127.html
+sha256  61d6aad5b6b47a116b960bd7f0cba4ee7e6da95d6bb0b127bde75d7d1acdebe5  xorg-server-21.1.3.tar.xz
+sha512  cf5fed023eadda62ae732f8c4d427c272ebe005188341290f3d03147042c103b00cbb94d86a0256da815fb9b9a3da315c21a05ee0c926c1a2ff0c54ab0c0638b  xorg-server-21.1.3.tar.xz
 
 # Locally calculated
 sha256  4cc0447a22635c7b2f1a93fec4aa94f1970fadeb72a063de006b51cf4963a06f  COPYING
diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
index 0cadba92a3..0f1779dcab 100644
--- a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
+++ b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XSERVER_XORG_SERVER_VERSION = 21.1.2
+XSERVER_XORG_SERVER_VERSION = 21.1.3
 XSERVER_XORG_SERVER_SOURCE = xorg-server-$(XSERVER_XORG_SERVER_VERSION).tar.xz
 XSERVER_XORG_SERVER_SITE = https://xorg.freedesktop.org/archive/individual/xserver
 XSERVER_XORG_SERVER_LICENSE = MIT
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
