Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E38ADCFD2F6
	for <buildroot@archiver.kernel.org>; Sat, 29 Nov 2025 23:04:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9A89660794;
	Sat, 29 Nov 2025 23:04:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AGj6tjQOmLuy; Sat, 29 Nov 2025 23:04:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AE71D607C1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id AE71D607C1;
	Sat, 29 Nov 2025 23:04:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id D9D511A9
 for <buildroot@buildroot.org>; Sat, 29 Nov 2025 23:04:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CB72880982
 for <buildroot@buildroot.org>; Sat, 29 Nov 2025 23:04:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gHkAcOhMKJP6 for <buildroot@buildroot.org>;
 Sat, 29 Nov 2025 23:04:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BFB50808A6
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id BFB50808A6
 for <buildroot@buildroot.org>; Sat, 29 Nov 2025 23:04:33 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AD1308617D; Sat, 29 Nov 2025 23:04:33 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 29 Nov 2025 19:30:37 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 9e7172ceac1e93a7167031a50edbff813c4b4774
X-Git-Newrev: 2feaeed29e0ed0f522898a5943d977e18bfa6b53
X-Patchwork-Hint: ignore
Message-Id: <20251129230433.AD1308617D@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/at-spi2-core: bump to
 version 2.58.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=2feaeed29e0ed0f522898a5943d977e18bfa6b53
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Release notes:
https://gitlab.gnome.org/GNOME/at-spi2-core/-/blob/2.58.2/NEWS

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/at-spi2-core/at-spi2-core.hash | 4 ++--
 package/at-spi2-core/at-spi2-core.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/at-spi2-core/at-spi2-core.hash b/package/at-spi2-core/at-spi2-core.hash
index 780456dcaf..bcf3de9a44 100644
--- a/package/at-spi2-core/at-spi2-core.hash
+++ b/package/at-spi2-core/at-spi2-core.hash
@@ -1,5 +1,5 @@
-# From https://download.gnome.org/sources/at-spi2-core/2.58/at-spi2-core-2.58.1.sha256sum
-sha256  7f374a6a38cd70ff4b32c9d3a0310bfa804d946fed4c9e69a7d49facdcb95e9c  at-spi2-core-2.58.1.tar.xz
+# From https://download.gnome.org/sources/at-spi2-core/2.58/at-spi2-core-2.58.2.sha256sum
+sha256  a2823b962ed16cdd5cb1fc5365029fd218394d852acd4098b321854bd6692f6e  at-spi2-core-2.58.2.tar.xz
 
 # locally calculated
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/at-spi2-core/at-spi2-core.mk b/package/at-spi2-core/at-spi2-core.mk
index f6d2b5264f..72703e923c 100644
--- a/package/at-spi2-core/at-spi2-core.mk
+++ b/package/at-spi2-core/at-spi2-core.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 AT_SPI2_CORE_VERSION_MAJOR = 2.58
-AT_SPI2_CORE_VERSION = $(AT_SPI2_CORE_VERSION_MAJOR).1
+AT_SPI2_CORE_VERSION = $(AT_SPI2_CORE_VERSION_MAJOR).2
 AT_SPI2_CORE_SOURCE = at-spi2-core-$(AT_SPI2_CORE_VERSION).tar.xz
 AT_SPI2_CORE_SITE = https://download.gnome.org/sources/at-spi2-core/$(AT_SPI2_CORE_VERSION_MAJOR)
 AT_SPI2_CORE_LICENSE = LGPL-2.1+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
