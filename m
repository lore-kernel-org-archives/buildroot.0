Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 828F4C4332F
	for <buildroot@archiver.kernel.org>; Fri,  9 Dec 2022 17:05:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 306D7820C0;
	Fri,  9 Dec 2022 17:05:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 306D7820C0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fP81HFQoyEqh; Fri,  9 Dec 2022 17:05:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 47454820A2;
	Fri,  9 Dec 2022 17:05:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 47454820A2
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 28B601BF973
 for <buildroot@lists.busybox.net>; Fri,  9 Dec 2022 17:01:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DDBC660F3B
 for <buildroot@lists.busybox.net>; Fri,  9 Dec 2022 17:01:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DDBC660F3B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3TrXGmbfkdMI for <buildroot@lists.busybox.net>;
 Fri,  9 Dec 2022 17:01:06 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9BFD361197
 for <buildroot@buildroot.org>; Fri,  9 Dec 2022 17:01:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9BFD361197
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 98C2385E9E; Fri,  9 Dec 2022 17:01:03 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Fri, 9 Dec 2022 17:32:16 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9e1546672ce900d82a39f991237246a201874d47
X-Git-Newrev: 327d7453ba3d4991c4ddc64a0164ca7f80ea0ef1
X-Patchwork-Hint: ignore
Message-Id: <20221209170103.98C2385E9E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/x11r7/xlib_libXrandr: bump version
 to 1.5.3
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

commit: https://git.buildroot.net/buildroot/commit/?id=327d7453ba3d4991c4ddc64a0164ca7f80ea0ef1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://lists.x.org/archives/xorg-announce/2022-November/003262.html
Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/x11r7/xlib_libXrandr/xlib_libXrandr.hash | 8 +++-----
 package/x11r7/xlib_libXrandr/xlib_libXrandr.mk   | 6 +++---
 2 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/package/x11r7/xlib_libXrandr/xlib_libXrandr.hash b/package/x11r7/xlib_libXrandr/xlib_libXrandr.hash
index 4b12328df0..3d3bb640ed 100644
--- a/package/x11r7/xlib_libXrandr/xlib_libXrandr.hash
+++ b/package/x11r7/xlib_libXrandr/xlib_libXrandr.hash
@@ -1,7 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2019-March/002979.html
-md5  18f3b20d522f45e4dadd34afb5bea048  libXrandr-1.5.2.tar.bz2
-sha1  7a1f6df239341b76fd59ebbe101d6f180adb43bb  libXrandr-1.5.2.tar.bz2
-sha256  8aea0ebe403d62330bb741ed595b53741acf45033d3bda1792f1d4cc3daee023  libXrandr-1.5.2.tar.bz2
-sha512  fcd005f9839e7ef980607128a5d76d7b671cc2f5755949e03c569c500d7e987cb3f6932750ab8bf6e2c1086ec69dde09d5831f0c2098b9f9ad46be4f56db0d87  libXrandr-1.5.2.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2022-November/003262.html
+sha256  897639014a78e1497704d669c5dd5682d721931a4452c89a7ba62676064eb428  libXrandr-1.5.3.tar.xz
+sha512  0c385fc304a872048ffca5cfb8789dfe3132e3126894d54b2fe642dff19d286e7ade1d2f6da894e03788df9c5cf31427c674e987143037b7d385b19285590edb  libXrandr-1.5.3.tar.xz
 # Locally computed
 sha256  73777e5be1cef2827d843e4b186803f050c66db472cf8076d88e2b5f71696e67  COPYING
diff --git a/package/x11r7/xlib_libXrandr/xlib_libXrandr.mk b/package/x11r7/xlib_libXrandr/xlib_libXrandr.mk
index aa2761330a..5e88173ed7 100644
--- a/package/x11r7/xlib_libXrandr/xlib_libXrandr.mk
+++ b/package/x11r7/xlib_libXrandr/xlib_libXrandr.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-XLIB_LIBXRANDR_VERSION = 1.5.2
-XLIB_LIBXRANDR_SOURCE = libXrandr-$(XLIB_LIBXRANDR_VERSION).tar.bz2
-XLIB_LIBXRANDR_SITE = http://xorg.freedesktop.org/releases/individual/lib
+XLIB_LIBXRANDR_VERSION = 1.5.3
+XLIB_LIBXRANDR_SOURCE = libXrandr-$(XLIB_LIBXRANDR_VERSION).tar.xz
+XLIB_LIBXRANDR_SITE = https://xorg.freedesktop.org/archive/individual/lib
 XLIB_LIBXRANDR_LICENSE = MIT
 XLIB_LIBXRANDR_LICENSE_FILES = COPYING
 XLIB_LIBXRANDR_CPE_ID_VENDOR = x.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
