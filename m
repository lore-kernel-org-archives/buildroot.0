Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9FF4C2D0CD
	for <buildroot@archiver.kernel.org>; Sat, 17 May 2025 13:42:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 60D4881C6F;
	Sat, 17 May 2025 13:42:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QJbAfPGg_ABW; Sat, 17 May 2025 13:42:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 86AD48195D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 86AD48195D;
	Sat, 17 May 2025 13:42:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id C4C931DE
 for <buildroot@buildroot.org>; Sat, 17 May 2025 13:42:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B63E44083C
 for <buildroot@buildroot.org>; Sat, 17 May 2025 13:42:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 67xQA6lHcVgj for <buildroot@buildroot.org>;
 Sat, 17 May 2025 13:42:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0895E407D6
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0895E407D6
 for <buildroot@buildroot.org>; Sat, 17 May 2025 13:42:16 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EBCAE86F29; Sat, 17 May 2025 13:42:15 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sat, 17 May 2025 15:37:41 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 763971cfe3235ede53c6455aa26eb671c51809cb
X-Git-Newrev: 73ff421159c542cc627a002e570812d531e6489a
X-Patchwork-Hint: ignore
Message-Id: <20250517134215.EBCAE86F29@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/sdl2: bump version to 2.32.6
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

commit: https://git.buildroot.net/buildroot/commit/?id=73ff421159c542cc627a002e570812d531e6489a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bugfix release, fixing various minor issues:
https://github.com/libsdl-org/SDL/releases/tag/release-2.32.4
https://github.com/libsdl-org/SDL/releases/tag/release-2.32.6

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/sdl2/sdl2.hash | 4 ++--
 package/sdl2/sdl2.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/sdl2/sdl2.hash b/package/sdl2/sdl2.hash
index 140de28eae..f5c0d44801 100644
--- a/package/sdl2/sdl2.hash
+++ b/package/sdl2/sdl2.hash
@@ -1,4 +1,4 @@
-# Locally calculated after checking http://www.libsdl.org/release/SDL2-2.32.2.tar.gz.sig
-sha256  c5f30c427fd8107ee4a400c84d4447dd211352512eaf0b6e89cc6a50a2821922  SDL2-2.32.2.tar.gz
+# Locally calculated after checking http://www.libsdl.org/release/SDL2-2.32.6.tar.gz.sig
+sha256  6a7a40d6c2e00016791815e1a9f4042809210bdf10cc78d2c75b45c4f52f93ad  SDL2-2.32.6.tar.gz
 # Locally calculated
 sha256  97f35b302b361680ec1e891e95d2d52097bb95abff361434916d99dc1305f127  LICENSE.txt
diff --git a/package/sdl2/sdl2.mk b/package/sdl2/sdl2.mk
index 5ed7c6c612..5225d8a531 100644
--- a/package/sdl2/sdl2.mk
+++ b/package/sdl2/sdl2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SDL2_VERSION = 2.32.2
+SDL2_VERSION = 2.32.6
 SDL2_SOURCE = SDL2-$(SDL2_VERSION).tar.gz
 SDL2_SITE = http://www.libsdl.org/release
 SDL2_LICENSE = Zlib
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
