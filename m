Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 749ECC636D6
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 21:59:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 191294ED74;
	Mon, 20 Feb 2023 21:59:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 191294ED74
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id orfWi_kbZSki; Mon, 20 Feb 2023 21:59:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E94714ED5E;
	Mon, 20 Feb 2023 21:59:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E94714ED5E
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 998E61BF8C7
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:54:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8CA3E61139
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:51:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8CA3E61139
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id prdhQXfZ6ZrZ for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:51:58 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id A316F61109
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:51:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A316F61109
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9203E8648F; Mon, 20 Feb 2023 20:51:58 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Fri, 9 Dec 2022 17:35:43 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 0978ae1d5e1acca7f9ab165e4050cfa1c283fed4
X-Git-Newrev: 08a0ed4d56c03a431b73a6faa53b0c5b83d7ca04
X-Patchwork-Hint: ignore
Message-Id: <20230220205158.9203E8648F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/x11r7/xapp_bdftopcf:
 bump version to 1.1.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=08a0ed4d56c03a431b73a6faa53b0c5b83d7ca04
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

https://lists.x.org/archives/xorg-announce/2022-October/003223.html
Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/x11r7/xapp_bdftopcf/xapp_bdftopcf.hash | 9 +++------
 package/x11r7/xapp_bdftopcf/xapp_bdftopcf.mk   | 6 +++---
 2 files changed, 6 insertions(+), 9 deletions(-)

diff --git a/package/x11r7/xapp_bdftopcf/xapp_bdftopcf.hash b/package/x11r7/xapp_bdftopcf/xapp_bdftopcf.hash
index bf806ab0d7..0596b65e49 100644
--- a/package/x11r7/xapp_bdftopcf/xapp_bdftopcf.hash
+++ b/package/x11r7/xapp_bdftopcf/xapp_bdftopcf.hash
@@ -1,8 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2017-November/002821.html
-md5  2a455d3c02390597feb9cefb3fe97a45  bdftopcf-1.1.tar.bz2
-sha1  48a783337a5aa49ebc102c9788ff0f43ea35c5c4  bdftopcf-1.1.tar.bz2
-sha256  4b4df05fc53f1e98993638d6f7e178d95b31745c4568cee407e167491fd311a2  bdftopcf-1.1.tar.bz2
-sha512  7b790e8d512ca2812ac889c156ef91c48798b4744a6857e5b17e0128764b5afa8c5426fe5de05a9819d64745116718db4221b3e657e3c2633465e87179c44bec  bdftopcf-1.1.tar.bz2
-
+# From https://lists.x.org/archives/xorg-announce/2022-October/003223.html
+sha256  11c953d53c0f3ed349d0198dfb0a40000b5121df7eef09f2615a262892fed908  bdftopcf-1.1.1.tar.xz
+sha512  257dc9ae29f2cf1496aad91ccba534348d87f881d75431aa6611a8154cb817d17588c464ab6c6c6bc51e6060baa8dcfcb9fd8c037cdaea8d18287651fa6b7ea9  bdftopcf-1.1.1.tar.xz
 # Locally calculated
 sha256  a437fb5272ba507c2977b2ef623bb391270f521b2a20271ed044785f4eaa5dbc  COPYING
diff --git a/package/x11r7/xapp_bdftopcf/xapp_bdftopcf.mk b/package/x11r7/xapp_bdftopcf/xapp_bdftopcf.mk
index 7ee618d641..d47f5c02ce 100644
--- a/package/x11r7/xapp_bdftopcf/xapp_bdftopcf.mk
+++ b/package/x11r7/xapp_bdftopcf/xapp_bdftopcf.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-XAPP_BDFTOPCF_VERSION = 1.1
-XAPP_BDFTOPCF_SOURCE = bdftopcf-$(XAPP_BDFTOPCF_VERSION).tar.bz2
-XAPP_BDFTOPCF_SITE = http://xorg.freedesktop.org/releases/individual/app
+XAPP_BDFTOPCF_VERSION = 1.1.1
+XAPP_BDFTOPCF_SOURCE = bdftopcf-$(XAPP_BDFTOPCF_VERSION).tar.xz
+XAPP_BDFTOPCF_SITE = https://xorg.freedesktop.org/archive/individual/util
 XAPP_BDFTOPCF_LICENSE = MIT
 XAPP_BDFTOPCF_LICENSE_FILES = COPYING
 XAPP_BDFTOPCF_DEPENDENCIES = xlib_libXfont
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
