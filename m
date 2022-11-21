Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D83DC433FE
	for <buildroot@archiver.kernel.org>; Mon, 21 Nov 2022 21:42:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B01C0409A9;
	Mon, 21 Nov 2022 21:42:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B01C0409A9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5F3ZjeGgcdXE; Mon, 21 Nov 2022 21:42:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BC762408BB;
	Mon, 21 Nov 2022 21:42:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BC762408BB
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E3CE91BF34D
 for <buildroot@lists.busybox.net>; Mon, 21 Nov 2022 21:42:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BFCA5405AA
 for <buildroot@lists.busybox.net>; Mon, 21 Nov 2022 21:42:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BFCA5405AA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iRa1-hJh6jUF for <buildroot@lists.busybox.net>;
 Mon, 21 Nov 2022 21:42:53 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1AB5340179
 for <buildroot@buildroot.org>; Mon, 21 Nov 2022 21:42:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1AB5340179
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 05E18840ED; Mon, 21 Nov 2022 21:42:53 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Mon, 21 Nov 2022 22:42:18 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: c3134c6abd4d34ecef938aacc04edd5b3c4e9a92
X-Git-Newrev: 93d8b7137196278dd1903c4df9ab8751b36cdfd0
X-Patchwork-Hint: ignore
Message-Id: <20221121214253.05E18840ED@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/sdl2_ttf: bump version
 to 2.20.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=93d8b7137196278dd1903c4df9ab8751b36cdfd0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Peter Thompson <peter.macleod.thompson@gmail.com>
[yann.morin.1998@free.fr: fix spaces in hash file]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/sdl2_ttf/sdl2_ttf.hash | 4 ++--
 package/sdl2_ttf/sdl2_ttf.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/sdl2_ttf/sdl2_ttf.hash b/package/sdl2_ttf/sdl2_ttf.hash
index a490b002b6..3313b341f9 100644
--- a/package/sdl2_ttf/sdl2_ttf.hash
+++ b/package/sdl2_ttf/sdl2_ttf.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  7234eb8883514e019e7747c703e4a774575b18d435c22a4a29d068cb768a2251  SDL2_ttf-2.0.18.tar.gz
-sha256  e211dfe7e2c36e64048be886fe3f2bbba8732ce4dd77b596a355d3abbec775a4  COPYING.txt
+sha256  78cdad51f3cc3ada6932b1bb6e914b33798ab970a1e817763f22ddbfd97d0c57  SDL2_ttf-2.20.1.tar.gz
+sha256  28aabfed22b3cb0b7e23ef40385e4f66297c960082f029c96d073cc1d4e008d5  LICENSE.txt
diff --git a/package/sdl2_ttf/sdl2_ttf.mk b/package/sdl2_ttf/sdl2_ttf.mk
index 054e327fac..4b44b0fc41 100644
--- a/package/sdl2_ttf/sdl2_ttf.mk
+++ b/package/sdl2_ttf/sdl2_ttf.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SDL2_TTF_VERSION = 2.0.18
+SDL2_TTF_VERSION = 2.20.1
 SDL2_TTF_SOURCE = SDL2_ttf-$(SDL2_TTF_VERSION).tar.gz
 SDL2_TTF_SITE = http://www.libsdl.org/projects/SDL_ttf/release
 SDL2_TTF_LICENSE = Zlib
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
