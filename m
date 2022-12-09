Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9009EC4332F
	for <buildroot@archiver.kernel.org>; Fri,  9 Dec 2022 17:01:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 113F160F3B;
	Fri,  9 Dec 2022 17:01:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 113F160F3B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GC_BOU5PO401; Fri,  9 Dec 2022 17:01:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 37B2E60EC6;
	Fri,  9 Dec 2022 17:01:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 37B2E60EC6
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id CA2B31BF976
 for <buildroot@lists.busybox.net>; Fri,  9 Dec 2022 17:01:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A5E3D611B8
 for <buildroot@lists.busybox.net>; Fri,  9 Dec 2022 17:01:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A5E3D611B8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gnrSh9fdOUws for <buildroot@lists.busybox.net>;
 Fri,  9 Dec 2022 17:01:03 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0310660E24
 for <buildroot@buildroot.org>; Fri,  9 Dec 2022 17:01:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0310660E24
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E3BC285EAA; Fri,  9 Dec 2022 17:01:02 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Fri, 9 Dec 2022 17:31:17 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8ce4206c9e8871ed02ccb824d584dfff36bbc719
X-Git-Newrev: 7436867eb1d07a1cf0c9c809b6c13c11596a1159
X-Patchwork-Hint: ignore
Message-Id: <20221209170102.E3BC285EAA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/x11r7/xlib_libXau: bump version to
 1.0.11
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

commit: https://git.buildroot.net/buildroot/commit/?id=7436867eb1d07a1cf0c9c809b6c13c11596a1159
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://lists.x.org/archives/xorg-announce/2022-December/003284.html
https://lists.x.org/archives/xorg-announce/2022-August/003201.html
Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/x11r7/xlib_libXau/xlib_libXau.hash | 8 +++-----
 package/x11r7/xlib_libXau/xlib_libXau.mk   | 4 ++--
 2 files changed, 5 insertions(+), 7 deletions(-)

diff --git a/package/x11r7/xlib_libXau/xlib_libXau.hash b/package/x11r7/xlib_libXau/xlib_libXau.hash
index 65ae54ec32..8d2a6ff43c 100644
--- a/package/x11r7/xlib_libXau/xlib_libXau.hash
+++ b/package/x11r7/xlib_libXau/xlib_libXau.hash
@@ -1,7 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2019-February/002942.html
-md5  c5f16288f2da9f071b29111d68797480  libXau-1.0.9.tar.bz2
-sha1  ef9b1ad00f958c8b6e30a1bbc11fdfac311c9733  libXau-1.0.9.tar.bz2
-sha256  ccf8cbf0dbf676faa2ea0a6d64bcc3b6746064722b606c8c52917ed00dcb73ec  libXau-1.0.9.tar.bz2
-sha512  3ca454ba466a807ea28b0f715066d73dc76ad312697b121d43e4d5766215052e9b7ffb8fe3ed3e496fa3f2a13f164ac692ff85cc428e26731b679f0f06a1d562  libXau-1.0.9.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2022-December/003284.html
+sha256  f3fa3282f5570c3f6bd620244438dbfbdd580fc80f02f549587a0f8ab329bbeb  libXau-1.0.11.tar.xz
+sha512  f56abba3bef3fdd4739dfa69367a4251b5fab7c89194c9aece9efa66b9ebbf0736690cc9bd654aab19d9db377e4b9a5268c9c020b3d293bb5351bff5fe75a4dd  libXau-1.0.11.tar.xz
 # Locally computed
 sha256  56abe29bb1d9806a9e04fa9f80fed2c0f18027594df3f098148d814aef6bddfa  COPYING
diff --git a/package/x11r7/xlib_libXau/xlib_libXau.mk b/package/x11r7/xlib_libXau/xlib_libXau.mk
index bac10818f1..0e9f79d38d 100644
--- a/package/x11r7/xlib_libXau/xlib_libXau.mk
+++ b/package/x11r7/xlib_libXau/xlib_libXau.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-XLIB_LIBXAU_VERSION = 1.0.9
-XLIB_LIBXAU_SOURCE = libXau-$(XLIB_LIBXAU_VERSION).tar.bz2
+XLIB_LIBXAU_VERSION = 1.0.11
+XLIB_LIBXAU_SOURCE = libXau-$(XLIB_LIBXAU_VERSION).tar.xz
 XLIB_LIBXAU_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBXAU_LICENSE = MIT
 XLIB_LIBXAU_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
