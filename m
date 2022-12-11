Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDC41C4332F
	for <buildroot@archiver.kernel.org>; Sun, 11 Dec 2022 16:20:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 775B94047B;
	Sun, 11 Dec 2022 16:20:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 775B94047B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dBZVjmquIcRd; Sun, 11 Dec 2022 16:20:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id AB1104026A;
	Sun, 11 Dec 2022 16:20:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AB1104026A
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A27B11BF2F2
 for <buildroot@lists.busybox.net>; Sun, 11 Dec 2022 16:20:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7CC07606AA
 for <buildroot@lists.busybox.net>; Sun, 11 Dec 2022 16:20:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7CC07606AA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id z0_0EV5CGh0W for <buildroot@lists.busybox.net>;
 Sun, 11 Dec 2022 16:20:16 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id B60D160B6C
 for <buildroot@buildroot.org>; Sun, 11 Dec 2022 16:20:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B60D160B6C
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A1D208644D; Sun, 11 Dec 2022 16:20:16 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 11 Dec 2022 17:17:51 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8f792825039878323d996d973f0bfd588991fc5c
X-Git-Newrev: d5a0c2b779afa886cd1d79dc242f834ed0b87644
X-Patchwork-Hint: ignore
Message-Id: <20221211162016.A1D208644D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/x11r7/xdriver_xf86-video-voodoo:
 bump version to 1.2.6
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

commit: https://git.buildroot.net/buildroot/commit/?id=d5a0c2b779afa886cd1d79dc242f834ed0b87644
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://lists.x.org/archives/xorg-announce/2022-December/003298.html

Added hash file, removed autoreconf.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 .../x11r7/xdriver_xf86-video-voodoo/xdriver_xf86-video-voodoo.hash  | 5 +++++
 .../x11r7/xdriver_xf86-video-voodoo/xdriver_xf86-video-voodoo.mk    | 6 +++---
 2 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/package/x11r7/xdriver_xf86-video-voodoo/xdriver_xf86-video-voodoo.hash b/package/x11r7/xdriver_xf86-video-voodoo/xdriver_xf86-video-voodoo.hash
new file mode 100644
index 0000000000..1220ec6c2f
--- /dev/null
+++ b/package/x11r7/xdriver_xf86-video-voodoo/xdriver_xf86-video-voodoo.hash
@@ -0,0 +1,5 @@
+# From https://lists.x.org/archives/xorg-announce/2022-December/003298.html
+sha256  622973f03ac0bd0c854794ebeac268f15f4f831ec0dbe36e6cfa2b65042af602  xf86-video-voodoo-1.2.6.tar.xz
+sha512  c889d79044438d6b15efceda07f63874063a2faa24a86d048e62c8ad1364efdfec04ff7ec662ad0749d2a7263abb14edb74e7d5ebf9a1aa880edb2b341a80a31  xf86-video-voodoo-1.2.6.tar.xz
+# Locally computed
+sha256  59ed98e3f6c6d0358d75183cf18a295d807acf2c3ea489197dd0a287b6e39bf1  COPYING
diff --git a/package/x11r7/xdriver_xf86-video-voodoo/xdriver_xf86-video-voodoo.mk b/package/x11r7/xdriver_xf86-video-voodoo/xdriver_xf86-video-voodoo.mk
index d6deaa7974..33264a0bb7 100644
--- a/package/x11r7/xdriver_xf86-video-voodoo/xdriver_xf86-video-voodoo.mk
+++ b/package/x11r7/xdriver_xf86-video-voodoo/xdriver_xf86-video-voodoo.mk
@@ -4,11 +4,11 @@
 #
 ################################################################################
 
-XDRIVER_XF86_VIDEO_VOODOO_VERSION = 9172ae566a0e85313fc80ab62b4455393eefe593
-XDRIVER_XF86_VIDEO_VOODOO_SITE = git://anongit.freedesktop.org/xorg/driver/xf86-video-voodoo
+XDRIVER_XF86_VIDEO_VOODOO_VERSION = 1.2.6
+XDRIVER_XF86_VIDEO_VOODOO_SOURCE = xf86-video-voodoo-$(XDRIVER_XF86_VIDEO_VOODOO_VERSION).tar.xz
+XDRIVER_XF86_VIDEO_VOODOO_SITE = https://xorg.freedesktop.org/archive/individual/driver
 XDRIVER_XF86_VIDEO_VOODOO_LICENSE = MIT
 XDRIVER_XF86_VIDEO_VOODOO_LICENSE_FILES = COPYING
-XDRIVER_XF86_VIDEO_VOODOO_AUTORECONF = YES
 XDRIVER_XF86_VIDEO_VOODOO_DEPENDENCIES = xserver_xorg-server xorgproto
 
 $(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
