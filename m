Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9F1EC433EF
	for <buildroot@archiver.kernel.org>; Sun, 12 Dec 2021 08:49:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2A1BB42079;
	Sun, 12 Dec 2021 08:49:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XhsOBWaodOcQ; Sun, 12 Dec 2021 08:49:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7A2014206E;
	Sun, 12 Dec 2021 08:49:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id AF8251BF303
 for <buildroot@lists.busybox.net>; Sun, 12 Dec 2021 08:49:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 97CF560C0D
 for <buildroot@lists.busybox.net>; Sun, 12 Dec 2021 08:49:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Q-vgM12zHwQh for <buildroot@lists.busybox.net>;
 Sun, 12 Dec 2021 08:49:05 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mailout07.t-online.de (mailout07.t-online.de [194.25.134.83])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5FC2D60BFE
 for <buildroot@buildroot.org>; Sun, 12 Dec 2021 08:49:04 +0000 (UTC)
Received: from fwd87.dcpf.telekom.de (fwd87.aul.t-online.de [10.223.144.113])
 by mailout07.t-online.de (Postfix) with SMTP id 207B83D57
 for <buildroot@buildroot.org>; Sun, 12 Dec 2021 09:49:01 +0100 (CET)
Received: from fli4l.lan.fli4l ([84.161.180.123]) by fwd87.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1mwKXS-30mbgX0; Sun, 12 Dec 2021 09:48:58 +0100
Received: from bruckner.lan.fli4l ([192.168.1.1]:49402)
 by fli4l.lan.fli4l with esmtp (Exim 4.95)
 (envelope-from <bernd.kuhls@t-online.de>) id 1mwKXR-0000VK-Mo
 for buildroot@buildroot.org; Sun, 12 Dec 2021 09:48:57 +0100
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Sun, 12 Dec 2021 09:48:57 +0100
Message-Id: <20211212084857.127023-2-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211212084857.127023-1-bernd.kuhls@t-online.de>
References: <20211212084857.127023-1-bernd.kuhls@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1639298938-00001457-A9363239/0/0 CLEAN NORMAL
X-TOI-MSGID: 29bcb041-26fc-4dc8-a641-047ee3a5a3f4
Subject: [Buildroot] [PATCH 2/2] package/x11r7/xlib_libX11: bump version to
 1.7.3.1
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Upstream switched from bz2 to xz tarball.

Release notes:
https://lists.x.org/archives/xorg-announce/2021-December/003120.html
https://lists.x.org/archives/xorg-announce/2021-December/003121.html

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xlib_libX11/xlib_libX11.hash | 6 +++---
 package/x11r7/xlib_libX11/xlib_libX11.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/x11r7/xlib_libX11/xlib_libX11.hash b/package/x11r7/xlib_libX11/xlib_libX11.hash
index 7aeef33446..126be07f03 100644
--- a/package/x11r7/xlib_libX11/xlib_libX11.hash
+++ b/package/x11r7/xlib_libX11/xlib_libX11.hash
@@ -1,6 +1,6 @@
-# From https://lists.x.org/archives/xorg-announce/2021-June/003092.html
-sha256  1cfa35e37aaabbe4792e9bb690468efefbfbf6b147d9c69d6f90d13c3092ea6c  libX11-1.7.2.tar.bz2
-sha512  d01e5c1848c76218605e5af2d353de6b301a251555b52a38dbe930e6635d5e8a92d1486eb6d328ad5d42a5939e0d16868ffa19a75e5a7863d1a32e0d0727bdc7  libX11-1.7.2.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2021-December/003121.html
+sha256  2ffd417266fb875028fdc0ef349694f63dbcd76d0b0cfacfb52e6151f4b60989  libX11-1.7.3.1.tar.xz
+sha512  a2620076db4bf35ab94706c8ab714e9c3fecbdd533cf99cdffeabaf49a1a1d30a233eb2dc76da51b01d50c43f11780aa3b2936668d982a33fa7d5008be44e25b  libX11-1.7.3.1.tar.xz
 
 # Locally computed
 sha256  2daec087a88e7c9b8082557cdeebad5bbb8155a4137472f0b22e269cd99d0c1e  COPYING
diff --git a/package/x11r7/xlib_libX11/xlib_libX11.mk b/package/x11r7/xlib_libX11/xlib_libX11.mk
index aa3ebf1593..a8dc7f3668 100644
--- a/package/x11r7/xlib_libX11/xlib_libX11.mk
+++ b/package/x11r7/xlib_libX11/xlib_libX11.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-XLIB_LIBX11_VERSION = 1.7.2
-XLIB_LIBX11_SOURCE = libX11-$(XLIB_LIBX11_VERSION).tar.bz2
+XLIB_LIBX11_VERSION = 1.7.3.1
+XLIB_LIBX11_SOURCE = libX11-$(XLIB_LIBX11_VERSION).tar.xz
 XLIB_LIBX11_SITE = https://xorg.freedesktop.org/archive/individual/lib
 XLIB_LIBX11_LICENSE = MIT
 XLIB_LIBX11_LICENSE_FILES = COPYING
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
