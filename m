Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2892DC636D6
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 21:54:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C26BA4ECBC;
	Mon, 20 Feb 2023 21:54:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C26BA4ECBC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Sgjepf00wfMQ; Mon, 20 Feb 2023 21:54:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 677D54ECD6;
	Mon, 20 Feb 2023 21:54:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 677D54ECD6
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E053A1BF2E3
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:53:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 67B3061129
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:51:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 67B3061129
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 30hJVHVx_hdD for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:51:57 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8D47F610EF
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:51:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8D47F610EF
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7C82281979; Mon, 20 Feb 2023 20:51:57 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Fri, 9 Dec 2022 17:32:21 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 7d2fff78049392f2dae82f5ea9f5a0dbac225f4d
X-Git-Newrev: 723eff5808451188ddc097aafc17e6969b849e57
X-Patchwork-Hint: ignore
Message-Id: <20230220205157.7C82281979@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/x11r7/xlib_libXdmcp:
 bump version to 1.1.4
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

commit: https://git.buildroot.net/buildroot/commit/?id=723eff5808451188ddc097aafc17e6969b849e57
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

https://lists.x.org/archives/xorg-announce/2022-November/003260.html
Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/x11r7/xlib_libXdmcp/xlib_libXdmcp.hash | 8 +++-----
 package/x11r7/xlib_libXdmcp/xlib_libXdmcp.mk   | 6 +++---
 2 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/package/x11r7/xlib_libXdmcp/xlib_libXdmcp.hash b/package/x11r7/xlib_libXdmcp/xlib_libXdmcp.hash
index 9f7f968350..83609413fd 100644
--- a/package/x11r7/xlib_libXdmcp/xlib_libXdmcp.hash
+++ b/package/x11r7/xlib_libXdmcp/xlib_libXdmcp.hash
@@ -1,7 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2019-March/002974.html
-md5  115c5c12ecce0e749cd91d999a5fd160  libXdmcp-1.1.3.tar.bz2
-sha1  0a8f8a274f829331efb1e8e2027c38631b204dd0  libXdmcp-1.1.3.tar.bz2
-sha256  20523b44aaa513e17c009e873ad7bbc301507a3224c232610ce2e099011c6529  libXdmcp-1.1.3.tar.bz2
-sha512  cb1d4650f97d66e73acd2465ec7d757b9b797cce2f85e301860a44997a461837eea845ec9bd5b639ec5ca34c804f8bdd870697a5ce3f4e270b687c9ef74f25ec  libXdmcp-1.1.3.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2022-November/003260.html
+sha256  2dce5cc317f8f0b484ec347d87d81d552cdbebb178bd13c5d8193b6b7cd6ad00  libXdmcp-1.1.4.tar.xz
+sha512  83b384d43bfb034c395f83f97d1c6e73aa3d5faa8f8756b08e697c0b9c3c87189651b51e8213fbd1f5f9cbc2d8136cbf143627481744345d78cfe0ff2ad074a9  libXdmcp-1.1.4.tar.xz
 # Locally computed
 sha256  8a3c3f35b0dbcb60a4e242b9e4394a352a65bb27deb2938ea1e2e62a626e16e9  COPYING
diff --git a/package/x11r7/xlib_libXdmcp/xlib_libXdmcp.mk b/package/x11r7/xlib_libXdmcp/xlib_libXdmcp.mk
index 51db9908e5..a79e2615db 100644
--- a/package/x11r7/xlib_libXdmcp/xlib_libXdmcp.mk
+++ b/package/x11r7/xlib_libXdmcp/xlib_libXdmcp.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-XLIB_LIBXDMCP_VERSION = 1.1.3
-XLIB_LIBXDMCP_SOURCE = libXdmcp-$(XLIB_LIBXDMCP_VERSION).tar.bz2
-XLIB_LIBXDMCP_SITE = http://xorg.freedesktop.org/releases/individual/lib
+XLIB_LIBXDMCP_VERSION = 1.1.4
+XLIB_LIBXDMCP_SOURCE = libXdmcp-$(XLIB_LIBXDMCP_VERSION).tar.xz
+XLIB_LIBXDMCP_SITE = https://xorg.freedesktop.org/archive/individual/lib
 XLIB_LIBXDMCP_LICENSE = MIT
 XLIB_LIBXDMCP_LICENSE_FILES = COPYING
 XLIB_LIBXDMCP_CPE_ID_VENDOR = x.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
