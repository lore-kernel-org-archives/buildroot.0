Return-Path: <SRS0=7Pu+=OC=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F1C7C433EF
	for <buildroot@archiver.kernel.org>; Sun, 12 Sep 2021 20:21:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C8AEE61076
	for <buildroot@archiver.kernel.org>; Sun, 12 Sep 2021 20:21:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C8AEE61076
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 89BCF4016B;
	Sun, 12 Sep 2021 20:21:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ear8LrqMOwn6; Sun, 12 Sep 2021 20:21:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 644284026F;
	Sun, 12 Sep 2021 20:21:23 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0E72C1BF404
 for <buildroot@lists.busybox.net>; Sun, 12 Sep 2021 20:16:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 282EE6073C
 for <buildroot@lists.busybox.net>; Sun, 12 Sep 2021 20:16:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yO1z0A3hlxjO for <buildroot@lists.busybox.net>;
 Sun, 12 Sep 2021 20:16:39 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2096160771
 for <buildroot@buildroot.org>; Sun, 12 Sep 2021 20:16:39 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 1F1B18A4C4; Sun, 12 Sep 2021 20:14:58 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 12 Sep 2021 20:47:27 +0200
X-Git-Refname: refs/heads/2021.08.x
X-Git-Oldrev: cbcb9a6ec145771a4f765d3b72664a09c86cea57
X-Git-Newrev: e9ee8a7cfdc6cc4ff53de0d0367500360984ed56
X-Patchwork-Hint: ignore
Message-Id: <20210912201458.1F1B18A4C4@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.08.x]
 package/x11r7/xlib_libXfont2: bump version to 2.0.5
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=e9ee8a7cfdc6cc4ff53de0d0367500360984ed56
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.08.x

Release notes:
https://lists.x.org/archives/xorg-announce/2021-August/003103.html

Removed patch which was applied upstream.
Removed md5 and sha1 hashes, reformatted hashes, updated _SITE.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit e6f8c403fe6c9909d2d3f5fd897c3057b7677192)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...-define-HAVE_LIBBSD-when-libbsd-was-found.patch | 30 ----------------------
 package/x11r7/xlib_libXfont2/xlib_libXfont2.hash   | 11 +++-----
 package/x11r7/xlib_libXfont2/xlib_libXfont2.mk     |  4 +--
 3 files changed, 6 insertions(+), 39 deletions(-)

diff --git a/package/x11r7/xlib_libXfont2/0001-configure-define-HAVE_LIBBSD-when-libbsd-was-found.patch b/package/x11r7/xlib_libXfont2/0001-configure-define-HAVE_LIBBSD-when-libbsd-was-found.patch
deleted file mode 100644
index 51e7225be6..0000000000
--- a/package/x11r7/xlib_libXfont2/0001-configure-define-HAVE_LIBBSD-when-libbsd-was-found.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From 5fceeeb0d1cdccdb2870f65444f2965344f3b8b9 Mon Sep 17 00:00:00 2001
-From: Bernd Kuhls <bernd.kuhls@t-online.de>
-Date: Sat, 19 Oct 2019 09:32:41 +0200
-Subject: [PATCH] configure: define HAVE_LIBBSD when libbsd was found
-
-Patch sent upstream:
-https://gitlab.freedesktop.org/xorg/lib/libxfont/merge_requests/6
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
----
- configure.ac | 3 +++
- 1 file changed, 3 insertions(+)
-
-diff --git a/configure.ac b/configure.ac
-index f507c28..cc7ca91 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -53,6 +53,9 @@ AC_CHECK_HEADERS([endian.h poll.h sys/poll.h])
- # Checks for library functions.
- AC_CHECK_FUNCS([poll readlink])
- AC_SEARCH_LIBS([strlcat], [bsd])
-+if test "$ac_cv_search_strlcat" = "-lbsd"; then
-+  AC_DEFINE(HAVE_LIBBSD,1,[Has libbsd])
-+fi
- AC_CONFIG_LIBOBJ_DIR([src/util])
- AC_REPLACE_FUNCS([reallocarray strlcat strlcpy])
- 
--- 
-2.20.1
-
diff --git a/package/x11r7/xlib_libXfont2/xlib_libXfont2.hash b/package/x11r7/xlib_libXfont2/xlib_libXfont2.hash
index 634affdfdb..069f2fc616 100644
--- a/package/x11r7/xlib_libXfont2/xlib_libXfont2.hash
+++ b/package/x11r7/xlib_libXfont2/xlib_libXfont2.hash
@@ -1,8 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2019-September/003022.html
-md5 00516bed7ec1453d56974560379fff2f  libXfont2-2.0.4.tar.bz2
-sha1 9e00ae7589315656435efaf330128facad7c4a57  libXfont2-2.0.4.tar.bz2
-sha256 6d151b3368e5035efede4b6264c0fdc6662c1c99dbc2de425e3480cababc69e6  libXfont2-2.0.4.tar.bz2
-sha512 7cf6c58e520e48e24fc4f05fec760fcbeaaac0cedeed57dded262c855e1515cc34cd033222945a0b016f6857b83009fc2a6946c7d632c2f7bb0060f8e8a8a106  libXfont2-2.0.4.tar.bz2
-
+# From https://lists.x.org/archives/xorg-announce/2021-August/003103.html
+sha256  aa7c6f211cf7215c0ab4819ed893dc98034363d7b930b844bb43603c2e10b53e  libXfont2-2.0.5.tar.bz2
+sha512  64d0635d14676bb645d61932afb177eb3808a46525b26e7ee31abc975eca75207743e85523fdd82b08010ce124eb4802338b508ee7b126875d2a3c12f8ac4faa  libXfont2-2.0.5.tar.bz2
 # Locally calculated
-sha256 97e413bb4962bbb5773085cd5405502bf1d4eadeaf98ff5be015eacacc840462  COPYING
+sha256  97e413bb4962bbb5773085cd5405502bf1d4eadeaf98ff5be015eacacc840462  COPYING
diff --git a/package/x11r7/xlib_libXfont2/xlib_libXfont2.mk b/package/x11r7/xlib_libXfont2/xlib_libXfont2.mk
index d2ff4ca7f3..6a71761f4e 100644
--- a/package/x11r7/xlib_libXfont2/xlib_libXfont2.mk
+++ b/package/x11r7/xlib_libXfont2/xlib_libXfont2.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-XLIB_LIBXFONT2_VERSION = 2.0.4
+XLIB_LIBXFONT2_VERSION = 2.0.5
 XLIB_LIBXFONT2_SOURCE = libXfont2-$(XLIB_LIBXFONT2_VERSION).tar.bz2
-XLIB_LIBXFONT2_SITE = http://xorg.freedesktop.org/releases/individual/lib
+XLIB_LIBXFONT2_SITE = https://xorg.freedesktop.org/archive/individual/lib
 XLIB_LIBXFONT2_LICENSE = MIT
 XLIB_LIBXFONT2_LICENSE_FILES = COPYING
 XLIB_LIBXFONT2_CPE_ID_VENDOR = x
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
