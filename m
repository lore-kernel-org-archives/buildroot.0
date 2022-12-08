Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE6BBC001B2
	for <buildroot@archiver.kernel.org>; Thu,  8 Dec 2022 22:45:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 54FE381919;
	Thu,  8 Dec 2022 22:45:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 54FE381919
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rEvVWqhD4Wal; Thu,  8 Dec 2022 22:45:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6CD4D81403;
	Thu,  8 Dec 2022 22:45:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6CD4D81403
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 41E111BF969
 for <buildroot@lists.busybox.net>; Thu,  8 Dec 2022 22:38:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 065DD40145
 for <buildroot@lists.busybox.net>; Thu,  8 Dec 2022 22:38:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 065DD40145
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9rxyMZdo0zoT for <buildroot@lists.busybox.net>;
 Thu,  8 Dec 2022 22:38:26 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 82F10401B7
Received: from mailout03.t-online.de (mailout03.t-online.de [194.25.134.81])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 82F10401B7
 for <buildroot@buildroot.org>; Thu,  8 Dec 2022 22:38:26 +0000 (UTC)
Received: from fwd86.dcpf.telekom.de (fwd86.aul.t-online.de [10.223.144.112])
 by mailout03.t-online.de (Postfix) with SMTP id D679B1ABAA
 for <buildroot@buildroot.org>; Thu,  8 Dec 2022 23:38:22 +0100 (CET)
Received: from fli4l.lan.fli4l ([79.214.203.244]) by fwd86.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1p3PX1-325S420; Thu, 8 Dec 2022 23:38:19 +0100
Received: from bruckner.lan.fli4l ([192.168.1.1]:35946)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd.kuhls@t-online.de>) id 1p3PX1-00048i-2F
 for buildroot@buildroot.org; Thu, 08 Dec 2022 23:38:19 +0100
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Thu,  8 Dec 2022 23:37:42 +0100
Message-Id: <20221208223817.1088619-36-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221208223817.1088619-1-bernd.kuhls@t-online.de>
References: <20221208223817.1088619-1-bernd.kuhls@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1670539099-D924D9D3-E8CC3DEF/0/0 CLEAN NORMAL
X-TOI-MSGID: be795c3b-3135-428b-b37d-51106629ddf3
Subject: [Buildroot] [PATCH 35/70] package/x11r7/xapp_sessreg: bump version
 to 1.1.3
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

https://lists.x.org/archives/xorg-announce/2022-October/003246.html
Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xapp_sessreg/xapp_sessreg.hash | 8 +++-----
 package/x11r7/xapp_sessreg/xapp_sessreg.mk   | 4 ++--
 2 files changed, 5 insertions(+), 7 deletions(-)

diff --git a/package/x11r7/xapp_sessreg/xapp_sessreg.hash b/package/x11r7/xapp_sessreg/xapp_sessreg.hash
index b8f55b50c5..1f1b54b877 100644
--- a/package/x11r7/xapp_sessreg/xapp_sessreg.hash
+++ b/package/x11r7/xapp_sessreg/xapp_sessreg.hash
@@ -1,7 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2019-June/002994.html
-md5  92be564d4be7d8aa7b5024057b715210  sessreg-1.1.2.tar.bz2
-sha1  169c1ff9fb152b4b4ca0cfbd3e1aee33af042016  sessreg-1.1.2.tar.bz2
-sha256  dfcb9e954273ace63879aec053c7880466f8755752a35aa9ced3fa5f04fd2c33  sessreg-1.1.2.tar.bz2
-sha512  7e3c2bdcadb7133aace463b58d8c6108d315ec95d2a42509073eeddc7f02644092a4b3168bd3b426c041736a016291092e0bf8368acd620dbeff96d53d12f98c  sessreg-1.1.2.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2022-October/003246.html
+sha256  022acd5de8077dddc4f919961f79e102ecd5f3228a333681af5cd0e7344facc2  sessreg-1.1.3.tar.xz
+sha512  bc1e83afc598ac5b4c6ab0861799b6c8727c123ee662c1fb9cbdd9ee926973b7a00cc62e32f6b4e462c0da3516f8b824337d9cf17587ebabd3f4753502641a60  sessreg-1.1.3.tar.xz
 # Locally computed
 sha256  ac8f5cc696e6c473aea4caaf18650316dc8912fcf0f370cae1df5f395cea8631  COPYING
diff --git a/package/x11r7/xapp_sessreg/xapp_sessreg.mk b/package/x11r7/xapp_sessreg/xapp_sessreg.mk
index 7f488e2423..b196bb947e 100644
--- a/package/x11r7/xapp_sessreg/xapp_sessreg.mk
+++ b/package/x11r7/xapp_sessreg/xapp_sessreg.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-XAPP_SESSREG_VERSION = 1.1.2
-XAPP_SESSREG_SOURCE = sessreg-$(XAPP_SESSREG_VERSION).tar.bz2
+XAPP_SESSREG_VERSION = 1.1.3
+XAPP_SESSREG_SOURCE = sessreg-$(XAPP_SESSREG_VERSION).tar.xz
 XAPP_SESSREG_SITE = https://xorg.freedesktop.org/archive/individual/app
 XAPP_SESSREG_LICENSE = MIT
 XAPP_SESSREG_LICENSE_FILES = COPYING
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
