Return-Path: <SRS0=Qe4W=PG=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 839EDC433F5
	for <buildroot@archiver.kernel.org>; Mon, 18 Oct 2021 20:09:58 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4A9DE61206
	for <buildroot@archiver.kernel.org>; Mon, 18 Oct 2021 20:09:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4A9DE61206
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0CFC840164;
	Mon, 18 Oct 2021 20:09:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0ukBlM01lAmv; Mon, 18 Oct 2021 20:09:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0FFD7401CA;
	Mon, 18 Oct 2021 20:09:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3368F1BF27A
 for <buildroot@lists.busybox.net>; Mon, 18 Oct 2021 20:09:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1EE10401CA
 for <buildroot@lists.busybox.net>; Mon, 18 Oct 2021 20:09:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EcyeBwHdyPM2 for <buildroot@lists.busybox.net>;
 Mon, 18 Oct 2021 20:09:53 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0ED9C40164
 for <buildroot@buildroot.org>; Mon, 18 Oct 2021 20:09:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id B030687997; Mon, 18 Oct 2021 20:06:48 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Mon, 18 Oct 2021 22:09:24 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 98728c893d194daa9bae777b4244dfe8bfb42749
X-Git-Newrev: 6703cdfa6720146cded222dbc293bf5628622005
X-Patchwork-Hint: ignore
Message-Id: <20211018200648.B030687997@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/kodi: bump version to 19.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=6703cdfa6720146cded222dbc293bf5628622005
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Removed patch 0002 which was applied upstream.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../kodi-jsonschemabuilder.mk                      |  2 +-
 package/kodi-texturepacker/kodi-texturepacker.mk   |  2 +-
 package/kodi/0002-utils-include-fmt-xchar.h.patch  | 34 ----------------------
 package/kodi/kodi.hash                             |  2 +-
 package/kodi/kodi.mk                               |  2 +-
 5 files changed, 4 insertions(+), 38 deletions(-)

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
index 6f020b58b8..13f066a13d 100644
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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
