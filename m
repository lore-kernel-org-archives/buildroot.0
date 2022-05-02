Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73E43C433EF
	for <buildroot@archiver.kernel.org>; Mon,  2 May 2022 22:02:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3699141696;
	Mon,  2 May 2022 22:02:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4FWNx6QY4lZ1; Mon,  2 May 2022 22:02:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CEE6B41619;
	Mon,  2 May 2022 22:02:51 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 57BB61BF2BC
 for <buildroot@lists.busybox.net>; Mon,  2 May 2022 21:59:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F32D860E2A
 for <buildroot@lists.busybox.net>; Mon,  2 May 2022 21:59:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qx_-kt77Ke9B for <buildroot@lists.busybox.net>;
 Mon,  2 May 2022 21:59:24 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5995D60F08
 for <buildroot@buildroot.org>; Mon,  2 May 2022 21:59:21 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 23C9484F0E; Mon,  2 May 2022 21:48:51 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Mon, 2 May 2022 23:56:38 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2d0e54ce86a39e5753f9a8314c543d0a2b9181dd
X-Git-Newrev: 6487c0150aad00ce3d481ddea139d66c6646e496
X-Patchwork-Hint: ignore
Message-Id: <20220502214851.23C9484F0E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/fluidsynth: bump to version 2.2.7
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

commit: https://git.buildroot.net/buildroot/commit/?id=6487c0150aad00ce3d481ddea139d66c6646e496
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For change log since v2.2.6, see:
- https://github.com/FluidSynth/fluidsynth/releases/tag/v2.2.7

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/fluidsynth/fluidsynth.hash | 2 +-
 package/fluidsynth/fluidsynth.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/fluidsynth/fluidsynth.hash b/package/fluidsynth/fluidsynth.hash
index 20eb9ec49f..12e67404fa 100644
--- a/package/fluidsynth/fluidsynth.hash
+++ b/package/fluidsynth/fluidsynth.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  ca90fe675cacd9a7b442662783c4e7fa0e1fd638b28d64105a4e3fe0f618d20f  fluidsynth-2.2.6.tar.gz
+sha256  460d86d8d687f567dc4780890b72538c7ff6b2082080ef2f9359d41670a309cf  fluidsynth-2.2.7.tar.gz
 sha256  9b872a8a070b8ad329c4bd380fb1bf0000f564c75023ec8e1e6803f15364b9e9  LICENSE
diff --git a/package/fluidsynth/fluidsynth.mk b/package/fluidsynth/fluidsynth.mk
index d7c72ed059..c4c9883102 100644
--- a/package/fluidsynth/fluidsynth.mk
+++ b/package/fluidsynth/fluidsynth.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FLUIDSYNTH_VERSION = 2.2.6
+FLUIDSYNTH_VERSION = 2.2.7
 FLUIDSYNTH_SITE = $(call github,FluidSynth,fluidsynth,v$(FLUIDSYNTH_VERSION))
 FLUIDSYNTH_LICENSE = LGPL-2.1+
 FLUIDSYNTH_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
