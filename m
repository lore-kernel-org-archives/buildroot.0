Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0462CECAAA1
	for <buildroot@archiver.kernel.org>; Sun, 11 Sep 2022 08:59:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A95BF841C2;
	Sun, 11 Sep 2022 08:59:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A95BF841C2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HF_FHF2wa2hC; Sun, 11 Sep 2022 08:59:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id BC5B683EF2;
	Sun, 11 Sep 2022 08:59:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BC5B683EF2
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B77371BF368
 for <buildroot@lists.busybox.net>; Sun, 11 Sep 2022 08:48:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A4F8583EE8
 for <buildroot@lists.busybox.net>; Sun, 11 Sep 2022 08:48:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A4F8583EE8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9DhXj4W1-VxP for <buildroot@lists.busybox.net>;
 Sun, 11 Sep 2022 08:48:25 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id BED5683EC0
 for <buildroot@buildroot.org>; Sun, 11 Sep 2022 08:48:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BED5683EC0
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id AC3C6835E4; Sun, 11 Sep 2022 08:48:25 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 23 Aug 2022 21:32:07 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d893182a4c74e4ebbfd8d0facf025b68d61a3512
X-Git-Newrev: ed92ca13d9de57a21e242098fea8a7d37955e232
X-Patchwork-Hint: ignore
Message-Id: <20220911084825.AC3C6835E4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/sdl2: bump version to 2.24.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=ed92ca13d9de57a21e242098fea8a7d37955e232
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

New version numbering scheme, similar to GLib and Flatpak
version 2.0.24 is now 2.24.0

Signed-off-by: Michael Fischer <mf@go-sys.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/sdl2/sdl2.hash | 4 ++--
 package/sdl2/sdl2.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/sdl2/sdl2.hash b/package/sdl2/sdl2.hash
index a5dad638bb..981c98531e 100644
--- a/package/sdl2/sdl2.hash
+++ b/package/sdl2/sdl2.hash
@@ -1,4 +1,4 @@
-# Locally calculated after checking http://www.libsdl.org/release/SDL2-2.0.22.tar.gz.sig
-sha256  fe7cbf3127882e3fc7259a75a0cb585620272c51745d3852ab9dd87960697f2e  SDL2-2.0.22.tar.gz
+# Locally calculated after checking http://www.libsdl.org/release/SDL2-2.24.0.tar.gz.sig
+sha256  91e4c34b1768f92d399b078e171448c6af18cafda743987ed2064a28954d6d97  SDL2-2.24.0.tar.gz
 # Locally calculated
 sha256  fcb07e07ac6bc8b2fcf047b50431ef4ebe5b619d7ca7c82212018309a9067426  LICENSE.txt
diff --git a/package/sdl2/sdl2.mk b/package/sdl2/sdl2.mk
index 58c2a04c1c..4585c33c9b 100644
--- a/package/sdl2/sdl2.mk
+++ b/package/sdl2/sdl2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SDL2_VERSION = 2.0.22
+SDL2_VERSION = 2.24.0
 SDL2_SOURCE = SDL2-$(SDL2_VERSION).tar.gz
 SDL2_SITE = http://www.libsdl.org/release
 SDL2_LICENSE = Zlib
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
