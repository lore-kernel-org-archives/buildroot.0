Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6FD5C61DA3
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 22:44:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 701904F27F;
	Mon, 20 Feb 2023 22:44:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 701904F27F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gYYfDMByvO2V; Mon, 20 Feb 2023 22:44:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4EFD14F28C;
	Mon, 20 Feb 2023 22:44:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4EFD14F28C
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0FD2E1BF8C7
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:55:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 29B8761259
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 29B8761259
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id v7Cn6dlybzla for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:07 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3B15561161
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3B15561161
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2C2AF828C8; Mon, 20 Feb 2023 20:52:07 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 11 Dec 2022 17:17:46 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 7255c2b31755241d8c4fafc5f733faa68182282d
X-Git-Newrev: 8e242cde92c10e6605de54a489f1aaee3dac3b5e
X-Patchwork-Hint: ignore
Message-Id: <20230220205207.2C2AF828C8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next]
 package/x11r7/xdriver_xf86-video-ast: bump version to 1.1.6
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

commit: https://git.buildroot.net/buildroot/commit/?id=8e242cde92c10e6605de54a489f1aaee3dac3b5e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

https://lists.x.org/archives/xorg-announce/2022-December/003291.html

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/x11r7/xdriver_xf86-video-ast/xdriver_xf86-video-ast.hash | 5 +++--
 package/x11r7/xdriver_xf86-video-ast/xdriver_xf86-video-ast.mk   | 6 +++---
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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
