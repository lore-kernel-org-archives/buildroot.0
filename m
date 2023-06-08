Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8545BC7EE29
	for <buildroot@archiver.kernel.org>; Thu,  8 Jun 2023 16:38:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CC86061509;
	Thu,  8 Jun 2023 16:38:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CC86061509
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TC3kyPxp2HwZ; Thu,  8 Jun 2023 16:38:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id EEF6B61501;
	Thu,  8 Jun 2023 16:38:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EEF6B61501
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1DA1A1BF39D
 for <buildroot@lists.busybox.net>; Thu,  8 Jun 2023 16:38:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 049A28125A
 for <buildroot@lists.busybox.net>; Thu,  8 Jun 2023 16:38:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 049A28125A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uESvx0bVAPQW for <buildroot@lists.busybox.net>;
 Thu,  8 Jun 2023 16:38:34 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 62A3181210
Received: from mailout12.t-online.de (mailout12.t-online.de [194.25.134.22])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 62A3181210
 for <buildroot@buildroot.org>; Thu,  8 Jun 2023 16:38:34 +0000 (UTC)
Received: from fwd77.dcpf.telekom.de (fwd77.aul.t-online.de [10.223.144.103])
 by mailout12.t-online.de (Postfix) with SMTP id 50D5971FD;
 Thu,  8 Jun 2023 18:38:31 +0200 (CEST)
Received: from fli4l.lan.fli4l ([91.58.6.127]) by fwd77.t-online.de
 with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
 esmtp id 1q7Iea-1UiVPN0; Thu, 8 Jun 2023 18:38:28 +0200
Received: from bruckner.lan.fli4l ([192.168.1.1]:48360)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd.kuhls@t-online.de>) id 1q7Iea-0003gu-0f;
 Thu, 08 Jun 2023 18:38:28 +0200
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Thu,  8 Jun 2023 18:38:28 +0200
Message-Id: <20230608163828.422195-1-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1686242308-CF0396D8-80CA5FDF/0/0 CLEAN NORMAL
X-TOI-MSGID: 5a2eaa9c-0139-4587-96a9-9e457bfb1299
Subject: [Buildroot] [PATCH 1/1] package/{mesa3d,
 mesa3d-headers}: bump version to 23.1.2
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
https://lists.freedesktop.org/archives/mesa-announce/2023-June/000722.html

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/mesa3d-headers/mesa3d-headers.mk | 2 +-
 package/mesa3d/mesa3d.hash               | 6 +++---
 package/mesa3d/mesa3d.mk                 | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/mesa3d-headers/mesa3d-headers.mk b/package/mesa3d-headers/mesa3d-headers.mk
index 1307626599..f7b0ecfd52 100644
--- a/package/mesa3d-headers/mesa3d-headers.mk
+++ b/package/mesa3d-headers/mesa3d-headers.mk
@@ -12,7 +12,7 @@ endif
 
 # Not possible to directly refer to mesa3d variables, because of
 # first/second expansion trickery...
-MESA3D_HEADERS_VERSION = 23.1.1
+MESA3D_HEADERS_VERSION = 23.1.2
 MESA3D_HEADERS_SOURCE = mesa-$(MESA3D_HEADERS_VERSION).tar.xz
 MESA3D_HEADERS_SITE = https://archive.mesa3d.org
 MESA3D_HEADERS_DL_SUBDIR = mesa3d
diff --git a/package/mesa3d/mesa3d.hash b/package/mesa3d/mesa3d.hash
index feeb20d158..80272b70d6 100644
--- a/package/mesa3d/mesa3d.hash
+++ b/package/mesa3d/mesa3d.hash
@@ -1,5 +1,5 @@
-# From https://lists.freedesktop.org/archives/mesa-announce/2023-May/000721.html
-sha256  a2679031ed5b73b29c4f042ac64d96f83b0cfe4858617de32e2efc196c653a40  mesa-23.1.1.tar.xz
-sha512  ac5522307d75ff71289a62e2e5827edca70a88e028563ed11907504b9727925186893cd40e5948f1f16c29d8ad9fad39012d7569276e2c75be97aef9c106baf8  mesa-23.1.1.tar.xz
+# From https://lists.freedesktop.org/archives/mesa-announce/2023-June/000722.html
+sha256  60b1f3adb1561830c158bf3c68508943674fb9d69f384c3c7289694385ab5c7e  mesa-23.1.2.tar.xz
+sha512  728e79720d950b0f39fa55c21dff7caed3650e88dff52a2f3e70540a049f1baf78178e62e5d6b1e59c76f6555ab0be3f0043cfbddd4745c0a742ccef2f5774d4  mesa-23.1.2.tar.xz
 # License
 sha256  a00275a53178e2645fb65be99a785c110513446a5071ff2c698ed260ad917d75  docs/license.rst
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index 3685ad7ef8..feb8547e73 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # When updating the version, please also update mesa3d-headers
-MESA3D_VERSION = 23.1.1
+MESA3D_VERSION = 23.1.2
 MESA3D_SOURCE = mesa-$(MESA3D_VERSION).tar.xz
 MESA3D_SITE = https://archive.mesa3d.org
 MESA3D_LICENSE = MIT, SGI, Khronos
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
