Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66B3FC433EF
	for <buildroot@archiver.kernel.org>; Sat,  1 Jan 2022 08:41:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id ED4DE400C7;
	Sat,  1 Jan 2022 08:41:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MfzawNdI8Lxl; Sat,  1 Jan 2022 08:41:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E3029400D9;
	Sat,  1 Jan 2022 08:41:39 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id CF8461BF5A7
 for <buildroot@lists.busybox.net>; Sat,  1 Jan 2022 08:41:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BCAF6400D9
 for <buildroot@lists.busybox.net>; Sat,  1 Jan 2022 08:41:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NFJ2ip2JppSv for <buildroot@lists.busybox.net>;
 Sat,  1 Jan 2022 08:41:36 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id E31CD400C7
 for <buildroot@buildroot.org>; Sat,  1 Jan 2022 08:41:36 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id E3C8D81E43; Sat,  1 Jan 2022 08:35:40 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 1 Jan 2022 09:40:00 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7684604188f829820f96ced628137ff880e302f6
X-Git-Newrev: bc0edf6e698ba9ed2686f0b3652b6739979964cc
X-Patchwork-Hint: ignore
Message-Id: <20220101083540.E3C8D81E43@busybox.osuosl.org>
Subject: [Buildroot] [git commit] flare-{engine, game}: bump to version 1.12
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

commit: https://git.buildroot.net/buildroot/commit/?id=bc0edf6e698ba9ed2686f0b3652b6739979964cc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

See:
https://flarerpg.org/2021/08/02/flare-1-12/

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/flare-engine/flare-engine.hash | 2 +-
 package/flare-engine/flare-engine.mk   | 2 +-
 package/flare-game/flare-game.hash     | 2 +-
 package/flare-game/flare-game.mk       | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/flare-engine/flare-engine.hash b/package/flare-engine/flare-engine.hash
index 0e37a71922..7f6169381c 100644
--- a/package/flare-engine/flare-engine.hash
+++ b/package/flare-engine/flare-engine.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  035ffd936d9e120dc2eb792779a0b7ff64574d4a29a1124946deaf7946d1059d  flare-engine-1.11.tar.gz
+sha256  287a08532972fa3ac56ce7cb213d21be8be35b529339f61d4eeadbd501c78a8e  flare-engine-1.12.tar.gz
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/flare-engine/flare-engine.mk b/package/flare-engine/flare-engine.mk
index d722a42208..cbb7add4bb 100644
--- a/package/flare-engine/flare-engine.mk
+++ b/package/flare-engine/flare-engine.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FLARE_ENGINE_VERSION = 1.11
+FLARE_ENGINE_VERSION = 1.12
 FLARE_ENGINE_SITE = $(call github,flareteam,flare-engine,v$(FLARE_ENGINE_VERSION))
 FLARE_ENGINE_LICENSE = GPL-3.0+
 FLARE_ENGINE_LICENSE_FILES = COPYING
diff --git a/package/flare-game/flare-game.hash b/package/flare-game/flare-game.hash
index 983c23200f..3d6d678c94 100644
--- a/package/flare-game/flare-game.hash
+++ b/package/flare-game/flare-game.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  c13231c7dd021252487f6cf117f7f2bb24bbda40af0a2b2902d72b5e2d4c242a  flare-game-1.11.tar.gz
+sha256  19a909f2c6e0868baae823bb491e8840d5fb3e0454f00201de8da119772e5160  flare-game-1.12.tar.gz
 sha256  3f941b3b89cf7b8370ceb83cc76d2120d471b58735d8ca60238a751a48d7f72f  LICENSE.txt
diff --git a/package/flare-game/flare-game.mk b/package/flare-game/flare-game.mk
index 2845dc9714..41f02bec93 100644
--- a/package/flare-game/flare-game.mk
+++ b/package/flare-game/flare-game.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FLARE_GAME_VERSION = 1.11
+FLARE_GAME_VERSION = 1.12
 FLARE_GAME_SITE = $(call github,flareteam,flare-game,v$(FLARE_GAME_VERSION))
 FLARE_GAME_LICENSE = CC-BY-SA-3.0 (data files), GPL-2.0 (GNU Unifont), \
 	OFL-1.1 (Liberation Sans)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
