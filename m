Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB82AC4167B
	for <buildroot@archiver.kernel.org>; Sun, 11 Dec 2022 16:04:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6719240550;
	Sun, 11 Dec 2022 16:04:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6719240550
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UklU-r3PoDK9; Sun, 11 Dec 2022 16:04:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8FD0D40549;
	Sun, 11 Dec 2022 16:04:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8FD0D40549
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 558B51BF3D6
 for <buildroot@lists.busybox.net>; Sun, 11 Dec 2022 16:03:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2DF7160BD8
 for <buildroot@lists.busybox.net>; Sun, 11 Dec 2022 16:03:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2DF7160BD8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hXd8Pfx90njc for <buildroot@lists.busybox.net>;
 Sun, 11 Dec 2022 16:03:26 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0934C60BD4
Received: from mailout03.t-online.de (mailout03.t-online.de [194.25.134.81])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0934C60BD4
 for <buildroot@buildroot.org>; Sun, 11 Dec 2022 16:03:25 +0000 (UTC)
Received: from fwd77.dcpf.telekom.de (fwd77.aul.t-online.de [10.223.144.103])
 by mailout03.t-online.de (Postfix) with SMTP id 64A3C16F40
 for <buildroot@buildroot.org>; Sun, 11 Dec 2022 17:03:23 +0100 (CET)
Received: from fli4l.lan.fli4l ([79.214.203.244]) by fwd77.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1p4OnP-2u3jXd0; Sun, 11 Dec 2022 17:03:19 +0100
Received: from bruckner.lan.fli4l ([192.168.1.1]:56504)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd.kuhls@t-online.de>) id 1p4OnP-0008VD-1g
 for buildroot@buildroot.org; Sun, 11 Dec 2022 17:03:19 +0100
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Sun, 11 Dec 2022 17:03:17 +0100
Message-Id: <20221211160319.3470254-3-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221211160319.3470254-1-bernd.kuhls@t-online.de>
References: <20221211160319.3470254-1-bernd.kuhls@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1670774599-88EA281F-27F7EE4E/0/0 CLEAN NORMAL
X-TOI-MSGID: a25330ca-b777-454d-bb46-a51a81b96298
Subject: [Buildroot] [PATCH 2/4] package/x11r7/xdriver_xf86-video-ast: bump
 version to 1.1.6
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

https://lists.x.org/archives/xorg-announce/2022-December/003291.html

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 .../xdriver_xf86-video-ast/xdriver_xf86-video-ast.hash      | 5 +++--
 .../x11r7/xdriver_xf86-video-ast/xdriver_xf86-video-ast.mk  | 6 +++---
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/package/x11r7/xdriver_xf86-video-ast/xdriver_xf86-video-ast.hash b/package/x11r7/xdriver_xf86-video-ast/xdriver_xf86-video-ast.hash
index 2988db98af..12ad79e4b4 100644
--- a/package/x11r7/xdriver_xf86-video-ast/xdriver_xf86-video-ast.hash
+++ b/package/x11r7/xdriver_xf86-video-ast/xdriver_xf86-video-ast.hash
@@ -1,4 +1,5 @@
-# Locally computed
-sha256  1edbbc55d47d3fd71dec99b15c2483e22738c642623a0fb86ef4a81a9067a2de  xf86-video-ast-1.1.5.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2022-December/003291.html
+sha256  75754fa9c7f9a94fcc706d32cc118942d16c71934d88110442443a143b930daf  xf86-video-ast-1.1.6.tar.xz
+sha512  8482fec8d6be577f293cb820e623544475163f713fd74ec415f899bf5e9cf9453ffe4f96e141da3671437ebf616b47395d30d4b10858053c5893f5f5b7575ef1  xf86-video-ast-1.1.6.tar.xz
 # Locally calculated
 sha256  1cdd3d57e2fdcbd21b8a7b788ffbe6f809216a9bdd36b2225cff6c4b4404a170  COPYING
diff --git a/package/x11r7/xdriver_xf86-video-ast/xdriver_xf86-video-ast.mk b/package/x11r7/xdriver_xf86-video-ast/xdriver_xf86-video-ast.mk
index b39bbf9a15..f29dc29f0b 100644
--- a/package/x11r7/xdriver_xf86-video-ast/xdriver_xf86-video-ast.mk
+++ b/package/x11r7/xdriver_xf86-video-ast/xdriver_xf86-video-ast.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-XDRIVER_XF86_VIDEO_AST_VERSION = 1.1.5
-XDRIVER_XF86_VIDEO_AST_SOURCE = xf86-video-ast-$(XDRIVER_XF86_VIDEO_AST_VERSION).tar.bz2
-XDRIVER_XF86_VIDEO_AST_SITE = http://xorg.freedesktop.org/releases/individual/driver
+XDRIVER_XF86_VIDEO_AST_VERSION = 1.1.6
+XDRIVER_XF86_VIDEO_AST_SOURCE = xf86-video-ast-$(XDRIVER_XF86_VIDEO_AST_VERSION).tar.xz
+XDRIVER_XF86_VIDEO_AST_SITE = https://xorg.freedesktop.org/archive/individual/driver
 XDRIVER_XF86_VIDEO_AST_LICENSE = MIT
 XDRIVER_XF86_VIDEO_AST_LICENSE_FILES = COPYING
 XDRIVER_XF86_VIDEO_AST_DEPENDENCIES = xorgproto xserver_xorg-server
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
