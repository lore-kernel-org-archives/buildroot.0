Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CBDBC54E58
	for <buildroot@archiver.kernel.org>; Fri, 15 Mar 2024 19:24:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DC01060903;
	Fri, 15 Mar 2024 19:24:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id usU9neJY5JgD; Fri, 15 Mar 2024 19:24:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E0B2E60FC1
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E0B2E60FC1;
	Fri, 15 Mar 2024 19:24:01 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B3C0E1BF307
 for <buildroot@lists.busybox.net>; Fri, 15 Mar 2024 19:23:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A79E241939
 for <buildroot@lists.busybox.net>; Fri, 15 Mar 2024 19:23:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nwvM4AO_GG9b for <buildroot@lists.busybox.net>;
 Fri, 15 Mar 2024 19:23:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CA16B4042B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id CA16B4042B
 for <buildroot@buildroot.org>; Fri, 15 Mar 2024 19:23:41 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AF11288383; Fri, 15 Mar 2024 19:23:41 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 15 Mar 2024 20:17:15 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 44f3c736a800d2afd154e5e476cdc60ae30a0108
X-Git-Newrev: 136d4dfbe6126b5ed20237c571f599dfc163d110
X-Patchwork-Hint: ignore
Message-Id: <20240315192341.AF11288383@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libpciaccess: bump to version 0.18
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=136d4dfbe6126b5ed20237c571f599dfc163d110
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Update hash of COPYING (update in year with:
  https://gitlab.freedesktop.org/xorg/lib/libpciaccess/-/commit/cde74b51014053175497ac75cbaea10d6184ab57)
- Switch to meson-package

https://lists.x.org/archives/xorg-announce/2024-February/003453.html

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/libpciaccess/libpciaccess.hash | 6 +++---
 package/libpciaccess/libpciaccess.mk   | 8 ++++----
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/package/libpciaccess/libpciaccess.hash b/package/libpciaccess/libpciaccess.hash
index 27ec59a452..4662314509 100644
--- a/package/libpciaccess/libpciaccess.hash
+++ b/package/libpciaccess/libpciaccess.hash
@@ -1,4 +1,4 @@
-# From https://lists.x.org/archives/xorg-announce/2022-October/003226.html
-sha512  8484605c66ef18c8d8a3e029a6d33e26fcaa450c1263790d89ac8b0a160ffb2dfceaa6140ac9ad7d8087283ecbec8ac801f757e44890d547c3cbecd2c922ca47  libpciaccess-0.17.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2024-February/003453.html
+sha512  54dff9a493344586d072edf8c8eb8f7960c7dfd64aa5c51a8ec8d4e341f703fd39eb606ee41c4fdd9d5aad3372b7efe6e0fe96eadc575ea91de276320ebc3fbd  libpciaccess-0.18.tar.xz
 # Hash for license file:
-sha256  47012fd746980d1712ac4f3841ab6164bda1d2b84880760e45dbe1e1dc07f608  COPYING
+sha256  f33f360f8905940dac01aa21597fe8a6727ca6f4ffa43b380e2116fd0666aa8a  COPYING
diff --git a/package/libpciaccess/libpciaccess.mk b/package/libpciaccess/libpciaccess.mk
index 525a3bcd02..04f3e2083b 100644
--- a/package/libpciaccess/libpciaccess.mk
+++ b/package/libpciaccess/libpciaccess.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBPCIACCESS_VERSION = 0.17
+LIBPCIACCESS_VERSION = 0.18
 LIBPCIACCESS_SOURCE = libpciaccess-$(LIBPCIACCESS_VERSION).tar.xz
 LIBPCIACCESS_SITE = http://xorg.freedesktop.org/releases/individual/lib
 LIBPCIACCESS_LICENSE = MIT
@@ -13,10 +13,10 @@ LIBPCIACCESS_INSTALL_STAGING = YES
 LIBPCIACCESS_DEPENDENCIES = host-pkgconf
 
 ifeq ($(BR2_PACKAGE_ZLIB),y)
-LIBPCIACCESS_CONF_OPTS += --with-zlib
+LIBPCIACCESS_CONF_OPTS += -Dzlib=enabled
 LIBPCIACCESS_DEPENDENCIES += zlib
 else
-LIBPCIACCESS_CONF_OPTS += --without-zlib
+LIBPCIACCESS_CONF_OPTS += -Dzlib=disabled
 endif
 
-$(eval $(autotools-package))
+$(eval $(meson-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
