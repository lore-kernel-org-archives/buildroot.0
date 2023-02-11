Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FD21C61DA4
	for <buildroot@archiver.kernel.org>; Sat, 11 Feb 2023 18:14:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5C44C41581;
	Sat, 11 Feb 2023 18:14:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5C44C41581
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dR3wl4Suxzbf; Sat, 11 Feb 2023 18:14:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 259DA4156C;
	Sat, 11 Feb 2023 18:14:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 259DA4156C
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7CCF51BF59D
 for <buildroot@lists.busybox.net>; Sat, 11 Feb 2023 18:14:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 56A7241554
 for <buildroot@lists.busybox.net>; Sat, 11 Feb 2023 18:14:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 56A7241554
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id U8AplOLdpBYQ for <buildroot@lists.busybox.net>;
 Sat, 11 Feb 2023 18:14:47 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3653E41550
Received: from mailout01.t-online.de (mailout01.t-online.de [194.25.134.80])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3653E41550
 for <buildroot@buildroot.org>; Sat, 11 Feb 2023 18:14:46 +0000 (UTC)
Received: from fwd88.dcpf.telekom.de (fwd88.aul.t-online.de [10.223.144.114])
 by mailout01.t-online.de (Postfix) with SMTP id 3518418F9B
 for <buildroot@buildroot.org>; Sat, 11 Feb 2023 19:14:44 +0100 (CET)
Received: from fli4l.lan.fli4l ([79.214.202.51]) by fwd88.t-online.de
 with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
 esmtp id 1pQuOW-3o1jhh0; Sat, 11 Feb 2023 19:14:40 +0100
Received: from bruckner.lan.fli4l ([192.168.1.1]:37908)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd.kuhls@t-online.de>) id 1pQuOW-0004mz-0L
 for buildroot@buildroot.org; Sat, 11 Feb 2023 19:14:40 +0100
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Sat, 11 Feb 2023 19:14:39 +0100
Message-Id: <20230211181439.33767-1-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1676139280-726BD7D8-DAF58075/0/0 CLEAN NORMAL
X-TOI-MSGID: 87f46265-f4f0-4ee5-9cbc-5d4a9ae25f9c
Subject: [Buildroot] [PATCH 1/1] package/libdrm: bump version to 2.4.115
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
https://lists.x.org/archives/xorg-announce/2023-February/003323.html

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/libdrm/libdrm.hash | 6 +++---
 package/libdrm/libdrm.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libdrm/libdrm.hash b/package/libdrm/libdrm.hash
index 387beadc3f..87cc170617 100644
--- a/package/libdrm/libdrm.hash
+++ b/package/libdrm/libdrm.hash
@@ -1,6 +1,6 @@
-# From https://lists.x.org/archives/xorg-announce/2022-November/003250.html
-sha256  3049cf843a47d12e5eeefbc3be3496d782fa09f42346bf0b7defe3d1e598d026  libdrm-2.4.114.tar.xz
-sha512  8dcd4be5674e3ea2ab4394fa8f461914e5aa7f4f57a2f448c5216d84ee6682e16b45eafabf97b7d9f5c062183d9a6bf3f0c97499d4cb01c19807a51209a0f644  libdrm-2.4.114.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2023-February/003323.html
+sha256  554cfbfe0542bddb391b4e3e05bfbbfc3e282b955bd56218d21c0616481f65eb  libdrm-2.4.115.tar.xz
+sha512  0c38d3cfd76f627b899f052527c2939d5fc87a417422dceb0761839ba21e69736703a87ba170b5ba7a4aca2506a240760c8c97ca1781a7fb78468225295293bd  libdrm-2.4.115.tar.xz
 
 # Hash for license file
 sha256  d0a616a9020dc0271e36e6dd4bad174b4e2c2a42636f13785f8e18dd5f85fd83  data/meson.build
diff --git a/package/libdrm/libdrm.mk b/package/libdrm/libdrm.mk
index cfb0f730fb..f0a6a29636 100644
--- a/package/libdrm/libdrm.mk
+++ b/package/libdrm/libdrm.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBDRM_VERSION = 2.4.114
+LIBDRM_VERSION = 2.4.115
 LIBDRM_SOURCE = libdrm-$(LIBDRM_VERSION).tar.xz
 LIBDRM_SITE = https://dri.freedesktop.org/libdrm
 LIBDRM_LICENSE = MIT
-- 
2.39.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
