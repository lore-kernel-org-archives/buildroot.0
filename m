Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E279BC61DA3
	for <buildroot@archiver.kernel.org>; Tue, 21 Feb 2023 00:16:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 80D4F4F198;
	Tue, 21 Feb 2023 00:16:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 80D4F4F198
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pp7Svucia0gf; Tue, 21 Feb 2023 00:16:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3CB334EFC5;
	Tue, 21 Feb 2023 00:16:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3CB334EFC5
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 25EA41BF27E
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:59:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 68DC36FAE0
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 68DC36FAE0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id W3gRyDqO7MqG for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:26 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9A0AF6FAB8
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9A0AF6FAB8
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 97A2D828C8; Mon, 20 Feb 2023 20:52:26 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 5 Jan 2023 10:51:09 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 01518e5660366be41e6a8e0a0f2b487d7cdf48a2
X-Git-Newrev: a16221834a0c7a8744f620c2cada751c693279d4
X-Patchwork-Hint: ignore
Message-Id: <20230220205226.97A2D828C8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/{mesa3d,
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=a16221834a0c7a8744f620c2cada751c693279d4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Release notes:
https://lists.freedesktop.org/archives/mesa-dev/2022-December/225903.html

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
index b6f1214102..523b642d0c 100644
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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
