Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD2A0C4167B
	for <buildroot@archiver.kernel.org>; Fri, 30 Dec 2022 15:46:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0B3E381C6E;
	Fri, 30 Dec 2022 15:46:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0B3E381C6E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JV3nZQG8rpHi; Fri, 30 Dec 2022 15:46:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4909681B60;
	Fri, 30 Dec 2022 15:46:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4909681B60
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 244621BF20B
 for <buildroot@lists.busybox.net>; Fri, 30 Dec 2022 15:46:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0C0DB81B60
 for <buildroot@lists.busybox.net>; Fri, 30 Dec 2022 15:46:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0C0DB81B60
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id csWGZrCtUwv4 for <buildroot@lists.busybox.net>;
 Fri, 30 Dec 2022 15:46:15 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A163C81432
Received: from mailout04.t-online.de (mailout04.t-online.de [194.25.134.18])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A163C81432
 for <buildroot@buildroot.org>; Fri, 30 Dec 2022 15:46:15 +0000 (UTC)
Received: from fwd83.dcpf.telekom.de (fwd83.aul.t-online.de [10.223.144.109])
 by mailout04.t-online.de (Postfix) with SMTP id 73E6CBD41;
 Fri, 30 Dec 2022 16:45:42 +0100 (CET)
Received: from fli4l.lan.fli4l ([84.161.180.73]) by fwd83.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1pBHZl-1x7lez0; Fri, 30 Dec 2022 16:45:41 +0100
Received: from bruckner.lan.fli4l ([192.168.1.1]:56270)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd.kuhls@t-online.de>) id 1pBHZl-0004cx-0z;
 Fri, 30 Dec 2022 16:45:41 +0100
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Fri, 30 Dec 2022 16:45:41 +0100
Message-Id: <20221230154541.20915-1-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1672415141-6120D2DC-692436AD/0/0 CLEAN NORMAL
X-TOI-MSGID: afeb3b12-ca1d-4694-a25d-b0ea9e2925fe
Subject: [Buildroot] [PATCH 1/1] package/{mesa3d,
 mesa3d-headers}: bump version to 22.3.2
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
https://lists.freedesktop.org/archives/mesa-dev/2022-December/225903.html

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/mesa3d-headers/mesa3d-headers.mk | 2 +-
 package/mesa3d/mesa3d.hash               | 6 +++---
 package/mesa3d/mesa3d.mk                 | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/mesa3d-headers/mesa3d-headers.mk b/package/mesa3d-headers/mesa3d-headers.mk
index e5988cad5e..f6b3ade3ea 100644
--- a/package/mesa3d-headers/mesa3d-headers.mk
+++ b/package/mesa3d-headers/mesa3d-headers.mk
@@ -12,7 +12,7 @@ endif
 
 # Not possible to directly refer to mesa3d variables, because of
 # first/second expansion trickery...
-MESA3D_HEADERS_VERSION = 22.3.1
+MESA3D_HEADERS_VERSION = 22.3.2
 MESA3D_HEADERS_SOURCE = mesa-$(MESA3D_HEADERS_VERSION).tar.xz
 MESA3D_HEADERS_SITE = https://archive.mesa3d.org
 MESA3D_HEADERS_DL_SUBDIR = mesa3d
diff --git a/package/mesa3d/mesa3d.hash b/package/mesa3d/mesa3d.hash
index 613ebce89f..e902e6b828 100644
--- a/package/mesa3d/mesa3d.hash
+++ b/package/mesa3d/mesa3d.hash
@@ -1,5 +1,5 @@
-# From https://lists.freedesktop.org/archives/mesa-announce/2022-December/000697.html
-sha256  3c9cd611c0859d307aba0659833386abdca4c86162d3c275ba5be62d16cf31eb  mesa-22.3.1.tar.xz
-sha512  8a7aee67f6351de293d23425229eb7c42d6918fe9ffb46c6e5df9609f79633c98ab78e892507fe48055c51fa88bf103d7b7baa58e826b1758f66067048baed5b  mesa-22.3.1.tar.xz
+# From https://lists.freedesktop.org/archives/mesa-dev/2022-December/225903.html
+sha256  c15df758a8795f53e57f2a228eb4593c22b16dffd9b38f83901f76cd9533140b  mesa-22.3.2.tar.xz
+sha512  32934dd23cfcd6165c365597d9a469da0b806b72ea98a200f499344c3b47815db3bf78875b4ea766d2d28d9c70b50c1615d2d3fcbfd4769447fe0a9d3b32951f  mesa-22.3.2.tar.xz
 # License
 sha256  a00275a53178e2645fb65be99a785c110513446a5071ff2c698ed260ad917d75  docs/license.rst
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index 447537d3a3..922fe1e735 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # When updating the version, please also update mesa3d-headers
-MESA3D_VERSION = 22.3.1
+MESA3D_VERSION = 22.3.2
 MESA3D_SOURCE = mesa-$(MESA3D_VERSION).tar.xz
 MESA3D_SITE = https://archive.mesa3d.org
 MESA3D_LICENSE = MIT, SGI, Khronos
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
