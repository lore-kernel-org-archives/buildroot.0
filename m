Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 036DDC77B7D
	for <buildroot@archiver.kernel.org>; Sun,  7 May 2023 12:05:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A277182199;
	Sun,  7 May 2023 12:05:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A277182199
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id g81EKqj_AN1B; Sun,  7 May 2023 12:05:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 71F4B83B17;
	Sun,  7 May 2023 12:05:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 71F4B83B17
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2C1F71BF861
 for <buildroot@lists.busybox.net>; Sun,  7 May 2023 12:04:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7CB6B60F21
 for <buildroot@lists.busybox.net>; Sun,  7 May 2023 12:04:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7CB6B60F21
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sc_3p3Kf0YUX for <buildroot@lists.busybox.net>;
 Sun,  7 May 2023 12:04:38 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9CE0D60BDD
 for <buildroot@buildroot.org>; Sun,  7 May 2023 12:04:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9CE0D60BDD
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 968BD85EE9; Sun,  7 May 2023 12:04:38 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 7 May 2023 13:18:38 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2e76842bab862f078bdefeba578ce73bb549e979
X-Git-Newrev: 6bd350f9bdd4f4358b037d6d873ee915f4dc5ac1
X-Patchwork-Hint: ignore
Message-Id: <20230507120438.968BD85EE9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/x11r7/xlib_libXfixes: bump version
 to 6.0.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=6bd350f9bdd4f4358b037d6d873ee915f4dc5ac1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes:
https://lists.x.org/archives/xorg-announce/2023-April/003382.html

Update license hash due to copyright update with upstream commit:
https://gitlab.freedesktop.org/xorg/lib/libxfixes/-/commit/1f908b1f27723a9a8f532ab4cc58429c2f174224
  -> drop "all rights reserved"
  -> no licensing change

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/x11r7/xlib_libXfixes/xlib_libXfixes.hash | 9 ++++-----
 package/x11r7/xlib_libXfixes/xlib_libXfixes.mk   | 6 +++---
 2 files changed, 7 insertions(+), 8 deletions(-)

diff --git a/package/x11r7/xlib_libXfixes/xlib_libXfixes.hash b/package/x11r7/xlib_libXfixes/xlib_libXfixes.hash
index 5dfe496052..03de906245 100644
--- a/package/x11r7/xlib_libXfixes/xlib_libXfixes.hash
+++ b/package/x11r7/xlib_libXfixes/xlib_libXfixes.hash
@@ -1,6 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2021-May/003086.html
-sha256  a7c1a24da53e0b46cac5aea79094b4b2257321c621b258729bc3139149245b4c  libXfixes-6.0.0.tar.bz2
-sha512  1985ef156f382e9a7e1cc7e044e0f626de1e4c82557a511cbcf6431994c0ac25b1f8b3a0293bd3089331593db8ce01d3a71ddec68f19b5fe6029d5082fb6885d  libXfixes-6.0.0.tar.bz2
-
+# From https://lists.x.org/archives/xorg-announce/2023-April/003382.html
+sha256  b695f93cd2499421ab02d22744458e650ccc88c1d4c8130d60200213abc02d58  libXfixes-6.0.1.tar.xz
+sha512  b46deffb30cd73ec8a127390d99f2ba2f3ab78f334fdba227f1f461441644a0c169b0d13ffa47576fa458780e7a6db664ff8b93e9195fb217262efd8128f1ffe  libXfixes-6.0.1.tar.xz
 # Locally calculated
-sha256  d64e671ffeb483d4543f98c842788ab34c77427e27d83d6b082065a4438d4885  COPYING
+sha256  a07d8a5a6972638a745a03983207a1052881c24eea29021fdca7794bea8d7774  COPYING
diff --git a/package/x11r7/xlib_libXfixes/xlib_libXfixes.mk b/package/x11r7/xlib_libXfixes/xlib_libXfixes.mk
index c0229b57d2..3f535fc1d4 100644
--- a/package/x11r7/xlib_libXfixes/xlib_libXfixes.mk
+++ b/package/x11r7/xlib_libXfixes/xlib_libXfixes.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-XLIB_LIBXFIXES_VERSION = 6.0.0
-XLIB_LIBXFIXES_SOURCE = libXfixes-$(XLIB_LIBXFIXES_VERSION).tar.bz2
-XLIB_LIBXFIXES_SITE = http://xorg.freedesktop.org/releases/individual/lib
+XLIB_LIBXFIXES_VERSION = 6.0.1
+XLIB_LIBXFIXES_SOURCE = libXfixes-$(XLIB_LIBXFIXES_VERSION).tar.xz
+XLIB_LIBXFIXES_SITE = https://xorg.freedesktop.org/archive/individual/lib
 XLIB_LIBXFIXES_LICENSE = MIT
 XLIB_LIBXFIXES_LICENSE_FILES = COPYING
 XLIB_LIBXFIXES_CPE_ID_VENDOR = x
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
