Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44227CAC5BB
	for <buildroot@archiver.kernel.org>; Sun,  5 Oct 2025 14:52:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 17CAE4100D;
	Sun,  5 Oct 2025 14:52:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 06p8VN48WGX0; Sun,  5 Oct 2025 14:52:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CCCD34133A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id CCCD34133A;
	Sun,  5 Oct 2025 14:52:56 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 7600FD84
 for <buildroot@buildroot.org>; Sun,  5 Oct 2025 14:52:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 55C0560DA3
 for <buildroot@buildroot.org>; Sun,  5 Oct 2025 14:52:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LSuxc7VxahYC for <buildroot@buildroot.org>;
 Sun,  5 Oct 2025 14:52:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A89C060851
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id A89C060851
 for <buildroot@buildroot.org>; Sun,  5 Oct 2025 14:52:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9912A868D9; Sun,  5 Oct 2025 14:52:51 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 5 Oct 2025 16:50:04 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c1696eff28061a6e39c40860141119b836910fcb
X-Git-Newrev: 1a66cdf7b34328d2b2065bfd22f190c92318e499
X-Patchwork-Hint: ignore
Message-Id: <20251005145251.9912A868D9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libdisplay-info: bump version to
 0.3.0
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=1a66cdf7b34328d2b2065bfd22f190c92318e499
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes:
https://lore.freedesktop.org/wayland-devel/47m6wyRq0q-sgX6zWXuZfexFdml2vTqsHKkdCBXBWywBql7gG9F9or9JsCm690MBXEmnnUEML0JnCIbUNma_a7tFKUPZ6bHPYa86b0gjYB0=@emersion.fr/

Added sha512 hash.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libdisplay-info/libdisplay-info.hash | 6 ++++--
 package/libdisplay-info/libdisplay-info.mk   | 2 +-
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/package/libdisplay-info/libdisplay-info.hash b/package/libdisplay-info/libdisplay-info.hash
index cc93a0cf32..8c6f077679 100644
--- a/package/libdisplay-info/libdisplay-info.hash
+++ b/package/libdisplay-info/libdisplay-info.hash
@@ -1,4 +1,6 @@
-# From https://gitlab.freedesktop.org/emersion/libdisplay-info/-/releases/0.2.0/downloads/libdisplay-info-0.2.0.tar.xz.sha256sum
-sha256  5a2f002a16f42dd3540c8846f80a90b8f4bdcd067a94b9d2087bc2feae974176  libdisplay-info-0.2.0.tar.xz
+# From https://gitlab.freedesktop.org/emersion/libdisplay-info/-/releases/0.3.0/downloads/libdisplay-info-0.3.0.tar.xz.sha256sum
+sha256  6ae77cd937f9cf7d1321d35c116062c4911e8447010a6a713ac4286f7a9d5987  libdisplay-info-0.3.0.tar.xz
+# From https://lore.freedesktop.org/wayland-devel/47m6wyRq0q-sgX6zWXuZfexFdml2vTqsHKkdCBXBWywBql7gG9F9or9JsCm690MBXEmnnUEML0JnCIbUNma_a7tFKUPZ6bHPYa86b0gjYB0=@emersion.fr/
+sha512  3266633d75ccd345dda5a8aad75f310e55a77654b48f17a247b35e18060b6db1047a69083cd286b43ec893125a36c4c43659af8f74a04da3278eea9fdd91efe9  libdisplay-info-0.3.0.tar.xz
 # Locally computed
 sha256  15b396244e58830c5614b9394f4deccfe684970cd507f299383ab57ad339eedd  LICENSE
diff --git a/package/libdisplay-info/libdisplay-info.mk b/package/libdisplay-info/libdisplay-info.mk
index b88463849e..ea5cf1af2d 100644
--- a/package/libdisplay-info/libdisplay-info.mk
+++ b/package/libdisplay-info/libdisplay-info.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBDISPLAY_INFO_VERSION = 0.2.0
+LIBDISPLAY_INFO_VERSION = 0.3.0
 LIBDISPLAY_INFO_SOURCE = libdisplay-info-$(LIBDISPLAY_INFO_VERSION).tar.xz
 LIBDISPLAY_INFO_SITE = https://gitlab.freedesktop.org/emersion/libdisplay-info/-/releases/$(LIBDISPLAY_INFO_VERSION)/downloads
 LIBDISPLAY_INFO_LICENSE = MIT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
