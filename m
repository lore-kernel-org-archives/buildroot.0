Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50528C4332F
	for <buildroot@archiver.kernel.org>; Fri,  9 Dec 2022 17:04:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E881D40CE2;
	Fri,  9 Dec 2022 17:04:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E881D40CE2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IE8KYNzorpaW; Fri,  9 Dec 2022 17:04:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2C6F4402F3;
	Fri,  9 Dec 2022 17:04:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2C6F4402F3
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 939641BF973
 for <buildroot@lists.busybox.net>; Fri,  9 Dec 2022 17:01:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0F13441A55
 for <buildroot@lists.busybox.net>; Fri,  9 Dec 2022 17:01:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0F13441A55
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id f2Z-RnYQ0m7i for <buildroot@lists.busybox.net>;
 Fri,  9 Dec 2022 17:01:03 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 22C4A41A67
 for <buildroot@buildroot.org>; Fri,  9 Dec 2022 17:01:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 22C4A41A67
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 126F185EA6; Fri,  9 Dec 2022 17:01:03 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Fri, 9 Dec 2022 17:31:30 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: bc8b91fdadd8abf22035c127bcd2bbb5961cf43e
X-Git-Newrev: 8929d19dfba43af98ae1c981131e33d366f45e8a
X-Patchwork-Hint: ignore
Message-Id: <20221209170103.126F185EA6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/x11r7/xlib_libXScrnSaver: bump
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

commit: https://git.buildroot.net/buildroot/commit/?id=8929d19dfba43af98ae1c981131e33d366f45e8a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://lists.x.org/archives/xorg-announce/2022-December/003279.html
Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/x11r7/xlib_libXScrnSaver/xlib_libXScrnSaver.hash | 8 +++-----
 package/x11r7/xlib_libXScrnSaver/xlib_libXScrnSaver.mk   | 6 +++---
 2 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/package/x11r7/xlib_libXScrnSaver/xlib_libXScrnSaver.hash b/package/x11r7/xlib_libXScrnSaver/xlib_libXScrnSaver.hash
index 01f468b77a..a32997e1fe 100644
--- a/package/x11r7/xlib_libXScrnSaver/xlib_libXScrnSaver.hash
+++ b/package/x11r7/xlib_libXScrnSaver/xlib_libXScrnSaver.hash
@@ -1,7 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2018-July/002906.html
-md5  eeea9d5af3e6c143d0ea1721d27a5e49  libXScrnSaver-1.2.3.tar.bz2
-sha1  70c791c5755a298ecf1a0823e239a24fa4b2b42f  libXScrnSaver-1.2.3.tar.bz2
-sha256  f917075a1b7b5a38d67a8b0238eaab14acd2557679835b154cf2bca576e89bf8  libXScrnSaver-1.2.3.tar.bz2
-sha512  7ea628324a11b25ee82c7b11c6bf98f37de219354de51c1e29467b5de422669ba1ab121f3b9dc674093c8f3960e93c5d5428122f5539092f79bc8451c768354a  libXScrnSaver-1.2.3.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2022-December/003279.html
+sha256  75cd2859f38e207a090cac980d76bc71e9da99d48d09703584e00585abc920fe  libXScrnSaver-1.2.4.tar.xz
+sha512  e4395af85f8496618afb23ffdaca1a75f5e3d213478d8dc73249cbc9840d7b993ba7513dbf6015cb38b48fe3f2223496365158a148dd5e1ac7475c5ee569e28c  libXScrnSaver-1.2.4.tar.xz
 # Locally computed
 sha256  5cf3e16f5dd753a4c0853e8227134ab65f5562d9ef89b1a2d7681f5c8ac9feb5  COPYING
diff --git a/package/x11r7/xlib_libXScrnSaver/xlib_libXScrnSaver.mk b/package/x11r7/xlib_libXScrnSaver/xlib_libXScrnSaver.mk
index 92abb902eb..55ae7a6801 100644
--- a/package/x11r7/xlib_libXScrnSaver/xlib_libXScrnSaver.mk
+++ b/package/x11r7/xlib_libXScrnSaver/xlib_libXScrnSaver.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-XLIB_LIBXSCRNSAVER_VERSION = 1.2.3
-XLIB_LIBXSCRNSAVER_SOURCE = libXScrnSaver-$(XLIB_LIBXSCRNSAVER_VERSION).tar.bz2
-XLIB_LIBXSCRNSAVER_SITE = http://xorg.freedesktop.org/releases/individual/lib
+XLIB_LIBXSCRNSAVER_VERSION = 1.2.4
+XLIB_LIBXSCRNSAVER_SOURCE = libXScrnSaver-$(XLIB_LIBXSCRNSAVER_VERSION).tar.xz
+XLIB_LIBXSCRNSAVER_SITE = https://xorg.freedesktop.org/archive/individual/lib
 XLIB_LIBXSCRNSAVER_LICENSE = MIT
 XLIB_LIBXSCRNSAVER_LICENSE_FILES = COPYING
 XLIB_LIBXSCRNSAVER_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
