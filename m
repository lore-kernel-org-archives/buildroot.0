Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CC4AC4332F
	for <buildroot@archiver.kernel.org>; Fri,  9 Dec 2022 17:02:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2598140492;
	Fri,  9 Dec 2022 17:02:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2598140492
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fZ9N50fHPNZu; Fri,  9 Dec 2022 17:02:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4850240012;
	Fri,  9 Dec 2022 17:02:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4850240012
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0B97E1BF37A
 for <buildroot@lists.busybox.net>; Fri,  9 Dec 2022 17:01:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B63B14103F
 for <buildroot@lists.busybox.net>; Fri,  9 Dec 2022 17:01:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B63B14103F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id R61mWCioyboG for <buildroot@lists.busybox.net>;
 Fri,  9 Dec 2022 17:01:03 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1259D40012
 for <buildroot@buildroot.org>; Fri,  9 Dec 2022 17:01:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1259D40012
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 00F3285EA0; Fri,  9 Dec 2022 17:01:03 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Fri, 9 Dec 2022 17:31:25 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 38e38370277366777ba850608c38f528f152a1e8
X-Git-Newrev: d6e3bcfb376b59a2503f111b6339202752b794c9
X-Patchwork-Hint: ignore
Message-Id: <20221209170103.00F3285EA0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/x11r7/xlib_libXxf86dga: bump
 version to 1.1.6
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

commit: https://git.buildroot.net/buildroot/commit/?id=d6e3bcfb376b59a2503f111b6339202752b794c9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://lists.x.org/archives/xorg-announce/2022-December/003281.html
Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/x11r7/xlib_libXxf86dga/xlib_libXxf86dga.hash | 8 +++-----
 package/x11r7/xlib_libXxf86dga/xlib_libXxf86dga.mk   | 4 ++--
 2 files changed, 5 insertions(+), 7 deletions(-)

diff --git a/package/x11r7/xlib_libXxf86dga/xlib_libXxf86dga.hash b/package/x11r7/xlib_libXxf86dga/xlib_libXxf86dga.hash
index 1b05624783..9057d4e8e2 100644
--- a/package/x11r7/xlib_libXxf86dga/xlib_libXxf86dga.hash
+++ b/package/x11r7/xlib_libXxf86dga/xlib_libXxf86dga.hash
@@ -1,7 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2019-March/002982.html
-md5  0ddeafc13b33086357cfa96fae41ee8e  libXxf86dga-1.1.5.tar.bz2
-sha1  332ba80d1b3d06473f7bbfe1612e7c5b58fbdf69  libXxf86dga-1.1.5.tar.bz2
-sha256  2b98bc5f506c6140d4eddd3990842d30f5dae733b64f198a504f07461bdb7203  libXxf86dga-1.1.5.tar.bz2
-sha512  0e77c4003aeba737b10c17d55aeefa935fc57c4ba9e8f79a834f3f8c690d6a1d98f69ad707eded784346c1cf40c41829719d257283b5eae3207147fb4c79ed89  libXxf86dga-1.1.5.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2022-December/003281.html
+sha256  be44427579808fe3a217d59f51cae756a26913eb6e4c8738ccab65ff56d7980f  libXxf86dga-1.1.6.tar.xz
+sha512  61f7954471df63840ffb5e82347018e285d30d64d4d0a97770ca031c8554a0f52d1b007ab8342a283cd2f0d534f564fb59f57ec92515714f20a7d145912c65d9  libXxf86dga-1.1.6.tar.xz
 # Locally computed
 sha256  dd27933ebc5c063128b158b085e4c442a36b0e6f704cf753116da119610191da  COPYING
diff --git a/package/x11r7/xlib_libXxf86dga/xlib_libXxf86dga.mk b/package/x11r7/xlib_libXxf86dga/xlib_libXxf86dga.mk
index a5173fbc7c..1094e1a1ad 100644
--- a/package/x11r7/xlib_libXxf86dga/xlib_libXxf86dga.mk
+++ b/package/x11r7/xlib_libXxf86dga/xlib_libXxf86dga.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-XLIB_LIBXXF86DGA_VERSION = 1.1.5
-XLIB_LIBXXF86DGA_SOURCE = libXxf86dga-$(XLIB_LIBXXF86DGA_VERSION).tar.bz2
+XLIB_LIBXXF86DGA_VERSION = 1.1.6
+XLIB_LIBXXF86DGA_SOURCE = libXxf86dga-$(XLIB_LIBXXF86DGA_VERSION).tar.xz
 XLIB_LIBXXF86DGA_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBXXF86DGA_LICENSE = MIT
 XLIB_LIBXXF86DGA_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
