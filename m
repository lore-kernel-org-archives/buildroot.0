Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35BC1CAC5B9
	for <buildroot@archiver.kernel.org>; Mon, 29 Sep 2025 19:04:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0149180C4C;
	Mon, 29 Sep 2025 19:04:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nKZtSYpG-LAM; Mon, 29 Sep 2025 19:04:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 23C6280C86
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 23C6280C86;
	Mon, 29 Sep 2025 19:04:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 66E1ACF
 for <buildroot@buildroot.org>; Mon, 29 Sep 2025 19:04:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 641D8407E9
 for <buildroot@buildroot.org>; Mon, 29 Sep 2025 19:04:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2-G1b1P7ttr8 for <buildroot@buildroot.org>;
 Mon, 29 Sep 2025 19:04:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8C4F7407E6
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8C4F7407E6
 for <buildroot@buildroot.org>; Mon, 29 Sep 2025 19:04:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7BBC18640D; Mon, 29 Sep 2025 19:04:53 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 29 Sep 2025 20:57:07 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4e7f03314d8b777c7616e6bf5edf69c8aa015782
X-Git-Newrev: 89af3d53b0d2bd64d8c210afd55fed07c900e562
X-Patchwork-Hint: ignore
Message-Id: <20250929190453.7BBC18640D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/sdl2: bump version to 2.32.10
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=89af3d53b0d2bd64d8c210afd55fed07c900e562
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Stable bugfix release:
https://github.com/libsdl-org/SDL/releases/tag/release-2.32.10

Signed-off-by: Michael Fischer <mf@go-sys.de>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/sdl2/sdl2.hash | 4 ++--
 package/sdl2/sdl2.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/sdl2/sdl2.hash b/package/sdl2/sdl2.hash
index 7e3a40ac5d..484545fe88 100644
--- a/package/sdl2/sdl2.hash
+++ b/package/sdl2/sdl2.hash
@@ -1,4 +1,4 @@
-# Locally calculated after checking http://www.libsdl.org/release/SDL2-2.32.8.tar.gz.sig
-sha256  0ca83e9c9b31e18288c7ec811108e58bac1f1bb5ec6577ad386830eac51c787e  SDL2-2.32.8.tar.gz
+# Locally calculated after checking http://www.libsdl.org/release/SDL2-2.32.10.tar.gz.sig
+sha256  5f5993c530f084535c65a6879e9b26ad441169b3e25d789d83287040a9ca5165  SDL2-2.32.10.tar.gz
 # Locally calculated
 sha256  97f35b302b361680ec1e891e95d2d52097bb95abff361434916d99dc1305f127  LICENSE.txt
diff --git a/package/sdl2/sdl2.mk b/package/sdl2/sdl2.mk
index 1537d3d82e..eb6e753869 100644
--- a/package/sdl2/sdl2.mk
+++ b/package/sdl2/sdl2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SDL2_VERSION = 2.32.8
+SDL2_VERSION = 2.32.10
 SDL2_SOURCE = SDL2-$(SDL2_VERSION).tar.gz
 SDL2_SITE = http://www.libsdl.org/release
 SDL2_LICENSE = Zlib
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
