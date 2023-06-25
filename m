Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBA9BEB64DC
	for <buildroot@archiver.kernel.org>; Sun, 25 Jun 2023 15:03:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 811BA40297;
	Sun, 25 Jun 2023 15:03:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 811BA40297
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fLcXpU-G4dL0; Sun, 25 Jun 2023 15:03:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4D1C0416C4;
	Sun, 25 Jun 2023 15:03:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4D1C0416C4
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1466E1BF909
 for <buildroot@lists.busybox.net>; Sun, 25 Jun 2023 15:01:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 75EAF81C46
 for <buildroot@lists.busybox.net>; Sun, 25 Jun 2023 15:01:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 75EAF81C46
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bgo123xHBqcK for <buildroot@lists.busybox.net>;
 Sun, 25 Jun 2023 15:01:10 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id F0CEC81CDB
 for <buildroot@buildroot.org>; Sun, 25 Jun 2023 15:01:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F0CEC81CDB
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E14C084AD3; Sun, 25 Jun 2023 15:01:09 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 25 Jun 2023 16:43:58 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 247f17f9af35037c766b0f34deebcf01646d2b22
X-Git-Newrev: ecffe389a27c35cd2044f9dfea1b4d3ef20aeacf
X-Patchwork-Hint: ignore
Message-Id: <20230625150109.E14C084AD3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/x11r7/xlib_libdmx: bump version to
 1.1.5
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=ecffe389a27c35cd2044f9dfea1b4d3ef20aeacf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes:
https://lists.x.org/archives/xorg-announce/2023-June/003403.html

Switched tarball to xz and _SITE to https.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/x11r7/xlib_libdmx/xlib_libdmx.hash | 8 +++-----
 package/x11r7/xlib_libdmx/xlib_libdmx.mk   | 6 +++---
 2 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/package/x11r7/xlib_libdmx/xlib_libdmx.hash b/package/x11r7/xlib_libdmx/xlib_libdmx.hash
index e9d8616ba4..8a4b13099e 100644
--- a/package/x11r7/xlib_libdmx/xlib_libdmx.hash
+++ b/package/x11r7/xlib_libdmx/xlib_libdmx.hash
@@ -1,7 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2018-May/002894.html
-md5  d2f1f0ec68ac3932dd7f1d9aa0a7a11c  libdmx-1.1.4.tar.bz2
-sha1  499e2540ca0e94ca858037865243c3c60908fd94  libdmx-1.1.4.tar.bz2
-sha256  253f90005d134fa7a209fbcbc5a3024335367c930adf0f3203e754cf32747243  libdmx-1.1.4.tar.bz2
-sha512  77aba6cadfd17db0cc7e1bc26f14d908223a0fdb135d46f86c3be34e3bc7e2f843f08d4d0ef773357e83b17122bffe56a0442d12908378c05a22177b10ae10e9  libdmx-1.1.4.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2023-June/003403.html
+sha256  35a4e26a8b0b2b4fe36441dca463645c3fa52d282ac3520501a38ea942cbf74f  libdmx-1.1.5.tar.xz
+sha512  55df45a06bddbf19e0253362853e2f979d736ba1f1fdec5d392c0f6c0dc72684e7b8df0f0a99ac96ce9d9d59bc6c25146086b18c054b4dbe6be9aa3166f23464  libdmx-1.1.5.tar.xz
 # Locally computed
 sha256  819e8dcd3dd2a44850c350331aa492230f86bccb0983dd739dec5ba36d7d2b8e  COPYING
diff --git a/package/x11r7/xlib_libdmx/xlib_libdmx.mk b/package/x11r7/xlib_libdmx/xlib_libdmx.mk
index 429595b5d7..9aaf81eb6f 100644
--- a/package/x11r7/xlib_libdmx/xlib_libdmx.mk
+++ b/package/x11r7/xlib_libdmx/xlib_libdmx.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-XLIB_LIBDMX_VERSION = 1.1.4
-XLIB_LIBDMX_SOURCE = libdmx-$(XLIB_LIBDMX_VERSION).tar.bz2
-XLIB_LIBDMX_SITE = http://xorg.freedesktop.org/releases/individual/lib
+XLIB_LIBDMX_VERSION = 1.1.5
+XLIB_LIBDMX_SOURCE = libdmx-$(XLIB_LIBDMX_VERSION).tar.xz
+XLIB_LIBDMX_SITE = https://xorg.freedesktop.org/archive/individual/lib
 XLIB_LIBDMX_LICENSE = MIT
 XLIB_LIBDMX_LICENSE_FILES = COPYING
 XLIB_LIBDMX_CPE_ID_VENDOR = x
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
