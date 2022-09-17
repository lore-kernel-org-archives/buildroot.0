Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B29AAECAAA1
	for <buildroot@archiver.kernel.org>; Sat, 17 Sep 2022 16:13:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 58C654057F;
	Sat, 17 Sep 2022 16:13:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 58C654057F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5bKrCg5Tg0H9; Sat, 17 Sep 2022 16:13:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 855CD4014A;
	Sat, 17 Sep 2022 16:13:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 855CD4014A
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A43491BF48D
 for <buildroot@lists.busybox.net>; Sat, 17 Sep 2022 16:13:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7FB254014A
 for <buildroot@lists.busybox.net>; Sat, 17 Sep 2022 16:13:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7FB254014A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lt6p0jKiUU-N for <buildroot@lists.busybox.net>;
 Sat, 17 Sep 2022 16:13:04 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id A16E5400E7
 for <buildroot@buildroot.org>; Sat, 17 Sep 2022 16:13:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A16E5400E7
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9103F845A3; Sat, 17 Sep 2022 16:13:04 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sat, 17 Sep 2022 18:12:50 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f640de44fac0c31e26e23a35b39d2b49b2060fbd
X-Git-Newrev: 3a5389f579de7938f74babd18edd80a272e65d3a
X-Patchwork-Hint: ignore
Message-Id: <20220917161304.9103F845A3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pipewire: bump to version 0.3.57
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

commit: https://git.buildroot.net/buildroot/commit/?id=3a5389f579de7938f74babd18edd80a272e65d3a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add support for new bluez5-codec-opus codec feature.

Disable new unsupported flatpak feature.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/pipewire/pipewire.hash |  2 +-
 package/pipewire/pipewire.mk   | 13 ++++++++++---
 2 files changed, 11 insertions(+), 4 deletions(-)

diff --git a/package/pipewire/pipewire.hash b/package/pipewire/pipewire.hash
index 905608c3bf..21c3119945 100644
--- a/package/pipewire/pipewire.hash
+++ b/package/pipewire/pipewire.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  bb4662ee4f4036586905268354329228d763fc08d99ca8f0e8ec7e002e46b88d  pipewire-0.3.56.tar.bz2
+sha256  da1fd2e6ee088aa22f5398caca76ff879e398ec9216fb6b9400c1177b8c68115  pipewire-0.3.57.tar.bz2
 sha256  8909c319a7e27dbb33a15b9035f89ab3b7b2f6a12f8bcddc755206a8db1ada44  COPYING
 sha256  be4be5d77424833edf31f53fc1f1cecb6996b9e2d747d9e6fb8f878362ebc92b  LICENSE
diff --git a/package/pipewire/pipewire.mk b/package/pipewire/pipewire.mk
index 790d9c8d9f..1aad4a3c5c 100644
--- a/package/pipewire/pipewire.mk
+++ b/package/pipewire/pipewire.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PIPEWIRE_VERSION = 0.3.56
+PIPEWIRE_VERSION = 0.3.57
 PIPEWIRE_SOURCE = pipewire-$(PIPEWIRE_VERSION).tar.bz2
 PIPEWIRE_SITE = https://gitlab.freedesktop.org/pipewire/pipewire/-/archive/$(PIPEWIRE_VERSION)
 PIPEWIRE_LICENSE = MIT, LGPL-2.1+ (libspa-alsa), GPL-2.0 (libjackserver)
@@ -32,7 +32,8 @@ PIPEWIRE_CONF_OPTS += \
 	-Dsession-managers=[] \
 	-Dlegacy-rtkit=false \
 	-Davb=disabled \
-	-Dlibcanberra=disabled
+	-Dlibcanberra=disabled \
+	-Dflatpak=disabled
 
 ifeq ($(BR2_PACKAGE_DBUS),y)
 PIPEWIRE_CONF_OPTS += -Ddbus=enabled
@@ -103,8 +104,14 @@ endif
 ifeq ($(BR2_PACKAGE_BLUEZ5_UTILS)$(BR2_PACKAGE_SBC),yy)
 PIPEWIRE_CONF_OPTS += -Dbluez5=enabled
 PIPEWIRE_DEPENDENCIES += bluez5_utils sbc
+ifeq ($(BR2_PACKAGE_OPUS),y)
+PIPEWIRE_CONF_OPTS += -Dbluez5-codec-opus=enabled
+PIPEWIRE_DEPENDENCIES += opus
 else
-PIPEWIRE_CONF_OPTS += -Dbluez5=disabled
+PIPEWIRE_CONF_OPTS += -Dbluez5-codec-opus=disabled
+endif
+else
+PIPEWIRE_CONF_OPTS += -Dbluez5=disabled -Dbluez5-codec-opus=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_FFMPEG),y)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
