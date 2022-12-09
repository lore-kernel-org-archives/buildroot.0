Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03DE2C61DA3
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 21:45:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8EA8D46B7B;
	Mon, 20 Feb 2023 21:45:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8EA8D46B7B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FL0QK9Icyysj; Mon, 20 Feb 2023 21:45:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3D4A84EBBC;
	Mon, 20 Feb 2023 21:45:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3D4A84EBBC
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 161471BF2E3
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:53:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7124B415C1
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:51:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7124B415C1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KHKXtUHFejs9 for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:51:58 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9F7F5415B8
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:51:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9F7F5415B8
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9C52686494; Mon, 20 Feb 2023 20:51:58 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Fri, 9 Dec 2022 17:35:45 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 08a0ed4d56c03a431b73a6faa53b0c5b83d7ca04
X-Git-Newrev: dd1c370ad7567fc38732d28cb52d66bc5dbb22fc
X-Patchwork-Hint: ignore
Message-Id: <20230220205158.9C52686494@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/x11r7/xapp_xkbprint:
 bump version to 1.0.6
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

commit: https://git.buildroot.net/buildroot/commit/?id=dd1c370ad7567fc38732d28cb52d66bc5dbb22fc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

https://lists.x.org/archives/xorg-announce/2022-October/003222.html
Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/x11r7/xapp_xkbprint/xapp_xkbprint.hash | 8 +++-----
 package/x11r7/xapp_xkbprint/xapp_xkbprint.mk   | 6 +++---
 2 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/package/x11r7/xapp_xkbprint/xapp_xkbprint.hash b/package/x11r7/xapp_xkbprint/xapp_xkbprint.hash
index 69a80576c4..8ca7656b5c 100644
--- a/package/x11r7/xapp_xkbprint/xapp_xkbprint.hash
+++ b/package/x11r7/xapp_xkbprint/xapp_xkbprint.hash
@@ -1,7 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2019-November/003030.html
-md5  9c34da77363dc3d0f616980da87244bf  xkbprint-1.0.5.tar.bz2
-sha1  e707caffb3c680b3a869a776aa3f80caeac9e9c3  xkbprint-1.0.5.tar.bz2
-sha256  5b58fe834f0822f06d63d283fac404098c6d3f6acce61888b81016f1c41023fa  xkbprint-1.0.5.tar.bz2
-sha512  ac3870352f3a595b5b8a8cb64f39e9bea81b17572c73cfbf72482477a2f576d0ffcdcf735cb3c66b8a88a7fe0f7aece6738cbac87df5641e44fae1ab9b97111f  xkbprint-1.0.5.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2022-October/003222.html
+sha256  99cc9404f7b90289ae04944c0d98a208cc8b158492ad6481386e31d4d09aa7b0  xkbprint-1.0.6.tar.xz
+sha512  a1c2401b2a2ef4c6bd2efc18923ecb176adcf38b6c5dfdce25f22f1f5ab21e25f494b25dac25b1765fb9a0f6acc24d191cd41b9a098a9e3c6eaf9a9df490be29  xkbprint-1.0.6.tar.xz
 # Locally computed
 sha256  79b32f28f7f5063054a564e1fdeee56f82a525b6516303704a1f70e55fe7197e  COPYING
diff --git a/package/x11r7/xapp_xkbprint/xapp_xkbprint.mk b/package/x11r7/xapp_xkbprint/xapp_xkbprint.mk
index 8643cb4276..f374c18dae 100644
--- a/package/x11r7/xapp_xkbprint/xapp_xkbprint.mk
+++ b/package/x11r7/xapp_xkbprint/xapp_xkbprint.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-XAPP_XKBPRINT_VERSION = 1.0.5
-XAPP_XKBPRINT_SOURCE = xkbprint-$(XAPP_XKBPRINT_VERSION).tar.bz2
-XAPP_XKBPRINT_SITE = http://xorg.freedesktop.org/releases/individual/app
+XAPP_XKBPRINT_VERSION = 1.0.6
+XAPP_XKBPRINT_SOURCE = xkbprint-$(XAPP_XKBPRINT_VERSION).tar.xz
+XAPP_XKBPRINT_SITE = https://xorg.freedesktop.org/archive/individual/app
 XAPP_XKBPRINT_LICENSE = MIT
 XAPP_XKBPRINT_LICENSE_FILES = COPYING
 XAPP_XKBPRINT_DEPENDENCIES = xlib_libxkbfile
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
