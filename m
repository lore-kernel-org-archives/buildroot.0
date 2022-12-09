Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F354CC61DA3
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 21:47:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9AF884EC03;
	Mon, 20 Feb 2023 21:47:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9AF884EC03
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ugaK77WqvjgU; Mon, 20 Feb 2023 21:47:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4F4BA4EC06;
	Mon, 20 Feb 2023 21:47:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4F4BA4EC06
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 134B31BF2E3
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:53:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 488596110C
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:51:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 488596110C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id t_CHNc_m8bd6 for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:51:56 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6EB3C610F9
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:51:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6EB3C610F9
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6B020828C8; Mon, 20 Feb 2023 20:51:56 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Fri, 9 Dec 2022 17:31:10 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 79a72dd0a5c8563533f75914d276022c401b3ffa
X-Git-Newrev: 1cfae45da9c35dd5e9a9bd8c42a8fb008d425f35
X-Patchwork-Hint: ignore
Message-Id: <20230220205156.6B020828C8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/x11r7/xlib_libxkbfile:
 bump version to 1.1.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=1cfae45da9c35dd5e9a9bd8c42a8fb008d425f35
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

https://lists.x.org/archives/xorg-announce/2022-December/003286.html
https://lists.x.org/archives/xorg-announce/2022-October/003227.html
Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/x11r7/xlib_libxkbfile/xlib_libxkbfile.hash | 8 +++-----
 package/x11r7/xlib_libxkbfile/xlib_libxkbfile.mk   | 4 ++--
 2 files changed, 5 insertions(+), 7 deletions(-)

diff --git a/package/x11r7/xlib_libxkbfile/xlib_libxkbfile.hash b/package/x11r7/xlib_libxkbfile/xlib_libxkbfile.hash
index 3f2ffdf09a..7e6199f16b 100644
--- a/package/x11r7/xlib_libxkbfile/xlib_libxkbfile.hash
+++ b/package/x11r7/xlib_libxkbfile/xlib_libxkbfile.hash
@@ -1,7 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2019-March/002977.html
-md5  dd7e1e946def674e78c0efbc5c7d5b3b  libxkbfile-1.1.0.tar.bz2
-sha1  487f314b6dbc17e93d0fe1e3741392156a9ca895  libxkbfile-1.1.0.tar.bz2
-sha256  758dbdaa20add2db4902df0b1b7c936564b7376c02a0acd1f2a331bd334b38c7  libxkbfile-1.1.0.tar.bz2
-sha512  1c6a57564e916ccdc3df3c49b9f3589f701df0cec55112c12ddc35ac3ed556608c28fe98e5ba0ac1962e9a65ed1e90eb7e6169b564951bf55a7cf3499b745826  libxkbfile-1.1.0.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2022-December/003286.html
+sha256  b8a3784fac420b201718047cfb6c2d5ee7e8b9481564c2667b4215f6616644b1  libxkbfile-1.1.2.tar.xz
+sha512  0639fad7b64b36a85f8d24cdd40085e0ec18d7a671793b8b5c26449e9cc5a84c37117e7757fb1238ac353044935dd00013e42166de5af9dec428e873a47e598d  libxkbfile-1.1.2.tar.xz
 # Locally computed
 sha256  e1b3fdad8037ab3f986ef9caaa7c8da47d8d55875e680c7d6011f6c07363ea7c  COPYING
diff --git a/package/x11r7/xlib_libxkbfile/xlib_libxkbfile.mk b/package/x11r7/xlib_libxkbfile/xlib_libxkbfile.mk
index 6b68496650..2e7f82922f 100644
--- a/package/x11r7/xlib_libxkbfile/xlib_libxkbfile.mk
+++ b/package/x11r7/xlib_libxkbfile/xlib_libxkbfile.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-XLIB_LIBXKBFILE_VERSION = 1.1.0
-XLIB_LIBXKBFILE_SOURCE = libxkbfile-$(XLIB_LIBXKBFILE_VERSION).tar.bz2
+XLIB_LIBXKBFILE_VERSION = 1.1.2
+XLIB_LIBXKBFILE_SOURCE = libxkbfile-$(XLIB_LIBXKBFILE_VERSION).tar.xz
 XLIB_LIBXKBFILE_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBXKBFILE_LICENSE = MIT
 XLIB_LIBXKBFILE_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
