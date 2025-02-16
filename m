Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 813E0C02198
	for <buildroot@archiver.kernel.org>; Sun, 16 Feb 2025 14:12:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 29A70412CF;
	Sun, 16 Feb 2025 14:12:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Q4yKunHiSycq; Sun, 16 Feb 2025 14:12:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 19E63412F4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 19E63412F4;
	Sun, 16 Feb 2025 14:12:27 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6B60F72
 for <buildroot@buildroot.org>; Sun, 16 Feb 2025 14:12:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 65E9160B49
 for <buildroot@buildroot.org>; Sun, 16 Feb 2025 14:12:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id t6KdFemQmeud for <buildroot@buildroot.org>;
 Sun, 16 Feb 2025 14:12:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A714160B38
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id A714160B38
 for <buildroot@buildroot.org>; Sun, 16 Feb 2025 14:12:24 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9A66A876BA; Sun, 16 Feb 2025 14:12:24 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sun, 16 Feb 2025 15:05:11 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9ee276732a776b540ac495ec46e8c27b28c856ef
X-Git-Newrev: 9f5ef2d8727499b9b92bfd24735e6d6b5a07bd18
X-Patchwork-Hint: ignore
Message-Id: <20250216141224.9A66A876BA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/sdl2_ttf: bump version to 2.24.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=9f5ef2d8727499b9b92bfd24735e6d6b5a07bd18
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For release note, see:
https://github.com/libsdl-org/SDL_ttf/releases/tag/release-2.24.0

This commit also updates the license hash, after year update in:
https://github.com/libsdl-org/SDL_ttf/commit/cf8e187373413fcb15a812966f7342e90f5610b3

Signed-off-by: Peter Macleod Thompson <peter.macleod.thompson@gmail.com>
[Julien: add link to release note and comment about licence hash change]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/sdl2_ttf/sdl2_ttf.hash | 4 ++--
 package/sdl2_ttf/sdl2_ttf.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/sdl2_ttf/sdl2_ttf.hash b/package/sdl2_ttf/sdl2_ttf.hash
index 7693aeba6b..4bdf004bad 100644
--- a/package/sdl2_ttf/sdl2_ttf.hash
+++ b/package/sdl2_ttf/sdl2_ttf.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  d48cbd1ce475b9e178206bf3b72d56b66d84d44f64ac05803328396234d67723  SDL2_ttf-2.22.0.tar.gz
-sha256  a0e8ce06504966e45088ee1cc7583cc8af9aac615d4cf56d47d847da9cb15139  LICENSE.txt
+sha256  0b2bf1e7b6568adbdbc9bb924643f79d9dedafe061fa1ed687d1d9ac4e453bfd  SDL2_ttf-2.24.0.tar.gz
+sha256  7826eca0a0f7e591f38dd844e207a200aac81a59b20d8a30c3af8c6282af13e6  LICENSE.txt
diff --git a/package/sdl2_ttf/sdl2_ttf.mk b/package/sdl2_ttf/sdl2_ttf.mk
index f4f293cec1..3f53dd1e79 100644
--- a/package/sdl2_ttf/sdl2_ttf.mk
+++ b/package/sdl2_ttf/sdl2_ttf.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SDL2_TTF_VERSION = 2.22.0
+SDL2_TTF_VERSION = 2.24.0
 SDL2_TTF_SOURCE = SDL2_ttf-$(SDL2_TTF_VERSION).tar.gz
 SDL2_TTF_SITE = http://www.libsdl.org/projects/SDL_ttf/release
 SDL2_TTF_LICENSE = Zlib
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
