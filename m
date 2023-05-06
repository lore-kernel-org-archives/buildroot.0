Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C21CC77B7F
	for <buildroot@archiver.kernel.org>; Sat,  6 May 2023 17:39:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 569CD40BFE;
	Sat,  6 May 2023 17:39:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 569CD40BFE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zRjMP275iFwG; Sat,  6 May 2023 17:39:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5643240C12;
	Sat,  6 May 2023 17:39:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5643240C12
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3D0F81BF369
 for <buildroot@lists.busybox.net>; Sat,  6 May 2023 17:39:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2358C40BFE
 for <buildroot@lists.busybox.net>; Sat,  6 May 2023 17:39:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2358C40BFE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MHXfRaBWnit4 for <buildroot@lists.busybox.net>;
 Sat,  6 May 2023 17:39:21 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 476D740B80
Received: from mailout03.t-online.de (mailout03.t-online.de [194.25.134.81])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 476D740B80
 for <buildroot@buildroot.org>; Sat,  6 May 2023 17:39:21 +0000 (UTC)
Received: from fwd85.dcpf.telekom.de (fwd85.aul.t-online.de [10.223.144.111])
 by mailout03.t-online.de (Postfix) with SMTP id 792D35836
 for <buildroot@buildroot.org>; Sat,  6 May 2023 19:39:18 +0200 (CEST)
Received: from fli4l.lan.fli4l ([79.214.192.80]) by fwd85.t-online.de
 with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
 esmtp id 1pvLsM-3RK6La0; Sat, 6 May 2023 19:39:18 +0200
Received: from bruckner.lan.fli4l ([192.168.1.1]:36596)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd.kuhls@t-online.de>) id 1pvLsM-0004jT-0L
 for buildroot@buildroot.org; Sat, 06 May 2023 19:39:18 +0200
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Sat,  6 May 2023 19:39:00 +0200
Message-Id: <20230506173917.1112500-5-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230506173917.1112500-1-bernd.kuhls@t-online.de>
References: <20230506173917.1112500-1-bernd.kuhls@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1683394758-A57C7C52-6D3F320D/0/0 CLEAN NORMAL
X-TOI-MSGID: 63dcb80c-c42b-4bd4-bd6c-c70d88e6978a
Subject: [Buildroot] [PATCH 05/22] package/x11r7/xapp_xinput: bump version
 to 1.6.4
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
https://lists.x.org/archives/xorg-announce/2023-April/003389.html

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xapp_xinput/xapp_xinput.hash | 8 +++-----
 package/x11r7/xapp_xinput/xapp_xinput.mk   | 4 ++--
 2 files changed, 5 insertions(+), 7 deletions(-)

diff --git a/package/x11r7/xapp_xinput/xapp_xinput.hash b/package/x11r7/xapp_xinput/xapp_xinput.hash
index 0961879637..d3a6a66902 100644
--- a/package/x11r7/xapp_xinput/xapp_xinput.hash
+++ b/package/x11r7/xapp_xinput/xapp_xinput.hash
@@ -1,7 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2019-July/003013.html
-md5  ac6b7432726008b2f50eba82b0e2dbe4  xinput-1.6.3.tar.bz2
-sha1  92ea7dfb3d8465921b0dca85da7d5b01cedae6c8  xinput-1.6.3.tar.bz2
-sha256  35a281dd3b9b22ea85e39869bb7670ba78955d5fec17c6ef7165d61e5aeb66ed  xinput-1.6.3.tar.bz2
-sha512  cb2fef866ac5a71dbca3e23b4ecadaca38e65dc1b30f8bb024bad92486554fafc472706619a1af04c746a4f53ce6aea827d694b9f4f0c7d0d46bb1da81984076  xinput-1.6.3.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2023-April/003389.html
+sha256  ad04d00d656884d133110eeddc34e9c69e626ebebbbab04dc95791c2907057c8  xinput-1.6.4.tar.xz
+sha512  6734860852715e5cb9d26259a173e42413fc037546ed7fa4173ffa802c2619ee0322bed228a28cd1911be759d860070867d9b89b115f37323cca1c9ef75354b9  xinput-1.6.4.tar.xz
 # Locally computed
 sha256  bbd35c7a8e8c5cb073935e84b29b0c53f7131a4ef1ce737dc2be5616941e07e1  COPYING
diff --git a/package/x11r7/xapp_xinput/xapp_xinput.mk b/package/x11r7/xapp_xinput/xapp_xinput.mk
index 0d6c0deffe..614b62fe77 100644
--- a/package/x11r7/xapp_xinput/xapp_xinput.mk
+++ b/package/x11r7/xapp_xinput/xapp_xinput.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-XAPP_XINPUT_VERSION = 1.6.3
-XAPP_XINPUT_SOURCE = xinput-$(XAPP_XINPUT_VERSION).tar.bz2
+XAPP_XINPUT_VERSION = 1.6.4
+XAPP_XINPUT_SOURCE = xinput-$(XAPP_XINPUT_VERSION).tar.xz
 XAPP_XINPUT_SITE = https://xorg.freedesktop.org/archive/individual/app
 XAPP_XINPUT_LICENSE = MIT
 XAPP_XINPUT_LICENSE_FILES = COPYING
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
