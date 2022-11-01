Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF46CC4332F
	for <buildroot@archiver.kernel.org>; Tue,  1 Nov 2022 22:26:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 92B7D81A30;
	Tue,  1 Nov 2022 22:26:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 92B7D81A30
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zIB6QU4Z_wOr; Tue,  1 Nov 2022 22:26:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C1D7A8190B;
	Tue,  1 Nov 2022 22:26:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C1D7A8190B
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 55FF51BF95C
 for <buildroot@lists.busybox.net>; Tue,  1 Nov 2022 22:26:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 31CD18190B
 for <buildroot@lists.busybox.net>; Tue,  1 Nov 2022 22:26:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 31CD18190B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rc8-NPFz3BcR for <buildroot@lists.busybox.net>;
 Tue,  1 Nov 2022 22:26:14 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4BBDC81A24
 for <buildroot@buildroot.org>; Tue,  1 Nov 2022 22:26:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4BBDC81A24
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3BA58879A3; Tue,  1 Nov 2022 22:26:14 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 1 Nov 2022 23:25:46 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: de17165fd5f94766aef1f51d09d0998fee8096b3
X-Git-Newrev: f71e8c313eecd6aeacc3d7e4f10edd645034809d
X-Patchwork-Hint: ignore
Message-Id: <20221101222614.3BA58879A3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/wayland-protocols: bump to version
 1.27
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

commit: https://git.buildroot.net/buildroot/commit/?id=f71e8c313eecd6aeacc3d7e4f10edd645034809d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/wayland-protocols/wayland-protocols.hash | 7 +++----
 package/wayland-protocols/wayland-protocols.mk   | 4 ++--
 2 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/package/wayland-protocols/wayland-protocols.hash b/package/wayland-protocols/wayland-protocols.hash
index 2d98c47c6f..4717523dc2 100644
--- a/package/wayland-protocols/wayland-protocols.hash
+++ b/package/wayland-protocols/wayland-protocols.hash
@@ -1,5 +1,4 @@
-# From https://lists.freedesktop.org/archives/wayland-devel/2022-July/042270.html
-md5  0c6b3e037f3881650d9a53610dd235c7  wayland-protocols-1.26.tar.xz
-sha1  8aeb1a629d847ec26e26d5a59c150add41e482bd  wayland-protocols-1.26.tar.xz
-sha256  c553384c1c68afd762fa537a2569cc9074fe7600da12d3472761e77a2ba56f13  wayland-protocols-1.26.tar.xz
+# From https://lists.freedesktop.org/archives/wayland-devel/2022-October/042466.html
+sha256  9046f10a425d4e2a00965a03acfb6b3fb575a56503ac72c2b86821c69653375c  wayland-protocols-1.27.tar.xz
+sha512  c0a49bc46c663c9f602998dfe2e184c09756790fbcc7acbc2bf9d9cf8f7d6dcdd00259b768222a30e5d134e6f97f7f4faf252947b544e8b32f53278b70da0390  wayland-protocols-1.27.tar.xz
 sha256  f1a2b233e8a9a71c40f4aa885be08a0842ac85bb8588703c1dd7e6e6502e3124  COPYING
diff --git a/package/wayland-protocols/wayland-protocols.mk b/package/wayland-protocols/wayland-protocols.mk
index 8e6d72480f..2510d7c04e 100644
--- a/package/wayland-protocols/wayland-protocols.mk
+++ b/package/wayland-protocols/wayland-protocols.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-WAYLAND_PROTOCOLS_VERSION = 1.26
-WAYLAND_PROTOCOLS_SITE = https://wayland.freedesktop.org/releases
+WAYLAND_PROTOCOLS_VERSION = 1.27
+WAYLAND_PROTOCOLS_SITE = https://gitlab.freedesktop.org/wayland/wayland-protocols/-/releases/$(WAYLAND_PROTOCOLS_VERSION)/downloads
 WAYLAND_PROTOCOLS_SOURCE = wayland-protocols-$(WAYLAND_PROTOCOLS_VERSION).tar.xz
 WAYLAND_PROTOCOLS_LICENSE = MIT
 WAYLAND_PROTOCOLS_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
