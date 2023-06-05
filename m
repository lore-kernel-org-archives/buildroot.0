Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E91ADC7EE23
	for <buildroot@archiver.kernel.org>; Mon,  5 Jun 2023 11:46:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9DD9960F9B;
	Mon,  5 Jun 2023 11:46:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9DD9960F9B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Otojq9mEbob1; Mon,  5 Jun 2023 11:46:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9CB8260D68;
	Mon,  5 Jun 2023 11:46:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9CB8260D68
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 04EC91BF4DA
 for <buildroot@lists.busybox.net>; Mon,  5 Jun 2023 11:45:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0B21040447
 for <buildroot@lists.busybox.net>; Mon,  5 Jun 2023 11:45:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0B21040447
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GSj6E__GAhNP for <buildroot@lists.busybox.net>;
 Mon,  5 Jun 2023 11:45:19 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 33DB440166
 for <buildroot@buildroot.org>; Mon,  5 Jun 2023 11:45:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 33DB440166
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 31A1486C79; Mon,  5 Jun 2023 11:45:19 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 5 Jun 2023 13:14:57 +0200
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: c9f2fca27619f76ded3b51931912e56c1698a125
X-Git-Newrev: 2a23ae346c7563c8e9486903a13ff28d6bf0334f
X-Patchwork-Hint: ignore
Message-Id: <20230605114519.31A1486C79@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x]
 package/x11r7/xapp_xwininfo: bump version to 1.1.6
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

commit: https://git.buildroot.net/buildroot/commit/?id=2a23ae346c7563c8e9486903a13ff28d6bf0334f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

Release notes:
https://lists.x.org/archives/xorg-announce/2023-April/003379.html

Updated license hash due to upstream commit:
https://gitlab.freedesktop.org/xorg/app/xwininfo/-/commit/9a5623e2ffc6995b2c6edf379f191d76d7b4444a
  -> drop "all rights reserved", update years
  -> no change in licensing

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit de8a3a53e52dc1ac6e04e623739aa67d412e965e)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/x11r7/xapp_xwininfo/xapp_xwininfo.hash | 10 ++++------
 package/x11r7/xapp_xwininfo/xapp_xwininfo.mk   |  4 ++--
 2 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/package/x11r7/xapp_xwininfo/xapp_xwininfo.hash b/package/x11r7/xapp_xwininfo/xapp_xwininfo.hash
index fbc7f7be00..bbf2e37328 100644
--- a/package/x11r7/xapp_xwininfo/xapp_xwininfo.hash
+++ b/package/x11r7/xapp_xwininfo/xapp_xwininfo.hash
@@ -1,7 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2019-July/003012.html
-md5  26d46f7ef0588d3392da3ad5802be420  xwininfo-1.1.5.tar.bz2
-sha1  9f67b1eb07c5824d437bf577cf6198962af1aeb7  xwininfo-1.1.5.tar.bz2
-sha256  7a405441dfc476666c744f5fcd1bc8a75abf8b5b1d85db7b88b370982365080e  xwininfo-1.1.5.tar.bz2
-sha512  a3268bbeeeeafac94e589fdd47554a965910d40df7cc3d9c36c7c24fa4f5dd49615484d5916ccb41efca9cd4cf9d8981a4c60953b921220b3f4f57f9cce0e1a6  xwininfo-1.1.5.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2023-April/003379.html
+sha256  3518897c17448df9ba99ad6d9bb1ca0f17bc0ed7c0fd61281b34ceed29a9253f  xwininfo-1.1.6.tar.xz
+sha512  c6df4ed3dcf97772450612f2786ecab8313a43bb78e0b8020cc9ec228b3f466f55090313ad02c8159a73a6892d117322ad85e28d9d76e38bb84c9750712c20bc  xwininfo-1.1.6.tar.xz
 # Locally computed
-sha256  443d675237c023a47e4886506b72796afbb2633394812027f91d6e8fa433b2af  COPYING
+sha256  1be1f0763a5efd08e48089c52728a822bf769b690a2fd82fbab456cfffee822f  COPYING
diff --git a/package/x11r7/xapp_xwininfo/xapp_xwininfo.mk b/package/x11r7/xapp_xwininfo/xapp_xwininfo.mk
index 9652487aae..196b73c83d 100644
--- a/package/x11r7/xapp_xwininfo/xapp_xwininfo.mk
+++ b/package/x11r7/xapp_xwininfo/xapp_xwininfo.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-XAPP_XWININFO_VERSION = 1.1.5
-XAPP_XWININFO_SOURCE = xwininfo-$(XAPP_XWININFO_VERSION).tar.bz2
+XAPP_XWININFO_VERSION = 1.1.6
+XAPP_XWININFO_SOURCE = xwininfo-$(XAPP_XWININFO_VERSION).tar.xz
 XAPP_XWININFO_SITE = https://xorg.freedesktop.org/archive/individual/app
 XAPP_XWININFO_LICENSE = MIT
 XAPP_XWININFO_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
