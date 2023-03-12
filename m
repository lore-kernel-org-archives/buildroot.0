Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0877FC6FD19
	for <buildroot@archiver.kernel.org>; Sun, 12 Mar 2023 22:03:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A21F740895;
	Sun, 12 Mar 2023 22:03:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A21F740895
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5ygHBg_Y4LaN; Sun, 12 Mar 2023 22:03:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 11BE9408DD;
	Sun, 12 Mar 2023 22:03:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 11BE9408DD
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D54301BF2CF
 for <buildroot@lists.busybox.net>; Sun, 12 Mar 2023 22:03:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AEB1A60C0A
 for <buildroot@lists.busybox.net>; Sun, 12 Mar 2023 22:03:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AEB1A60C0A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MvytD0q0OOEz for <buildroot@lists.busybox.net>;
 Sun, 12 Mar 2023 22:03:11 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 510FB60BFE
Received: from mailout08.t-online.de (mailout08.t-online.de [194.25.134.20])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 510FB60BFE
 for <buildroot@buildroot.org>; Sun, 12 Mar 2023 22:03:11 +0000 (UTC)
Received: from fwd75.dcpf.telekom.de (fwd75.aul.t-online.de [10.223.144.101])
 by mailout08.t-online.de (Postfix) with SMTP id E4DC1233A5;
 Sun, 12 Mar 2023 23:02:54 +0100 (CET)
Received: from fli4l.lan.fli4l ([79.214.204.131]) by fwd75.t-online.de
 with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
 esmtp id 1pbTmI-2OrmZl0; Sun, 12 Mar 2023 23:02:54 +0100
Received: from bruckner.lan.fli4l ([192.168.1.1]:56712)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd.kuhls@t-online.de>) id 1pbTmI-0005ph-01;
 Sun, 12 Mar 2023 23:02:54 +0100
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Sun, 12 Mar 2023 23:02:53 +0100
Message-Id: <20230312220253.285408-1-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1678658574-DB61A2C4-1C258A30/0/0 CLEAN NORMAL
X-TOI-MSGID: 10c73ed6-e439-4c61-a20d-5e1d93b7b07c
Subject: [Buildroot] [PATCH 1/1] package/{mesa3d,
 mesa3d-headers}: bump version to 23.0.0
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
Cc: Romain Naour <romain.naour@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Release notes:
https://www.phoronix.com/news/Mesa-23.0-Released
https://lists.freedesktop.org/archives/mesa-announce/2023-February/000706.html

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/mesa3d-headers/mesa3d-headers.mk | 2 +-
 package/mesa3d/mesa3d.hash               | 6 +++---
 package/mesa3d/mesa3d.mk                 | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/mesa3d-headers/mesa3d-headers.mk b/package/mesa3d-headers/mesa3d-headers.mk
index ad1999a30d..a9ab1de8ea 100644
--- a/package/mesa3d-headers/mesa3d-headers.mk
+++ b/package/mesa3d-headers/mesa3d-headers.mk
@@ -12,7 +12,7 @@ endif
 
 # Not possible to directly refer to mesa3d variables, because of
 # first/second expansion trickery...
-MESA3D_HEADERS_VERSION = 22.3.5
+MESA3D_HEADERS_VERSION = 23.0.0
 MESA3D_HEADERS_SOURCE = mesa-$(MESA3D_HEADERS_VERSION).tar.xz
 MESA3D_HEADERS_SITE = https://archive.mesa3d.org
 MESA3D_HEADERS_DL_SUBDIR = mesa3d
diff --git a/package/mesa3d/mesa3d.hash b/package/mesa3d/mesa3d.hash
index 50c5bcc7fc..17dc2e7c00 100644
--- a/package/mesa3d/mesa3d.hash
+++ b/package/mesa3d/mesa3d.hash
@@ -1,5 +1,5 @@
-# From https://lists.freedesktop.org/archives/mesa-announce/2023-February/000705.html
-sha256  3eed2ecae2bc674494566faab9fcc9beb21cd804c7ba2b59a1694f3d7236e6a9  mesa-22.3.5.tar.xz
-sha512  a4cad9b7e6501678fac279bd88a37e522633c7128afa8df04982f469c930e3557bb1d05b4b0f5ae16704d8d04e50c90a7489943a48861df17dd947704c329b85  mesa-22.3.5.tar.xz
+# From https://lists.freedesktop.org/archives/mesa-announce/2023-February/000706.html
+sha256  01f3cff3763f09e0adabcb8011e4aebc6ad48f6a4dd4bae904fe918707d253e4  mesa-23.0.0.tar.xz
+sha512  127e2759a2a31cacd65a0891719ab7bb4a9188844022b4bccaebbedce9c550b9ccb160ad519178ea0d851c4bcb8f0f56febda248ed2ba82b5ddf804855e4694b  mesa-23.0.0.tar.xz
 # License
 sha256  a00275a53178e2645fb65be99a785c110513446a5071ff2c698ed260ad917d75  docs/license.rst
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index a744334c5b..a09c157b33 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # When updating the version, please also update mesa3d-headers
-MESA3D_VERSION = 22.3.5
+MESA3D_VERSION = 23.0.0
 MESA3D_SOURCE = mesa-$(MESA3D_VERSION).tar.xz
 MESA3D_SITE = https://archive.mesa3d.org
 MESA3D_LICENSE = MIT, SGI, Khronos
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
