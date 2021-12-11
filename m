Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5DD6C433F5
	for <buildroot@archiver.kernel.org>; Sat, 11 Dec 2021 18:55:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 608A740173;
	Sat, 11 Dec 2021 18:55:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iC2yWkJW6Std; Sat, 11 Dec 2021 18:55:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 72C394021E;
	Sat, 11 Dec 2021 18:55:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8E5BE1BF3D4
 for <buildroot@lists.busybox.net>; Sat, 11 Dec 2021 18:55:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8B6A3429FE
 for <buildroot@lists.busybox.net>; Sat, 11 Dec 2021 18:55:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9-ucOJPRorFG for <buildroot@lists.busybox.net>;
 Sat, 11 Dec 2021 18:55:35 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mailout01.t-online.de (mailout01.t-online.de [194.25.134.80])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 57AE5429FD
 for <buildroot@buildroot.org>; Sat, 11 Dec 2021 18:55:35 +0000 (UTC)
Received: from fwd83.dcpf.telekom.de (fwd83.aul.t-online.de [10.223.144.109])
 by mailout01.t-online.de (Postfix) with SMTP id 366631DD4
 for <buildroot@buildroot.org>; Sat, 11 Dec 2021 19:55:33 +0100 (CET)
Received: from fli4l.lan.fli4l ([84.161.180.123]) by fwd83.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1mw7Wk-0DKs410; Sat, 11 Dec 2021 19:55:22 +0100
Received: from bruckner.lan.fli4l ([192.168.1.1]:48800)
 by fli4l.lan.fli4l with esmtp (Exim 4.95)
 (envelope-from <bernd.kuhls@t-online.de>) id 1mw7Wj-0004uG-Mu
 for buildroot@buildroot.org; Sat, 11 Dec 2021 19:55:21 +0100
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Sat, 11 Dec 2021 19:55:21 +0100
Message-Id: <20211211185521.2621478-3-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211211185521.2621478-1-bernd.kuhls@t-online.de>
References: <20211211185521.2621478-1-bernd.kuhls@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1639248922-00001454-CC02C6DE/0/0 CLEAN NORMAL
X-TOI-MSGID: bf749716-95f6-475f-81e2-4efc050ff7f4
Subject: [Buildroot] [PATCH 3/3] package/kodi-screensaver-rsxs: bump version
 to 19.0.1-Matrix
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

Removed patch which was applied upstream.

Release notes:
https://github.com/xbmc/screensavers.rsxs/releases/tag/19.0.1-Matrix

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 ...01-impSurface.h-fix-build-with-gcc11.patch | 29 -------------------
 .../kodi-screensaver-rsxs.hash                |  2 +-
 .../kodi-screensaver-rsxs.mk                  |  2 +-
 3 files changed, 2 insertions(+), 31 deletions(-)
 delete mode 100644 package/kodi-screensaver-rsxs/0001-impSurface.h-fix-build-with-gcc11.patch

diff --git a/package/kodi-screensaver-rsxs/0001-impSurface.h-fix-build-with-gcc11.patch b/package/kodi-screensaver-rsxs/0001-impSurface.h-fix-build-with-gcc11.patch
deleted file mode 100644
index 9080731918..0000000000
--- a/package/kodi-screensaver-rsxs/0001-impSurface.h-fix-build-with-gcc11.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From fb23e136f88a94aa497e8eb4369bb06435c2aaf8 Mon Sep 17 00:00:00 2001
-From: Bernd Kuhls <bernd.kuhls@t-online.de>
-Date: Sun, 26 Sep 2021 15:59:29 +0200
-Subject: [PATCH] impSurface.h: fix build with gcc11
-
-lib/Implicit/impSurface.h:44:9: error: 'size_t' does not name a type
-   44 |         size_t vertex_data_size;
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
-Upstream status: https://github.com/xbmc/screensavers.rsxs/pull/52
----
- lib/Implicit/impSurface.h | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/lib/Implicit/impSurface.h b/lib/Implicit/impSurface.h
-index 388701aa..3319820e 100644
---- a/lib/Implicit/impSurface.h
-+++ b/lib/Implicit/impSurface.h
-@@ -21,6 +21,7 @@
- #ifndef IMPSURFACE_H
- #define IMPSURFACE_H
- 
-+#include <cstddef>
- #include <functional>
- 
- #ifdef WIN32
--- 
-2.30.2
-
diff --git a/package/kodi-screensaver-rsxs/kodi-screensaver-rsxs.hash b/package/kodi-screensaver-rsxs/kodi-screensaver-rsxs.hash
index 4ffd035e81..0c2292a223 100644
--- a/package/kodi-screensaver-rsxs/kodi-screensaver-rsxs.hash
+++ b/package/kodi-screensaver-rsxs/kodi-screensaver-rsxs.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  d08570d45a7f5bcf43f737a89f2988ebb163590f1746a8f734995711cda0d3a6  kodi-screensaver-rsxs-19.0.0-Matrix.tar.gz
+sha256  9b06aa9745aa1ee6e4c01d3faab8adea7404933779c597537d2223f9f5492c14  kodi-screensaver-rsxs-19.0.1-Matrix.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-screensaver-rsxs/kodi-screensaver-rsxs.mk b/package/kodi-screensaver-rsxs/kodi-screensaver-rsxs.mk
index 1ec8c8003e..0c0ffea02f 100644
--- a/package/kodi-screensaver-rsxs/kodi-screensaver-rsxs.mk
+++ b/package/kodi-screensaver-rsxs/kodi-screensaver-rsxs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_SCREENSAVER_RSXS_VERSION = 19.0.0-Matrix
+KODI_SCREENSAVER_RSXS_VERSION = 19.0.1-Matrix
 KODI_SCREENSAVER_RSXS_SITE = $(call github,xbmc,screensavers.rsxs,$(KODI_SCREENSAVER_RSXS_VERSION))
 KODI_SCREENSAVER_RSXS_LICENSE = GPL-2.0+
 KODI_SCREENSAVER_RSXS_LICENSE_FILES = LICENSE.md
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
