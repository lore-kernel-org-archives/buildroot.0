Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14364C636D7
	for <buildroot@archiver.kernel.org>; Wed,  8 Feb 2023 10:58:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9DACB610CE;
	Wed,  8 Feb 2023 10:58:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9DACB610CE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qwKU7hlOotiK; Wed,  8 Feb 2023 10:58:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DD79D610C3;
	Wed,  8 Feb 2023 10:58:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DD79D610C3
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4CBEF1BF8B4
 for <buildroot@lists.busybox.net>; Wed,  8 Feb 2023 10:57:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 243B3610C4
 for <buildroot@lists.busybox.net>; Wed,  8 Feb 2023 10:57:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 243B3610C4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wDRXiQP7xdVH for <buildroot@lists.busybox.net>;
 Wed,  8 Feb 2023 10:57:49 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 554B3610C3
 for <buildroot@buildroot.org>; Wed,  8 Feb 2023 10:57:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 554B3610C3
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 43575845F3; Wed,  8 Feb 2023 10:57:49 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 8 Feb 2023 11:55:07 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5ee78c0a8b7854b4e8b260e1791909b8591ae5ed
X-Git-Newrev: 247e2d0eb1e60f483044d58bed58c5ed321528f7
X-Patchwork-Hint: ignore
Message-Id: <20230208105749.43575845F3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pipewire: bump to version 0.3.65
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

commit: https://git.buildroot.net/buildroot/commit/?id=247e2d0eb1e60f483044d58bed58c5ed321528f7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add support for new compress-offload and pw-cat-ffmpeg features.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/pipewire/pipewire.hash |  2 +-
 package/pipewire/pipewire.mk   | 13 ++++++++++---
 2 files changed, 11 insertions(+), 4 deletions(-)

diff --git a/package/pipewire/pipewire.hash b/package/pipewire/pipewire.hash
index d8b5b0cc86..0e027aaa55 100644
--- a/package/pipewire/pipewire.hash
+++ b/package/pipewire/pipewire.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  24b218cf3bb1fb279c8c489c14cc9ae483e1da7b4c8215b2ee5a5ee831bae94f  pipewire-0.3.62.tar.bz2
+sha256  c78c95cdff2774418f0a9468e94a1b2800761d322f13104df6501e1a0dc92558  pipewire-0.3.65.tar.bz2
 sha256  8909c319a7e27dbb33a15b9035f89ab3b7b2f6a12f8bcddc755206a8db1ada44  COPYING
 sha256  be4be5d77424833edf31f53fc1f1cecb6996b9e2d747d9e6fb8f878362ebc92b  LICENSE
diff --git a/package/pipewire/pipewire.mk b/package/pipewire/pipewire.mk
index 6bcda0a93d..976d7783b9 100644
--- a/package/pipewire/pipewire.mk
+++ b/package/pipewire/pipewire.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PIPEWIRE_VERSION = 0.3.62
+PIPEWIRE_VERSION = 0.3.65
 PIPEWIRE_SOURCE = pipewire-$(PIPEWIRE_VERSION).tar.bz2
 PIPEWIRE_SITE = https://gitlab.freedesktop.org/pipewire/pipewire/-/archive/$(PIPEWIRE_VERSION)
 PIPEWIRE_LICENSE = MIT, LGPL-2.1+ (libspa-alsa), GPL-2.0 (libjackserver)
@@ -122,10 +122,10 @@ PIPEWIRE_CONF_OPTS += -Dbluez5=disabled -Dbluez5-codec-opus=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_FFMPEG),y)
-PIPEWIRE_CONF_OPTS += -Dffmpeg=enabled
+PIPEWIRE_CONF_OPTS += -Dffmpeg=enabled -Dpw-cat-ffmpeg=enabled
 PIPEWIRE_DEPENDENCIES += ffmpeg
 else
-PIPEWIRE_CONF_OPTS += -Dffmpeg=disabled
+PIPEWIRE_CONF_OPTS += -Dffmpeg=disabled -Dpw-cat-ffmpeg=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_NCURSES_WCHAR),y)
@@ -215,6 +215,13 @@ else
 PIPEWIRE_CONF_OPTS += -Dsdl2=disabled
 endif
 
+ifeq ($(BR2_PACKAGE_TINYCOMPRESS),y)
+PIPEWIRE_CONF_OPTS += -Dcompress-offload=enabled
+PIPEWIRE_DEPENDENCIES += tinycompress
+else
+PIPEWIRE_CONF_OPTS += -Dcompress-offload=disabled
+endif
+
 ifeq ($(WEBRTC_AUDIO_PROCESSING),y)
 PIPEWIRE_CONF_OPTS += -Decho-cancel-webrtc=enabled
 PIPEWIRE_DEPENDENCIES += webrtc-audio-processing
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
