Return-Path: <SRS0=lKTV=PD=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75DB7C433F5
	for <buildroot@archiver.kernel.org>; Fri, 15 Oct 2021 14:50:49 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E931C61181
	for <buildroot@archiver.kernel.org>; Fri, 15 Oct 2021 14:50:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E931C61181
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=t-online.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 91E1540165;
	Fri, 15 Oct 2021 14:50:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id P30F7lcj0YTW; Fri, 15 Oct 2021 14:50:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A2830401BE;
	Fri, 15 Oct 2021 14:50:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6744A1BF909
 for <buildroot@lists.busybox.net>; Fri, 15 Oct 2021 14:50:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 559A9401BE
 for <buildroot@lists.busybox.net>; Fri, 15 Oct 2021 14:50:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JLwmznAq1u6D for <buildroot@lists.busybox.net>;
 Fri, 15 Oct 2021 14:50:43 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mailout10.t-online.de (mailout10.t-online.de [194.25.134.21])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6F77340165
 for <buildroot@buildroot.org>; Fri, 15 Oct 2021 14:50:43 +0000 (UTC)
Received: from fwd81.dcpf.telekom.de (fwd81.aul.t-online.de [10.223.144.107])
 by mailout10.t-online.de (Postfix) with SMTP id 4211A5BA6
 for <buildroot@buildroot.org>; Fri, 15 Oct 2021 16:46:44 +0200 (CEST)
Received: from fli4l.lan.fli4l ([79.214.199.253]) by fwd81.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1mbOTr-2Q2NUH0; Fri, 15 Oct 2021 16:46:43 +0200
Received: from bruckner.lan.fli4l ([192.168.1.1]:35122)
 by fli4l.lan.fli4l with esmtp (Exim 4.95)
 (envelope-from <bernd.kuhls@t-online.de>) id 1mbOTq-0004pi-R9
 for buildroot@buildroot.org; Fri, 15 Oct 2021 16:46:43 +0200
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Fri, 15 Oct 2021 16:46:42 +0200
Message-Id: <20211015144642.10167-1-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1634309203-00001460-8895FECE/0/0 CLEAN NORMAL
X-TOI-MSGID: 661fc354-2e46-47a2-859f-31154b985fc3
Subject: [Buildroot] [PATCH v2 1/1] package/kodi: bump version to 19.2
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
v2: fixed tarball hash (Arnout)
    I can not rule out that I messed-up the hash in v1, sorry.

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
index c8562ce9ed..e51ebaff0a 100644
--- a/package/kodi/kodi.hash
+++ b/package/kodi/kodi.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256  195a916a32057e259e6f42b49ba8f07cc6253460018851a52deb058ae938c58c  kodi-19.1-Matrix.tar.gz
+sha256  e8f5e50767ddd1b8f0399016dcf5ba762315c16c0568cb06e659c493376f99d5  kodi-19.2-Matrix.tar.gz
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
