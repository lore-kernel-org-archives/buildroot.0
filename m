Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AD6DC61DA3
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 21:58:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F1D884ED38;
	Mon, 20 Feb 2023 21:58:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F1D884ED38
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Q8MzdkA2XhE8; Mon, 20 Feb 2023 21:58:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B004C4ED45;
	Mon, 20 Feb 2023 21:58:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B004C4ED45
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 745C21BF2E3
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:54:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 46D5B61133
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:51:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 46D5B61133
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EuofiduRUF-u for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:51:58 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7142D6112C
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:51:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7142D6112C
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6FA0E8648F; Mon, 20 Feb 2023 20:51:58 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Fri, 9 Dec 2022 17:34:26 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: cd91f23a6ab9d0bb734fa8084275d81a39d300b2
X-Git-Newrev: f7b42852817e93423afeff64e637795d8ba80672
X-Patchwork-Hint: ignore
Message-Id: <20230220205158.6FA0E8648F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/x11r7/xcb-util-image:
 bump version to 0.4.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=f7b42852817e93423afeff64e637795d8ba80672
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

https://lists.x.org/archives/xorg-announce/2022-October/003231.html
Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/x11r7/xcb-util-image/xcb-util-image.hash | 5 +++--
 package/x11r7/xcb-util-image/xcb-util-image.mk   | 6 +++---
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/package/x11r7/xcb-util-image/xcb-util-image.hash b/package/x11r7/xcb-util-image/xcb-util-image.hash
index b2c42d6899..e200853e47 100644
--- a/package/x11r7/xcb-util-image/xcb-util-image.hash
+++ b/package/x11r7/xcb-util-image/xcb-util-image.hash
@@ -1,4 +1,5 @@
-# From http://lists.x.org/archives/xorg-announce/2014-October/002489.html
-sha256  2db96a37d78831d643538dd1b595d7d712e04bdccf8896a5e18ce0f398ea2ffc  xcb-util-image-0.4.0.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2022-October/003231.html
+sha256  ccad8ee5dadb1271fd4727ad14d9bd77a64e505608766c4e98267d9aede40d3d  xcb-util-image-0.4.1.tar.xz
+sha512  9b47ba38b91196d76541b6ccabeaf291d3b91036f15422909cd6a79b3fd1a9786d5b1728e411bc41cfdf3d60a253485f4ef7c65ffa6ae646fa93439ec782746e  xcb-util-image-0.4.1.tar.xz
 # License file, locally calculated
 sha256  19672c6153d8c4870abe734fa4dd2197481a311f4788d02ad729be07e116b26b  COPYING
diff --git a/package/x11r7/xcb-util-image/xcb-util-image.mk b/package/x11r7/xcb-util-image/xcb-util-image.mk
index 8ddb0be86d..446d545ef2 100644
--- a/package/x11r7/xcb-util-image/xcb-util-image.mk
+++ b/package/x11r7/xcb-util-image/xcb-util-image.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-XCB_UTIL_IMAGE_VERSION = 0.4.0
-XCB_UTIL_IMAGE_SITE = http://xcb.freedesktop.org/dist
-XCB_UTIL_IMAGE_SOURCE = xcb-util-image-$(XCB_UTIL_IMAGE_VERSION).tar.bz2
+XCB_UTIL_IMAGE_VERSION = 0.4.1
+XCB_UTIL_IMAGE_SITE = https://xorg.freedesktop.org/archive/individual/lib
+XCB_UTIL_IMAGE_SOURCE = xcb-util-image-$(XCB_UTIL_IMAGE_VERSION).tar.xz
 XCB_UTIL_IMAGE_INSTALL_STAGING = YES
 XCB_UTIL_IMAGE_LICENSE = MIT
 XCB_UTIL_IMAGE_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
