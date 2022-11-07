Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22C2CC4321E
	for <buildroot@archiver.kernel.org>; Mon,  5 Dec 2022 12:07:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C48DC4167F;
	Mon,  5 Dec 2022 12:07:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C48DC4167F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HH3O0Rr27LYr; Mon,  5 Dec 2022 12:07:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 90EEF4169B;
	Mon,  5 Dec 2022 12:06:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 90EEF4169B
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id EF9CB1BF352
 for <buildroot@lists.busybox.net>; Mon,  5 Dec 2022 11:27:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9BBAA408A8
 for <buildroot@lists.busybox.net>; Mon,  5 Dec 2022 11:26:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9BBAA408A8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 488IkjI0sN8b for <buildroot@lists.busybox.net>;
 Mon,  5 Dec 2022 11:26:08 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2D4254056A
 for <buildroot@buildroot.org>; Mon,  5 Dec 2022 11:26:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2D4254056A
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2391D85B9B; Mon,  5 Dec 2022 11:26:08 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 7 Nov 2022 23:11:12 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f7a6011f78044e782c5ef19d1f5abb3b6fd9e435
X-Git-Newrev: d1688c60f42b0186b8147aa58d35649e704b36cb
X-Patchwork-Hint: ignore
Message-Id: <20221205112608.2391D85B9B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/wayland-protocols: bump to version
 1.28
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

commit: https://git.buildroot.net/buildroot/commit/?id=d1688c60f42b0186b8147aa58d35649e704b36cb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/wayland-protocols/wayland-protocols.hash | 6 +++---
 package/wayland-protocols/wayland-protocols.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/wayland-protocols/wayland-protocols.hash b/package/wayland-protocols/wayland-protocols.hash
index 4717523dc2..8884babbc0 100644
--- a/package/wayland-protocols/wayland-protocols.hash
+++ b/package/wayland-protocols/wayland-protocols.hash
@@ -1,4 +1,4 @@
-# From https://lists.freedesktop.org/archives/wayland-devel/2022-October/042466.html
-sha256  9046f10a425d4e2a00965a03acfb6b3fb575a56503ac72c2b86821c69653375c  wayland-protocols-1.27.tar.xz
-sha512  c0a49bc46c663c9f602998dfe2e184c09756790fbcc7acbc2bf9d9cf8f7d6dcdd00259b768222a30e5d134e6f97f7f4faf252947b544e8b32f53278b70da0390  wayland-protocols-1.27.tar.xz
+# From https://lists.freedesktop.org/archives/wayland-devel/2022-November/042490.html
+sha256  c7659fb6bf14905e68ef605f898de60d1c066bf66dbea92798573dddec1535b6  wayland-protocols-1.28.tar.xz
+sha512  092454c6a7e5cc47729de49e9061fb91dfdc5610859e17c495642806ca14dcfb3850a5d3a7459ddb70b2adb08d2590d4b0f92c3a97600e48598682d59adb102f  wayland-protocols-1.28.tar.xz
 sha256  f1a2b233e8a9a71c40f4aa885be08a0842ac85bb8588703c1dd7e6e6502e3124  COPYING
diff --git a/package/wayland-protocols/wayland-protocols.mk b/package/wayland-protocols/wayland-protocols.mk
index 2510d7c04e..830136ce06 100644
--- a/package/wayland-protocols/wayland-protocols.mk
+++ b/package/wayland-protocols/wayland-protocols.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WAYLAND_PROTOCOLS_VERSION = 1.27
+WAYLAND_PROTOCOLS_VERSION = 1.28
 WAYLAND_PROTOCOLS_SITE = https://gitlab.freedesktop.org/wayland/wayland-protocols/-/releases/$(WAYLAND_PROTOCOLS_VERSION)/downloads
 WAYLAND_PROTOCOLS_SOURCE = wayland-protocols-$(WAYLAND_PROTOCOLS_VERSION).tar.xz
 WAYLAND_PROTOCOLS_LICENSE = MIT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
