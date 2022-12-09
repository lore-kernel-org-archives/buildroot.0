Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3C89C636D6
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 21:39:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 47B7B4B2D8;
	Mon, 20 Feb 2023 21:39:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 47B7B4B2D8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5whAi9IE_vqV; Mon, 20 Feb 2023 21:39:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1786E4CA27;
	Mon, 20 Feb 2023 21:39:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1786E4CA27
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 580601BF2E3
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:53:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6DC47415BF
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:51:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6DC47415BF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Mz25u81n45SI for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:51:57 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8F12D415A9
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:51:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8F12D415A9
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8790086494; Mon, 20 Feb 2023 20:51:57 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Fri, 9 Dec 2022 17:32:27 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 723eff5808451188ddc097aafc17e6969b849e57
X-Git-Newrev: e20641dcf85dada48621f46e1f30966c90696317
X-Patchwork-Hint: ignore
Message-Id: <20230220205157.8790086494@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/x11r7/xapp_xlsclients:
 bump version to 1.1.5
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

commit: https://git.buildroot.net/buildroot/commit/?id=e20641dcf85dada48621f46e1f30966c90696317
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

https://lists.x.org/archives/xorg-announce/2022-November/003259.html
Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/x11r7/xapp_xlsclients/xapp_xlsclients.hash | 8 +++-----
 package/x11r7/xapp_xlsclients/xapp_xlsclients.mk   | 6 +++---
 2 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/package/x11r7/xapp_xlsclients/xapp_xlsclients.hash b/package/x11r7/xapp_xlsclients/xapp_xlsclients.hash
index b73917cb4a..ac172acceb 100644
--- a/package/x11r7/xapp_xlsclients/xapp_xlsclients.hash
+++ b/package/x11r7/xapp_xlsclients/xapp_xlsclients.hash
@@ -1,7 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2018-March/002866.html
-md5  4fa92377e0ddc137cd226a7a87b6b29a  xlsclients-1.1.4.tar.bz2
-sha1  175af1c216a1db3de5023ecd6cce186e7693c6e4  xlsclients-1.1.4.tar.bz2
-sha256  773f2af49c7ea2c44fba4213bee64325875c1b3c9bc4bbcd8dac9261751809c1  xlsclients-1.1.4.tar.bz2
-sha512  42fd848d88d3cf31168a37fed63f9f5b60ddc4f36be2956b354e574c93129d75f29e005d6631784380bcef27860b54c64f419ca18ad77f092f4520dec47b10f4  xlsclients-1.1.4.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2022-November/003259.html
+sha256  68baee57e70250ac4a7759fb78221831f97d88bc8e51dcc2e64eb3f8ca56bae3  xlsclients-1.1.5.tar.xz
+sha512  3896643378603876438772475e89ad5c066f98c16593245db5fa066418ff793798247f976d2bf7aa401d2590fc9807b80c9758bcbcc91566f02ceb856d9702bf  xlsclients-1.1.5.tar.xz
 # Locally computed
 sha256  716d6f1d18cb97cdd4a2ef7b101d944a250ca9de57578a490c038b9aaf950648  COPYING
diff --git a/package/x11r7/xapp_xlsclients/xapp_xlsclients.mk b/package/x11r7/xapp_xlsclients/xapp_xlsclients.mk
index 167748b338..a179e06713 100644
--- a/package/x11r7/xapp_xlsclients/xapp_xlsclients.mk
+++ b/package/x11r7/xapp_xlsclients/xapp_xlsclients.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-XAPP_XLSCLIENTS_VERSION = 1.1.4
-XAPP_XLSCLIENTS_SOURCE = xlsclients-$(XAPP_XLSCLIENTS_VERSION).tar.bz2
-XAPP_XLSCLIENTS_SITE = http://xorg.freedesktop.org/releases/individual/app
+XAPP_XLSCLIENTS_VERSION = 1.1.5
+XAPP_XLSCLIENTS_SOURCE = xlsclients-$(XAPP_XLSCLIENTS_VERSION).tar.xz
+XAPP_XLSCLIENTS_SITE = https://xorg.freedesktop.org/archive/individual/app
 XAPP_XLSCLIENTS_LICENSE = MIT
 XAPP_XLSCLIENTS_LICENSE_FILES = COPYING
 XAPP_XLSCLIENTS_DEPENDENCIES = xlib_libX11 xlib_libXmu libxcb xcb-util
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
