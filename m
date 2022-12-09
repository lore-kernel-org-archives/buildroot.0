Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBE38C61DA3
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 21:55:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6B4544ECDD;
	Mon, 20 Feb 2023 21:55:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6B4544ECDD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5R5fkxUjYtpt; Mon, 20 Feb 2023 21:55:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BF6F84DD08;
	Mon, 20 Feb 2023 21:55:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BF6F84DD08
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1BF661BF2E3
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:53:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8AFA4610EF
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:51:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8AFA4610EF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kY2eJDynFoXc for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:51:57 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id B019161107
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:51:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B019161107
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AC3A38648F; Mon, 20 Feb 2023 20:51:57 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Fri, 9 Dec 2022 17:32:36 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: df57bbf7279757a11327361e7cd9a1091b2da40f
X-Git-Newrev: fefd30f06c88f36cc75b52b767293586e1770af1
X-Patchwork-Hint: ignore
Message-Id: <20230220205157.AC3A38648F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/x11r7/xapp_xkill: bump
 version to 1.0.6
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

commit: https://git.buildroot.net/buildroot/commit/?id=fefd30f06c88f36cc75b52b767293586e1770af1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

https://lists.x.org/archives/xorg-announce/2022-November/003256.html
Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/x11r7/xapp_xkill/xapp_xkill.hash | 8 +++-----
 package/x11r7/xapp_xkill/xapp_xkill.mk   | 6 +++---
 2 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/package/x11r7/xapp_xkill/xapp_xkill.hash b/package/x11r7/xapp_xkill/xapp_xkill.hash
index 911a28d0b6..8cee05d871 100644
--- a/package/x11r7/xapp_xkill/xapp_xkill.hash
+++ b/package/x11r7/xapp_xkill/xapp_xkill.hash
@@ -1,7 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2018-March/002864.html
-md5  938177e4472c346cf031c1aefd8934fc  xkill-1.0.5.tar.bz2
-sha1  c5ee06b33adb252a41e4f737be6bd47651ff582a  xkill-1.0.5.tar.bz2
-sha256  c5f0bb6a95e1ac7c4def8a657496d5d2f21ccd41eb47ef2c9ccb03fb6d6aff6b  xkill-1.0.5.tar.bz2
-sha512  4603a1794f114f5cea2c885020c9d073c8421d1e785c99ff6b936ae97139c8dac8020a187b5bbd0fa6d56ed6fab879441b42ba900cc5f2f5a534dafdc86b9249  xkill-1.0.5.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2022-November/003256.html
+sha256  e5a8aa78c475677b11504646da8d93dacc30744258076a2ca418a24438aeb907  xkill-1.0.6.tar.xz
+sha512  a755a8db51d7860b9942161776390007b9b530c2f7fcf8ddb3383311d36d185a6f08a44c5f6f7735576b146902e66aca21cbd7e746c1289d035e79332e8173b6  xkill-1.0.6.tar.xz
 # Locally computed
 sha256  13306c3890e4c8710bc468dee0eba7f9677cd94c7a67d2d81fa932d4f635b21f  COPYING
diff --git a/package/x11r7/xapp_xkill/xapp_xkill.mk b/package/x11r7/xapp_xkill/xapp_xkill.mk
index 64ddbca694..84dad0b5c7 100644
--- a/package/x11r7/xapp_xkill/xapp_xkill.mk
+++ b/package/x11r7/xapp_xkill/xapp_xkill.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-XAPP_XKILL_VERSION = 1.0.5
-XAPP_XKILL_SOURCE = xkill-$(XAPP_XKILL_VERSION).tar.bz2
-XAPP_XKILL_SITE = http://xorg.freedesktop.org/releases/individual/app
+XAPP_XKILL_VERSION = 1.0.6
+XAPP_XKILL_SOURCE = xkill-$(XAPP_XKILL_VERSION).tar.xz
+XAPP_XKILL_SITE = https://xorg.freedesktop.org/archive/individual/app
 XAPP_XKILL_LICENSE = MIT
 XAPP_XKILL_LICENSE_FILES = COPYING
 XAPP_XKILL_DEPENDENCIES = xlib_libX11 xlib_libXmu
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
