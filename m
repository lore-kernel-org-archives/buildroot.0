Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3F51C53210
	for <buildroot@archiver.kernel.org>; Wed,  4 Jan 2023 21:39:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6C1F240342;
	Wed,  4 Jan 2023 21:39:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6C1F240342
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id O8sWIRGN8w1Y; Wed,  4 Jan 2023 21:39:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2931841939;
	Wed,  4 Jan 2023 21:39:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2931841939
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 86A071BF279
 for <buildroot@lists.busybox.net>; Wed,  4 Jan 2023 21:36:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2E1EF60DF6
 for <buildroot@lists.busybox.net>; Wed,  4 Jan 2023 21:36:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2E1EF60DF6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id b2wvpOCxCOQn for <buildroot@lists.busybox.net>;
 Wed,  4 Jan 2023 21:36:37 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 917ED610D7
 for <buildroot@buildroot.org>; Wed,  4 Jan 2023 21:36:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 917ED610D7
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8ED708756E; Wed,  4 Jan 2023 21:36:37 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 4 Jan 2023 22:29:01 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3e41117c64cada4a06fcb20fd17517354a42e948
X-Git-Newrev: 34f28a9399477f8fceff54976f838b4d9ff6fb22
X-Patchwork-Hint: ignore
Message-Id: <20230104213637.8ED708756E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/flare-{engine,
 game}: bump to version 1.14
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

commit: https://git.buildroot.net/buildroot/commit/?id=34f28a9399477f8fceff54976f838b4d9ff6fb22
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

See:
https://flarerpg.org/2022/01/31/flare-1-13/
https://flarerpg.org/2022/12/10/flare-1-14/

While at it, change URL to use https.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/flare-engine/Config.in         | 2 +-
 package/flare-engine/flare-engine.hash | 2 +-
 package/flare-engine/flare-engine.mk   | 2 +-
 package/flare-game/Config.in           | 2 +-
 package/flare-game/flare-game.hash     | 2 +-
 package/flare-game/flare-game.mk       | 2 +-
 6 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/flare-engine/Config.in b/package/flare-engine/Config.in
index 9c997c2b9a..136cae707e 100644
--- a/package/flare-engine/Config.in
+++ b/package/flare-engine/Config.in
@@ -15,7 +15,7 @@ config BR2_PACKAGE_FLARE_ENGINE
 	  Flare is not a reimplementation of an existing game or engine.
 	  It is a tribute to and exploration of the action RPG genre.
 
-	  http://flarerpg.org
+	  https://flarerpg.org
 
 comment "flare-engine needs a toolchain w/ C++, dynamic library"
 	depends on !BR2_INSTALL_LIBSTDCPP || BR2_STATIC_LIBS
diff --git a/package/flare-engine/flare-engine.hash b/package/flare-engine/flare-engine.hash
index 7f6169381c..2e1f87b237 100644
--- a/package/flare-engine/flare-engine.hash
+++ b/package/flare-engine/flare-engine.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  287a08532972fa3ac56ce7cb213d21be8be35b529339f61d4eeadbd501c78a8e  flare-engine-1.12.tar.gz
+sha256  2c1bafeaa5ac26c10449bfcb7151b06e8a22547aa7364d2a39bbcb135aa50a09  flare-engine-1.14.tar.gz
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/flare-engine/flare-engine.mk b/package/flare-engine/flare-engine.mk
index cbb7add4bb..e5fa947272 100644
--- a/package/flare-engine/flare-engine.mk
+++ b/package/flare-engine/flare-engine.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FLARE_ENGINE_VERSION = 1.12
+FLARE_ENGINE_VERSION = 1.14
 FLARE_ENGINE_SITE = $(call github,flareteam,flare-engine,v$(FLARE_ENGINE_VERSION))
 FLARE_ENGINE_LICENSE = GPL-3.0+
 FLARE_ENGINE_LICENSE_FILES = COPYING
diff --git a/package/flare-game/Config.in b/package/flare-game/Config.in
index ca68d19a69..535a9b18a2 100644
--- a/package/flare-game/Config.in
+++ b/package/flare-game/Config.in
@@ -10,4 +10,4 @@ config BR2_PACKAGE_FLARE_GAME
 	  game engine itself is part of a separate package,
 	  flame-engine.
 
-	  http://flarerpg.org
+	  https://flarerpg.org
diff --git a/package/flare-game/flare-game.hash b/package/flare-game/flare-game.hash
index 3d6d678c94..9ae88c6daa 100644
--- a/package/flare-game/flare-game.hash
+++ b/package/flare-game/flare-game.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  19a909f2c6e0868baae823bb491e8840d5fb3e0454f00201de8da119772e5160  flare-game-1.12.tar.gz
+sha256  65758462070aa88842084f8ee69083d8226e93cfbf83481663276d8307494b8e  flare-game-1.14.tar.gz
 sha256  3f941b3b89cf7b8370ceb83cc76d2120d471b58735d8ca60238a751a48d7f72f  LICENSE.txt
diff --git a/package/flare-game/flare-game.mk b/package/flare-game/flare-game.mk
index 41f02bec93..a1a0a5944a 100644
--- a/package/flare-game/flare-game.mk
+++ b/package/flare-game/flare-game.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FLARE_GAME_VERSION = 1.12
+FLARE_GAME_VERSION = 1.14
 FLARE_GAME_SITE = $(call github,flareteam,flare-game,v$(FLARE_GAME_VERSION))
 FLARE_GAME_LICENSE = CC-BY-SA-3.0 (data files), GPL-2.0 (GNU Unifont), \
 	OFL-1.1 (Liberation Sans)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
