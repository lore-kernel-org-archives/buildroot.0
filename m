Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97B17C4332F
	for <buildroot@archiver.kernel.org>; Thu,  8 Dec 2022 22:42:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4608240465;
	Thu,  8 Dec 2022 22:42:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4608240465
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6-KPg1gs68wC; Thu,  8 Dec 2022 22:42:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2F2BE403E9;
	Thu,  8 Dec 2022 22:42:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2F2BE403E9
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D87281BF35F
 for <buildroot@lists.busybox.net>; Thu,  8 Dec 2022 22:38:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 53CA9820D4
 for <buildroot@lists.busybox.net>; Thu,  8 Dec 2022 22:38:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 53CA9820D4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8w-k2Cpnxbfx for <buildroot@lists.busybox.net>;
 Thu,  8 Dec 2022 22:38:25 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7FE90820A7
Received: from mailout12.t-online.de (mailout12.t-online.de [194.25.134.22])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7FE90820A7
 for <buildroot@buildroot.org>; Thu,  8 Dec 2022 22:38:25 +0000 (UTC)
Received: from fwd83.dcpf.telekom.de (fwd83.aul.t-online.de [10.223.144.109])
 by mailout12.t-online.de (Postfix) with SMTP id 5926F18AC0
 for <buildroot@buildroot.org>; Thu,  8 Dec 2022 23:38:23 +0100 (CET)
Received: from fli4l.lan.fli4l ([79.214.203.244]) by fwd83.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1p3PX0-2btxJb0; Thu, 8 Dec 2022 23:38:19 +0100
Received: from bruckner.lan.fli4l ([192.168.1.1]:35946)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd.kuhls@t-online.de>) id 1p3PX0-00048i-2S
 for buildroot@buildroot.org; Thu, 08 Dec 2022 23:38:18 +0100
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Thu,  8 Dec 2022 23:37:28 +0100
Message-Id: <20221208223817.1088619-22-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221208223817.1088619-1-bernd.kuhls@t-online.de>
References: <20221208223817.1088619-1-bernd.kuhls@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1670539099-62A0A2DC-B1560B57/0/0 CLEAN NORMAL
X-TOI-MSGID: db61709b-dbf0-44b8-abc3-70a7331f772d
Subject: [Buildroot] [PATCH 21/70] package/x11r7/xapp_xgamma: bump version
 to 1.0.7
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

https://lists.x.org/archives/xorg-announce/2022-December/003267.html
Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xapp_xgamma/xapp_xgamma.hash | 5 +++--
 package/x11r7/xapp_xgamma/xapp_xgamma.mk   | 6 +++---
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/package/x11r7/xapp_xgamma/xapp_xgamma.hash b/package/x11r7/xapp_xgamma/xapp_xgamma.hash
index 0031450c4d..17efe0a975 100644
--- a/package/x11r7/xapp_xgamma/xapp_xgamma.hash
+++ b/package/x11r7/xapp_xgamma/xapp_xgamma.hash
@@ -1,4 +1,5 @@
-# From http://lists.x.org/archives/xorg-announce/2015-April/002574.html
-sha256  0ef1c35b5c18b1b22317f455c8df13c0a471a8efad63c89c98ae3ce8c2b222d3  xgamma-1.0.6.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2022-December/003267.html
+sha256  1c79dae85a8953a15f4fe5c2895a033307b43b8613456c87ec47b374b113bc8f  xgamma-1.0.7.tar.xz
+sha512  9eeee9b537dcae9e4d153774eb632a6a5e8dd32bebadc9bbd897a773e5b56f76848f32a1699b8c921d3094760c42b5083365d853b89ab31fd85c7a0d46feeceb  xgamma-1.0.7.tar.xz
 # Locally computed
 sha256  78d354d348feaaab8d67a220e84137ec24fece04af4dface2e67132c72e216a2  COPYING
diff --git a/package/x11r7/xapp_xgamma/xapp_xgamma.mk b/package/x11r7/xapp_xgamma/xapp_xgamma.mk
index a73a29e5a2..f2e9e91efb 100644
--- a/package/x11r7/xapp_xgamma/xapp_xgamma.mk
+++ b/package/x11r7/xapp_xgamma/xapp_xgamma.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-XAPP_XGAMMA_VERSION = 1.0.6
-XAPP_XGAMMA_SOURCE = xgamma-$(XAPP_XGAMMA_VERSION).tar.bz2
-XAPP_XGAMMA_SITE = http://xorg.freedesktop.org/releases/individual/app
+XAPP_XGAMMA_VERSION = 1.0.7
+XAPP_XGAMMA_SOURCE = xgamma-$(XAPP_XGAMMA_VERSION).tar.xz
+XAPP_XGAMMA_SITE = https://xorg.freedesktop.org/archive/individual/app
 XAPP_XGAMMA_LICENSE = MIT
 XAPP_XGAMMA_LICENSE_FILES = COPYING
 XAPP_XGAMMA_DEPENDENCIES = xlib_libXxf86vm
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
