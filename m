Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 498EFC77B7F
	for <buildroot@archiver.kernel.org>; Sat, 13 May 2023 20:27:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A817142A2A;
	Sat, 13 May 2023 20:27:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A817142A2A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nvHdJ-wHY1Fp; Sat, 13 May 2023 20:27:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7C26D428A8;
	Sat, 13 May 2023 20:27:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7C26D428A8
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C48E81BF86B
 for <buildroot@lists.busybox.net>; Sat, 13 May 2023 20:26:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9BE314047D
 for <buildroot@lists.busybox.net>; Sat, 13 May 2023 20:26:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9BE314047D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8fealW-iq1K6 for <buildroot@lists.busybox.net>;
 Sat, 13 May 2023 20:26:50 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id A3A5A4000B
 for <buildroot@buildroot.org>; Sat, 13 May 2023 20:26:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A3A5A4000B
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8FBB38660B; Sat, 13 May 2023 20:26:50 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 13 May 2023 22:26:09 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2bfb4cd0dcc328cc875d3a7483fd944f75f9288f
X-Git-Newrev: b1b8d5bf1b6468725a420fcaffa042303200ece6
X-Patchwork-Hint: ignore
Message-Id: <20230513202650.8FBB38660B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/sdl2_mixer: bump version to 2.6.3
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

commit: https://git.buildroot.net/buildroot/commit/?id=b1b8d5bf1b6468725a420fcaffa042303200ece6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Luke D. Jones <luke@ljones.dev>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/sdl2_mixer/sdl2_mixer.hash | 2 +-
 package/sdl2_mixer/sdl2_mixer.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/sdl2_mixer/sdl2_mixer.hash b/package/sdl2_mixer/sdl2_mixer.hash
index f3bab151f2..98c5fda6af 100644
--- a/package/sdl2_mixer/sdl2_mixer.hash
+++ b/package/sdl2_mixer/sdl2_mixer.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  b4cf5a382c061cd75081cf246c2aa2f9df8db04bdda8dcdc6b6cca55bede2419  SDL2_mixer-2.0.4.tar.gz
+sha256  7a6ba86a478648ce617e3a5e9277181bc67f7ce9876605eea6affd4a0d6eea8f  SDL2_mixer-2.6.3.tar.gz
 sha256  113727180e7956cb9718b03b41da85b63ea54743a33047071a623bf672895a10  COPYING.txt
diff --git a/package/sdl2_mixer/sdl2_mixer.mk b/package/sdl2_mixer/sdl2_mixer.mk
index f349b8ca80..425380bf5d 100644
--- a/package/sdl2_mixer/sdl2_mixer.mk
+++ b/package/sdl2_mixer/sdl2_mixer.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SDL2_MIXER_VERSION = 2.0.4
+SDL2_MIXER_VERSION = 2.6.3
 SDL2_MIXER_SOURCE = SDL2_mixer-$(SDL2_MIXER_VERSION).tar.gz
 SDL2_MIXER_SITE = http://www.libsdl.org/projects/SDL_mixer/release
 SDL2_MIXER_LICENSE = Zlib
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
