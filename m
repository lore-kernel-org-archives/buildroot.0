Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32534C4332F
	for <buildroot@archiver.kernel.org>; Fri,  9 Dec 2022 17:10:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CE2D941B7C;
	Fri,  9 Dec 2022 17:10:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CE2D941B7C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xpC6yd70cQmS; Fri,  9 Dec 2022 17:10:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id AE6DF41B78;
	Fri,  9 Dec 2022 17:10:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AE6DF41B78
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 686091BF976
 for <buildroot@lists.busybox.net>; Fri,  9 Dec 2022 17:01:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9A04D60E24
 for <buildroot@lists.busybox.net>; Fri,  9 Dec 2022 17:01:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9A04D60E24
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zwCLOgD-rv8s for <buildroot@lists.busybox.net>;
 Fri,  9 Dec 2022 17:01:07 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 54F60611AA
 for <buildroot@buildroot.org>; Fri,  9 Dec 2022 17:01:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 54F60611AA
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5326E85EA0; Fri,  9 Dec 2022 17:01:04 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Fri, 9 Dec 2022 17:34:21 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f7f74ba0b3f8d5dd0dcf5af42e0622749e57a7e4
X-Git-Newrev: 8b42c06423c7b31b5fdc8d2d06bdec7cd059eb30
X-Patchwork-Hint: ignore
Message-Id: <20221209170104.5326E85EA0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/x11r7/xcb-util-renderutil: bump
 version to 0.3.10
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

commit: https://git.buildroot.net/buildroot/commit/?id=8b42c06423c7b31b5fdc8d2d06bdec7cd059eb30
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://lists.x.org/archives/xorg-announce/2022-October/003234.html
Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/x11r7/xcb-util-renderutil/xcb-util-renderutil.hash | 5 +++--
 package/x11r7/xcb-util-renderutil/xcb-util-renderutil.mk   | 6 +++---
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/package/x11r7/xcb-util-renderutil/xcb-util-renderutil.hash b/package/x11r7/xcb-util-renderutil/xcb-util-renderutil.hash
index 19ed9d4640..cb3ed55cea 100644
--- a/package/x11r7/xcb-util-renderutil/xcb-util-renderutil.hash
+++ b/package/x11r7/xcb-util-renderutil/xcb-util-renderutil.hash
@@ -1,4 +1,5 @@
-# From http://lists.x.org/archives/xorg-announce/2014-June/002446.html
-sha256  c6e97e48fb1286d6394dddb1c1732f00227c70bd1bedb7d1acabefdd340bea5b  xcb-util-renderutil-0.3.9.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2022-October/003234.html
+sha256  3e15d4f0e22d8ddbfbb9f5d77db43eacd7a304029bf25a6166cc63caa96d04ba  xcb-util-renderutil-0.3.10.tar.xz
+sha512  9cfa9201be2df7c0b832e1e1fe506e7c7a1e0f2b1b1d4a4b58620eadc241190a36478fa3ea27c32047fa79bf199f17dcd0b106853dbf5eda8cd584f3fc2b0c15  xcb-util-renderutil-0.3.10.tar.xz
 # Locally computed
 sha256  271169dd66674e9c396697af0b4822d1c59ccd2342b7740864d667a02963068b  COPYING
diff --git a/package/x11r7/xcb-util-renderutil/xcb-util-renderutil.mk b/package/x11r7/xcb-util-renderutil/xcb-util-renderutil.mk
index 9e6683bf3a..d15d19f7e2 100644
--- a/package/x11r7/xcb-util-renderutil/xcb-util-renderutil.mk
+++ b/package/x11r7/xcb-util-renderutil/xcb-util-renderutil.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-XCB_UTIL_RENDERUTIL_VERSION = 0.3.9
-XCB_UTIL_RENDERUTIL_SITE = http://xcb.freedesktop.org/dist
-XCB_UTIL_RENDERUTIL_SOURCE = xcb-util-renderutil-$(XCB_UTIL_RENDERUTIL_VERSION).tar.bz2
+XCB_UTIL_RENDERUTIL_VERSION = 0.3.10
+XCB_UTIL_RENDERUTIL_SITE = https://xorg.freedesktop.org/archive/individual/lib
+XCB_UTIL_RENDERUTIL_SOURCE = xcb-util-renderutil-$(XCB_UTIL_RENDERUTIL_VERSION).tar.xz
 XCB_UTIL_RENDERUTIL_LICENSE = MIT
 XCB_UTIL_RENDERUTIL_LICENSE_FILES = COPYING
 XCB_UTIL_RENDERUTIL_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
