Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A57BC77B7C
	for <buildroot@archiver.kernel.org>; Sun,  7 May 2023 12:27:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DA2588225C;
	Sun,  7 May 2023 12:27:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DA2588225C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Sh3Q4UQpAKtP; Sun,  7 May 2023 12:27:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id EFDF882199;
	Sun,  7 May 2023 12:27:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EFDF882199
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C2B931BF391
 for <buildroot@lists.busybox.net>; Sun,  7 May 2023 12:26:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9A8D4418BE
 for <buildroot@lists.busybox.net>; Sun,  7 May 2023 12:26:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9A8D4418BE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LqrwkYvoqPuq for <buildroot@lists.busybox.net>;
 Sun,  7 May 2023 12:26:52 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9A2254176F
 for <buildroot@buildroot.org>; Sun,  7 May 2023 12:26:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9A2254176F
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 85F4C85F1D; Sun,  7 May 2023 12:26:52 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 7 May 2023 14:25:47 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: eb22e467c75c875542c3cfea9875f4d6cfa93fe1
X-Git-Newrev: 0ce2d42aa7f603f3441d3f7481372663b1a2090c
X-Patchwork-Hint: ignore
Message-Id: <20230507122652.85F4C85F1D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/kodi: update patch status
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

commit: https://git.buildroot.net/buildroot/commit/?id=0ce2d42aa7f603f3441d3f7481372663b1a2090c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 .checkpackageignore                                                     | 1 -
 .../0001-kodi-config.cmake-use-CMAKE_FIND_ROOT_PATH-to-fix-cr.patch     | 2 +-
 package/kodi/0002-cmake-modules-fix-python-detection.patch              | 2 +-
 3 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index e80e2a845f..cd0ccc1abd 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -706,7 +706,6 @@ package/keyutils/0002-cifs.patch Sob Upstream
 package/kmod/0001-fix-O_CLOEXEC.patch Upstream
 package/kodi-texturepacker/0001-texturepacker.patch Upstream
 package/kodi-texturepacker/0002-fix-texture-packer-cmake-source-dir.patch Upstream
-package/kodi/0001-kodi-config.cmake-use-CMAKE_FIND_ROOT_PATH-to-fix-cr.patch Upstream
 package/kodi/S50kodi Shellcheck Variables
 package/latencytop/0001-makefile.patch Upstream
 package/lbase64/0001-retro-compatible-with-Lua-5.1.patch Upstream
diff --git a/package/kodi/0001-kodi-config.cmake-use-CMAKE_FIND_ROOT_PATH-to-fix-cr.patch b/package/kodi/0001-kodi-config.cmake-use-CMAKE_FIND_ROOT_PATH-to-fix-cr.patch
index 057d2254bc..4fb95c8b4a 100644
--- a/package/kodi/0001-kodi-config.cmake-use-CMAKE_FIND_ROOT_PATH-to-fix-cr.patch
+++ b/package/kodi/0001-kodi-config.cmake-use-CMAKE_FIND_ROOT_PATH-to-fix-cr.patch
@@ -8,7 +8,7 @@ When cross-compiling, the location at build time of the libraries is
 not the same as the one at run-time. The CMAKE_FIND_ROOT_PATH variable
 is here to handle this difference, so use it in kodi-config.cmake.
 
-Upstream status: Reverted (PR 17616)
+Upstream: Reverted (PR 17616 and 18680)
 
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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
