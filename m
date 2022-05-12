Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9492FC433EF
	for <buildroot@archiver.kernel.org>; Thu, 12 May 2022 18:57:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 49312401B8;
	Thu, 12 May 2022 18:57:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gEF1XOBkGrO7; Thu, 12 May 2022 18:57:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 49569401A0;
	Thu, 12 May 2022 18:57:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4F9F11BF9CB
 for <buildroot@lists.busybox.net>; Thu, 12 May 2022 18:54:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5BB2382628
 for <buildroot@lists.busybox.net>; Thu, 12 May 2022 18:54:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zwL339Wtzr0G for <buildroot@lists.busybox.net>;
 Thu, 12 May 2022 18:54:01 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mailout05.t-online.de (mailout05.t-online.de [194.25.134.82])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 779AA81B04
 for <buildroot@buildroot.org>; Thu, 12 May 2022 18:54:01 +0000 (UTC)
Received: from fwd89.dcpf.telekom.de (fwd89.aul.t-online.de [10.223.144.115])
 by mailout05.t-online.de (Postfix) with SMTP id B30A119770
 for <buildroot@buildroot.org>; Thu, 12 May 2022 20:53:56 +0200 (CEST)
Received: from fli4l.lan.fli4l ([79.214.203.41]) by fwd89.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1npDwi-0Fmf3t0; Thu, 12 May 2022 20:53:56 +0200
Received: from bruckner.lan.fli4l ([192.168.1.1]:48510)
 by fli4l.lan.fli4l with esmtp (Exim 4.95)
 (envelope-from <bernd.kuhls@t-online.de>) id 1npDwi-0004aZ-9C
 for buildroot@buildroot.org; Thu, 12 May 2022 20:53:56 +0200
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Thu, 12 May 2022 20:53:42 +0200
Message-Id: <20220512185355.873825-12-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220512185355.873825-1-bernd.kuhls@t-online.de>
References: <20220512185355.873825-1-bernd.kuhls@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1652381636-0000F5B3-A8480CE4/0/0 CLEAN NORMAL
X-TOI-MSGID: e85b3839-0906-4231-8693-5c7139ad0d9e
Subject: [Buildroot] [PATCH 12/25] package/x11r7/xapp_xclock: bump version
 to 1.1.1
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
https://lists.x.org/archives/xorg-announce/2022-April/003147.html
https://lists.x.org/archives/xorg-announce/2022-April/003156.html

Removed md5 and sha1 hashes, not provided by upstream anymore.
Reformatted license hash.
Switched tarball to upstream-provided .xz format.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xapp_xclock/xapp_xclock.hash | 10 ++++------
 package/x11r7/xapp_xclock/xapp_xclock.mk   |  4 ++--
 2 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/package/x11r7/xapp_xclock/xapp_xclock.hash b/package/x11r7/xapp_xclock/xapp_xclock.hash
index 881b40154d..0bc011732f 100644
--- a/package/x11r7/xapp_xclock/xapp_xclock.hash
+++ b/package/x11r7/xapp_xclock/xapp_xclock.hash
@@ -1,7 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2019-July/003010.html
-md5 437522a96f424f68fc64ed34ece9b211  xclock-1.0.9.tar.bz2
-sha1 774c711cf7ee3f601f7209bbb01ce3f0d5ddbde6  xclock-1.0.9.tar.bz2
-sha256 cf461fb2c6f2ac42c54d8429ee2010fdb9a1442a370adfbfe8a7bfaf33c123bb  xclock-1.0.9.tar.bz2
-sha512 fcbac0b4ab1cea4ae0751ce1c0c6302048e5d98d459873c7580e4ca786ec49fa27f73e5831bdfe135abb5cfeabe886456276e9d01351ea7905c606f40f84522d  xclock-1.0.9.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2022-April/003156.html
+sha256  df7ceabf8f07044a2fde4924d794554996811640a45de40cb12c2cf1f90f742c  xclock-1.1.1.tar.xz
+sha512  059ea986bc7537c2796e8855676e8357bd8a7852fbac0839b3f8a9e3ffa088de41bc4e4961973353f0a7b7293366b81bc764d74f3dc4e90e361da06185d976e7  xclock-1.1.1.tar.xz
 # Locally computed
-sha256 ee1f19f46801ef00e70498603e74df644d0b93fc82f06b55ce64c3a2c9f16e71  COPYING
+sha256  ee1f19f46801ef00e70498603e74df644d0b93fc82f06b55ce64c3a2c9f16e71  COPYING
diff --git a/package/x11r7/xapp_xclock/xapp_xclock.mk b/package/x11r7/xapp_xclock/xapp_xclock.mk
index 77cc7011d3..852ae5dbae 100644
--- a/package/x11r7/xapp_xclock/xapp_xclock.mk
+++ b/package/x11r7/xapp_xclock/xapp_xclock.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-XAPP_XCLOCK_VERSION = 1.0.9
-XAPP_XCLOCK_SOURCE = xclock-$(XAPP_XCLOCK_VERSION).tar.bz2
+XAPP_XCLOCK_VERSION = 1.1.1
+XAPP_XCLOCK_SOURCE = xclock-$(XAPP_XCLOCK_VERSION).tar.xz
 XAPP_XCLOCK_SITE = https://xorg.freedesktop.org/archive/individual/app
 XAPP_XCLOCK_LICENSE = MIT
 XAPP_XCLOCK_LICENSE_FILES = COPYING
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
