Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28D05C77B75
	for <buildroot@archiver.kernel.org>; Sun,  7 May 2023 11:25:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B2A2081BC2;
	Sun,  7 May 2023 11:25:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B2A2081BC2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aJ5tJ5xZrfWX; Sun,  7 May 2023 11:25:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id F1E2A81A92;
	Sun,  7 May 2023 11:25:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F1E2A81A92
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2FABD1BF301
 for <buildroot@lists.busybox.net>; Sun,  7 May 2023 11:25:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 16E5940286
 for <buildroot@lists.busybox.net>; Sun,  7 May 2023 11:25:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 16E5940286
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FoBbgyX5YIhZ for <buildroot@lists.busybox.net>;
 Sun,  7 May 2023 11:25:29 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C103840106
Received: from mailout09.t-online.de (mailout09.t-online.de [194.25.134.84])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C103840106
 for <buildroot@buildroot.org>; Sun,  7 May 2023 11:25:28 +0000 (UTC)
Received: from fwd88.dcpf.telekom.de (fwd88.aul.t-online.de [10.223.144.114])
 by mailout09.t-online.de (Postfix) with SMTP id B87FD278E0
 for <buildroot@buildroot.org>; Sun,  7 May 2023 13:25:25 +0200 (CEST)
Received: from fli4l.lan.fli4l ([79.214.192.80]) by fwd88.t-online.de
 with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
 esmtp id 1pvcW5-310uED0; Sun, 7 May 2023 13:25:25 +0200
Received: from bruckner.lan.fli4l ([192.168.1.1]:60794)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd.kuhls@t-online.de>) id 1pvcW5-0000zW-0W
 for buildroot@buildroot.org; Sun, 07 May 2023 13:25:25 +0200
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Sun,  7 May 2023 13:25:25 +0200
Message-Id: <20230507112525.3575289-1-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1683458725-0BFFCC01-65F7F385/0/0 CLEAN NORMAL
X-TOI-MSGID: ebd315ab-9c4c-4609-836f-7db882104cce
Subject: [Buildroot] [PATCH 1/1] package/kodi: update patch status
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

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 .checkpackageignore                                             | 1 -
 ...1-kodi-config.cmake-use-CMAKE_FIND_ROOT_PATH-to-fix-cr.patch | 2 +-
 package/kodi/0002-cmake-modules-fix-python-detection.patch      | 2 +-
 3 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index aef67e3403..949f92b4bf 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -704,7 +704,6 @@ package/keyutils/0002-cifs.patch Sob Upstream
 package/kmod/0001-fix-O_CLOEXEC.patch Upstream
 package/kodi-texturepacker/0001-texturepacker.patch Upstream
 package/kodi-texturepacker/0002-fix-texture-packer-cmake-source-dir.patch Upstream
-package/kodi/0001-kodi-config.cmake-use-CMAKE_FIND_ROOT_PATH-to-fix-cr.patch Upstream
 package/kodi/S50kodi Shellcheck Variables
 package/latencytop/0001-makefile.patch Upstream
 package/lbase64/0001-retro-compatible-with-Lua-5.1.patch Upstream
diff --git a/package/kodi/0001-kodi-config.cmake-use-CMAKE_FIND_ROOT_PATH-to-fix-cr.patch b/package/kodi/0001-kodi-config.cmake-use-CMAKE_FIND_ROOT_PATH-to-fix-cr.patch
index 057d2254bc..d564a3e2be 100644
--- a/package/kodi/0001-kodi-config.cmake-use-CMAKE_FIND_ROOT_PATH-to-fix-cr.patch
+++ b/package/kodi/0001-kodi-config.cmake-use-CMAKE_FIND_ROOT_PATH-to-fix-cr.patch
@@ -8,7 +8,7 @@ When cross-compiling, the location at build time of the libraries is
 not the same as the one at run-time. The CMAKE_FIND_ROOT_PATH variable
 is here to handle this difference, so use it in kodi-config.cmake.
 
-Upstream status: Reverted (PR 17616)
+Upstream: Reverted (PR 17616)
 
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 (rebased and simplified for Kodi 17.0-Krypton)
diff --git a/package/kodi/0002-cmake-modules-fix-python-detection.patch b/package/kodi/0002-cmake-modules-fix-python-detection.patch
index 92a4ac904d..fcf35b25b2 100644
--- a/package/kodi/0002-cmake-modules-fix-python-detection.patch
+++ b/package/kodi/0002-cmake-modules-fix-python-detection.patch
@@ -5,7 +5,7 @@ Subject: [PATCH] cmake/modules: fix python detection
 
 Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
 Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
-Upstream: unknown
+Upstream: https://github.com/xbmc/xbmc/pull/23230
 ---
  cmake/modules/FindPython.cmake | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
