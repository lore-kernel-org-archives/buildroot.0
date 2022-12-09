Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01AB7C04FDE
	for <buildroot@archiver.kernel.org>; Fri,  9 Dec 2022 17:05:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 95342611A2;
	Fri,  9 Dec 2022 17:05:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 95342611A2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Jv9xy3E3uMiO; Fri,  9 Dec 2022 17:05:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C8A526118A;
	Fri,  9 Dec 2022 17:05:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C8A526118A
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 113BA1BF37A
 for <buildroot@lists.busybox.net>; Fri,  9 Dec 2022 17:01:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8126141A58
 for <buildroot@lists.busybox.net>; Fri,  9 Dec 2022 17:01:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8126141A58
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pGNW7Jv_usxr for <buildroot@lists.busybox.net>;
 Fri,  9 Dec 2022 17:01:06 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6CD8341A6F
 for <buildroot@buildroot.org>; Fri,  9 Dec 2022 17:01:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6CD8341A6F
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6A93F85EA7; Fri,  9 Dec 2022 17:01:03 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Fri, 9 Dec 2022 17:32:01 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3500526b189e4a75f3b969ac54685fc8a4b2e15c
X-Git-Newrev: 8f15b22fdd55611f0a1b64cb8a430df3c6385e11
X-Patchwork-Hint: ignore
Message-Id: <20221209170103.6A93F85EA7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/x11r7/xapp_xinit: bump version to
 1.4.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=8f15b22fdd55611f0a1b64cb8a430df3c6385e11
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://lists.x.org/archives/xorg-announce/2022-December/003268.html
Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/x11r7/xapp_xinit/xapp_xinit.hash | 8 +++-----
 package/x11r7/xapp_xinit/xapp_xinit.mk   | 6 +++---
 2 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/package/x11r7/xapp_xinit/xapp_xinit.hash b/package/x11r7/xapp_xinit/xapp_xinit.hash
index 49c8099467..4b7d8feb5d 100644
--- a/package/x11r7/xapp_xinit/xapp_xinit.hash
+++ b/package/x11r7/xapp_xinit/xapp_xinit.hash
@@ -1,7 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2019-March/002962.html
-md5  6d506ab2efc17a08e87778654e099d37  xinit-1.4.1.tar.bz2
-sha1  d874a2eecf2c30291e327851b151fdab8183260c  xinit-1.4.1.tar.bz2
-sha256  de9b8f617b68a70f6caf87da01fcf0ebd2b75690cdcba9c921d0ef54fa54abb9  xinit-1.4.1.tar.bz2
-sha512  6cbc5d025a891c419f3f4493381b2fca57a67d78df866d2f16a83426f86bad6eca7f240fac12b25cbcc63df0fec41f625407184e044898602d66483715315340  xinit-1.4.1.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2022-December/003268.html
+sha256  b7d8dc8d22ef9f15985a10b606ee4f2aad6828befa437359934647e88d331f23  xinit-1.4.2.tar.xz
+sha512  4b62c2edd97b40133577cbba88b3f31b36c5634b4eb667ef0c302e8358dc1c55a255abe42aaadc910d8aa9ea0e3add157a12a301382f1cdbe091df4e1215fae0  xinit-1.4.2.tar.xz
 # Locally computed
 sha256  c47001aa217d4ae7787121d80634db4bdba564e49a0ecab8d48b1bdc4edee1c7  COPYING
diff --git a/package/x11r7/xapp_xinit/xapp_xinit.mk b/package/x11r7/xapp_xinit/xapp_xinit.mk
index 86a4d92674..795a1b541b 100644
--- a/package/x11r7/xapp_xinit/xapp_xinit.mk
+++ b/package/x11r7/xapp_xinit/xapp_xinit.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-XAPP_XINIT_VERSION = 1.4.1
-XAPP_XINIT_SOURCE = xinit-$(XAPP_XINIT_VERSION).tar.bz2
-XAPP_XINIT_SITE = http://xorg.freedesktop.org/releases/individual/app
+XAPP_XINIT_VERSION = 1.4.2
+XAPP_XINIT_SOURCE = xinit-$(XAPP_XINIT_VERSION).tar.xz
+XAPP_XINIT_SITE = https://xorg.freedesktop.org/archive/individual/app
 XAPP_XINIT_DEPENDENCIES = xapp_xauth xlib_libX11
 XAPP_XINIT_LICENSE = MIT
 XAPP_XINIT_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
