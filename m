Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E560C00528
	for <buildroot@archiver.kernel.org>; Sat, 29 Jul 2023 21:38:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 07E5880C98;
	Sat, 29 Jul 2023 21:38:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 07E5880C98
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 52pulilFIPDA; Sat, 29 Jul 2023 21:38:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2B87280E64;
	Sat, 29 Jul 2023 21:38:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2B87280E64
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7F0B41BF3C1
 for <buildroot@lists.busybox.net>; Sat, 29 Jul 2023 21:38:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B043180061
 for <buildroot@lists.busybox.net>; Sat, 29 Jul 2023 21:38:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B043180061
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id F6zF61SPLRsI for <buildroot@lists.busybox.net>;
 Sat, 29 Jul 2023 21:38:28 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id B70B081ADE
 for <buildroot@buildroot.org>; Sat, 29 Jul 2023 21:38:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B70B081ADE
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9D44183B50; Sat, 29 Jul 2023 21:38:28 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 29 Jul 2023 23:35:12 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d2a2fb01c4a3e757173c87511c7a3ed2fefcd26c
X-Git-Newrev: 7c43f9d4a14f311ee1cad334401d84135af4807e
X-Patchwork-Hint: ignore
Message-Id: <20230729213828.9D44183B50@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/glslsandbox-player: bump to
 version v2023.04.05
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=7c43f9d4a14f311ee1cad334401d84135af4807e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

License hash changed due to copyright year update.

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/glslsandbox-player/glslsandbox-player.hash | 4 ++--
 package/glslsandbox-player/glslsandbox-player.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/glslsandbox-player/glslsandbox-player.hash b/package/glslsandbox-player/glslsandbox-player.hash
index bc8946c62b..91af3c9c75 100644
--- a/package/glslsandbox-player/glslsandbox-player.hash
+++ b/package/glslsandbox-player/glslsandbox-player.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  b4af34889faa6d3a904e980f23aeb720dfb614d50aa01b9b1874fc2ae77dbcf4  glslsandbox-player-2021.08.24.tar.gz
-sha256  970d45d8a3dfd042d303008294f49db8c0c464f7687aa6e28a01b0926e74df85  LICENSE
+sha256  8adf89f65a060958e6ba2aa52a28f3189fde23b5478958ad4b8b6a7e82007587  glslsandbox-player-2023.04.05.tar.gz
+sha256  cda47d436d3aeb02d595ddd316d841494926d286327383b5d63734115204a8b2  LICENSE
diff --git a/package/glslsandbox-player/glslsandbox-player.mk b/package/glslsandbox-player/glslsandbox-player.mk
index 241f3475d2..0066f43567 100644
--- a/package/glslsandbox-player/glslsandbox-player.mk
+++ b/package/glslsandbox-player/glslsandbox-player.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GLSLSANDBOX_PLAYER_VERSION = 2021.08.24
+GLSLSANDBOX_PLAYER_VERSION = 2023.04.05
 GLSLSANDBOX_PLAYER_SITE = $(call github,jolivain,glslsandbox-player,v$(GLSLSANDBOX_PLAYER_VERSION))
 GLSLSANDBOX_PLAYER_AUTORECONF = YES
 GLSLSANDBOX_PLAYER_DEPENDENCIES = libegl libgles host-pkgconf
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
