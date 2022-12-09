Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27675C636D6
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 21:43:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C31D045BE9;
	Mon, 20 Feb 2023 21:43:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C31D045BE9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AF6Xp9Ov-jwu; Mon, 20 Feb 2023 21:43:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6A94A42D5D;
	Mon, 20 Feb 2023 21:43:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6A94A42D5D
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8C56E1BF8C7
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:53:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 23407415D0
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:51:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 23407415D0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LnCqdtUFbvs2 for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:51:58 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 44B75415B3
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:51:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 44B75415B3
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 350BD86495; Mon, 20 Feb 2023 20:51:58 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Fri, 9 Dec 2022 17:34:13 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 51818b18b9a1fe1a5e0b31298f86cb80309ae9ab
X-Git-Newrev: c93b50a34a3f46c27fd21c72332c7fde18e0a3f8
X-Patchwork-Hint: ignore
Message-Id: <20230220205158.350BD86495@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/x11r7/xlib_libXrender:
 bump version to 0.9.11
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

commit: https://git.buildroot.net/buildroot/commit/?id=c93b50a34a3f46c27fd21c72332c7fde18e0a3f8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

https://lists.x.org/archives/xorg-announce/2022-October/003239.html
Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/x11r7/xlib_libXrender/xlib_libXrender.hash | 6 +++---
 package/x11r7/xlib_libXrender/xlib_libXrender.mk   | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/x11r7/xlib_libXrender/xlib_libXrender.hash b/package/x11r7/xlib_libXrender/xlib_libXrender.hash
index 680c765237..015fa0af21 100644
--- a/package/x11r7/xlib_libXrender/xlib_libXrender.hash
+++ b/package/x11r7/xlib_libXrender/xlib_libXrender.hash
@@ -1,5 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2016-October/002725.html
-sha256  c06d5979f86e64cabbde57c223938db0b939dff49fdb5a793a1d3d0396650949  libXrender-0.9.10.tar.bz2
-
+# From https://lists.x.org/archives/xorg-announce/2022-October/003239.html
+sha256  bc53759a3a83d1ff702fb59641b3d2f7c56e05051fa0cfa93501166fa782dc24  libXrender-0.9.11.tar.xz
+sha512  2327cc1b530382d81df29b8d579f801f1f990202107cc84506986bcf5d15010d414e9418987b200e3f222d188afce46f0d7754febcdca62a5fc1e541b3bb82de  libXrender-0.9.11.tar.xz
 # Locally calculated
 sha256  bbe1db89c48816c48248796adac91defd8fbde1141b145f01511781ab87f29a1  COPYING
diff --git a/package/x11r7/xlib_libXrender/xlib_libXrender.mk b/package/x11r7/xlib_libXrender/xlib_libXrender.mk
index 0ef0ec48d9..fd97c83cf6 100644
--- a/package/x11r7/xlib_libXrender/xlib_libXrender.mk
+++ b/package/x11r7/xlib_libXrender/xlib_libXrender.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-XLIB_LIBXRENDER_VERSION = 0.9.10
-XLIB_LIBXRENDER_SOURCE = libXrender-$(XLIB_LIBXRENDER_VERSION).tar.bz2
-XLIB_LIBXRENDER_SITE = http://xorg.freedesktop.org/releases/individual/lib
+XLIB_LIBXRENDER_VERSION = 0.9.11
+XLIB_LIBXRENDER_SOURCE = libXrender-$(XLIB_LIBXRENDER_VERSION).tar.xz
+XLIB_LIBXRENDER_SITE = https://xorg.freedesktop.org/archive/individual/lib
 XLIB_LIBXRENDER_LICENSE = MIT
 XLIB_LIBXRENDER_LICENSE_FILES = COPYING
 XLIB_LIBXRENDER_CPE_ID_VENDOR = x.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
