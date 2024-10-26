Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7982AD10BF9
	for <buildroot@archiver.kernel.org>; Sat, 26 Oct 2024 13:30:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0F46E40643;
	Sat, 26 Oct 2024 13:30:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BSVTSpmQ85hM; Sat, 26 Oct 2024 13:30:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 91C0C405F9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 91C0C405F9;
	Sat, 26 Oct 2024 13:30:25 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id CF7F85C24
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 13:30:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BBC1B6063D
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 13:30:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UkRXGoyyQvk9 for <buildroot@buildroot.org>;
 Sat, 26 Oct 2024 13:30:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DDD5160622
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id DDD5160622
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 13:30:23 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D5D4283AFF; Sat, 26 Oct 2024 13:30:23 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 26 Oct 2024 15:24:47 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5440d6c4464d8dd25c9315e49e97cd91884ccde2
X-Git-Newrev: 430b80cfc11c59949da8e0a4f11a7088d0b4bd79
X-Patchwork-Hint: ignore
Message-Id: <20241026133023.D5D4283AFF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/weston: bump to version 14.0.0
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=430b80cfc11c59949da8e0a4f11a7088d0b4bd79
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Notes:
 - (14.0.0) https://lists.freedesktop.org/archives/wayland-devel/2024-September/043776.html
 - (13.0.95 RC3) https://lists.freedesktop.org/archives/wayland-devel/2024-September/043775.html
 - (13.0.94 RC2) https://lists.freedesktop.org/archives/wayland-devel/2024-August/043772.html
 - (13.0.93 RC1) https://lists.freedesktop.org/archives/wayland-devel/2024-August/043761.html
 - (13.0.92 Beta Release) https://lists.freedesktop.org/archives/wayland-devel/2024-August/043758.html
 - (13.0.91 Alpha Release) https://lists.freedesktop.org/archives/wayland-devel/2024-August/043705.html

Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/weston/Config.in   | 1 +
 package/weston/weston.hash | 6 +++---
 package/weston/weston.mk   | 5 +++--
 3 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/package/weston/Config.in b/package/weston/Config.in
index d55c456425..89bcaa4aa0 100644
--- a/package/weston/Config.in
+++ b/package/weston/Config.in
@@ -17,6 +17,7 @@ config BR2_PACKAGE_WESTON
 	select BR2_PACKAGE_LIBPNG
 	select BR2_PACKAGE_JPEG
 	select BR2_PACKAGE_LIBINPUT
+	select BR2_PACKAGE_LIBDISPLAY_INFO
 	select BR2_PACKAGE_LIBDRM
 	select BR2_PACKAGE_SEATD
 	# Runtime dependency
diff --git a/package/weston/weston.hash b/package/weston/weston.hash
index 62322ac639..2fdc6ec1f4 100644
--- a/package/weston/weston.hash
+++ b/package/weston/weston.hash
@@ -1,4 +1,4 @@
-# From https://lists.freedesktop.org/archives/wayland-devel/2024-June/043655.html
-sha256  27f68d96e3b97d98daadef13a202356524924fa381418fa6716b9136ef099093  weston-13.0.3.tar.xz
-sha512  60e655b57cf418902ec6e4371883354165241d9a99a712aabe2165e11ac190dec22836fd885f5178def5416dc5f00e70042b022c96a8e0aa74827bbd4563f9cb  weston-13.0.3.tar.xz
+# From https://lists.freedesktop.org/archives/wayland-devel/2024-September/043776.html
+sha256  47fd0325b0b948e9b003a38fdf4eb3a8581f3fdc740b8932b35ae8793bf4e4a5  weston-14.0.0.tar.xz
+sha512  8bdeed91befd5cbb0bde0f1860ff7775c1835a5fa8c3bf26e99d2f0c16e81255fcf35bf338ae02d7826463d0efdf41ba3fe78e38e4c27787831dfa331acafc08  weston-14.0.0.tar.xz
 sha256  fdb65868f65d0fbdb05c2d3b779e10ce9969fa0c4b9262ba4f260e87086ab860  COPYING
diff --git a/package/weston/weston.mk b/package/weston/weston.mk
index 9292ba14b6..d879dcc965 100644
--- a/package/weston/weston.mk
+++ b/package/weston/weston.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WESTON_VERSION = 13.0.3
+WESTON_VERSION = 14.0.0
 WESTON_SITE = https://gitlab.freedesktop.org/wayland/weston/-/releases/$(WESTON_VERSION)/downloads
 WESTON_SOURCE = weston-$(WESTON_VERSION).tar.xz
 WESTON_LICENSE = MIT
@@ -13,7 +13,8 @@ WESTON_CPE_ID_VENDOR = wayland
 WESTON_INSTALL_STAGING = YES
 
 WESTON_DEPENDENCIES = host-pkgconf wayland wayland-protocols \
-	libxkbcommon pixman libpng udev cairo libinput libdrm seatd
+	libxkbcommon pixman libpng udev cairo libinput libdisplay-info libdrm \
+	seatd
 
 WESTON_CONF_OPTS = \
 	-Ddoc=false \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
