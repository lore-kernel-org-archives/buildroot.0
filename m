Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F12C5C4332F
	for <buildroot@archiver.kernel.org>; Fri,  9 Dec 2022 17:11:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9F79A820F2;
	Fri,  9 Dec 2022 17:11:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9F79A820F2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AZFfD6RDTKAE; Fri,  9 Dec 2022 17:11:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E71FD80FA2;
	Fri,  9 Dec 2022 17:10:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E71FD80FA2
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 042721BF37A
 for <buildroot@lists.busybox.net>; Fri,  9 Dec 2022 17:01:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1EC5D41023
 for <buildroot@lists.busybox.net>; Fri,  9 Dec 2022 17:01:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1EC5D41023
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ozg9B9uCO4Ma for <buildroot@lists.busybox.net>;
 Fri,  9 Dec 2022 17:01:09 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 514FD41028
 for <buildroot@buildroot.org>; Fri,  9 Dec 2022 17:01:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 514FD41028
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4160085EA1; Fri,  9 Dec 2022 17:01:04 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Fri, 9 Dec 2022 17:34:15 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c93b50a34a3f46c27fd21c72332c7fde18e0a3f8
X-Git-Newrev: c999fb9a0527e371f4d9f433436afcc1dc88d4af
X-Patchwork-Hint: ignore
Message-Id: <20221209170104.4160085EA1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/x11r7/xapp_xfsinfo: bump version
 to 1.0.7
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

commit: https://git.buildroot.net/buildroot/commit/?id=c999fb9a0527e371f4d9f433436afcc1dc88d4af
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://lists.x.org/archives/xorg-announce/2022-October/003238.html
Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/x11r7/xapp_xfsinfo/xapp_xfsinfo.hash | 8 +++-----
 package/x11r7/xapp_xfsinfo/xapp_xfsinfo.mk   | 6 +++---
 2 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/package/x11r7/xapp_xfsinfo/xapp_xfsinfo.hash b/package/x11r7/xapp_xfsinfo/xapp_xfsinfo.hash
index dbdf8e0eda..7d5976473d 100644
--- a/package/x11r7/xapp_xfsinfo/xapp_xfsinfo.hash
+++ b/package/x11r7/xapp_xfsinfo/xapp_xfsinfo.hash
@@ -1,7 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2019-February/002949.html
-md5  0060d6151427d9e570e54fc52a88e7d7  xfsinfo-1.0.6.tar.bz2
-sha1  cbfe7470179f1ab5eecf992226dc1b28902c6b4c  xfsinfo-1.0.6.tar.bz2
-sha256  8a3e8b9b9ae6ed571989d04e1846d39b9043e28f7623b500ebe1d47762c9b1d6  xfsinfo-1.0.6.tar.bz2
-sha512  901fc3817d7c95f2ba75ed0c51de91abd8efa67bbb93ad6b7d66e56a2f721af9db364e92f9ef2e719835fd48e934a5ea7402e5565c0ccd9b6b82633e869dc57b  xfsinfo-1.0.6.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2022-October/003238.html
+sha256  92f3ca451cba7717eed15f80de3c123aa56c82a1ee7d6e9116ba513021b98874  xfsinfo-1.0.7.tar.xz
+sha512  1914916bf995c08a520bd009ddfa57c7e4a997a829380232d359f9bf68852c67650efb8f1fe3cc8a11889b2ec067f50ac38df711ffaf4536802a0b530dc1789c  xfsinfo-1.0.7.tar.xz
 # Locally computed
 sha256  bae01fa08f30f21f9cfb75e8339d081b34e5e03d12677177f85a55b0ca41d0db  COPYING
diff --git a/package/x11r7/xapp_xfsinfo/xapp_xfsinfo.mk b/package/x11r7/xapp_xfsinfo/xapp_xfsinfo.mk
index bef9787ffe..29e9fc75c4 100644
--- a/package/x11r7/xapp_xfsinfo/xapp_xfsinfo.mk
+++ b/package/x11r7/xapp_xfsinfo/xapp_xfsinfo.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-XAPP_XFSINFO_VERSION = 1.0.6
-XAPP_XFSINFO_SOURCE = xfsinfo-$(XAPP_XFSINFO_VERSION).tar.bz2
-XAPP_XFSINFO_SITE = http://xorg.freedesktop.org/releases/individual/app
+XAPP_XFSINFO_VERSION = 1.0.7
+XAPP_XFSINFO_SOURCE = xfsinfo-$(XAPP_XFSINFO_VERSION).tar.xz
+XAPP_XFSINFO_SITE = https://xorg.freedesktop.org/archive/individual/app
 XAPP_XFSINFO_LICENSE = MIT
 XAPP_XFSINFO_LICENSE_FILES = COPYING
 XAPP_XFSINFO_DEPENDENCIES = xlib_libFS xlib_libX11
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
