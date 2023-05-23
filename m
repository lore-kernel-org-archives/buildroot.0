Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D8E4C7EE23
	for <buildroot@archiver.kernel.org>; Tue, 23 May 2023 19:54:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A21EE614CD;
	Tue, 23 May 2023 19:54:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A21EE614CD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8wkpzMq-XgdZ; Tue, 23 May 2023 19:54:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8EAEE614D9;
	Tue, 23 May 2023 19:54:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8EAEE614D9
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E0CCF1BF378
 for <buildroot@lists.busybox.net>; Tue, 23 May 2023 19:54:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C5B6F400F0
 for <buildroot@lists.busybox.net>; Tue, 23 May 2023 19:54:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C5B6F400F0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GLIjZmVJGtMY for <buildroot@lists.busybox.net>;
 Tue, 23 May 2023 19:54:53 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C0C7E4007E
Received: from mailout06.t-online.de (mailout06.t-online.de [194.25.134.19])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C0C7E4007E
 for <buildroot@buildroot.org>; Tue, 23 May 2023 19:54:52 +0000 (UTC)
Received: from fwd79.dcpf.telekom.de (fwd79.aul.t-online.de [10.223.144.105])
 by mailout06.t-online.de (Postfix) with SMTP id 1091A17A5;
 Tue, 23 May 2023 21:54:18 +0200 (CEST)
Received: from fli4l.lan.fli4l ([91.58.6.127]) by fwd79.t-online.de
 with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
 esmtp id 1q1Y5D-1tduGf0; Tue, 23 May 2023 21:54:11 +0200
Received: from bruckner.lan.fli4l ([192.168.1.1]:53926)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd.kuhls@t-online.de>) id 1q1Y5D-0003zA-1Q;
 Tue, 23 May 2023 21:54:11 +0200
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Tue, 23 May 2023 21:54:11 +0200
Message-Id: <20230523195411.231639-1-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1684871651-417F4266-AAB8DF6D/0/0 CLEAN NORMAL
X-TOI-MSGID: ec4b8d4b-990f-44bf-9564-f8a5128e4a8c
Subject: [Buildroot] [PATCH/next 1/1] package/eudev: bump version to 3.2.12
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Release notes:
https://github.com/eudev-project/eudev/releases/tag/v3.2.12

Removed patch 0001, a different fix was applied in 2015:
https://github.com/eudev-project/eudev/commit/c7badd37d3ac5b06b1fb170b7dfc8ed7c00ce64b

Removed patch 0002 which is included in this release.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
Build-tested using this defconfig:

BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
BR2_PACKAGE_EUDEV_RULES_GEN=y

                             arm-aarch64 [ 1/45]: OK
                   bootlin-aarch64-glibc [ 2/45]: OK
               bootlin-arcle-hs38-uclibc [ 3/45]: OK
                    bootlin-armv5-uclibc [ 4/45]: OK
                     bootlin-armv7-glibc [ 5/45]: OK
                   bootlin-armv7m-uclibc [ 6/45]: SKIPPED
                      bootlin-armv7-musl [ 7/45]: OK
                bootlin-m68k-5208-uclibc [ 8/45]: SKIPPED
               bootlin-m68k-68040-uclibc [ 9/45]: OK
             bootlin-microblazeel-uclibc [10/45]: OK
                bootlin-mipsel32r6-glibc [11/45]: OK
                   bootlin-mipsel-uclibc [12/45]: OK
                     bootlin-nios2-glibc [13/45]: OK
                 bootlin-openrisc-uclibc [14/45]: OK
        bootlin-powerpc64le-power8-glibc [15/45]: OK
           bootlin-powerpc-e500mc-uclibc [16/45]: OK
                   bootlin-riscv32-glibc [17/45]: OK
                   bootlin-riscv64-glibc [18/45]: OK
                    bootlin-riscv64-musl [19/45]: OK
                 bootlin-s390x-z13-glibc [20/45]: OK
                      bootlin-sh4-uclibc [21/45]: OK
                   bootlin-sparc64-glibc [22/45]: OK
                    bootlin-sparc-uclibc [23/45]: OK
                    bootlin-x86-64-glibc [24/45]: OK
                     bootlin-x86-64-musl [25/45]: OK
                   bootlin-x86-64-uclibc [26/45]: OK
                   bootlin-xtensa-uclibc [27/45]: OK
                            br-arm-basic [28/45]: SKIPPED
                    br-arm-full-nothread [29/45]: OK
                      br-arm-full-static [30/45]: SKIPPED
                   br-i386-pentium4-full [31/45]: OK
                br-i386-pentium-mmx-musl [32/45]: OK
                      br-mips64-n64-full [33/45]: OK
                 br-mips64r6-el-hf-glibc [34/45]: OK
               br-powerpc-603e-basic-cpp [35/45]: SKIPPED
               br-powerpc64-power7-glibc [36/45]: OK
                       linaro-aarch64-be [37/45]: OK
                          linaro-aarch64 [38/45]: OK
                              linaro-arm [39/45]: OK
                     sourcery-arm-armv4t [40/45]: OK
                            sourcery-arm [41/45]: OK
                     sourcery-arm-thumb2 [42/45]: OK
                         sourcery-mips64 [43/45]: OK
                           sourcery-mips [44/45]: OK
                          sourcery-nios2 [45/45]: OK
45 builds, 5 skipped, 0 build failed, 0 legal-info failed, 0 show-info failed

 .checkpackageignore                           |  1 -
 ...-pragma-for-ignoring-diagnostics-if-.patch | 39 ----------------
 ...mpile-time-issue-on-very-old-kernels.patch | 44 -------------------
 package/eudev/eudev.hash                      |  2 +-
 package/eudev/eudev.mk                        |  2 +-
 5 files changed, 2 insertions(+), 86 deletions(-)
 delete mode 100644 package/eudev/0001-Only-use-pragma-for-ignoring-diagnostics-if-.patch
 delete mode 100644 package/eudev/0002-Fix-compile-time-issue-on-very-old-kernels.patch

diff --git a/.checkpackageignore b/.checkpackageignore
index 947f4606aa..37c84a0505 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -433,7 +433,6 @@ package/erlang/0002-erts-emulator-reorder-inclued-headers-paths.patch Upstream
 package/erlang/0003-crypto-Fixes-for-LibreSSL-3-5-0.patch Upstream
 package/espeak/0001-Fix-build-of-shared-library-on-architectures-needing.patch Upstream
 package/espeak/0002-tr_languages-cast-string_ordinal-init-values.patch Upstream
-package/eudev/0001-Only-use-pragma-for-ignoring-diagnostics-if-.patch Upstream
 package/eudev/S10udev ConsecutiveEmptyLines Indent Shellcheck Variables
 package/evemu/0001-Include-limits.h-for-PATH_MAX.patch Upstream
 package/evemu/0002-evemu-Update-struct-input_event.patch Upstream
diff --git a/package/eudev/0001-Only-use-pragma-for-ignoring-diagnostics-if-.patch b/package/eudev/0001-Only-use-pragma-for-ignoring-diagnostics-if-.patch
deleted file mode 100644
index 3046ba528b..0000000000
--- a/package/eudev/0001-Only-use-pragma-for-ignoring-diagnostics-if-.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From dc8aa43b7b6d0cead7d8a0c1a151d289a5233a10 Mon Sep 17 00:00:00 2001
-From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
-Date: Wed, 2 Apr 2014 12:36:52 +0200
-Subject: [PATCH] libudev: Only use #pragma for ignoring diagnostics if GCC
- version supports it.
-
-[Peter: update for 2.1.1, fix shared_assert issue]
-Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
----
- src/shared/macro.h |    8 +++++
- 1 file changed, 8 insertions(+)
-
-diff --git a/src/shared/macro.h b/src/shared/macro.h
---- a/src/shared/macro.h
-+++ b/src/shared/macro.h
-@@ -38,6 +38,7 @@
- #define _cleanup_(x) __attribute__((cleanup(x)))
- 
- /* Temporarily disable some warnings */
-+#if __GNUC__ > 4 || (__GNUC__ == 4 && __GNUC_MINOR__ >= 6)
- #define DISABLE_WARNING_DECLARATION_AFTER_STATEMENT                     \
-         _Pragma("GCC diagnostic push");                                 \
-         _Pragma("GCC diagnostic ignored \"-Wdeclaration-after-statement\"")
-@@ -48,6 +49,13 @@
- 
- #define REENABLE_WARNING                                                \
-         _Pragma("GCC diagnostic pop")
-+#else
-+#define DISABLE_WARNING_DECLARATION_AFTER_STATEMENT
-+#define DISABLE_WARNING_FORMAT_NONLITERAL
-+#define REENABLE_WARNING
-+/* glibc unconditionally defines this, but it needs GCC 4.6+ */
-+#undef static_assert
-+#endif
- 
- #define XCONCATENATE(x, y) x ## y
- #define CONCATENATE(x, y) XCONCATENATE(x, y)
--- 
-1.7.9.5
diff --git a/package/eudev/0002-Fix-compile-time-issue-on-very-old-kernels.patch b/package/eudev/0002-Fix-compile-time-issue-on-very-old-kernels.patch
deleted file mode 100644
index 46961cc9d1..0000000000
--- a/package/eudev/0002-Fix-compile-time-issue-on-very-old-kernels.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-From 09b536e0b9d0964674936901ab9d2954f935c8b4 Mon Sep 17 00:00:00 2001
-From: Stefan Ott <stefan@ott.net>
-Date: Wed, 5 Apr 2023 18:20:37 +0200
-Subject: [PATCH] Fix compile-time issue on very old kernels
-
-Kernel versions prior to 3.4 did not have V4L2_CAP_DEVICE_CAPS and
-compiling against such a kernel will fail.
-
-This patch introduces a version check and makes eudev fall back to
-v2cap.capabilities on these kernels.
-
-Upstream: https://github.com/eudev-project/eudev/commit/09b536e0b9d0964674936901ab9d2954f935c8b4
-Signed-off-by: Stefan Ott <stefan@ott.net>
----
- src/v4l_id/v4l_id.c | 3 +++
- 1 file changed, 3 insertions(+)
-
-diff --git a/src/v4l_id/v4l_id.c b/src/v4l_id/v4l_id.c
-index 6bf45effe..702d5b687 100644
---- a/src/v4l_id/v4l_id.c
-+++ b/src/v4l_id/v4l_id.c
-@@ -28,6 +28,7 @@
- #include <sys/types.h>
- #include <sys/time.h>
- #include <sys/ioctl.h>
-+#include <linux/version.h>
- #include <linux/videodev2.h>
- 
- #include "util.h"
-@@ -71,9 +72,11 @@ int main(int argc, char *argv[]) {
-                 printf("ID_V4L_VERSION=2\n");
-                 printf("ID_V4L_PRODUCT=%s\n", v2cap.card);
-                 printf("ID_V4L_CAPABILITIES=:");
-+#if LINUX_VERSION_CODE >= KERNEL_VERSION(3,4,0)
-                 if (v2cap.capabilities & V4L2_CAP_DEVICE_CAPS)
-                         capabilities = v2cap.device_caps;
-                 else
-+#endif
-                         capabilities = v2cap.capabilities;
-                 if ((capabilities & V4L2_CAP_VIDEO_CAPTURE) > 0 ||
-                     (capabilities & V4L2_CAP_VIDEO_CAPTURE_MPLANE) > 0)
--- 
-2.40.0
-
diff --git a/package/eudev/eudev.hash b/package/eudev/eudev.hash
index fe6c7ef008..d91bc761c9 100644
--- a/package/eudev/eudev.hash
+++ b/package/eudev/eudev.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  19847cafec67897da855fde56f9dc7d92e21c50e450aa79068a7e704ed44558b  eudev-3.2.11.tar.gz
+sha256  ccdd64ec3c381d3c3ed0e99d2e70d1f62988c7763de89ca7bdffafa5eacb9ad8  eudev-3.2.12.tar.gz
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
diff --git a/package/eudev/eudev.mk b/package/eudev/eudev.mk
index a61d3c08f1..6de82acbdb 100644
--- a/package/eudev/eudev.mk
+++ b/package/eudev/eudev.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-EUDEV_VERSION = 3.2.11
+EUDEV_VERSION = 3.2.12
 EUDEV_SITE = https://github.com/eudev-project/eudev/releases/download/v$(EUDEV_VERSION)
 EUDEV_LICENSE = GPL-2.0+ (programs), LGPL-2.1+ (libraries)
 EUDEV_LICENSE_FILES = COPYING
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
