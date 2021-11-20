Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCE14C433EF
	for <buildroot@archiver.kernel.org>; Sat, 20 Nov 2021 10:33:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6C535410A4;
	Sat, 20 Nov 2021 10:33:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HAzsZCu1XGAK; Sat, 20 Nov 2021 10:33:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B34A74043D;
	Sat, 20 Nov 2021 10:33:43 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A754F1BF420
 for <buildroot@lists.busybox.net>; Sat, 20 Nov 2021 10:33:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 94DB260597
 for <buildroot@lists.busybox.net>; Sat, 20 Nov 2021 10:33:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1LqU3G5tu9_z for <buildroot@lists.busybox.net>;
 Sat, 20 Nov 2021 10:33:41 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mailout08.t-online.de (mailout08.t-online.de [194.25.134.20])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AFBF46058A
 for <buildroot@buildroot.org>; Sat, 20 Nov 2021 10:33:41 +0000 (UTC)
Received: from fwd74.dcpf.telekom.de (fwd74.aul.t-online.de [10.223.144.100])
 by mailout08.t-online.de (Postfix) with SMTP id AA6B112FF7
 for <buildroot@buildroot.org>; Sat, 20 Nov 2021 11:33:39 +0100 (CET)
Received: from fli4l.lan.fli4l ([79.214.197.220]) by fwd74.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1moNgh-1rpADR0; Sat, 20 Nov 2021 11:33:39 +0100
Received: from bruckner.lan.fli4l ([192.168.1.1]:45104)
 by fli4l.lan.fli4l with esmtp (Exim 4.95)
 (envelope-from <bernd.kuhls@t-online.de>) id 1moNgg-0002Og-P8
 for buildroot@buildroot.org; Sat, 20 Nov 2021 11:33:38 +0100
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Sat, 20 Nov 2021 11:33:38 +0100
Message-Id: <20211120103338.2524370-1-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1637404419-00001446-0C10C223/0/0 CLEAN NORMAL
X-TOI-MSGID: 7420cfb2-0712-4817-b138-94b0d8e38b02
Subject: [Buildroot] [PATCH/next 1/1] package/libdrm: bump version to 2.4.108
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

Updated license due to upstream commits:
https://cgit.freedesktop.org/mesa/drm/log/xf86drm.c?h=main

Release notes:
https://lists.freedesktop.org/archives/dri-devel/2021-November/330279.html

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/libdrm/libdrm.hash | 8 ++++----
 package/libdrm/libdrm.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/libdrm/libdrm.hash b/package/libdrm/libdrm.hash
index d3f35b3de0..ee14d4c124 100644
--- a/package/libdrm/libdrm.hash
+++ b/package/libdrm/libdrm.hash
@@ -1,6 +1,6 @@
-# From https://lists.freedesktop.org/archives/dri-devel/2021-July/313594.html
-sha256  c554cef03b033636a975543eab363cc19081cb464595d3da1ec129f87370f888  libdrm-2.4.107.tar.xz
-sha512  c7542ba15c4c934519a6a1f3cb1ec21effa820a805a030d0175313bb1cc796cd311f39596ead883f9f251679d701e262894c5a297d5cf45093c80a6cd818def0  libdrm-2.4.107.tar.xz
+# From https://lists.freedesktop.org/archives/dri-devel/2021-November/330279.html
+sha256  a1d7948cbc536763fde14b4beb5e4da7867607966d4cf46301087e8b8fe3d6a0  libdrm-2.4.108.tar.xz
+sha512  6a841dc3eb8eae7d75e1d35d23a14d51aff758e5a251dbcf6fc8c28d973d935a4a2f6751b405e956b2777d93c651721199ac80c3cd14b87d021668120d6bc974  libdrm-2.4.108.tar.xz
 
 # Hash for license file
-sha256  7e952c6666ed17c99f91ee7af13c688b8769b0feaf6f4558bf6ad3e07512e1e6  xf86drm.c
+sha256  e64a695d0f18bfba26071afdfe19dd6ff4030d0dc1c47304059b724b23955ddb  xf86drm.c
diff --git a/package/libdrm/libdrm.mk b/package/libdrm/libdrm.mk
index c15be3e671..0e4029fed2 100644
--- a/package/libdrm/libdrm.mk
+++ b/package/libdrm/libdrm.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBDRM_VERSION = 2.4.107
+LIBDRM_VERSION = 2.4.108
 LIBDRM_SOURCE = libdrm-$(LIBDRM_VERSION).tar.xz
 LIBDRM_SITE = https://dri.freedesktop.org/libdrm
 LIBDRM_LICENSE = MIT
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
