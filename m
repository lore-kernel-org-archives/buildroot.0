Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2A9CC021A6
	for <buildroot@archiver.kernel.org>; Sun, 16 Feb 2025 14:12:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 80AF660B38;
	Sun, 16 Feb 2025 14:12:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BIwil0N1REsD; Sun, 16 Feb 2025 14:12:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8F6E860B49
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8F6E860B49;
	Sun, 16 Feb 2025 14:12:29 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 021D8DE
 for <buildroot@buildroot.org>; Sun, 16 Feb 2025 14:12:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DAA9E411D4
 for <buildroot@buildroot.org>; Sun, 16 Feb 2025 14:12:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id t7kgPjRp1Fdq for <buildroot@buildroot.org>;
 Sun, 16 Feb 2025 14:12:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D599B411AB
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id D599B411AB
 for <buildroot@buildroot.org>; Sun, 16 Feb 2025 14:12:24 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C4A1D876BA; Sun, 16 Feb 2025 14:12:24 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sun, 16 Feb 2025 15:05:51 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9f5ef2d8727499b9b92bfd24735e6d6b5a07bd18
X-Git-Newrev: 678ad7d69d1b9757433d2235e8d2856961d904d1
X-Patchwork-Hint: ignore
Message-Id: <20250216141224.C4A1D876BA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/sdl2_image: bump version to 2.8.4
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

commit: https://git.buildroot.net/buildroot/commit/?id=678ad7d69d1b9757433d2235e8d2856961d904d1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For release notes since 2.8.2, see:
https://github.com/libsdl-org/SDL_image/releases/tag/release-2.8.3
https://github.com/libsdl-org/SDL_image/releases/tag/release-2.8.4

Signed-off-by: Peter Macleod Thompson <peter.macleod.thompson@gmail.com>
[Julien: add links to release notes]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/sdl2_image/sdl2_image.hash | 2 +-
 package/sdl2_image/sdl2_image.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/sdl2_image/sdl2_image.hash b/package/sdl2_image/sdl2_image.hash
index 53a887c6f9..9d5ae395cd 100644
--- a/package/sdl2_image/sdl2_image.hash
+++ b/package/sdl2_image/sdl2_image.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  8f486bbfbcf8464dd58c9e5d93394ab0255ce68b51c5a966a918244820a76ddc  SDL2_image-2.8.2.tar.gz
+sha256  f7c06a8783952cfe960adccdd3d8472b63ab31475b4390d10cfdcc1aea61238f  SDL2_image-2.8.4.tar.gz
 sha256  a0e8ce06504966e45088ee1cc7583cc8af9aac615d4cf56d47d847da9cb15139  LICENSE.txt
diff --git a/package/sdl2_image/sdl2_image.mk b/package/sdl2_image/sdl2_image.mk
index 40b9e3c915..e058cd9f74 100644
--- a/package/sdl2_image/sdl2_image.mk
+++ b/package/sdl2_image/sdl2_image.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SDL2_IMAGE_VERSION = 2.8.2
+SDL2_IMAGE_VERSION = 2.8.4
 SDL2_IMAGE_SOURCE = SDL2_image-$(SDL2_IMAGE_VERSION).tar.gz
 SDL2_IMAGE_SITE = http://www.libsdl.org/projects/SDL_image/release
 SDL2_IMAGE_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
