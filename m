Return-Path: <SRS0=85Xw=OA=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 720C6C433F5
	for <buildroot@archiver.kernel.org>; Fri, 10 Sep 2021 17:54:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1817D611CB
	for <buildroot@archiver.kernel.org>; Fri, 10 Sep 2021 17:54:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1817D611CB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DCE7D40275;
	Fri, 10 Sep 2021 17:54:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mq-ryT5BNFup; Fri, 10 Sep 2021 17:54:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id F16E740209;
	Fri, 10 Sep 2021 17:54:11 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id F10121BF9C8
 for <buildroot@lists.busybox.net>; Fri, 10 Sep 2021 17:53:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E17B883E74
 for <buildroot@lists.busybox.net>; Fri, 10 Sep 2021 17:53:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ET8NL3Mjeabd for <buildroot@lists.busybox.net>;
 Fri, 10 Sep 2021 17:53:32 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id D3AF880E99
 for <buildroot@buildroot.org>; Fri, 10 Sep 2021 17:53:32 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id B07F688DB2; Fri, 10 Sep 2021 17:51:56 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 10 Sep 2021 19:52:23 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0476b4f2fad9077008cc5cb8a45296b0da3ebb30
X-Git-Newrev: d3355d8625b61438a6d981e51ec40dc231012590
X-Patchwork-Hint: ignore
Message-Id: <20210910175156.B07F688DB2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/x11r7/xlib_libXft: bump version to
 2.3.4
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

commit: https://git.buildroot.net/buildroot/commit/?id=d3355d8625b61438a6d981e51ec40dc231012590
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes:
https://lists.x.org/archives/xorg-announce/2021-August/003104.html

Removed md5 and sha1 hashes, reformatted hashes, updated _SITE.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/x11r7/xlib_libXft/xlib_libXft.hash | 10 ++++------
 package/x11r7/xlib_libXft/xlib_libXft.mk   |  4 ++--
 2 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/package/x11r7/xlib_libXft/xlib_libXft.hash b/package/x11r7/xlib_libXft/xlib_libXft.hash
index bd0838b4dd..8743a9b7d1 100644
--- a/package/x11r7/xlib_libXft/xlib_libXft.hash
+++ b/package/x11r7/xlib_libXft/xlib_libXft.hash
@@ -1,7 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2019-March/002976.html
-md5 4a433c24627b4ff60a4dd403a0990796  libXft-2.3.3.tar.bz2
-sha1 48f543fe495f545df1794fa36a0a708558ae298c  libXft-2.3.3.tar.bz2
-sha256 225c68e616dd29dbb27809e45e9eadf18e4d74c50be43020ef20015274529216  libXft-2.3.3.tar.bz2
-sha512 28fdaf3baa3b156a4a7fdd6e39c4d8026d7d21eaa9be27c9797c8d329dab691a1bc82ea6042f9d4729a9343d93787536fb7e4b606f722f33cbe608b2e79910e8  libXft-2.3.3.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2021-August/003104.html
+sha256  57dedaab20914002146bdae0cb0c769ba3f75214c4c91bd2613d6ef79fc9abdd  libXft-2.3.4.tar.bz2
+sha512  5bb019750982ed4643880efd7368bc226ad49cfa8c0c8c6d4614dfeed74f588c65e1ba69adcc12284ec07d841e5b58fc1c27f3fddf83fe1a2837b29dd9ecec51  libXft-2.3.4.tar.bz2
 # Locally computed
-sha256 7cda22286b1379b9b73df695f72cbad36595e65b039a5fbc5c89b69ecc44438c  COPYING
+sha256  7cda22286b1379b9b73df695f72cbad36595e65b039a5fbc5c89b69ecc44438c  COPYING
diff --git a/package/x11r7/xlib_libXft/xlib_libXft.mk b/package/x11r7/xlib_libXft/xlib_libXft.mk
index 489cfe4c56..b1640a6613 100644
--- a/package/x11r7/xlib_libXft/xlib_libXft.mk
+++ b/package/x11r7/xlib_libXft/xlib_libXft.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-XLIB_LIBXFT_VERSION = 2.3.3
+XLIB_LIBXFT_VERSION = 2.3.4
 XLIB_LIBXFT_SOURCE = libXft-$(XLIB_LIBXFT_VERSION).tar.bz2
-XLIB_LIBXFT_SITE = http://xorg.freedesktop.org/releases/individual/lib
+XLIB_LIBXFT_SITE = https://xorg.freedesktop.org/archive/individual/lib
 XLIB_LIBXFT_LICENSE = MIT
 XLIB_LIBXFT_LICENSE_FILES = COPYING
 XLIB_LIBXFT_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
