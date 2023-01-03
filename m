Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8229C53210
	for <buildroot@archiver.kernel.org>; Tue,  3 Jan 2023 19:17:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 578FA60FA4;
	Tue,  3 Jan 2023 19:17:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 578FA60FA4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FTEOc843swex; Tue,  3 Jan 2023 19:17:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7B45260F93;
	Tue,  3 Jan 2023 19:17:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7B45260F93
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 696671BF834
 for <buildroot@lists.busybox.net>; Tue,  3 Jan 2023 19:17:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4574560F95
 for <buildroot@lists.busybox.net>; Tue,  3 Jan 2023 19:17:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4574560F95
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gZ6n5rEXHjH7 for <buildroot@lists.busybox.net>;
 Tue,  3 Jan 2023 19:16:58 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6479260784
Received: from mailout06.t-online.de (mailout06.t-online.de [194.25.134.19])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6479260784
 for <buildroot@buildroot.org>; Tue,  3 Jan 2023 19:16:58 +0000 (UTC)
Received: from fwd80.dcpf.telekom.de (fwd80.aul.t-online.de [10.223.144.106])
 by mailout06.t-online.de (Postfix) with SMTP id 0AEE34115;
 Tue,  3 Jan 2023 20:16:56 +0100 (CET)
Received: from fli4l.lan.fli4l ([84.161.180.73]) by fwd80.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1pCmmK-1XHij30; Tue, 3 Jan 2023 20:16:52 +0100
Received: from bruckner.lan.fli4l ([192.168.1.1]:59256)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd.kuhls@t-online.de>) id 1pCmmK-0005ez-1K;
 Tue, 03 Jan 2023 20:16:52 +0100
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Tue,  3 Jan 2023 20:16:52 +0100
Message-Id: <20230103191652.46936-2-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230103191652.46936-1-bernd.kuhls@t-online.de>
References: <20230103191652.46936-1-bernd.kuhls@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1672773412-AB7F81D1-553A7F30/0/0 CLEAN NORMAL
X-TOI-MSGID: aad7812a-d5a8-449b-b0a0-7773b8ba9299
Subject: [Buildroot] [PATCH 2/2] package/intel-mediadriver: bump version to
 22.6.5
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
Cc: Louis-Paul Cordier <lpdev@cordier.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Removed patch included in upstream release.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 .../0001-dont-include-va-dricommon-h.patch    | 36 -------------------
 .../intel-mediadriver/intel-mediadriver.hash  |  2 +-
 .../intel-mediadriver/intel-mediadriver.mk    |  2 +-
 3 files changed, 2 insertions(+), 38 deletions(-)
 delete mode 100644 package/intel-mediadriver/0001-dont-include-va-dricommon-h.patch

diff --git a/package/intel-mediadriver/0001-dont-include-va-dricommon-h.patch b/package/intel-mediadriver/0001-dont-include-va-dricommon-h.patch
deleted file mode 100644
index 9d512f9c0b..0000000000
--- a/package/intel-mediadriver/0001-dont-include-va-dricommon-h.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From e0d2caafcd5e583a01f7792eaec5d1f2d540bdf1 Mon Sep 17 00:00:00 2001
-From: Rudi Heitbaum <rudi@heitbaum.com>
-Date: Fri, 18 Nov 2022 22:44:52 +1100
-Subject: [PATCH] [Media Common] [VP] dont include va_dricommon.h
-
-<va/va_dricommon.h> is not in non-X11 libva 2.16.0
-The header "media_libva_putsurface_linux.h" is included
-
-Downloaded from upstream commit
-https://github.com/intel/media-driver/commit/e0d2caafcd5e583a01f7792eaec5d1f2d540bdf1
-
-Signed-off-by: Rudi Heitbaum <rudi@heitbaum.com>
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
----
- media_softlet/linux/common/vp/ddi/ddi_vp_functions.cpp | 3 +--
- 1 file changed, 1 insertion(+), 2 deletions(-)
-
-diff --git a/media_softlet/linux/common/vp/ddi/ddi_vp_functions.cpp b/media_softlet/linux/common/vp/ddi/ddi_vp_functions.cpp
-index 8695d6c86..6719c07b3 100644
---- a/media_softlet/linux/common/vp/ddi/ddi_vp_functions.cpp
-+++ b/media_softlet/linux/common/vp/ddi/ddi_vp_functions.cpp
-@@ -23,7 +23,6 @@
- //! \file     ddi_vp_functions.cpp
- //! \brief    ddi vp functions implementaion.
- //!
--#include <va/va_dricommon.h>
- #include "ddi_vp_functions.h"
- #include "media_libva_util_next.h"
- #include "media_libva_common_next.h"
-@@ -4700,4 +4699,4 @@ VAStatus DdiVpFunctions::PutSurfaceLinuxHW(
- 
-     return VA_STATUS_SUCCESS;
- }
--#endif // !defined(ANDROID) && defined(X11_FOUND)
-\ No newline at end of file
-+#endif // !defined(ANDROID) && defined(X11_FOUND)
diff --git a/package/intel-mediadriver/intel-mediadriver.hash b/package/intel-mediadriver/intel-mediadriver.hash
index a9b7c6407d..b2c45eb025 100644
--- a/package/intel-mediadriver/intel-mediadriver.hash
+++ b/package/intel-mediadriver/intel-mediadriver.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  0c04b9d74b92de41fd409b62913ce4afd799236c0b6bc1983a496990764e5d90  intel-media-22.6.4.tar.gz
+sha256  cbb6a514564f8c3349b1f78fc0906b636ea2074d7605cb0e820c5b727ce88cdc  intel-media-22.6.5.tar.gz
 sha256  74979d5aaee78b8da82e3aafd415a216b6131dfff6d95d6930927c8a4e3bded3  LICENSE.md
diff --git a/package/intel-mediadriver/intel-mediadriver.mk b/package/intel-mediadriver/intel-mediadriver.mk
index 5010a9ca1e..2dfddf6f22 100644
--- a/package/intel-mediadriver/intel-mediadriver.mk
+++ b/package/intel-mediadriver/intel-mediadriver.mk
@@ -6,7 +6,7 @@
 
 # based on https://software.intel.com/en-us/articles/build-and-debug-open-source-media-stack
 
-INTEL_MEDIADRIVER_VERSION = 22.6.4
+INTEL_MEDIADRIVER_VERSION = 22.6.5
 INTEL_MEDIADRIVER_SITE = https://github.com/intel/media-driver/archive
 INTEL_MEDIADRIVER_SOURCE= intel-media-$(INTEL_MEDIADRIVER_VERSION).tar.gz
 INTEL_MEDIADRIVER_LICENSE = MIT, BSD-3-Clause
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
