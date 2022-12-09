Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 093ABC4332F
	for <buildroot@archiver.kernel.org>; Fri,  9 Dec 2022 17:05:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A3ACC41013;
	Fri,  9 Dec 2022 17:05:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A3ACC41013
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Guh34XP58zsx; Fri,  9 Dec 2022 17:05:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id EBD3341029;
	Fri,  9 Dec 2022 17:05:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EBD3341029
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0C1C71BF973
 for <buildroot@lists.busybox.net>; Fri,  9 Dec 2022 17:01:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DEC9240CE2
 for <buildroot@lists.busybox.net>; Fri,  9 Dec 2022 17:01:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DEC9240CE2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4p3Febnsi45s for <buildroot@lists.busybox.net>;
 Fri,  9 Dec 2022 17:01:06 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 72F8541004
 for <buildroot@buildroot.org>; Fri,  9 Dec 2022 17:01:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 72F8541004
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6208E85EA6; Fri,  9 Dec 2022 17:01:03 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Fri, 9 Dec 2022 17:31:58 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 835918d8e8e34ee298580c4da5e57bf0f925f708
X-Git-Newrev: 3500526b189e4a75f3b969ac54685fc8a4b2e15c
X-Patchwork-Hint: ignore
Message-Id: <20221209170103.6208E85EA6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/x11r7/xapp_xprop: bump version to
 1.2.6
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

commit: https://git.buildroot.net/buildroot/commit/?id=3500526b189e4a75f3b969ac54685fc8a4b2e15c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://lists.x.org/archives/xorg-announce/2022-December/003269.html
Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/x11r7/xapp_xprop/xapp_xprop.hash | 6 +++---
 package/x11r7/xapp_xprop/xapp_xprop.mk   | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/x11r7/xapp_xprop/xapp_xprop.hash b/package/x11r7/xapp_xprop/xapp_xprop.hash
index 95e7c4eeed..9db2fb9125 100644
--- a/package/x11r7/xapp_xprop/xapp_xprop.hash
+++ b/package/x11r7/xapp_xprop/xapp_xprop.hash
@@ -1,5 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2020-November/003064.html
-sha256  9b92ed0316bf2486121d8bac88bd1878f16b43bd335f18009b1f941f1eca93a1  xprop-1.2.5.tar.bz2
-sha512  93cfa621fa76ca6e8e780a252c508380b6dc9db39b67bfca16bb9800f0d39110f5d18189409a8577ef79e98bf5eece17f5e23f2218ca72ae8bb04ee7b429d559  xprop-1.2.5.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2022-December/003269.html
+sha256  580b8525b12ecc0144aa16c88b0aafa76d2e799b44c8c6c50f9ce92788b5586e  xprop-1.2.6.tar.xz
+sha512  ab25d4b8bf9de8fb37149060ad4870ffed4d6846ac3b31903a42c36301fcb0d50d3ba15949fdd9079507db97d3f05d4bbd11711d825e5470482cc30772cc3f25  xprop-1.2.6.tar.xz
 # Locally computed
 sha256  f19ff982936cca133b9593a6561c3817512207e0b4c951d0e4eb5956d30d4415  COPYING
diff --git a/package/x11r7/xapp_xprop/xapp_xprop.mk b/package/x11r7/xapp_xprop/xapp_xprop.mk
index 75f0d37cdc..888e9d3a69 100644
--- a/package/x11r7/xapp_xprop/xapp_xprop.mk
+++ b/package/x11r7/xapp_xprop/xapp_xprop.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-XAPP_XPROP_VERSION = 1.2.5
-XAPP_XPROP_SOURCE = xprop-$(XAPP_XPROP_VERSION).tar.bz2
-XAPP_XPROP_SITE = http://xorg.freedesktop.org/releases/individual/app
+XAPP_XPROP_VERSION = 1.2.6
+XAPP_XPROP_SOURCE = xprop-$(XAPP_XPROP_VERSION).tar.xz
+XAPP_XPROP_SITE = https://xorg.freedesktop.org/archive/individual/app
 XAPP_XPROP_LICENSE = MIT
 XAPP_XPROP_LICENSE_FILES = COPYING
 XAPP_XPROP_DEPENDENCIES = xlib_libX11 xlib_libXmu
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
