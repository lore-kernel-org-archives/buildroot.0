Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D3F0EB64DA
	for <buildroot@archiver.kernel.org>; Sat, 24 Jun 2023 14:07:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 053FD60A7B;
	Sat, 24 Jun 2023 14:07:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 053FD60A7B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2hAgXpMt-lZx; Sat, 24 Jun 2023 14:07:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3CEC9607E1;
	Sat, 24 Jun 2023 14:07:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3CEC9607E1
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id DA5891BF3E0
 for <buildroot@lists.busybox.net>; Sat, 24 Jun 2023 14:06:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B1A1C410B8
 for <buildroot@lists.busybox.net>; Sat, 24 Jun 2023 14:06:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B1A1C410B8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id syphBmZ55r1I for <buildroot@lists.busybox.net>;
 Sat, 24 Jun 2023 14:06:58 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id A6600409C0
 for <buildroot@buildroot.org>; Sat, 24 Jun 2023 14:06:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A6600409C0
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 91A7684543; Sat, 24 Jun 2023 14:06:58 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 24 Jun 2023 16:05:17 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 840b5527466502f02b86c95f9bf95557d35c8571
X-Git-Newrev: dfdf613e3bc709dc58d7490103220fa820e489be
X-Patchwork-Hint: ignore
Message-Id: <20230624140658.91A7684543@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/{mesa3d,
 mesa3d-headers}: bump version to 23.1.3
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

commit: https://git.buildroot.net/buildroot/commit/?id=dfdf613e3bc709dc58d7490103220fa820e489be
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes:
https://lists.freedesktop.org/archives/mesa-announce/2023-June/000723.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/mesa3d-headers/mesa3d-headers.mk | 2 +-
 package/mesa3d/mesa3d.hash               | 4 ++--
 package/mesa3d/mesa3d.mk                 | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/mesa3d-headers/mesa3d-headers.mk b/package/mesa3d-headers/mesa3d-headers.mk
index f7b0ecfd52..a89ab984a8 100644
--- a/package/mesa3d-headers/mesa3d-headers.mk
+++ b/package/mesa3d-headers/mesa3d-headers.mk
@@ -12,7 +12,7 @@ endif
 
 # Not possible to directly refer to mesa3d variables, because of
 # first/second expansion trickery...
-MESA3D_HEADERS_VERSION = 23.1.2
+MESA3D_HEADERS_VERSION = 23.1.3
 MESA3D_HEADERS_SOURCE = mesa-$(MESA3D_HEADERS_VERSION).tar.xz
 MESA3D_HEADERS_SITE = https://archive.mesa3d.org
 MESA3D_HEADERS_DL_SUBDIR = mesa3d
diff --git a/package/mesa3d/mesa3d.hash b/package/mesa3d/mesa3d.hash
index 80272b70d6..71583d5f67 100644
--- a/package/mesa3d/mesa3d.hash
+++ b/package/mesa3d/mesa3d.hash
@@ -1,5 +1,5 @@
 # From https://lists.freedesktop.org/archives/mesa-announce/2023-June/000722.html
-sha256  60b1f3adb1561830c158bf3c68508943674fb9d69f384c3c7289694385ab5c7e  mesa-23.1.2.tar.xz
-sha512  728e79720d950b0f39fa55c21dff7caed3650e88dff52a2f3e70540a049f1baf78178e62e5d6b1e59c76f6555ab0be3f0043cfbddd4745c0a742ccef2f5774d4  mesa-23.1.2.tar.xz
+sha256  2f6d7381bc10fbd2d6263ad1022785b8b511046c1a904162f8f7da18eea8aed9  mesa-23.1.3.tar.xz
+sha512  44f0658138ef99dcede5e4c33d5733af836283f05b031b07f3f8b3bc03b301bc7ab9dc15248829cf3dfc423f2da8935b372b25df8b9ef15a511ba16ccd913959  mesa-23.1.3.tar.xz
 # License
 sha256  a00275a53178e2645fb65be99a785c110513446a5071ff2c698ed260ad917d75  docs/license.rst
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index feb8547e73..191fa15eef 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # When updating the version, please also update mesa3d-headers
-MESA3D_VERSION = 23.1.2
+MESA3D_VERSION = 23.1.3
 MESA3D_SOURCE = mesa-$(MESA3D_VERSION).tar.xz
 MESA3D_SITE = https://archive.mesa3d.org
 MESA3D_LICENSE = MIT, SGI, Khronos
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
