Return-Path: <SRS0=USZC=O5=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CD18C433F5
	for <buildroot@archiver.kernel.org>; Sat,  9 Oct 2021 08:35:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B1F4660EFE
	for <buildroot@archiver.kernel.org>; Sat,  9 Oct 2021 08:35:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B1F4660EFE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=t-online.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7E6A440667;
	Sat,  9 Oct 2021 08:35:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qeaHJCDUtTn3; Sat,  9 Oct 2021 08:35:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C4A3440661;
	Sat,  9 Oct 2021 08:35:45 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 830581BF388
 for <buildroot@lists.busybox.net>; Sat,  9 Oct 2021 08:35:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 720FC605FC
 for <buildroot@lists.busybox.net>; Sat,  9 Oct 2021 08:35:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oF5J5LnhVgr9 for <buildroot@lists.busybox.net>;
 Sat,  9 Oct 2021 08:35:42 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mailout07.t-online.de (mailout07.t-online.de [194.25.134.83])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D5725605F4
 for <buildroot@buildroot.org>; Sat,  9 Oct 2021 08:35:41 +0000 (UTC)
Received: from fwd79.dcpf.telekom.de (fwd79.aul.t-online.de [10.223.144.105])
 by mailout07.t-online.de (Postfix) with SMTP id E726EF6C6
 for <buildroot@buildroot.org>; Sat,  9 Oct 2021 10:34:09 +0200 (CEST)
Received: from fli4l.lan.fli4l ([79.214.199.18]) by fwd79.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1mZ7o1-2BtSWP0; Sat, 9 Oct 2021 10:34:09 +0200
Received: from bruckner.lan.fli4l ([192.168.1.1]:50298)
 by fli4l.lan.fli4l with esmtp (Exim 4.95)
 (envelope-from <bernd.kuhls@t-online.de>) id 1mZ7o1-0001N4-1g
 for buildroot@buildroot.org; Sat, 09 Oct 2021 10:34:09 +0200
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Sat,  9 Oct 2021 10:34:09 +0200
Message-Id: <20211009083409.590326-1-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1633768449-0000146E-9143E375/0/0 CLEAN NORMAL
X-TOI-MSGID: a46503ce-b1de-40c9-9663-a8f37ad939f5
Subject: [Buildroot] [PATCH 1/1] package/kodi: bump version to 19.2
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Removed patch 0002 which was applied upstream.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 .../kodi-jsonschemabuilder.mk                 |  2 +-
 .../kodi-texturepacker/kodi-texturepacker.mk  |  2 +-
 .../kodi/0002-utils-include-fmt-xchar.h.patch | 34 -------------------
 package/kodi/kodi.hash                        |  2 +-
 package/kodi/kodi.mk                          |  2 +-
 5 files changed, 4 insertions(+), 38 deletions(-)
 delete mode 100644 package/kodi/0002-utils-include-fmt-xchar.h.patch

diff --git a/package/kodi-jsonschemabuilder/kodi-jsonschemabuilder.mk b/package/kodi-jsonschemabuilder/kodi-jsonschemabuilder.mk
index d57e9f2434..7b4df91efe 100644
--- a/package/kodi-jsonschemabuilder/kodi-jsonschemabuilder.mk
+++ b/package/kodi-jsonschemabuilder/kodi-jsonschemabuilder.mk
@@ -6,7 +6,7 @@
 
 # Not possible to directly refer to kodi variables, because of
 # first/second expansion trickery...
-KODI_JSONSCHEMABUILDER_VERSION = 19.1-Matrix
+KODI_JSONSCHEMABUILDER_VERSION = 19.2-Matrix
 KODI_JSONSCHEMABUILDER_SITE = $(call github,xbmc,xbmc,$(KODI_JSONSCHEMABUILDER_VERSION))
 KODI_JSONSCHEMABUILDER_SOURCE = kodi-$(KODI_JSONSCHEMABUILDER_VERSION).tar.gz
 KODI_JSONSCHEMABUILDER_DL_SUBDIR = kodi
diff --git a/package/kodi-texturepacker/kodi-texturepacker.mk b/package/kodi-texturepacker/kodi-texturepacker.mk
index c50387e8d2..7d13c72cc6 100644
--- a/package/kodi-texturepacker/kodi-texturepacker.mk
+++ b/package/kodi-texturepacker/kodi-texturepacker.mk
@@ -6,7 +6,7 @@
 
 # Not possible to directly refer to kodi variables, because of
 # first/second expansion trickery...
-KODI_TEXTUREPACKER_VERSION = 19.1-Matrix
+KODI_TEXTUREPACKER_VERSION = 19.2-Matrix
 KODI_TEXTUREPACKER_SITE = $(call github,xbmc,xbmc,$(KODI_TEXTUREPACKER_VERSION))
 KODI_TEXTUREPACKER_SOURCE = kodi-$(KODI_TEXTUREPACKER_VERSION).tar.gz
 KODI_TEXTUREPACKER_DL_SUBDIR = kodi
diff --git a/package/kodi/0002-utils-include-fmt-xchar.h.patch b/package/kodi/0002-utils-include-fmt-xchar.h.patch
deleted file mode 100644
index 70c88412e9..0000000000
--- a/package/kodi/0002-utils-include-fmt-xchar.h.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From 18ff80a9c169fb969b75e2143d9f1f234b71a730 Mon Sep 17 00:00:00 2001
-From: Craig Andrews <candrews@integralblue.com>
-Date: Thu, 24 Jun 2021 20:41:11 -0400
-Subject: [PATCH] [utils] include fmt/xchar.h
-
-fmt 8 moved wchar/custom char overloads to xchar.h, so for fmt 8 compatibility, xchar.h must be included
-
-See https://github.com/fmtlib/fmt/commit/76ee490468212f8705a1421b4c88f8f814b2d351
-
-Downloaded from upstream commit
-https://github.com/xbmc/xbmc/commit/18ff80a9c169fb969b75e2143d9f1f234b71a730
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
----
- xbmc/utils/StringUtils.h | 3 +++
- 1 file changed, 3 insertions(+)
-
-diff --git a/xbmc/utils/StringUtils.h b/xbmc/utils/StringUtils.h
-index ca6f82953d..2dc5c3f03a 100644
---- a/xbmc/utils/StringUtils.h
-+++ b/xbmc/utils/StringUtils.h
-@@ -36,6 +36,9 @@
- #if FMT_VERSION >= 40000
- #include <fmt/printf.h>
- #endif
-+#if FMT_VERSION >= 80000
-+#include <fmt/xchar.h>
-+#endif
- 
- #include "XBDateTime.h"
- #include "utils/params_check_macros.h"
--- 
-2.30.2
-
diff --git a/package/kodi/kodi.hash b/package/kodi/kodi.hash
index c8562ce9ed..27b20aaac3 100644
--- a/package/kodi/kodi.hash
+++ b/package/kodi/kodi.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256  195a916a32057e259e6f42b49ba8f07cc6253460018851a52deb058ae938c58c  kodi-19.1-Matrix.tar.gz
+sha256  9830e68a2b6d6381e1dc03c1be119d9742fcdfff9824da1e4fe8c5c778f8f6ed  kodi-19.2-Matrix.tar.gz
 sha256  38816f8373e243bc5950449b4f3b18938c4e1c59348e3411e23f31db4072e40d  kodi-libdvdcss-1.4.2-Leia-Beta-5.tar.gz
 sha256  071e414e61b795f2ff9015b21a85fc009dde967f27780d23092643916538a57a  kodi-libdvdnav-6.0.0-Leia-Alpha-3.tar.gz
 sha256  a30b6aa0aad0f2c505bc77948af2d5531a80b6e68112addb4c123fca24d5d3bf  kodi-libdvdread-6.0.0-Leia-Alpha-3.tar.gz
diff --git a/package/kodi/kodi.mk b/package/kodi/kodi.mk
index 627427f584..49174316fc 100644
--- a/package/kodi/kodi.mk
+++ b/package/kodi/kodi.mk
@@ -6,7 +6,7 @@
 
 # When updating the version, please also update kodi-jsonschemabuilder
 # and kodi-texturepacker
-KODI_VERSION_MAJOR = 19.1
+KODI_VERSION_MAJOR = 19.2
 KODI_VERSION_NAME = Matrix
 KODI_VERSION = $(KODI_VERSION_MAJOR)-$(KODI_VERSION_NAME)
 KODI_SITE = $(call github,xbmc,xbmc,$(KODI_VERSION))
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
