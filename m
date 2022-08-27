Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD40FC0502A
	for <buildroot@archiver.kernel.org>; Sat, 27 Aug 2022 13:42:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 656D882437;
	Sat, 27 Aug 2022 13:42:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 656D882437
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ABR6SyMGoWeK; Sat, 27 Aug 2022 13:42:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 882F382410;
	Sat, 27 Aug 2022 13:42:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 882F382410
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9A4061BF95D
 for <buildroot@lists.busybox.net>; Sat, 27 Aug 2022 13:42:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 75D6360D5D
 for <buildroot@lists.busybox.net>; Sat, 27 Aug 2022 13:42:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 75D6360D5D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kyngfXTaN6Jq for <buildroot@lists.busybox.net>;
 Sat, 27 Aug 2022 13:42:04 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id A912060D51
 for <buildroot@buildroot.org>; Sat, 27 Aug 2022 13:42:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A912060D51
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id F200A87E20; Sat, 27 Aug 2022 13:27:07 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 27 Aug 2022 15:41:28 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 30c1aa539ba8d787312f5941b3711a026b714072
X-Git-Newrev: 4f903c9ba8f4f68df530b3de43247865f59d1b77
X-Patchwork-Hint: ignore
Message-Id: <20220827132707.F200A87E20@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/cog: bump to version
 0.14.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=4f903c9ba8f4f68df530b3de43247865f59d1b77
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

This new version includes many improvements. Release notes:

  https://wpewebkit.org/release/cog-0.14.0.html

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/cog/cog.hash | 8 ++++----
 package/cog/cog.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/cog/cog.hash b/package/cog/cog.hash
index 00d3a4e191..3fd480c2a8 100644
--- a/package/cog/cog.hash
+++ b/package/cog/cog.hash
@@ -1,7 +1,7 @@
-# From https://wpewebkit.org/releases/cog-0.12.4.tar.xz.sums
-md5  cdb8acdc3acc9b5082e7db9c279155c3  cog-0.12.4.tar.xz
-sha1  600b30efadf55bf94ea5062a0a1b2ea0b74053e5  cog-0.12.4.tar.xz
-sha256  9983c621c8e14fca3792ff566cb6b86d6a1f17446eb4c083af4a5a749112982f  cog-0.12.4.tar.xz
+# From https://wpewebkit.org/releases/cog-0.14.0.tar.xz.sums
+md5  2352aaba1a4ff31b1d1fb559c4941a01  cog-0.14.0.tar.xz
+sha1  2da37ea6c25e45425aa80de4a129484ee226dd96  cog-0.14.0.tar.xz
+sha256  e23936f1ce350ea5ea6fa0709b63d34776b05709388aed9c6cf3fdc41299de9f  cog-0.14.0.tar.xz
 
 # Hashes for license files:
 sha256  e6c42d93c68b292bcccf6d2ec3e13da85df90b718ba27c2c2a01053a9d009252  COPYING
diff --git a/package/cog/cog.mk b/package/cog/cog.mk
index 95b6220629..348c17c336 100644
--- a/package/cog/cog.mk
+++ b/package/cog/cog.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-COG_VERSION = 0.12.4
+COG_VERSION = 0.14.0
 COG_SITE = https://wpewebkit.org/releases
 COG_SOURCE = cog-$(COG_VERSION).tar.xz
 COG_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
