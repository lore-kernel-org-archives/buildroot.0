Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C52DCEACFF
	for <buildroot@archiver.kernel.org>; Tue,  1 Oct 2024 20:03:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6860160898;
	Tue,  1 Oct 2024 20:03:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XZCdmE_3vMZs; Tue,  1 Oct 2024 20:03:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CAECA608A2
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CAECA608A2;
	Tue,  1 Oct 2024 20:03:22 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7560F1BF97A
 for <buildroot@lists.busybox.net>; Tue,  1 Oct 2024 20:03:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6399D40A56
 for <buildroot@lists.busybox.net>; Tue,  1 Oct 2024 20:03:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jnKzOhtRQPYY for <buildroot@lists.busybox.net>;
 Tue,  1 Oct 2024 20:03:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 58389402B1
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 58389402B1
 for <buildroot@buildroot.org>; Tue,  1 Oct 2024 20:03:18 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 431E18462F; Tue,  1 Oct 2024 20:03:18 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 1 Oct 2024 21:50:40 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a2da88519fc1f96e517171dfb053aca8c00f7daf
X-Git-Newrev: 93c81b1b1f8dceaa6bd3eb5d203285b94015b8cb
X-Patchwork-Hint: ignore
Message-Id: <20241001200318.431E18462F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/sdl2: bump version to 2.30.7
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

commit: https://git.buildroot.net/buildroot/commit/?id=93c81b1b1f8dceaa6bd3eb5d203285b94015b8cb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Michael Fischer <mf@go-sys.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/sdl2/sdl2.hash | 4 ++--
 package/sdl2/sdl2.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/sdl2/sdl2.hash b/package/sdl2/sdl2.hash
index d45ed1c73e..4cd3cb08d8 100644
--- a/package/sdl2/sdl2.hash
+++ b/package/sdl2/sdl2.hash
@@ -1,4 +1,4 @@
-# Locally calculated after checking http://www.libsdl.org/release/SDL2-2.30.6.tar.gz.sig
-sha256  c6ef64ca18a19d13df6eb22df9aff19fb0db65610a74cc81dae33a82235cacd4  SDL2-2.30.6.tar.gz
+# Locally calculated after checking http://www.libsdl.org/release/SDL2-2.30.7.tar.gz.sig
+sha256  2508c80438cd5ff3bbeb8fe36b8f3ce7805018ff30303010b61b03bb83ab9694  SDL2-2.30.7.tar.gz
 # Locally calculated
 sha256  9b9e1764f06701bcf7ce21e942c682d5921ba0900c6fca760321b1c8837a9662  LICENSE.txt
diff --git a/package/sdl2/sdl2.mk b/package/sdl2/sdl2.mk
index 6b7d19bae5..558deed4bc 100644
--- a/package/sdl2/sdl2.mk
+++ b/package/sdl2/sdl2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SDL2_VERSION = 2.30.6
+SDL2_VERSION = 2.30.7
 SDL2_SOURCE = SDL2-$(SDL2_VERSION).tar.gz
 SDL2_SITE = http://www.libsdl.org/release
 SDL2_LICENSE = Zlib
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
