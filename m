Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76166CAC587
	for <buildroot@archiver.kernel.org>; Sun, 14 Sep 2025 20:39:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1927541830;
	Sun, 14 Sep 2025 20:39:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xJncIfbd8TO7; Sun, 14 Sep 2025 20:39:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 291884178F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 291884178F;
	Sun, 14 Sep 2025 20:39:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id E325E92E
 for <buildroot@buildroot.org>; Sun, 14 Sep 2025 20:39:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C88286F682
 for <buildroot@buildroot.org>; Sun, 14 Sep 2025 20:39:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Jfoz2zi6ECC7 for <buildroot@buildroot.org>;
 Sun, 14 Sep 2025 20:39:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 074376F5F4
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 074376F5F4
 for <buildroot@buildroot.org>; Sun, 14 Sep 2025 20:39:44 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E91EC843BA; Sun, 14 Sep 2025 20:39:43 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 14 Sep 2025 22:34:19 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9fd06f212a9488484b93be511b7c6fa42b2f8adb
X-Git-Newrev: 171bd290053a061ae11c7af18444a5d30105d058
X-Patchwork-Hint: ignore
Message-Id: <20250914203943.E91EC843BA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/wayland-protocols: bump to 1.45
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

commit: https://git.buildroot.net/buildroot/commit/?id=171bd290053a061ae11c7af18444a5d30105d058
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

News:
 - 1.43: http://lists.freedesktop.org/archives/wayland-devel/2025-April/044134.html
 - 1.44: http://lists.freedesktop.org/archives/wayland-devel/2025-April/044161.html
 - 1.45: https://lore.freedesktop.org/wayland-devel/aEw0AP7h6T8l11ug@gmail.com/T/#u

Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/wayland-protocols/wayland-protocols.hash | 6 +++---
 package/wayland-protocols/wayland-protocols.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/wayland-protocols/wayland-protocols.hash b/package/wayland-protocols/wayland-protocols.hash
index c6fca6cd25..f35c054dff 100644
--- a/package/wayland-protocols/wayland-protocols.hash
+++ b/package/wayland-protocols/wayland-protocols.hash
@@ -1,4 +1,4 @@
-# From https://lists.freedesktop.org/archives/wayland-devel/2025-March/044027.html
-sha256  23ba80d410d1200a86fe29592c19766eae8f1c350b67289999e9e7ea12d9f7aa  wayland-protocols-1.42.tar.xz
-sha512  ce85fecbe886264eaeb34c7992d4e493295f57f6213d5a2ec04b3471daee04a4225b1a7e77a27ccf39306074780553ec1383c55af30cc2c78942b40cc5777c1b  wayland-protocols-1.42.tar.xz
+# From https://lore.freedesktop.org/wayland-devel/aEw0AP7h6T8l11ug@gmail.com/T/#u
+sha256  4d2b2a9e3e099d017dc8107bf1c334d27bb87d9e4aff19a0c8d856d17cd41ef0  wayland-protocols-1.45.tar.xz
+sha512  d0557a75eb486fb824f182648bec346e270cb1ada8727613377ab95b0ccb595c516de242f486110c88b7009e98c87b071bf5b598f84466e5624aa1d81f19e195  wayland-protocols-1.45.tar.xz
 sha256  f1a2b233e8a9a71c40f4aa885be08a0842ac85bb8588703c1dd7e6e6502e3124  COPYING
diff --git a/package/wayland-protocols/wayland-protocols.mk b/package/wayland-protocols/wayland-protocols.mk
index b7c5b118e6..0cb23f8438 100644
--- a/package/wayland-protocols/wayland-protocols.mk
+++ b/package/wayland-protocols/wayland-protocols.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WAYLAND_PROTOCOLS_VERSION = 1.42
+WAYLAND_PROTOCOLS_VERSION = 1.45
 WAYLAND_PROTOCOLS_SITE = https://gitlab.freedesktop.org/wayland/wayland-protocols/-/releases/$(WAYLAND_PROTOCOLS_VERSION)/downloads
 WAYLAND_PROTOCOLS_SOURCE = wayland-protocols-$(WAYLAND_PROTOCOLS_VERSION).tar.xz
 WAYLAND_PROTOCOLS_LICENSE = MIT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
