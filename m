Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B53CC001B2
	for <buildroot@archiver.kernel.org>; Wed, 14 Dec 2022 19:31:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CC79B81F45;
	Wed, 14 Dec 2022 19:31:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CC79B81F45
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id N64vP_aGaj3D; Wed, 14 Dec 2022 19:31:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id F233181F3E;
	Wed, 14 Dec 2022 19:30:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F233181F3E
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7AA191BF42C
 for <buildroot@lists.busybox.net>; Wed, 14 Dec 2022 19:30:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 557F341853
 for <buildroot@lists.busybox.net>; Wed, 14 Dec 2022 19:30:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 557F341853
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yUoQo5zuhNO3 for <buildroot@lists.busybox.net>;
 Wed, 14 Dec 2022 19:30:39 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 66E8F4037A
 for <buildroot@buildroot.org>; Wed, 14 Dec 2022 19:30:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 66E8F4037A
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 53FC3866CF; Wed, 14 Dec 2022 19:30:39 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 14 Dec 2022 20:30:07 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 319d2735f99e95955c2a75c8fc6282ddf7de232a
X-Git-Newrev: 4d05fa00fd07c3d0cd3f1b6ee676e6dd20c5430f
X-Patchwork-Hint: ignore
Message-Id: <20221214193039.53FC3866CF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/wayland-protocols: bump to version
 1.31
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

commit: https://git.buildroot.net/buildroot/commit/?id=4d05fa00fd07c3d0cd3f1b6ee676e6dd20c5430f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/wayland-protocols/wayland-protocols.hash | 6 +++---
 package/wayland-protocols/wayland-protocols.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/wayland-protocols/wayland-protocols.hash b/package/wayland-protocols/wayland-protocols.hash
index 8884babbc0..45c62a396b 100644
--- a/package/wayland-protocols/wayland-protocols.hash
+++ b/package/wayland-protocols/wayland-protocols.hash
@@ -1,4 +1,4 @@
-# From https://lists.freedesktop.org/archives/wayland-devel/2022-November/042490.html
-sha256  c7659fb6bf14905e68ef605f898de60d1c066bf66dbea92798573dddec1535b6  wayland-protocols-1.28.tar.xz
-sha512  092454c6a7e5cc47729de49e9061fb91dfdc5610859e17c495642806ca14dcfb3850a5d3a7459ddb70b2adb08d2590d4b0f92c3a97600e48598682d59adb102f  wayland-protocols-1.28.tar.xz
+# From https://lists.freedesktop.org/archives/wayland-devel/2022-November/042524.html
+sha256  a07fa722ed87676ec020d867714bc9a2f24c464da73912f39706eeef5219e238  wayland-protocols-1.31.tar.xz
+sha512  402ce1915300e29afe554d77965ee0a28a5f22fdb5b901c4c640e59b9f3a9c11094e1edae87eea1e76eea557f6faf0c34a0c28ee7f6babb4dc3719329c4e25bf  wayland-protocols-1.31.tar.xz
 sha256  f1a2b233e8a9a71c40f4aa885be08a0842ac85bb8588703c1dd7e6e6502e3124  COPYING
diff --git a/package/wayland-protocols/wayland-protocols.mk b/package/wayland-protocols/wayland-protocols.mk
index 830136ce06..54f9ed8a3a 100644
--- a/package/wayland-protocols/wayland-protocols.mk
+++ b/package/wayland-protocols/wayland-protocols.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WAYLAND_PROTOCOLS_VERSION = 1.28
+WAYLAND_PROTOCOLS_VERSION = 1.31
 WAYLAND_PROTOCOLS_SITE = https://gitlab.freedesktop.org/wayland/wayland-protocols/-/releases/$(WAYLAND_PROTOCOLS_VERSION)/downloads
 WAYLAND_PROTOCOLS_SOURCE = wayland-protocols-$(WAYLAND_PROTOCOLS_VERSION).tar.xz
 WAYLAND_PROTOCOLS_LICENSE = MIT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
