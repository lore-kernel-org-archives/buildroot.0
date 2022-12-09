Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 539F5C4332F
	for <buildroot@archiver.kernel.org>; Fri,  9 Dec 2022 17:04:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 007A882137;
	Fri,  9 Dec 2022 17:04:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 007A882137
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CglF7Ck6k9qG; Fri,  9 Dec 2022 17:04:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 325578211C;
	Fri,  9 Dec 2022 17:04:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 325578211C
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E57521BF973
 for <buildroot@lists.busybox.net>; Fri,  9 Dec 2022 17:01:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C06CC81E13
 for <buildroot@lists.busybox.net>; Fri,  9 Dec 2022 17:01:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C06CC81E13
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HhYxjn7iTodb for <buildroot@lists.busybox.net>;
 Fri,  9 Dec 2022 17:01:05 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1915682116
 for <buildroot@buildroot.org>; Fri,  9 Dec 2022 17:01:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1915682116
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 08FC285EA7; Fri,  9 Dec 2022 17:01:05 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Fri, 9 Dec 2022 17:36:19 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a49f6567142eee59817d07afa380337260f81634
X-Git-Newrev: fe85dbf818ab4321f3a18f742458f3313ed1b3ec
X-Patchwork-Hint: ignore
Message-Id: <20221209170105.08FC285EA7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/x11r7/xapp_showfont: bump version
 to 1.0.6
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

commit: https://git.buildroot.net/buildroot/commit/?id=fe85dbf818ab4321f3a18f742458f3313ed1b3ec
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://lists.x.org/archives/xorg-announce/2022-August/003207.html
Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/x11r7/xapp_showfont/xapp_showfont.hash | 5 +++--
 package/x11r7/xapp_showfont/xapp_showfont.mk   | 6 +++---
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/package/x11r7/xapp_showfont/xapp_showfont.hash b/package/x11r7/xapp_showfont/xapp_showfont.hash
index ff35e9c9eb..7bec4e8728 100644
--- a/package/x11r7/xapp_showfont/xapp_showfont.hash
+++ b/package/x11r7/xapp_showfont/xapp_showfont.hash
@@ -1,4 +1,5 @@
-# From http://lists.x.org/archives/xorg-announce/2014-December/002513.html
-sha256  e9735c1c530b8a52edfab7415cc0fd7f8d2889095114f4cb689a27476461ac89  showfont-1.0.5.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2022-August/003207.html
+sha256  2b9b9f06e65e095ed76ce560b701b9fc47fa63310ee706b54c8787af061d0e56  showfont-1.0.6.tar.xz
+sha512  21a318519492f4ba46a8bcb3590097fc5f96fe01fdb557257ae56bae813671952a2aad6c0df8cd69659e06708571c398e6d97969224cf692e22c8a35c8e6c363  showfont-1.0.6.tar.xz
 # Locally computed
 sha256  c32217021e0507207e2ee6da3fcee3d9e32816003a7153b3357c08cdc97934a8  COPYING
diff --git a/package/x11r7/xapp_showfont/xapp_showfont.mk b/package/x11r7/xapp_showfont/xapp_showfont.mk
index c0b8c9a3a2..a805f35231 100644
--- a/package/x11r7/xapp_showfont/xapp_showfont.mk
+++ b/package/x11r7/xapp_showfont/xapp_showfont.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-XAPP_SHOWFONT_VERSION = 1.0.5
-XAPP_SHOWFONT_SOURCE = showfont-$(XAPP_SHOWFONT_VERSION).tar.bz2
-XAPP_SHOWFONT_SITE = http://xorg.freedesktop.org/releases/individual/app
+XAPP_SHOWFONT_VERSION = 1.0.6
+XAPP_SHOWFONT_SOURCE = showfont-$(XAPP_SHOWFONT_VERSION).tar.xz
+XAPP_SHOWFONT_SITE = https://xorg.freedesktop.org/archive/individual/app
 XAPP_SHOWFONT_LICENSE = MIT
 XAPP_SHOWFONT_LICENSE_FILES = COPYING
 XAPP_SHOWFONT_DEPENDENCIES = xlib_libFS
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
