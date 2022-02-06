Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4976C433F5
	for <buildroot@archiver.kernel.org>; Sun,  6 Feb 2022 13:33:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 274C640549;
	Sun,  6 Feb 2022 13:33:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hKJAQ91MNK21; Sun,  6 Feb 2022 13:33:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2BB754026F;
	Sun,  6 Feb 2022 13:33:33 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 833101BF36F
 for <buildroot@lists.busybox.net>; Sun,  6 Feb 2022 13:33:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7243C60A89
 for <buildroot@lists.busybox.net>; Sun,  6 Feb 2022 13:33:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Uxfq0C_zLGrk for <buildroot@lists.busybox.net>;
 Sun,  6 Feb 2022 13:33:30 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id B5180605E0
 for <buildroot@buildroot.org>; Sun,  6 Feb 2022 13:33:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 4355D82582; Sun,  6 Feb 2022 13:26:13 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 6 Feb 2022 14:30:38 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 88f79aead8fa750bc0e93ef8798751a4b463e9d9
X-Git-Newrev: f4da031a77f200515bcc5b2e0fe665a7b4f2a780
X-Patchwork-Hint: ignore
Message-Id: <20220206132613.4355D82582@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/sdl2_ttf: bump version to 2.0.18
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

commit: https://git.buildroot.net/buildroot/commit/?id=f4da031a77f200515bcc5b2e0fe665a7b4f2a780
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update the license hash because of a change in copyright year:
-  Copyright (C) 1997-2019 Sam Lantinga <slouken@libsdl.org>
+  Copyright (C) 1997-2022 Sam Lantinga <slouken@libsdl.org>

Signed-off-by: Peter Thompson <peter.macleod.thompson@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/sdl2_ttf/sdl2_ttf.hash | 4 ++--
 package/sdl2_ttf/sdl2_ttf.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/sdl2_ttf/sdl2_ttf.hash b/package/sdl2_ttf/sdl2_ttf.hash
index 16459e4a59..a490b002b6 100644
--- a/package/sdl2_ttf/sdl2_ttf.hash
+++ b/package/sdl2_ttf/sdl2_ttf.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  a9eceb1ad88c1f1545cd7bd28e7cbc0b2c14191d40238f531a15b01b1b22cd33  SDL2_ttf-2.0.15.tar.gz
-sha256  f6370809c9f644760920d9945c5be07aed17664975f2e4741013d4d9a2ec696f  COPYING.txt
+sha256  7234eb8883514e019e7747c703e4a774575b18d435c22a4a29d068cb768a2251  SDL2_ttf-2.0.18.tar.gz
+sha256  e211dfe7e2c36e64048be886fe3f2bbba8732ce4dd77b596a355d3abbec775a4  COPYING.txt
diff --git a/package/sdl2_ttf/sdl2_ttf.mk b/package/sdl2_ttf/sdl2_ttf.mk
index 326cb99366..1fe7c0a075 100644
--- a/package/sdl2_ttf/sdl2_ttf.mk
+++ b/package/sdl2_ttf/sdl2_ttf.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SDL2_TTF_VERSION = 2.0.15
+SDL2_TTF_VERSION = 2.0.18
 SDL2_TTF_SOURCE = SDL2_ttf-$(SDL2_TTF_VERSION).tar.gz
 SDL2_TTF_SITE = http://www.libsdl.org/projects/SDL_ttf/release
 SDL2_TTF_LICENSE = Zlib
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
