Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0E7DCCD1BF
	for <buildroot@archiver.kernel.org>; Sat, 25 Oct 2025 17:16:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1FAC981200;
	Sat, 25 Oct 2025 17:16:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Q88sOx06HF21; Sat, 25 Oct 2025 17:16:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0D4F9811F7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0D4F9811F7;
	Sat, 25 Oct 2025 17:16:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id A2120D7
 for <buildroot@buildroot.org>; Sat, 25 Oct 2025 17:16:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9C1164046B
 for <buildroot@buildroot.org>; Sat, 25 Oct 2025 17:16:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 60lAhkaaILIF for <buildroot@buildroot.org>;
 Sat, 25 Oct 2025 17:16:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EC66A4033D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id EC66A4033D
 for <buildroot@buildroot.org>; Sat, 25 Oct 2025 17:16:22 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E7FC6877E2; Sat, 25 Oct 2025 17:16:22 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 25 Oct 2025 19:09:26 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 01e71aa9f6a7f6a3d7e54a666809bb7e44c49098
X-Git-Newrev: bb2e03c03cf45823f2ecfe56f0d39017ed1e2d7e
X-Patchwork-Hint: ignore
Message-Id: <20251025171622.E7FC6877E2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libevdev: bump to version 1.13.5
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

commit: https://git.buildroot.net/buildroot/commit/?id=bb2e03c03cf45823f2ecfe56f0d39017ed1e2d7e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes since 1.13.2:
https://lists.freedesktop.org/archives/input-tools/2024-May/001588.html
https://lists.freedesktop.org/archives/input-tools/2024-September/001589.html
https://lists.freedesktop.org/archives/input-tools/2025-March/001592.html
https://lists.freedesktop.org/archives/input-tools/2025-October/001593.html

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/libevdev/libevdev.hash | 6 +++---
 package/libevdev/libevdev.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libevdev/libevdev.hash b/package/libevdev/libevdev.hash
index acaedfad56..3fe609d78a 100644
--- a/package/libevdev/libevdev.hash
+++ b/package/libevdev/libevdev.hash
@@ -1,6 +1,6 @@
-# From https://lists.freedesktop.org/archives/input-tools/2023-May/001585.html
-sha256  06a77bf2ac5c993305882bc1641017f5bec1592d6d1b64787bad492ab34f2f36  libevdev-1.13.1.tar.xz
-sha512  9b75bad4bc13948854c8dff7a7a46aca6c06d1410ccb000f881bf76055ccac040595c3b24fb1a574be875b5c262eb86820b9ec3383752641bc2047135e5a412f  libevdev-1.13.1.tar.xz
+# From https://lists.freedesktop.org/archives/input-tools/2025-October/001593.html
+sha256  89918ae7b7c13936e6482604a77a2bfbbb74544c5d039fde01c3fa1bdf639987  libevdev-1.13.5.tar.xz
+sha512  2ca066235c9d6729e965e2df1df192285b3d41a20aeb2bc4eb21d14dc469198d5270d1cd900dee0b6cf1bdf9efd3c47ec310bfbd9e4965b3bcc3ef440efba604  libevdev-1.13.5.tar.xz
 
 # Hash for license files:
 sha256  6f13de7ce28e4948ba95170e0723ee1254c1978ce1f127af82aeca597b567cb9  COPYING
diff --git a/package/libevdev/libevdev.mk b/package/libevdev/libevdev.mk
index b0cf6c9ba8..24bd1609da 100644
--- a/package/libevdev/libevdev.mk
+++ b/package/libevdev/libevdev.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBEVDEV_VERSION = 1.13.1
+LIBEVDEV_VERSION = 1.13.5
 LIBEVDEV_SITE = http://www.freedesktop.org/software/libevdev
 LIBEVDEV_SOURCE = libevdev-$(LIBEVDEV_VERSION).tar.xz
 LIBEVDEV_LICENSE = MIT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
