Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DD3EC77B7A
	for <buildroot@archiver.kernel.org>; Sat, 13 May 2023 20:26:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EFD8B428A7;
	Sat, 13 May 2023 20:26:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EFD8B428A7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Mvf3iH7bT51y; Sat, 13 May 2023 20:26:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E0BB442888;
	Sat, 13 May 2023 20:26:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E0BB442888
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C32EA1BF48C
 for <buildroot@lists.busybox.net>; Sat, 13 May 2023 20:26:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9B75960B95
 for <buildroot@lists.busybox.net>; Sat, 13 May 2023 20:26:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9B75960B95
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0azVJExiD3oV for <buildroot@lists.busybox.net>;
 Sat, 13 May 2023 20:26:50 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id AB52060B83
 for <buildroot@buildroot.org>; Sat, 13 May 2023 20:26:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AB52060B83
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 998F88660C; Sat, 13 May 2023 20:26:50 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 13 May 2023 22:26:15 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b1b8d5bf1b6468725a420fcaffa042303200ece6
X-Git-Newrev: b41ff7dd46c50728603f1d2953352f82bba8c538
X-Patchwork-Hint: ignore
Message-Id: <20230513202650.998F88660C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/sdl2_net: bump version to 2.2.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=b41ff7dd46c50728603f1d2953352f82bba8c538
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Luke D. Jones <luke@ljones.dev>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/sdl2_net/sdl2_net.hash | 2 +-
 package/sdl2_net/sdl2_net.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/sdl2_net/sdl2_net.hash b/package/sdl2_net/sdl2_net.hash
index a58e3c96cf..c614aee255 100644
--- a/package/sdl2_net/sdl2_net.hash
+++ b/package/sdl2_net/sdl2_net.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  15ce8a7e5a23dafe8177c8df6e6c79b6749a03fff1e8196742d3571657609d21  SDL2_net-2.0.1.tar.gz
+sha256  4e4a891988316271974ff4e9585ed1ef729a123d22c08bd473129179dc857feb  SDL2_net-2.2.0.tar.gz
 sha256  f09845a238245402a8b8388db6634d8a5b2c3e1dc098f16f9d8c74a276ef4594  COPYING.txt
diff --git a/package/sdl2_net/sdl2_net.mk b/package/sdl2_net/sdl2_net.mk
index 93bf3a2eb3..6adf8eb779 100644
--- a/package/sdl2_net/sdl2_net.mk
+++ b/package/sdl2_net/sdl2_net.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SDL2_NET_VERSION = 2.0.1
+SDL2_NET_VERSION = 2.2.0
 SDL2_NET_SOURCE = SDL2_net-$(SDL2_NET_VERSION).tar.gz
 SDL2_NET_SITE = http://www.libsdl.org/projects/SDL_net/release
 SDL2_NET_LICENSE = Zlib
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
