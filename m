Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C241C4332F
	for <buildroot@archiver.kernel.org>; Sun, 11 Dec 2022 10:42:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 249F4402C8;
	Sun, 11 Dec 2022 10:42:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 249F4402C8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pSuSajjsTZVS; Sun, 11 Dec 2022 10:42:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 32F7A40245;
	Sun, 11 Dec 2022 10:42:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 32F7A40245
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3A98B1BF2A5
 for <buildroot@lists.busybox.net>; Sun, 11 Dec 2022 10:42:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 14E9140245
 for <buildroot@lists.busybox.net>; Sun, 11 Dec 2022 10:42:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 14E9140245
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3O5vdloYG3xa for <buildroot@lists.busybox.net>;
 Sun, 11 Dec 2022 10:42:18 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 124EB4022E
 for <buildroot@buildroot.org>; Sun, 11 Dec 2022 10:42:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 124EB4022E
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 006ED86036; Sun, 11 Dec 2022 10:42:17 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 11 Dec 2022 11:41:09 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 717cf468c4be8669785027f298f077f903214fc7
X-Git-Newrev: 67895bf33c00e07bc0f85311f39eaa237f58bd45
X-Patchwork-Hint: ignore
Message-Id: <20221211104218.006ED86036@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pipewire: bump to version 0.3.62
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

commit: https://git.buildroot.net/buildroot/commit/?id=67895bf33c00e07bc0f85311f39eaa237f58bd45
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add support for new optional gsettings meson config option.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/pipewire/pipewire.hash | 2 +-
 package/pipewire/pipewire.mk   | 9 ++++++++-
 2 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/package/pipewire/pipewire.hash b/package/pipewire/pipewire.hash
index 4585534569..d8b5b0cc86 100644
--- a/package/pipewire/pipewire.hash
+++ b/package/pipewire/pipewire.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  8164eb53c9eafedfa22fe1adc4b8e38f3173c6f33695c735a17ed1a3d43c664e  pipewire-0.3.60.tar.bz2
+sha256  24b218cf3bb1fb279c8c489c14cc9ae483e1da7b4c8215b2ee5a5ee831bae94f  pipewire-0.3.62.tar.bz2
 sha256  8909c319a7e27dbb33a15b9035f89ab3b7b2f6a12f8bcddc755206a8db1ada44  COPYING
 sha256  be4be5d77424833edf31f53fc1f1cecb6996b9e2d747d9e6fb8f878362ebc92b  LICENSE
diff --git a/package/pipewire/pipewire.mk b/package/pipewire/pipewire.mk
index 9fef605878..6bcda0a93d 100644
--- a/package/pipewire/pipewire.mk
+++ b/package/pipewire/pipewire.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PIPEWIRE_VERSION = 0.3.60
+PIPEWIRE_VERSION = 0.3.62
 PIPEWIRE_SOURCE = pipewire-$(PIPEWIRE_VERSION).tar.bz2
 PIPEWIRE_SITE = https://gitlab.freedesktop.org/pipewire/pipewire/-/archive/$(PIPEWIRE_VERSION)
 PIPEWIRE_LICENSE = MIT, LGPL-2.1+ (libspa-alsa), GPL-2.0 (libjackserver)
@@ -166,6 +166,13 @@ else
 PIPEWIRE_CONF_OPTS += -Dx11-xfixes=disabled
 endif
 
+ifeq ($(BR2_PACKAGE_LIBGLIB2),y)
+PIPEWIRE_CONF_OPTS += -Dgsettings=enabled
+PIPEWIRE_DEPENDENCIES += libglib2
+else
+PIPEWIRE_CONF_OPTS += -Dgsettings=disabled
+endif
+
 ifeq ($(BR2_PACKAGE_LIBUSB),y)
 PIPEWIRE_CONF_OPTS += -Dlibusb=enabled
 PIPEWIRE_DEPENDENCIES += libusb
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
