Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A41D5C4332F
	for <buildroot@archiver.kernel.org>; Thu,  8 Dec 2022 22:51:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4AB1660B08;
	Thu,  8 Dec 2022 22:51:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4AB1660B08
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id t-zC2U4QTDm5; Thu,  8 Dec 2022 22:51:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 47F3860A72;
	Thu,  8 Dec 2022 22:51:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 47F3860A72
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B21F81BF35F
 for <buildroot@lists.busybox.net>; Thu,  8 Dec 2022 22:38:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A7A6C820A7
 for <buildroot@lists.busybox.net>; Thu,  8 Dec 2022 22:38:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A7A6C820A7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id csuLwzlmBtr4 for <buildroot@lists.busybox.net>;
 Thu,  8 Dec 2022 22:38:34 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 85BCC820DE
Received: from mailout02.t-online.de (mailout02.t-online.de [194.25.134.17])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 85BCC820DE
 for <buildroot@buildroot.org>; Thu,  8 Dec 2022 22:38:34 +0000 (UTC)
Received: from fwd88.dcpf.telekom.de (fwd88.aul.t-online.de [10.223.144.114])
 by mailout02.t-online.de (Postfix) with SMTP id 61DCB11E78
 for <buildroot@buildroot.org>; Thu,  8 Dec 2022 23:38:32 +0100 (CET)
Received: from fli4l.lan.fli4l ([79.214.203.244]) by fwd88.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1p3PX0-0X2tPQ0; Thu, 8 Dec 2022 23:38:18 +0100
Received: from bruckner.lan.fli4l ([192.168.1.1]:35946)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd.kuhls@t-online.de>) id 1p3PX0-00048i-0X
 for buildroot@buildroot.org; Thu, 08 Dec 2022 23:38:18 +0100
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Thu,  8 Dec 2022 23:37:19 +0100
Message-Id: <20221208223817.1088619-13-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221208223817.1088619-1-bernd.kuhls@t-online.de>
References: <20221208223817.1088619-1-bernd.kuhls@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1670539098-E20B2E65-CE5F32F3/0/0 CLEAN NORMAL
X-TOI-MSGID: fa00a961-1eb6-4349-bbce-f7ce340ec1f9
Subject: [Buildroot] [PATCH 12/70] package/x11r7/xlib_libXdamage: bump
 version to 1.1.6
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

https://lists.x.org/archives/xorg-announce/2022-December/003277.html
Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xlib_libXdamage/xlib_libXdamage.hash | 8 +++-----
 package/x11r7/xlib_libXdamage/xlib_libXdamage.mk   | 6 +++---
 2 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/package/x11r7/xlib_libXdamage/xlib_libXdamage.hash b/package/x11r7/xlib_libXdamage/xlib_libXdamage.hash
index 9e7cf566a7..41a809ad23 100644
--- a/package/x11r7/xlib_libXdamage/xlib_libXdamage.hash
+++ b/package/x11r7/xlib_libXdamage/xlib_libXdamage.hash
@@ -1,7 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2019-March/002973.html
-md5  e3f554267a7a04b042dc1f6352bd6d99  libXdamage-1.1.5.tar.bz2
-sha1  719ae6ab8c1b972c6386b654976c479255af5572  libXdamage-1.1.5.tar.bz2
-sha256  b734068643cac3b5f3d2c8279dd366b5bf28c7219d9e9d8717e1383995e0ea45  libXdamage-1.1.5.tar.bz2
-sha512  a3ca6cc33b1727f717a3e2aa5593f660508a81a47918a0aa949e9e8fba105e303fe5071983b48caac92feea0fe6e8e01620805e4d19b41f21f20d837b191c124  libXdamage-1.1.5.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2022-December/003277.html
+sha256  52733c1f5262fca35f64e7d5060c6fcd81a880ba8e1e65c9621cf0727afb5d11  libXdamage-1.1.6.tar.xz
+sha512  624dcefa1c79064569df952892f7f1351dc19ad338ce73d1a57041e406cb3e18abe531bab352b93d1f0f5c9b5c6b2652cc84a8f1fbfcbba648343812695a8acb  libXdamage-1.1.6.tar.xz
 # Locally computed
 sha256  33effe928634be12e668465c3935c5570ff2787b970b15d9243d69df42302c57  COPYING
diff --git a/package/x11r7/xlib_libXdamage/xlib_libXdamage.mk b/package/x11r7/xlib_libXdamage/xlib_libXdamage.mk
index cc5493ff6c..dba0862211 100644
--- a/package/x11r7/xlib_libXdamage/xlib_libXdamage.mk
+++ b/package/x11r7/xlib_libXdamage/xlib_libXdamage.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-XLIB_LIBXDAMAGE_VERSION = 1.1.5
-XLIB_LIBXDAMAGE_SOURCE = libXdamage-$(XLIB_LIBXDAMAGE_VERSION).tar.bz2
-XLIB_LIBXDAMAGE_SITE = http://xorg.freedesktop.org/releases/individual/lib
+XLIB_LIBXDAMAGE_VERSION = 1.1.6
+XLIB_LIBXDAMAGE_SOURCE = libXdamage-$(XLIB_LIBXDAMAGE_VERSION).tar.xz
+XLIB_LIBXDAMAGE_SITE = https://xorg.freedesktop.org/archive/individual/lib
 XLIB_LIBXDAMAGE_LICENSE = MIT
 XLIB_LIBXDAMAGE_LICENSE_FILES = COPYING
 XLIB_LIBXDAMAGE_INSTALL_STAGING = YES
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
