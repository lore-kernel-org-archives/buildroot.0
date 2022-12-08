Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65396C4332F
	for <buildroot@archiver.kernel.org>; Thu,  8 Dec 2022 22:44:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0A3F080FA7;
	Thu,  8 Dec 2022 22:44:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0A3F080FA7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id B1G3CJLkSpPF; Thu,  8 Dec 2022 22:44:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0838880F7E;
	Thu,  8 Dec 2022 22:44:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0838880F7E
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1E4EB1BF969
 for <buildroot@lists.busybox.net>; Thu,  8 Dec 2022 22:38:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9D9FD820EC
 for <buildroot@lists.busybox.net>; Thu,  8 Dec 2022 22:38:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9D9FD820EC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wM1zWniqxz6r for <buildroot@lists.busybox.net>;
 Thu,  8 Dec 2022 22:38:27 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AB5F2820E8
Received: from mailout12.t-online.de (mailout12.t-online.de [194.25.134.22])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AB5F2820E8
 for <buildroot@buildroot.org>; Thu,  8 Dec 2022 22:38:27 +0000 (UTC)
Received: from fwd70.dcpf.telekom.de (fwd70.aul.t-online.de [10.223.144.96])
 by mailout12.t-online.de (Postfix) with SMTP id 3108F17C40
 for <buildroot@buildroot.org>; Thu,  8 Dec 2022 23:38:24 +0100 (CET)
Received: from fli4l.lan.fli4l ([79.214.203.244]) by fwd70.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1p3PX3-1iKQVN0; Thu, 8 Dec 2022 23:38:21 +0100
Received: from bruckner.lan.fli4l ([192.168.1.1]:35946)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd.kuhls@t-online.de>) id 1p3PX2-00048i-2A
 for buildroot@buildroot.org; Thu, 08 Dec 2022 23:38:20 +0100
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Thu,  8 Dec 2022 23:37:57 +0100
Message-Id: <20221208223817.1088619-51-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221208223817.1088619-1-bernd.kuhls@t-online.de>
References: <20221208223817.1088619-1-bernd.kuhls@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1670539101-48FF9689-12E4D683/0/0 CLEAN NORMAL
X-TOI-MSGID: b53e3493-7a38-4ed7-8935-c5a7f7aafd47
Subject: [Buildroot] [PATCH 50/70] package/x11r7/xapp_bdftopcf: bump version
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

https://lists.x.org/archives/xorg-announce/2022-October/003223.html
Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
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
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
