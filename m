Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B610AC4332F
	for <buildroot@archiver.kernel.org>; Sun, 11 Dec 2022 16:03:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 11C5281767;
	Sun, 11 Dec 2022 16:03:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 11C5281767
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zmITRQbkYu-0; Sun, 11 Dec 2022 16:03:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3301781779;
	Sun, 11 Dec 2022 16:03:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3301781779
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4171A1BF860
 for <buildroot@lists.busybox.net>; Sun, 11 Dec 2022 16:03:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1D34C403A9
 for <buildroot@lists.busybox.net>; Sun, 11 Dec 2022 16:03:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1D34C403A9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id v_X3Ia2NueNK for <buildroot@lists.busybox.net>;
 Sun, 11 Dec 2022 16:03:23 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F2815400A6
Received: from mailout08.t-online.de (mailout08.t-online.de [194.25.134.20])
 by smtp2.osuosl.org (Postfix) with ESMTPS id F2815400A6
 for <buildroot@buildroot.org>; Sun, 11 Dec 2022 16:03:22 +0000 (UTC)
Received: from fwd76.dcpf.telekom.de (fwd76.aul.t-online.de [10.223.144.102])
 by mailout08.t-online.de (Postfix) with SMTP id 07E162C07E
 for <buildroot@buildroot.org>; Sun, 11 Dec 2022 17:03:21 +0100 (CET)
Received: from fli4l.lan.fli4l ([79.214.203.244]) by fwd76.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1p4OnP-1TSxcI0; Sun, 11 Dec 2022 17:03:19 +0100
Received: from bruckner.lan.fli4l ([192.168.1.1]:56504)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd.kuhls@t-online.de>) id 1p4OnP-0008VD-26
 for buildroot@buildroot.org; Sun, 11 Dec 2022 17:03:19 +0100
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Sun, 11 Dec 2022 17:03:19 +0100
Message-Id: <20221211160319.3470254-5-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221211160319.3470254-1-bernd.kuhls@t-online.de>
References: <20221211160319.3470254-1-bernd.kuhls@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1670774599-EEFF2A26-56FC63BE/0/0 CLEAN NORMAL
X-TOI-MSGID: 93329dd1-3f85-460f-9ea1-0e8f9f6b8195
Subject: [Buildroot] [PATCH 4/4] package/x11r7/xdriver_xf86-video-voodoo:
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://lists.x.org/archives/xorg-announce/2022-December/003298.html

Added hash file, removed autoreconf.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 .../xdriver_xf86-video-voodoo.hash                          | 5 +++++
 .../xdriver_xf86-video-voodoo/xdriver_xf86-video-voodoo.mk  | 6 +++---
 2 files changed, 8 insertions(+), 3 deletions(-)
 create mode 100644 package/x11r7/xdriver_xf86-video-voodoo/xdriver_xf86-video-voodoo.hash

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
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
