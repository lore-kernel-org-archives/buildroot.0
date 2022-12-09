Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EF94C04FDE
	for <buildroot@archiver.kernel.org>; Fri,  9 Dec 2022 17:02:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4BF0B82129;
	Fri,  9 Dec 2022 17:02:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4BF0B82129
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VPV2vKENcXTK; Fri,  9 Dec 2022 17:02:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 614E082135;
	Fri,  9 Dec 2022 17:02:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 614E082135
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 20A671BF97A
 for <buildroot@lists.busybox.net>; Fri,  9 Dec 2022 17:01:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BF2B160E24
 for <buildroot@lists.busybox.net>; Fri,  9 Dec 2022 17:01:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BF2B160E24
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VIF_RF4fq8Lr for <buildroot@lists.busybox.net>;
 Fri,  9 Dec 2022 17:01:03 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1C5FB60EC6
 for <buildroot@buildroot.org>; Fri,  9 Dec 2022 17:01:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1C5FB60EC6
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1A94685EA7; Fri,  9 Dec 2022 17:01:03 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Fri, 9 Dec 2022 17:31:33 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8929d19dfba43af98ae1c981131e33d366f45e8a
X-Git-Newrev: 6b6ea10c528c1c7b3f6ac7bbba7ba519974b2c3a
X-Patchwork-Hint: ignore
Message-Id: <20221209170103.1A94685EA7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/x11r7/xlib_libXres: bump version
 to 1.2.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=6b6ea10c528c1c7b3f6ac7bbba7ba519974b2c3a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://lists.x.org/archives/xorg-announce/2022-December/003278.html
Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/x11r7/xlib_libXres/xlib_libXres.hash | 7 +++----
 package/x11r7/xlib_libXres/xlib_libXres.mk   | 6 +++---
 2 files changed, 6 insertions(+), 7 deletions(-)

diff --git a/package/x11r7/xlib_libXres/xlib_libXres.hash b/package/x11r7/xlib_libXres/xlib_libXres.hash
index 700590ad8c..2e6d3d5c55 100644
--- a/package/x11r7/xlib_libXres/xlib_libXres.hash
+++ b/package/x11r7/xlib_libXres/xlib_libXres.hash
@@ -1,6 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2021-March/003078.html
-sha256  b6e6fb1ebb61610e56017edd928fb89a5f53b3f4f990078309877468663b2b11  libXres-1.2.1.tar.bz2
-sha512  c17d28406e17e305dc4976f095e88059735f5bd8c600adf2e556523c9e0dd7fa01dcbf7a9d28a642e77e49a5b30f54bb9b2fc34bfbedce467ee2a020bba5cdf1  libXres-1.2.1.tar.bz2
-
+# From https://lists.x.org/archives/xorg-announce/2022-December/003278.html
+sha256  9a7446f3484b9b7538ac5ee30d2c1ce9e5b7fbbaf1440e02f6cca186a1fa745f  libXres-1.2.2.tar.xz
+sha512  897f2d426ea6f41169a5a52c356d1a1cb2ffb9144ae41b9fedd06455c3d81042930fe55be269ce4b8545ee65fcfe168101192a599053d810e8810f627c94f810  libXres-1.2.2.tar.xz
 # Locally calculated
 sha256  0d7300168f85833ea2564835f66a61e036ede90b33e76c06a7b4078096fedbcc  COPYING
diff --git a/package/x11r7/xlib_libXres/xlib_libXres.mk b/package/x11r7/xlib_libXres/xlib_libXres.mk
index de3637a04a..25498090fe 100644
--- a/package/x11r7/xlib_libXres/xlib_libXres.mk
+++ b/package/x11r7/xlib_libXres/xlib_libXres.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-XLIB_LIBXRES_VERSION = 1.2.1
-XLIB_LIBXRES_SOURCE = libXres-$(XLIB_LIBXRES_VERSION).tar.bz2
-XLIB_LIBXRES_SITE = http://xorg.freedesktop.org/releases/individual/lib
+XLIB_LIBXRES_VERSION = 1.2.2
+XLIB_LIBXRES_SOURCE = libXres-$(XLIB_LIBXRES_VERSION).tar.xz
+XLIB_LIBXRES_SITE = https://xorg.freedesktop.org/archive/individual/lib
 XLIB_LIBXRES_LICENSE = MIT
 XLIB_LIBXRES_LICENSE_FILES = COPYING
 XLIB_LIBXRES_CPE_ID_VENDOR = x
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
