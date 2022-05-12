Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E30AFC433EF
	for <buildroot@archiver.kernel.org>; Thu, 12 May 2022 18:55:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A108340153;
	Thu, 12 May 2022 18:55:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zpJ3codLrC7B; Thu, 12 May 2022 18:55:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 73A0540132;
	Thu, 12 May 2022 18:55:57 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 781B61C1189
 for <buildroot@lists.busybox.net>; Thu, 12 May 2022 18:54:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 54DFE40108
 for <buildroot@lists.busybox.net>; Thu, 12 May 2022 18:54:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id J9FEJV1cEifK for <buildroot@lists.busybox.net>;
 Thu, 12 May 2022 18:53:59 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mailout05.t-online.de (mailout05.t-online.de [194.25.134.82])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7343D400FB
 for <buildroot@buildroot.org>; Thu, 12 May 2022 18:53:59 +0000 (UTC)
Received: from fwd89.dcpf.telekom.de (fwd89.aul.t-online.de [10.223.144.115])
 by mailout05.t-online.de (Postfix) with SMTP id 5E37035CC
 for <buildroot@buildroot.org>; Thu, 12 May 2022 20:53:56 +0200 (CEST)
Received: from fli4l.lan.fli4l ([79.214.203.41]) by fwd89.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1npDwh-0Fmf3p0; Thu, 12 May 2022 20:53:55 +0200
Received: from bruckner.lan.fli4l ([192.168.1.1]:48510)
 by fli4l.lan.fli4l with esmtp (Exim 4.95)
 (envelope-from <bernd.kuhls@t-online.de>) id 1npDwh-0004aZ-HQ
 for buildroot@buildroot.org; Thu, 12 May 2022 20:53:55 +0200
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Thu, 12 May 2022 20:53:31 +0200
Message-Id: <20220512185355.873825-1-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1652381635-0000F5B3-5BD16137/0/0 CLEAN NORMAL
X-TOI-MSGID: d4fb16f7-5af6-450c-86de-f4413b0f1f52
Subject: [Buildroot] [PATCH 01/25] package/x11r7/xlib_libXvMC: bump version
 to 1.0.13
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

Release notes:
https://lists.x.org/archives/xorg-announce/2022-March/003132.html

Removed md5 and sha1 hashes, not provided by upstream anymore.
Reformatted license hash.
Switched tarball to upstream-provided .xz format.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xlib_libXvMC/xlib_libXvMC.hash | 11 ++++-------
 package/x11r7/xlib_libXvMC/xlib_libXvMC.mk   |  4 ++--
 2 files changed, 6 insertions(+), 9 deletions(-)

diff --git a/package/x11r7/xlib_libXvMC/xlib_libXvMC.hash b/package/x11r7/xlib_libXvMC/xlib_libXvMC.hash
index be4ba751aa..15221969e3 100644
--- a/package/x11r7/xlib_libXvMC/xlib_libXvMC.hash
+++ b/package/x11r7/xlib_libXvMC/xlib_libXvMC.hash
@@ -1,8 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2019-September/003023.html
-md5 3569ff7f3e26864d986d6a21147eaa58  libXvMC-1.0.12.tar.bz2
-sha1 4871f92a83faa86aff5c630a2d6016c67bf11b97  libXvMC-1.0.12.tar.bz2
-sha256 6b3da7977b3f7eaf4f0ac6470ab1e562298d82c4e79077765787963ab7966dcd  libXvMC-1.0.12.tar.bz2
-sha512 62cb9a72b20af3b081d2d555a253b0e2b8b26b31f4fad10bd3e53bbf96e1663b61bd8df2b78b16f18218cd37cce0c9e6809ae16ded226b37a8b199e41b223955  libXvMC-1.0.12.tar.bz2
-
+# From https://lists.x.org/archives/xorg-announce/2022-March/003132.html
+sha256  0a9ebe6dea7888a747e5aca1b891d53cd7d3a5f141a9645f77d9b6a12cee657c  libXvMC-1.0.13.tar.xz
+sha512  c9d0f73884a586efb9ea4f77fc8555f60d940077d7dff8eaa765b86345c8b4e3d80b860f68191d2830c272b9e464c08450fbb51bb64819753a6f4228c71861ac  libXvMC-1.0.13.tar.xz
 # Locally computed
-sha256 b7c709df281675a07eb60a71c5fa2599d1ef538eb79ae7ad6e774b10e4a804c4  COPYING
+sha256  b7c709df281675a07eb60a71c5fa2599d1ef538eb79ae7ad6e774b10e4a804c4  COPYING
diff --git a/package/x11r7/xlib_libXvMC/xlib_libXvMC.mk b/package/x11r7/xlib_libXvMC/xlib_libXvMC.mk
index 7980f17493..c1fe31277e 100644
--- a/package/x11r7/xlib_libXvMC/xlib_libXvMC.mk
+++ b/package/x11r7/xlib_libXvMC/xlib_libXvMC.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-XLIB_LIBXVMC_VERSION = 1.0.12
-XLIB_LIBXVMC_SOURCE = libXvMC-$(XLIB_LIBXVMC_VERSION).tar.bz2
+XLIB_LIBXVMC_VERSION = 1.0.13
+XLIB_LIBXVMC_SOURCE = libXvMC-$(XLIB_LIBXVMC_VERSION).tar.xz
 XLIB_LIBXVMC_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBXVMC_LICENSE = MIT
 XLIB_LIBXVMC_LICENSE_FILES = COPYING
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
