Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEAE0C4332F
	for <buildroot@archiver.kernel.org>; Fri,  9 Dec 2022 17:14:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5937D81762;
	Fri,  9 Dec 2022 17:14:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5937D81762
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ur-CBGbDPU0m; Fri,  9 Dec 2022 17:14:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8045481758;
	Fri,  9 Dec 2022 17:14:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8045481758
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 022971BF37A
 for <buildroot@lists.busybox.net>; Fri,  9 Dec 2022 17:01:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D5ACA4102E
 for <buildroot@lists.busybox.net>; Fri,  9 Dec 2022 17:01:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D5ACA4102E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WFy1n79iHHws for <buildroot@lists.busybox.net>;
 Fri,  9 Dec 2022 17:01:07 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id D19B74101F
 for <buildroot@buildroot.org>; Fri,  9 Dec 2022 17:01:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D19B74101F
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C298785EA1; Fri,  9 Dec 2022 17:01:03 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Fri, 9 Dec 2022 17:32:33 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7b0c8c6aee402bc6e9128bc8bb535ad1ef1f2fc5
X-Git-Newrev: df57bbf7279757a11327361e7cd9a1091b2da40f
X-Patchwork-Hint: ignore
Message-Id: <20221209170103.C298785EA1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/x11r7/xapp_xlogo: bump version to
 1.0.6
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

commit: https://git.buildroot.net/buildroot/commit/?id=df57bbf7279757a11327361e7cd9a1091b2da40f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://lists.x.org/archives/xorg-announce/2022-November/003257.html
Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/x11r7/xapp_xlogo/xapp_xlogo.hash | 8 +++-----
 package/x11r7/xapp_xlogo/xapp_xlogo.mk   | 6 +++---
 2 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/package/x11r7/xapp_xlogo/xapp_xlogo.hash b/package/x11r7/xapp_xlogo/xapp_xlogo.hash
index c393e7dc33..58f2ac4028 100644
--- a/package/x11r7/xapp_xlogo/xapp_xlogo.hash
+++ b/package/x11r7/xapp_xlogo/xapp_xlogo.hash
@@ -1,7 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2019-March/002963.html
-md5  e9d21de1dc8c8b9f854509a26a985cd7  xlogo-1.0.5.tar.bz2
-sha1  f025a0ad30c45cbec1c2f3b1610bff94fb4e9f33  xlogo-1.0.5.tar.bz2
-sha256  633d7a3aa5df61e4e643b740e5799664741ab1a0ba40593e54fcd15dc30f378e  xlogo-1.0.5.tar.bz2
-sha512  0d78e269b0be3c5de71de7f362b896bfd9934ecd9d0361b3302399b1269e029c4a9f35418d792121a1edc34405d753f9d69c996cc3a69ac717f2b0d1f736406b  xlogo-1.0.5.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2022-November/003257.html
+sha256  c16ae461a7f7ea275f55c82acf3ee86ce0eb5e406f3a91ab2bb4d332693f32a0  xlogo-1.0.6.tar.xz
+sha512  f0c921e0e34d2c0959d95ca0fcb7488395043280b8b35bcad4e8a528224f2b38581fbf60e82239d06760ecd637692cb29c3b1c0c46ac7f269f692a139d954ea0  xlogo-1.0.6.tar.xz
 # Locally computed
 sha256  972b454b6c0da17cec61225ab9dfd4afc69fd8e7e4c629497197c6f79adc6fb0  COPYING
diff --git a/package/x11r7/xapp_xlogo/xapp_xlogo.mk b/package/x11r7/xapp_xlogo/xapp_xlogo.mk
index 455469e160..27d693bec9 100644
--- a/package/x11r7/xapp_xlogo/xapp_xlogo.mk
+++ b/package/x11r7/xapp_xlogo/xapp_xlogo.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-XAPP_XLOGO_VERSION = 1.0.5
-XAPP_XLOGO_SOURCE = xlogo-$(XAPP_XLOGO_VERSION).tar.bz2
-XAPP_XLOGO_SITE = http://xorg.freedesktop.org/releases/individual/app
+XAPP_XLOGO_VERSION = 1.0.6
+XAPP_XLOGO_SOURCE = xlogo-$(XAPP_XLOGO_VERSION).tar.xz
+XAPP_XLOGO_SITE = https://xorg.freedesktop.org/archive/individual/app
 XAPP_XLOGO_LICENSE = MIT
 XAPP_XLOGO_LICENSE_FILES = COPYING
 XAPP_XLOGO_DEPENDENCIES = \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
