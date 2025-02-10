Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB2C8C021A2
	for <buildroot@archiver.kernel.org>; Mon, 10 Feb 2025 21:32:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 618DA82151;
	Mon, 10 Feb 2025 21:32:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZcHRJDNQKinH; Mon, 10 Feb 2025 21:32:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 779058214D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 779058214D;
	Mon, 10 Feb 2025 21:32:36 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0E348C2
 for <buildroot@buildroot.org>; Mon, 10 Feb 2025 21:32:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E6B0960E13
 for <buildroot@buildroot.org>; Mon, 10 Feb 2025 21:32:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HGhwkJ1vC7GN for <buildroot@buildroot.org>;
 Mon, 10 Feb 2025 21:32:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 23F5360B6B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 23F5360B6B
 for <buildroot@buildroot.org>; Mon, 10 Feb 2025 21:32:34 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0C050874E8; Mon, 10 Feb 2025 21:32:34 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Mon, 10 Feb 2025 22:19:21 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d5570b6a174800455e0737e66b687100057d9ef6
X-Git-Newrev: 7f432324bd48ec985465810f1ba72e25c6d769f9
X-Patchwork-Hint: ignore
Message-Id: <20250210213234.0C050874E8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/sdl2: bump version to 2.30.12
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

commit: https://git.buildroot.net/buildroot/commit/?id=7f432324bd48ec985465810f1ba72e25c6d769f9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes:
https://github.com/libsdl-org/SDL/releases/tag/release-2.30.12

Signed-off-by: Michael Fischer <mf@go-sys.de>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/sdl2/sdl2.hash | 4 ++--
 package/sdl2/sdl2.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/sdl2/sdl2.hash b/package/sdl2/sdl2.hash
index c6237d1286..9171139889 100644
--- a/package/sdl2/sdl2.hash
+++ b/package/sdl2/sdl2.hash
@@ -1,4 +1,4 @@
-# Locally calculated after checking http://www.libsdl.org/release/SDL2-2.30.11.tar.gz.sig
-sha256  8b8d4aef2038533da814965220f88f77d60dfa0f32685f80ead65e501337da7f  SDL2-2.30.11.tar.gz
+# Locally calculated after checking http://www.libsdl.org/release/SDL2-2.30.12.tar.gz.sig
+sha256  ac356ea55e8b9dd0b2d1fa27da40ef7e238267ccf9324704850d5d47375b48ea  SDL2-2.30.12.tar.gz
 # Locally calculated
 sha256  97f35b302b361680ec1e891e95d2d52097bb95abff361434916d99dc1305f127  LICENSE.txt
diff --git a/package/sdl2/sdl2.mk b/package/sdl2/sdl2.mk
index 50f80c68d7..67a4978e22 100644
--- a/package/sdl2/sdl2.mk
+++ b/package/sdl2/sdl2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SDL2_VERSION = 2.30.11
+SDL2_VERSION = 2.30.12
 SDL2_SOURCE = SDL2-$(SDL2_VERSION).tar.gz
 SDL2_SITE = http://www.libsdl.org/release
 SDL2_LICENSE = Zlib
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
