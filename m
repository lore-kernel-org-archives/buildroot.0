Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32057C4332F
	for <buildroot@archiver.kernel.org>; Thu,  8 Dec 2022 22:38:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9828A41918;
	Thu,  8 Dec 2022 22:38:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9828A41918
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OvrjPfsTOuK0; Thu,  8 Dec 2022 22:38:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 496E841914;
	Thu,  8 Dec 2022 22:38:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 496E841914
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7DDE21BF969
 for <buildroot@lists.busybox.net>; Thu,  8 Dec 2022 22:38:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 52FA2820DE
 for <buildroot@lists.busybox.net>; Thu,  8 Dec 2022 22:38:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 52FA2820DE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id o2AIrwA72Y61 for <buildroot@lists.busybox.net>;
 Thu,  8 Dec 2022 22:38:23 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E02F8820A7
Received: from mailout08.t-online.de (mailout08.t-online.de [194.25.134.20])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E02F8820A7
 for <buildroot@buildroot.org>; Thu,  8 Dec 2022 22:38:22 +0000 (UTC)
Received: from fwd87.dcpf.telekom.de (fwd87.aul.t-online.de [10.223.144.113])
 by mailout08.t-online.de (Postfix) with SMTP id 7640F13758
 for <buildroot@buildroot.org>; Thu,  8 Dec 2022 23:38:20 +0100 (CET)
Received: from fli4l.lan.fli4l ([79.214.203.244]) by fwd87.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1p3PWz-0RSxso0; Thu, 8 Dec 2022 23:38:17 +0100
Received: from bruckner.lan.fli4l ([192.168.1.1]:35946)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd.kuhls@t-online.de>) id 1p3PWz-00048i-2i
 for buildroot@buildroot.org; Thu, 08 Dec 2022 23:38:17 +0100
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Thu,  8 Dec 2022 23:37:14 +0100
Message-Id: <20221208223817.1088619-8-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221208223817.1088619-1-bernd.kuhls@t-online.de>
References: <20221208223817.1088619-1-bernd.kuhls@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1670539098-3BFEC81E-5DFB8109/0/0 CLEAN NORMAL
X-TOI-MSGID: 6a4883aa-862a-4af0-b652-7b65341d77a7
Subject: [Buildroot] [PATCH 07/70] package/x11r7/xapp_xkbcomp: bump version
 to 1.4.6
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

https://lists.x.org/archives/xorg-announce/2022-December/003283.html
Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xapp_xkbcomp/xapp_xkbcomp.hash | 7 +++----
 package/x11r7/xapp_xkbcomp/xapp_xkbcomp.mk   | 4 ++--
 2 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/package/x11r7/xapp_xkbcomp/xapp_xkbcomp.hash b/package/x11r7/xapp_xkbcomp/xapp_xkbcomp.hash
index bccaae6f57..b626e50236 100644
--- a/package/x11r7/xapp_xkbcomp/xapp_xkbcomp.hash
+++ b/package/x11r7/xapp_xkbcomp/xapp_xkbcomp.hash
@@ -1,6 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2021-March/003075.html
-sha256  6851086c4244b6fd0cc562880d8ff193fb2bbf1e141c73632e10731b31d4b05e  xkbcomp-1.4.5.tar.bz2
-sha512  2e84f8d6b083e2e818cb95e5d2a184da00e50d71b280e92d1a71465a9a4348f922f4ddccb42cfeee6f76705bbfc8580ef67aedd0d958aaa1ae6bbcc66ccd8154  xkbcomp-1.4.5.tar.bz2
-
+# From https://lists.x.org/archives/xorg-announce/2022-December/003283.html
+sha256  fa50d611ef41e034487af7bd8d8c718df53dd18002f591cca16b0384afc58e98  xkbcomp-1.4.6.tar.xz
+sha512  90e69dd1c78c28f77a5acc7821b43afec1b9ac4895bc6f3462b4902baaadc26f3869da69e3bd023b4bc74adb5f1be0c43ca24b3dab37ac9a479c5622684baa81  xkbcomp-1.4.6.tar.xz
 # Locally computed
 sha256  6b833fdc05906ce57f016dc791db86830d49ee4da2861ce45806c50b3f4dda9e  COPYING
diff --git a/package/x11r7/xapp_xkbcomp/xapp_xkbcomp.mk b/package/x11r7/xapp_xkbcomp/xapp_xkbcomp.mk
index b52f5e6850..61922c7cc9 100644
--- a/package/x11r7/xapp_xkbcomp/xapp_xkbcomp.mk
+++ b/package/x11r7/xapp_xkbcomp/xapp_xkbcomp.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-XAPP_XKBCOMP_VERSION = 1.4.5
-XAPP_XKBCOMP_SOURCE = xkbcomp-$(XAPP_XKBCOMP_VERSION).tar.bz2
+XAPP_XKBCOMP_VERSION = 1.4.6
+XAPP_XKBCOMP_SOURCE = xkbcomp-$(XAPP_XKBCOMP_VERSION).tar.xz
 XAPP_XKBCOMP_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XKBCOMP_LICENSE = MIT
 XAPP_XKBCOMP_LICENSE_FILES = COPYING
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
