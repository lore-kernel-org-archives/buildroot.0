Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04226C433EF
	for <buildroot@archiver.kernel.org>; Thu,  7 Jul 2022 13:19:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id ADBBD6120E;
	Thu,  7 Jul 2022 13:19:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ADBBD6120E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kH7OGX86jVAS; Thu,  7 Jul 2022 13:19:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1D3DC6120A;
	Thu,  7 Jul 2022 13:19:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1D3DC6120A
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D21581BF40E
 for <buildroot@lists.busybox.net>; Thu,  7 Jul 2022 13:19:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AD6CC84070
 for <buildroot@lists.busybox.net>; Thu,  7 Jul 2022 13:19:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AD6CC84070
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zkJnuMG_JvVL for <buildroot@lists.busybox.net>;
 Thu,  7 Jul 2022 13:19:04 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id D4BB883F8D
 for <buildroot@buildroot.org>; Thu,  7 Jul 2022 13:19:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D4BB883F8D
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 7AE5B835CD; Thu,  7 Jul 2022 13:06:04 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 7 Jul 2022 15:18:37 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e4ff284ba88ea0cb41c190165cb42a174c5faa23
X-Git-Newrev: b3990050c8ba8161689aca7a21ce1600291c6de3
X-Patchwork-Hint: ignore
Message-Id: <20220707130604.7AE5B835CD@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/x11r7/xkeyboard-config: bump
 version to 2.36
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

commit: https://git.buildroot.net/buildroot/commit/?id=b3990050c8ba8161689aca7a21ce1600291c6de3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes: https://cgit.freedesktop.org/xkeyboard-config/tree/NEWS

Upstream switched to meson.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/x11r7/xkeyboard-config/xkeyboard-config.hash | 2 +-
 package/x11r7/xkeyboard-config/xkeyboard-config.mk   | 8 +++-----
 2 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/package/x11r7/xkeyboard-config/xkeyboard-config.hash b/package/x11r7/xkeyboard-config/xkeyboard-config.hash
index a5ae7a7039..e7e3765e59 100644
--- a/package/x11r7/xkeyboard-config/xkeyboard-config.hash
+++ b/package/x11r7/xkeyboard-config/xkeyboard-config.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  b321d27686ee7e6610ffe7b56e28d5bbf60625a1f595124cd320c0caa717b8ce  xkeyboard-config-2.34.tar.bz2
+sha256  1f1bb1292a161d520a3485d378609277d108cd07cde0327c16811ff54c3e1595  xkeyboard-config-2.36.tar.xz
 sha256  6ca90f4b67dced4062894d6d77f4cc39343df9e359fc12f5e5d3c89ef2a3ef6d  COPYING
diff --git a/package/x11r7/xkeyboard-config/xkeyboard-config.mk b/package/x11r7/xkeyboard-config/xkeyboard-config.mk
index fe46dae3b7..0f45d9f74a 100644
--- a/package/x11r7/xkeyboard-config/xkeyboard-config.mk
+++ b/package/x11r7/xkeyboard-config/xkeyboard-config.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-XKEYBOARD_CONFIG_VERSION = 2.34
-XKEYBOARD_CONFIG_SOURCE = xkeyboard-config-$(XKEYBOARD_CONFIG_VERSION).tar.bz2
+XKEYBOARD_CONFIG_VERSION = 2.36
+XKEYBOARD_CONFIG_SOURCE = xkeyboard-config-$(XKEYBOARD_CONFIG_VERSION).tar.xz
 XKEYBOARD_CONFIG_SITE = https://www.x.org/releases/individual/data/xkeyboard-config
 XKEYBOARD_CONFIG_LICENSE = MIT
 XKEYBOARD_CONFIG_LICENSE_FILES = COPYING
@@ -18,6 +18,4 @@ XKEYBOARD_CONFIG_DEPENDENCIES = \
 # xkeyboard-config.pc
 XKEYBOARD_CONFIG_INSTALL_STAGING = YES
 
-XKEYBOARD_CONFIG_CONF_OPTS = --disable-runtime-deps
-
-$(eval $(autotools-package))
+$(eval $(meson-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
