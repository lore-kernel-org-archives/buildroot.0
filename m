Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6705C4332F
	for <buildroot@archiver.kernel.org>; Fri,  9 Dec 2022 17:13:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7A1AC41B91;
	Fri,  9 Dec 2022 17:13:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7A1AC41B91
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qvzGc_3J7gbU; Fri,  9 Dec 2022 17:13:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 57D2840591;
	Fri,  9 Dec 2022 17:13:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 57D2840591
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 033371BF37A
 for <buildroot@lists.busybox.net>; Fri,  9 Dec 2022 17:01:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A065241B36
 for <buildroot@lists.busybox.net>; Fri,  9 Dec 2022 17:01:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A065241B36
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XsWzL3JRyRs0 for <buildroot@lists.busybox.net>;
 Fri,  9 Dec 2022 17:01:10 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id C8D0941B41
 for <buildroot@buildroot.org>; Fri,  9 Dec 2022 17:01:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C8D0941B41
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C675E85EA6; Fri,  9 Dec 2022 17:01:04 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Fri, 9 Dec 2022 17:36:06 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5cd2f31a255b4295d83adaeb8db97150c3f660ac
X-Git-Newrev: 5e2df02d3109131b72880ebf313088e70366c5da
X-Patchwork-Hint: ignore
Message-Id: <20221209170104.C675E85EA6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/x11r7/xlib_libXtst: bump version
 to 1.2.4
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

commit: https://git.buildroot.net/buildroot/commit/?id=5e2df02d3109131b72880ebf313088e70366c5da
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://lists.x.org/archives/xorg-announce/2022-September/003214.html
Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/x11r7/xlib_libXtst/xlib_libXtst.hash | 5 +++--
 package/x11r7/xlib_libXtst/xlib_libXtst.mk   | 6 +++---
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/package/x11r7/xlib_libXtst/xlib_libXtst.hash b/package/x11r7/xlib_libXtst/xlib_libXtst.hash
index f64a018567..7bdcdb9c17 100644
--- a/package/x11r7/xlib_libXtst/xlib_libXtst.hash
+++ b/package/x11r7/xlib_libXtst/xlib_libXtst.hash
@@ -1,4 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2016-October/002726.html
-sha256  4655498a1b8e844e3d6f21f3b2c4e2b571effb5fd83199d428a6ba7ea4bf5204  libXtst-1.2.3.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2022-September/003214.html
+sha256  84f5f30b9254b4ffee14b5b0940e2622153b0d3aed8286a3c5b7eeb340ca33c8  libXtst-1.2.4.tar.xz
+sha512  f2f4e01239b892b8e26284cede90feb4fe7738beb243bca0f6adb349029f8bf87b5a482911edcd2401733c92ef78eec07fcd455b92e5b8c4828374769e60098d  libXtst-1.2.4.tar.xz
 # Locally computed
 sha256  940190489c7a0e5ae3d83fc4fcbd79e0cd1b765bf1a4efd408293c1ee0332ceb  COPYING
diff --git a/package/x11r7/xlib_libXtst/xlib_libXtst.mk b/package/x11r7/xlib_libXtst/xlib_libXtst.mk
index c79301e064..47103377aa 100644
--- a/package/x11r7/xlib_libXtst/xlib_libXtst.mk
+++ b/package/x11r7/xlib_libXtst/xlib_libXtst.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-XLIB_LIBXTST_VERSION = 1.2.3
-XLIB_LIBXTST_SOURCE = libXtst-$(XLIB_LIBXTST_VERSION).tar.bz2
-XLIB_LIBXTST_SITE = http://xorg.freedesktop.org/releases/individual/lib
+XLIB_LIBXTST_VERSION = 1.2.4
+XLIB_LIBXTST_SOURCE = libXtst-$(XLIB_LIBXTST_VERSION).tar.xz
+XLIB_LIBXTST_SITE = https://xorg.freedesktop.org/archive/individual/lib
 XLIB_LIBXTST_LICENSE = MIT
 XLIB_LIBXTST_LICENSE_FILES = COPYING
 XLIB_LIBXTST_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
