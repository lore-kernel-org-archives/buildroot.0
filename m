Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 834ABC04FDE
	for <buildroot@archiver.kernel.org>; Fri,  9 Dec 2022 17:10:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2924F40CE2;
	Fri,  9 Dec 2022 17:10:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2924F40CE2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id m3jC1y6lCtJ3; Fri,  9 Dec 2022 17:10:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6904E41004;
	Fri,  9 Dec 2022 17:10:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6904E41004
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 14C8E1BF37A
 for <buildroot@lists.busybox.net>; Fri,  9 Dec 2022 17:01:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0EA33402F3
 for <buildroot@lists.busybox.net>; Fri,  9 Dec 2022 17:01:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0EA33402F3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fDtKWkhuUtep for <buildroot@lists.busybox.net>;
 Fri,  9 Dec 2022 17:01:09 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 694DA41029
 for <buildroot@buildroot.org>; Fri,  9 Dec 2022 17:01:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 694DA41029
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 663EB85E9E; Fri,  9 Dec 2022 17:01:04 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Fri, 9 Dec 2022 17:34:26 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: cd91f23a6ab9d0bb734fa8084275d81a39d300b2
X-Git-Newrev: f7b42852817e93423afeff64e637795d8ba80672
X-Patchwork-Hint: ignore
Message-Id: <20221209170104.663EB85E9E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/x11r7/xcb-util-image: bump version
 to 0.4.1
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
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
