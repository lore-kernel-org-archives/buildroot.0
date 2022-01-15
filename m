Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 253D7C433F5
	for <buildroot@archiver.kernel.org>; Sat, 15 Jan 2022 11:04:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D26C9408CD;
	Sat, 15 Jan 2022 11:04:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gu0zQniuq8c0; Sat, 15 Jan 2022 11:04:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 314E7408C7;
	Sat, 15 Jan 2022 11:04:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3966F1BF5DD
 for <buildroot@lists.busybox.net>; Sat, 15 Jan 2022 11:01:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 540C680BD8
 for <buildroot@lists.busybox.net>; Sat, 15 Jan 2022 11:01:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xKfxbKuIlM1p for <buildroot@lists.busybox.net>;
 Sat, 15 Jan 2022 11:01:54 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 71BAE80BE8
 for <buildroot@buildroot.org>; Sat, 15 Jan 2022 11:01:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 83CD4829FE; Sat, 15 Jan 2022 10:55:26 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 15 Jan 2022 11:58:14 +0100
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: 0a110aa56451bbe0b5713812b44b99e473b69afd
X-Git-Newrev: c0fe00a878c573663e2cb1cab3ecd8f68eecd340
X-Patchwork-Hint: ignore
Message-Id: <20220115105526.83CD4829FE@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x]
 package/x11r7/xlib_libX11: bump version to 1.7.3.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=c0fe00a878c573663e2cb1cab3ecd8f68eecd340
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

Upstream switched from bz2 to xz tarball.

Release notes:
https://lists.x.org/archives/xorg-announce/2021-December/003120.html
https://lists.x.org/archives/xorg-announce/2021-December/003121.html

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit e39d5fb074807ee2e1725549d555153262626e41)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
