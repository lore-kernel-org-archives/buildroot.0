Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6884CC4332F
	for <buildroot@archiver.kernel.org>; Fri,  9 Dec 2022 17:12:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 12EE240492;
	Fri,  9 Dec 2022 17:12:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 12EE240492
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KSM3p67mefd1; Fri,  9 Dec 2022 17:12:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 40C5B41023;
	Fri,  9 Dec 2022 17:12:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 40C5B41023
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 040371BF37A
 for <buildroot@lists.busybox.net>; Fri,  9 Dec 2022 17:01:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2CB7C41029
 for <buildroot@lists.busybox.net>; Fri,  9 Dec 2022 17:01:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2CB7C41029
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gj6w-gPdpggt for <buildroot@lists.busybox.net>;
 Fri,  9 Dec 2022 17:01:09 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 79B084102A
 for <buildroot@buildroot.org>; Fri,  9 Dec 2022 17:01:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 79B084102A
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 77E0785EA1; Fri,  9 Dec 2022 17:01:04 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Fri, 9 Dec 2022 17:35:40 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6111bac9e5d2f1cea5db127ad59f2379f86b90fd
X-Git-Newrev: 0978ae1d5e1acca7f9ab165e4050cfa1c283fed4
X-Patchwork-Hint: ignore
Message-Id: <20221209170104.77E0785EA1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/x11r7/xlib_libXmu: bump version to
 1.1.4
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

commit: https://git.buildroot.net/buildroot/commit/?id=0978ae1d5e1acca7f9ab165e4050cfa1c283fed4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://lists.x.org/archives/xorg-announce/2022-October/003224.html

Updated license hash due to upstream commits:
https://gitlab.freedesktop.org/xorg/lib/libxmu/-/commit/621f61f7d3f5955a84e6aa8b7458699870fdee45
https://gitlab.freedesktop.org/xorg/lib/libxmu/-/commit/f84dcc7fef5e0842e6408f059c13d73975114ec4

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/x11r7/xlib_libXmu/xlib_libXmu.hash | 10 ++++------
 package/x11r7/xlib_libXmu/xlib_libXmu.mk   |  6 +++---
 2 files changed, 7 insertions(+), 9 deletions(-)

diff --git a/package/x11r7/xlib_libXmu/xlib_libXmu.hash b/package/x11r7/xlib_libXmu/xlib_libXmu.hash
index b443419285..58d3545156 100644
--- a/package/x11r7/xlib_libXmu/xlib_libXmu.hash
+++ b/package/x11r7/xlib_libXmu/xlib_libXmu.hash
@@ -1,7 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2019-March/002978.html
-md5  ac774cff8b493f566088a255dbf91201  libXmu-1.1.3.tar.bz2
-sha1  7ff54ce38379fb795aebed38f6be404ee0dfeec6  libXmu-1.1.3.tar.bz2
-sha256  9c343225e7c3dc0904f2122b562278da5fed639b1b5e880d25111561bac5b731  libXmu-1.1.3.tar.bz2
-sha512  8c6cc65b22aa031ad870dd92736681a068a0878a425a53dbed909943da1136c4a24034d467cfd3785c3a8d78f66850b69f1ebe1eb24aaf9bc176b1d171a5c762  libXmu-1.1.3.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2022-October/003224.html
+sha256  210de3ab9c3e9382572c25d17c2518a854ce6e2c62c5f8315deac7579e758244  libXmu-1.1.4.tar.xz
+sha512  3cf90cb3ff380aafefbb39297bdd95b9e1e6d6618cecb53ff09faf38f9b9c54599d28367f07a9ec77a20214c6c3e661b8d0a12b38082556790a79a59942039c1  libXmu-1.1.4.tar.xz
 # Locally computed
-sha256  e65a4a8bbf8b0dfd2439d6bc6d86df03e2b8e693b757593b25149e099aeb8ec4  COPYING
+sha256  8f0f2ca7a05cfd10bf9e307a272182de7cb52d7a603feaf17b9943c2c9a4838e  COPYING
diff --git a/package/x11r7/xlib_libXmu/xlib_libXmu.mk b/package/x11r7/xlib_libXmu/xlib_libXmu.mk
index 3218e0ec39..051968059b 100644
--- a/package/x11r7/xlib_libXmu/xlib_libXmu.mk
+++ b/package/x11r7/xlib_libXmu/xlib_libXmu.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-XLIB_LIBXMU_VERSION = 1.1.3
-XLIB_LIBXMU_SOURCE = libXmu-$(XLIB_LIBXMU_VERSION).tar.bz2
-XLIB_LIBXMU_SITE = http://xorg.freedesktop.org/releases/individual/lib
+XLIB_LIBXMU_VERSION = 1.1.4
+XLIB_LIBXMU_SOURCE = libXmu-$(XLIB_LIBXMU_VERSION).tar.xz
+XLIB_LIBXMU_SITE = https://xorg.freedesktop.org/archive/individual/lib
 XLIB_LIBXMU_LICENSE = MIT
 XLIB_LIBXMU_LICENSE_FILES = COPYING
 XLIB_LIBXMU_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
