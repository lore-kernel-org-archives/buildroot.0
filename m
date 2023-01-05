Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74C1CC61DA3
	for <buildroot@archiver.kernel.org>; Tue, 21 Feb 2023 00:14:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 133394F141;
	Tue, 21 Feb 2023 00:14:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 133394F141
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Z0bucxpu3_gj; Tue, 21 Feb 2023 00:14:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9EC344F142;
	Tue, 21 Feb 2023 00:14:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9EC344F142
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id CEA3F1BF27E
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:59:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1CE4B6FACC
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1CE4B6FACC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id X55rC6Dm4sEW for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:26 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 55B0D6FA04
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 55B0D6FA04
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 431808648F; Mon, 20 Feb 2023 20:52:26 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 5 Jan 2023 10:20:17 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 43b13ebbdc89f3d7597f476123bcddb7e0a1655d
X-Git-Newrev: a70e0bdfdabad5e9d789db181e0f4c37544a426b
X-Patchwork-Hint: ignore
Message-Id: <20230220205226.431808648F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/x11r7/xlib_libSM: bump
 version to 1.2.4
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

commit: https://git.buildroot.net/buildroot/commit/?id=a70e0bdfdabad5e9d789db181e0f4c37544a426b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Release notes:
https://lists.x.org/archives/xorg-announce/2022-December/003307.html

Switched tarball to xz, updated _SITE.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/x11r7/xlib_libSM/xlib_libSM.hash | 8 +++-----
 package/x11r7/xlib_libSM/xlib_libSM.mk   | 6 +++---
 2 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/package/x11r7/xlib_libSM/xlib_libSM.hash b/package/x11r7/xlib_libSM/xlib_libSM.hash
index 7ac288ba4e..3068c85b93 100644
--- a/package/x11r7/xlib_libSM/xlib_libSM.hash
+++ b/package/x11r7/xlib_libSM/xlib_libSM.hash
@@ -1,7 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2018-October/002922.html
-md5  87c7fad1c1813517979184c8ccd76628  libSM-1.2.3.tar.bz2
-sha1  437d7b13fa2eba325df3a106f177df46ccec6546  libSM-1.2.3.tar.bz2
-sha256  2d264499dcb05f56438dee12a1b4b71d76736ce7ba7aa6efbf15ebb113769cbb  libSM-1.2.3.tar.bz2
-sha512  74c42e27029db78475e62025b4711dbac5e22d2f8e8a24be98a1c31b03c0fc4afe859928f851800ea0b76854f12147900dc4f27bbfd3d8ea45daaaf24b70a903  libSM-1.2.3.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2022-December/003307.html
+sha256  fdcbe51e4d1276b1183da77a8a4e74a137ca203e0bcfb20972dd5f3347e97b84  libSM-1.2.4.tar.xz
+sha512  7f1d41b7b6c5dd456c49ccad7740c3ba9791a2793fa50fd94814a4164ce2e20c4a0a0ad42a87708e494ed5c23f611be6d3ccd9ef1e9add6d46ac545e2b0f6f86  libSM-1.2.4.tar.xz
 # Locally computed
 sha256  af7926a14d85ad367622688636e8c9c6f7807c8a6867536af1c530b5c262bfba  COPYING
diff --git a/package/x11r7/xlib_libSM/xlib_libSM.mk b/package/x11r7/xlib_libSM/xlib_libSM.mk
index 708224e2d1..8e5c90127a 100644
--- a/package/x11r7/xlib_libSM/xlib_libSM.mk
+++ b/package/x11r7/xlib_libSM/xlib_libSM.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-XLIB_LIBSM_VERSION = 1.2.3
-XLIB_LIBSM_SOURCE = libSM-$(XLIB_LIBSM_VERSION).tar.bz2
-XLIB_LIBSM_SITE = http://xorg.freedesktop.org/releases/individual/lib
+XLIB_LIBSM_VERSION = 1.2.4
+XLIB_LIBSM_SOURCE = libSM-$(XLIB_LIBSM_VERSION).tar.xz
+XLIB_LIBSM_SITE = https://xorg.freedesktop.org/archive/individual/lib
 XLIB_LIBSM_LICENSE = MIT
 XLIB_LIBSM_LICENSE_FILES = COPYING
 XLIB_LIBSM_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
