Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 038FBC4332F
	for <buildroot@archiver.kernel.org>; Mon,  6 Nov 2023 19:34:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8D54C61247;
	Mon,  6 Nov 2023 19:34:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8D54C61247
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id C5k6E_ittDBt; Mon,  6 Nov 2023 19:34:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D18BD611CB;
	Mon,  6 Nov 2023 19:34:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D18BD611CB
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D128F1BF3A1
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 19:34:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B797B60A6A
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 19:34:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B797B60A6A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Tak7Rrfo8dKh for <buildroot@lists.busybox.net>;
 Mon,  6 Nov 2023 19:34:48 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id E9730611CB
 for <buildroot@buildroot.org>; Mon,  6 Nov 2023 19:34:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E9730611CB
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D733D86930; Mon,  6 Nov 2023 19:34:47 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 6 Nov 2023 20:33:03 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 171cf2320e343c9f68f0700836fa11320dd33cb5
X-Git-Newrev: 1978792db23aabdf2edaf3519019a8af81fb3efe
X-Patchwork-Hint: ignore
Message-Id: <20231106193447.D733D86930@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/sdl2: bump version to 2.28.5
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

commit: https://git.buildroot.net/buildroot/commit/?id=1978792db23aabdf2edaf3519019a8af81fb3efe
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Michael Fischer <mf@go-sys.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/sdl2/sdl2.hash | 4 ++--
 package/sdl2/sdl2.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/sdl2/sdl2.hash b/package/sdl2/sdl2.hash
index dde33bb9b6..7a28d5efc8 100644
--- a/package/sdl2/sdl2.hash
+++ b/package/sdl2/sdl2.hash
@@ -1,4 +1,4 @@
-# Locally calculated after checking http://www.libsdl.org/release/SDL2-2.28.3.tar.gz.sig
-sha256  7acb8679652701a2504d734e2ba7543ec1a83e310498ddd22fd44bf965eb5518  SDL2-2.28.3.tar.gz
+# Locally calculated after checking http://www.libsdl.org/release/SDL2-2.28.5.tar.gz.sig
+sha256  332cb37d0be20cb9541739c61f79bae5a477427d79ae85e352089afdaf6666e4  SDL2-2.28.5.tar.gz
 # Locally calculated
 sha256  9928507f684c1965d07f2b6ef4b4723d5efc2f6b4ab731f743a413c51c319927  LICENSE.txt
diff --git a/package/sdl2/sdl2.mk b/package/sdl2/sdl2.mk
index 840a7283d2..4646e7d1f8 100644
--- a/package/sdl2/sdl2.mk
+++ b/package/sdl2/sdl2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SDL2_VERSION = 2.28.3
+SDL2_VERSION = 2.28.5
 SDL2_SOURCE = SDL2-$(SDL2_VERSION).tar.gz
 SDL2_SITE = http://www.libsdl.org/release
 SDL2_LICENSE = Zlib
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
