Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D69AAC54EAA
	for <buildroot@archiver.kernel.org>; Fri, 27 Jan 2023 19:21:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6343B41699;
	Fri, 27 Jan 2023 19:21:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6343B41699
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8iNzd002B3st; Fri, 27 Jan 2023 19:21:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 93C344159A;
	Fri, 27 Jan 2023 19:21:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 93C344159A
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 62F8C1BF2FD
 for <buildroot@lists.busybox.net>; Fri, 27 Jan 2023 19:21:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 394E841CF0
 for <buildroot@lists.busybox.net>; Fri, 27 Jan 2023 19:21:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 394E841CF0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bayXJ6nE_Sni for <buildroot@lists.busybox.net>;
 Fri, 27 Jan 2023 19:21:12 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 16D1D41CE5
Received: from mailout08.t-online.de (mailout08.t-online.de [194.25.134.20])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 16D1D41CE5
 for <buildroot@buildroot.org>; Fri, 27 Jan 2023 19:21:12 +0000 (UTC)
Received: from fwd78.dcpf.telekom.de (fwd78.aul.t-online.de [10.223.144.104])
 by mailout08.t-online.de (Postfix) with SMTP id 3EA582BA9C
 for <buildroot@buildroot.org>; Fri, 27 Jan 2023 20:21:09 +0100 (CET)
Received: from fli4l.lan.fli4l ([84.161.176.31]) by fwd78.t-online.de
 with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
 esmtp id 1pLUHd-4OzAFV0; Fri, 27 Jan 2023 20:21:09 +0100
Received: from bruckner.lan.fli4l ([192.168.1.1]:36842)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd.kuhls@t-online.de>) id 1pLUHc-00063e-2K
 for buildroot@buildroot.org; Fri, 27 Jan 2023 20:21:08 +0100
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Fri, 27 Jan 2023 20:21:08 +0100
Message-Id: <20230127192108.341891-2-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230127192108.341891-1-bernd.kuhls@t-online.de>
References: <20230127192108.341891-1-bernd.kuhls@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1674847269-DD34B4E4-4DBB231D/0/0 CLEAN NORMAL
X-TOI-MSGID: 22d252b3-0288-4dd7-b0af-0f6ded52a082
Subject: [Buildroot] [PATCH 2/2] package/x11r7/xdriver_xf86-video-vmware:
 bump version to 13.4.0
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

Release notes:
https://lists.x.org/archives/xorg-announce/2023-January/003315.html

Switched tarball to xz and _SITE to https.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 .../xdriver_xf86-video-vmware.hash                        | 8 +++-----
 .../xdriver_xf86-video-vmware.mk                          | 6 +++---
 2 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/package/x11r7/xdriver_xf86-video-vmware/xdriver_xf86-video-vmware.hash b/package/x11r7/xdriver_xf86-video-vmware/xdriver_xf86-video-vmware.hash
index fc69e01ffe..a6415703be 100644
--- a/package/x11r7/xdriver_xf86-video-vmware/xdriver_xf86-video-vmware.hash
+++ b/package/x11r7/xdriver_xf86-video-vmware/xdriver_xf86-video-vmware.hash
@@ -1,7 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2018-May/002895.html
-md5  08d66d062055080ff699ab4869726ea2  xf86-video-vmware-13.3.0.tar.bz2
-sha1  f01335fe6bdb507e749571bfcd69163aed97312a  xf86-video-vmware-13.3.0.tar.bz2
-sha256  47971924659e51666a757269ad941a059ef5afe7a47b5101c174a6022ac4066c  xf86-video-vmware-13.3.0.tar.bz2
-sha512  c318de893cae7b2b11e11c1b389ee47478b7c8d1f52c27099dbe453efec28f3e9da449217307a8c2251999eada66312f766996be1a6ead413b8b6dedc42c68ca  xf86-video-vmware-13.3.0.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2023-January/003315.html
+sha256  aed31ee5ed5ecc6e2226705383e7ad06f7602c1376a295305f376b17af3eb81a  xf86-video-vmware-13.4.0.tar.xz
+sha512  7cacde21a490501dd9c2e9121040274c1f6ef64e6dc0ef49946b400f6297fab73a6e9548e45fe8930cee9028e65e45aaff9ba489dd69ac75a5133114726bf55d  xf86-video-vmware-13.4.0.tar.xz
 # Locally computed
 sha256  7e59b8ca2a161855a60561f27ada8dfdbb678733eacdb23423fff6d21f9ad43b  COPYING
diff --git a/package/x11r7/xdriver_xf86-video-vmware/xdriver_xf86-video-vmware.mk b/package/x11r7/xdriver_xf86-video-vmware/xdriver_xf86-video-vmware.mk
index 5f0cb77bf8..37c2d67c19 100644
--- a/package/x11r7/xdriver_xf86-video-vmware/xdriver_xf86-video-vmware.mk
+++ b/package/x11r7/xdriver_xf86-video-vmware/xdriver_xf86-video-vmware.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-XDRIVER_XF86_VIDEO_VMWARE_VERSION = 13.3.0
-XDRIVER_XF86_VIDEO_VMWARE_SOURCE = xf86-video-vmware-$(XDRIVER_XF86_VIDEO_VMWARE_VERSION).tar.bz2
-XDRIVER_XF86_VIDEO_VMWARE_SITE = http://xorg.freedesktop.org/releases/individual/driver
+XDRIVER_XF86_VIDEO_VMWARE_VERSION = 13.4.0
+XDRIVER_XF86_VIDEO_VMWARE_SOURCE = xf86-video-vmware-$(XDRIVER_XF86_VIDEO_VMWARE_VERSION).tar.xz
+XDRIVER_XF86_VIDEO_VMWARE_SITE = https://xorg.freedesktop.org/archive/individual/driver
 XDRIVER_XF86_VIDEO_VMWARE_LICENSE = MIT
 XDRIVER_XF86_VIDEO_VMWARE_LICENSE_FILES = COPYING
 XDRIVER_XF86_VIDEO_VMWARE_DEPENDENCIES = mesa3d xserver_xorg-server xorgproto
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
