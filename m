Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3530C433F5
	for <buildroot@archiver.kernel.org>; Sat, 12 Mar 2022 20:33:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AE6EC8129B;
	Sat, 12 Mar 2022 20:33:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UsglIdWLlPk3; Sat, 12 Mar 2022 20:33:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E3A7B812CA;
	Sat, 12 Mar 2022 20:33:45 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id CA4931BF3DD
 for <buildroot@lists.busybox.net>; Sat, 12 Mar 2022 20:33:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B9C7340442
 for <buildroot@lists.busybox.net>; Sat, 12 Mar 2022 20:33:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VOICpEzT7hh3 for <buildroot@lists.busybox.net>;
 Sat, 12 Mar 2022 20:33:43 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id F1CCC403EC
 for <buildroot@buildroot.org>; Sat, 12 Mar 2022 20:33:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id E350283AA4; Sat, 12 Mar 2022 20:25:07 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 12 Mar 2022 21:33:35 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7e8635ba94bfb029584171a52d135db145ac7bf1
X-Git-Newrev: 4550054d2ff6e086711c7a258f6596a0ef8a9f99
X-Patchwork-Hint: ignore
Message-Id: <20220312202507.E350283AA4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pipewire: bump to version 0.3.48
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

commit: https://git.buildroot.net/buildroot/commit/?id=4550054d2ff6e086711c7a258f6596a0ef8a9f99
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Set new x11-xfixes meson config option.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/pipewire/pipewire.hash | 2 +-
 package/pipewire/pipewire.mk   | 9 ++++++++-
 2 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/package/pipewire/pipewire.hash b/package/pipewire/pipewire.hash
index a9d59663ae..e6fad56698 100644
--- a/package/pipewire/pipewire.hash
+++ b/package/pipewire/pipewire.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  76291373f7ab271664df5b6a22b678ad57e485e25c73ee9c78e049a67b7886d2  pipewire-0.3.45.tar.bz2
+sha256  68bbf83b4c12bbcaef5d4bfb0dda86177583cf0abe0026efcfedd837b2e4926e  pipewire-0.3.48.tar.bz2
 sha256  8909c319a7e27dbb33a15b9035f89ab3b7b2f6a12f8bcddc755206a8db1ada44  COPYING
 sha256  be4be5d77424833edf31f53fc1f1cecb6996b9e2d747d9e6fb8f878362ebc92b  LICENSE
diff --git a/package/pipewire/pipewire.mk b/package/pipewire/pipewire.mk
index fc521c86ac..80246cc8d0 100644
--- a/package/pipewire/pipewire.mk
+++ b/package/pipewire/pipewire.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PIPEWIRE_VERSION = 0.3.45
+PIPEWIRE_VERSION = 0.3.48
 PIPEWIRE_SOURCE = pipewire-$(PIPEWIRE_VERSION).tar.bz2
 PIPEWIRE_SITE = https://gitlab.freedesktop.org/pipewire/pipewire/-/archive/$(PIPEWIRE_VERSION)
 PIPEWIRE_LICENSE = MIT, LGPL-2.1+ (libspa-alsa), GPL-2.0 (libjackserver)
@@ -136,6 +136,13 @@ else
 PIPEWIRE_CONF_OPTS += -Dx11=disabled
 endif
 
+ifeq ($(BR2_PACKAGE_XLIB_LIBXFIXES),y)
+PIPEWIRE_CONF_OPTS += -Dx11-xfixes=enabled
+PIPEWIRE_DEPENDENCIES += xlib_libXfixes
+else
+PIPEWIRE_CONF_OPTS += -Dx11-xfixes=disabled
+endif
+
 ifeq ($(BR2_PACKAGE_LIBUSB),y)
 PIPEWIRE_CONF_OPTS += -Dlibusb=enabled
 PIPEWIRE_DEPENDENCIES += libusb
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
