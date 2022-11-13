Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60F0CC433FE
	for <buildroot@archiver.kernel.org>; Sun, 13 Nov 2022 14:35:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 06488408E9;
	Sun, 13 Nov 2022 14:35:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 06488408E9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MrAnMs_2OYJU; Sun, 13 Nov 2022 14:35:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E9792408BC;
	Sun, 13 Nov 2022 14:35:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E9792408BC
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 013721BF414
 for <buildroot@lists.busybox.net>; Sun, 13 Nov 2022 14:35:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D125B40562
 for <buildroot@lists.busybox.net>; Sun, 13 Nov 2022 14:35:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D125B40562
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id R-7aEG-3NCBT for <buildroot@lists.busybox.net>;
 Sun, 13 Nov 2022 14:35:04 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 032B34048F
 for <buildroot@buildroot.org>; Sun, 13 Nov 2022 14:35:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 032B34048F
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E73198363F; Sun, 13 Nov 2022 14:35:03 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 13 Nov 2022 15:32:18 +0100
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: ae830d4ebd98a933b904b5e13b0d9376e8b84b2c
X-Git-Newrev: d30bd21b5e4a11e43b16cafe36fcd6f5cb0ca180
X-Patchwork-Hint: ignore
Message-Id: <20221113143503.E73198363F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/pkg-cmake.mk:
 MakeFiles -> Makefiles
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

commit: https://git.buildroot.net/buildroot/commit/?id=d30bd21b5e4a11e43b16cafe36fcd6f5cb0ca180
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Fixes:
CMake Error: Could not create named generator Unix MakeFiles

Generators
  Green Hills MULTI            = Generates Green Hills MULTI files
                                 (experimental, work-in-progress).
* Unix Makefiles               = Generates standard UNIX makefiles.
  Ninja                        = Generates build.ninja files.
  Ninja Multi-Config           = Generates build-<Config>.ninja files.
  Watcom WMake                 = Generates Watcom WMake makefiles.
  CodeBlocks - Ninja           = Generates CodeBlocks project files.
  CodeBlocks - Unix Makefiles  = Generates CodeBlocks project files.
  CodeLite - Ninja             = Generates CodeLite project files.
  CodeLite - Unix Makefiles    = Generates CodeLite project files.
  Eclipse CDT4 - Ninja         = Generates Eclipse CDT 4.0 project files.
  Eclipse CDT4 - Unix Makefiles= Generates Eclipse CDT 4.0 project files.
  Kate - Ninja                 = Generates Kate project files.
  Kate - Unix Makefiles        = Generates Kate project files.
  Sublime Text 2 - Ninja       = Generates Sublime Text 2 project files.
  Sublime Text 2 - Unix Makefiles
                               = Generates Sublime Text 2 project files.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 68b68518a8cc372cd6bfb34414a91311e7266044)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/pkg-cmake.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/pkg-cmake.mk b/package/pkg-cmake.mk
index fc6ce4921d..d2ef5ca82d 100644
--- a/package/pkg-cmake.mk
+++ b/package/pkg-cmake.mk
@@ -88,7 +88,7 @@ define $(2)_CONFIGURE_CMDS
 	rm -f CMakeCache.txt && \
 	PATH=$$(BR_PATH) \
 	$$($$(PKG)_CONF_ENV) $$(BR2_CMAKE) $$($$(PKG)_SRCDIR) \
-		-G"Unix MakeFiles" \
+		-G"Unix Makefiles" \
 		-DCMAKE_TOOLCHAIN_FILE="$$(HOST_DIR)/share/buildroot/toolchainfile.cmake" \
 		-DCMAKE_INSTALL_PREFIX="/usr" \
 		-DCMAKE_COLOR_MAKEFILE=OFF \
@@ -118,7 +118,7 @@ define $(2)_CONFIGURE_CMDS
 	PKG_CONFIG_ALLOW_SYSTEM_CFLAGS=1 \
 	PKG_CONFIG_ALLOW_SYSTEM_LIBS=1 \
 	$$($$(PKG)_CONF_ENV) $$(BR2_CMAKE) $$($$(PKG)_SRCDIR) \
-		-G"Unix MakeFiles" \
+		-G"Unix Makefiles" \
 		-DCMAKE_INSTALL_SO_NO_EXE=0 \
 		-DCMAKE_FIND_ROOT_PATH="$$(HOST_DIR)" \
 		-DCMAKE_FIND_ROOT_PATH_MODE_PROGRAM="BOTH" \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
