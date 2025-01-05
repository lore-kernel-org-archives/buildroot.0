Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83C53E77197
	for <buildroot@archiver.kernel.org>; Sun,  5 Jan 2025 12:03:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2F056405E5;
	Sun,  5 Jan 2025 12:03:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id A8fLTxHj5utm; Sun,  5 Jan 2025 12:03:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4AFDE405DC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4AFDE405DC;
	Sun,  5 Jan 2025 12:03:58 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id C566B6B
 for <buildroot@buildroot.org>; Sun,  5 Jan 2025 12:03:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B3B994003A
 for <buildroot@buildroot.org>; Sun,  5 Jan 2025 12:03:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1fqkmmd7XKBm for <buildroot@buildroot.org>;
 Sun,  5 Jan 2025 12:03:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BAF1440126
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id BAF1440126
 for <buildroot@buildroot.org>; Sun,  5 Jan 2025 12:03:55 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A35E783A39; Sun,  5 Jan 2025 12:03:55 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sun, 5 Jan 2025 12:59:13 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8548c7586a56938b2f52f5c41050441b53a457f0
X-Git-Newrev: b4214c1cea2dd5740e4cadc0fb4c4a8670ea92ae
X-Patchwork-Hint: ignore
Message-Id: <20250105120355.A35E783A39@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/sdl2: bump version to 2.30.11
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

commit: https://git.buildroot.net/buildroot/commit/?id=b4214c1cea2dd5740e4cadc0fb4c4a8670ea92ae
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For release notes since 2.30.9, see:
https://github.com/libsdl-org/SDL/releases/tag/release-2.30.10
https://github.com/libsdl-org/SDL/releases/tag/release-2.30.11

Update the license hash because of a change in copyright year:
- Copyright (C) 1997-2024 Sam Lantinga <slouken@libsdl.org>
+ Copyright (C) 1997-2025 Sam Lantinga <slouken@libsdl.org>

Signed-off-by: Michael Fischer <mf@go-sys.de>
[Julien: add link to release notes]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/sdl2/sdl2.hash | 6 +++---
 package/sdl2/sdl2.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/sdl2/sdl2.hash b/package/sdl2/sdl2.hash
index 140767ef0a..c6237d1286 100644
--- a/package/sdl2/sdl2.hash
+++ b/package/sdl2/sdl2.hash
@@ -1,4 +1,4 @@
-# Locally calculated after checking http://www.libsdl.org/release/SDL2-2.30.9.tar.gz.sig
-sha256  24b574f71c87a763f50704bbb630cbe38298d544a1f890f099a4696b1d6beba4  SDL2-2.30.9.tar.gz
+# Locally calculated after checking http://www.libsdl.org/release/SDL2-2.30.11.tar.gz.sig
+sha256  8b8d4aef2038533da814965220f88f77d60dfa0f32685f80ead65e501337da7f  SDL2-2.30.11.tar.gz
 # Locally calculated
-sha256  9b9e1764f06701bcf7ce21e942c682d5921ba0900c6fca760321b1c8837a9662  LICENSE.txt
+sha256  97f35b302b361680ec1e891e95d2d52097bb95abff361434916d99dc1305f127  LICENSE.txt
diff --git a/package/sdl2/sdl2.mk b/package/sdl2/sdl2.mk
index 62d6e91894..50f80c68d7 100644
--- a/package/sdl2/sdl2.mk
+++ b/package/sdl2/sdl2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SDL2_VERSION = 2.30.9
+SDL2_VERSION = 2.30.11
 SDL2_SOURCE = SDL2-$(SDL2_VERSION).tar.gz
 SDL2_SITE = http://www.libsdl.org/release
 SDL2_LICENSE = Zlib
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
