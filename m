Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69C68CAC587
	for <buildroot@archiver.kernel.org>; Sun, 14 Sep 2025 20:39:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0A15E6F68A;
	Sun, 14 Sep 2025 20:39:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NCD1UwJxWyPc; Sun, 14 Sep 2025 20:39:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AF47A6F69B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id AF47A6F69B;
	Sun, 14 Sep 2025 20:39:50 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 46260117
 for <buildroot@buildroot.org>; Sun, 14 Sep 2025 20:39:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 43C3941F36
 for <buildroot@buildroot.org>; Sun, 14 Sep 2025 20:39:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PGwo5FyYp_6w for <buildroot@buildroot.org>;
 Sun, 14 Sep 2025 20:39:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0256B41237
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0256B41237
 for <buildroot@buildroot.org>; Sun, 14 Sep 2025 20:39:44 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id F21778442C; Sun, 14 Sep 2025 20:39:43 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 14 Sep 2025 22:34:19 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 171bd290053a061ae11c7af18444a5d30105d058
X-Git-Newrev: 5ad452656498c23c06cb2f6a9d1bad0adab841ef
X-Patchwork-Hint: ignore
Message-Id: <20250914203943.F21778442C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/wayland: bump to 1.24.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=5ad452656498c23c06cb2f6a9d1bad0adab841ef
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

News:
 - RC1: https://lists.freedesktop.org/archives/wayland-devel/2025-May/044282.html
 - RC2: https://lore.freedesktop.org/wayland-devel/2-4IjuOFGtlCZQhVPefO2DnjO26y5dVbL3mW3Get8jPPXw-GPN-0C8VIBOejnP7lZlSZcRGslG3A1DX5ACHiYazNXyx0UVhLyCQjXgdtg0U=@emersion.fr/
 - RC3: https://lore.freedesktop.org/wayland-devel/l2Ybp5Dex4yXCOVJb-VgQiK68CLgXQnBa4SG5cPFKA7tl4rkuLqMFRy_6Kx34pBZ-np3qLQNVx3ID9AKDrk2MEJ5lKueMj1PfE2K0um7KwA=@emersion.fr/T/#u
 - 1.24.0: https://lore.freedesktop.org/wayland-devel/plU5smxin5VXbiedTGtL7CNHe0t2mHtgQlQ3-xwREmSSNYaClAcZpEBV8L7JvMT8JHwdD_a_uSFkDUaP45CAWyL545iZh5gInAdToX6hgt4=@emersion.fr/T/#u

Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/wayland/wayland.hash | 6 +++---
 package/wayland/wayland.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/wayland/wayland.hash b/package/wayland/wayland.hash
index f7c085513a..8da9dbe745 100644
--- a/package/wayland/wayland.hash
+++ b/package/wayland/wayland.hash
@@ -1,6 +1,6 @@
-# From https://lists.freedesktop.org/archives/wayland-devel/2024-August/043760.html
-sha256  864fb2a8399e2d0ec39d56e9d9b753c093775beadc6022ce81f441929a81e5ed  wayland-1.23.1.tar.xz
-sha512  818eda003e3f7aa15690eedb1ff227a6056b2ce54bf23d45ffe573dc40a914623c5a1358218b59444dcdc483db0503324f0d27091d0ea954412a8b290de5f50a  wayland-1.23.1.tar.xz
+# From https://lore.freedesktop.org/wayland-devel/plU5smxin5VXbiedTGtL7CNHe0t2mHtgQlQ3-xwREmSSNYaClAcZpEBV8L7JvMT8JHwdD_a_uSFkDUaP45CAWyL545iZh5gInAdToX6hgt4=@emersion.fr/T/#u
+sha256  82892487a01ad67b334eca83b54317a7c86a03a89cfadacfef5211f11a5d0536  wayland-1.24.0.tar.xz
+sha512  60216602cffd1473ae15381f9e9a6f3829e742cac83843ca65360ba78bcff8d9442f15eb6a6d5d29c8f74dd920762ca1605f51658d22a1d3c18e338505b9f974  wayland-1.24.0.tar.xz
 
 # Locally calculated
 sha256  6eefcb023622a463168a5c20add95fd24a38c7482622a9254a23b99b7c153061  COPYING
diff --git a/package/wayland/wayland.mk b/package/wayland/wayland.mk
index 23903bafcb..6add648d5d 100644
--- a/package/wayland/wayland.mk
+++ b/package/wayland/wayland.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WAYLAND_VERSION = 1.23.1
+WAYLAND_VERSION = 1.24.0
 WAYLAND_SITE = https://gitlab.freedesktop.org/wayland/wayland/-/releases/$(WAYLAND_VERSION)/downloads
 WAYLAND_SOURCE = wayland-$(WAYLAND_VERSION).tar.xz
 WAYLAND_LICENSE = MIT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
