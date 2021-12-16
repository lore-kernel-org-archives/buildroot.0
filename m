Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91C41C433F5
	for <buildroot@archiver.kernel.org>; Thu, 16 Dec 2021 21:27:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 386A883F39;
	Thu, 16 Dec 2021 21:27:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id h9hqdl07bvLS; Thu, 16 Dec 2021 21:27:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9DF5983F34;
	Thu, 16 Dec 2021 21:27:44 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0BDC11BF392
 for <buildroot@lists.busybox.net>; Thu, 16 Dec 2021 21:27:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EFEF983F34
 for <buildroot@lists.busybox.net>; Thu, 16 Dec 2021 21:27:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Rbl_RuKghP0w for <buildroot@lists.busybox.net>;
 Thu, 16 Dec 2021 21:27:37 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mailout08.t-online.de (mailout08.t-online.de [194.25.134.20])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E87F183EFA
 for <buildroot@buildroot.org>; Thu, 16 Dec 2021 21:27:36 +0000 (UTC)
Received: from fwd80.dcpf.telekom.de (fwd80.aul.t-online.de [10.223.144.106])
 by mailout08.t-online.de (Postfix) with SMTP id 789BB1818C;
 Thu, 16 Dec 2021 22:27:33 +0100 (CET)
Received: from fli4l.lan.fli4l ([84.161.188.64]) by fwd80.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1mxyHd-3ExRzd0; Thu, 16 Dec 2021 22:27:25 +0100
Received: from bruckner.lan.fli4l ([192.168.1.1]:42768)
 by fli4l.lan.fli4l with esmtp (Exim 4.95)
 (envelope-from <bernd.kuhls@t-online.de>) id 1mxyHd-0002pg-2b;
 Thu, 16 Dec 2021 22:27:25 +0100
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Thu, 16 Dec 2021 22:27:24 +0100
Message-Id: <20211216212724.787872-3-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211216212724.787872-1-bernd.kuhls@t-online.de>
References: <20211216212724.787872-1-bernd.kuhls@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1639690045-00001C4D-4553DD1E/0/0 CLEAN NORMAL
X-TOI-MSGID: f5ad24a1-dc6c-4747-94ec-14ac1f05b22b
Subject: [Buildroot] [PATCH 3/3] package/x11r7/xapp_xinput-calibrator:
 switch _SITE to https
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
Cc: Louis-Paul Cordier <lpdev@cordier.org>,
 Theo Debrouwere <t.debrouwere@televic.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xapp_xinput-calibrator/xapp_xinput-calibrator.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/x11r7/xapp_xinput-calibrator/xapp_xinput-calibrator.mk b/package/x11r7/xapp_xinput-calibrator/xapp_xinput-calibrator.mk
index 974b83df2c..be86608b85 100644
--- a/package/x11r7/xapp_xinput-calibrator/xapp_xinput-calibrator.mk
+++ b/package/x11r7/xapp_xinput-calibrator/xapp_xinput-calibrator.mk
@@ -6,7 +6,7 @@
 
 XAPP_XINPUT_CALIBRATOR_VERSION = 0.7.5
 XAPP_XINPUT_CALIBRATOR_SOURCE = xinput_calibrator-$(XAPP_XINPUT_CALIBRATOR_VERSION).tar.gz
-XAPP_XINPUT_CALIBRATOR_SITE = http://github.com/downloads/tias/xinput_calibrator
+XAPP_XINPUT_CALIBRATOR_SITE = https://github.com/downloads/tias/xinput_calibrator
 XAPP_XINPUT_CALIBRATOR_LICENSE = MIT
 XAPP_XINPUT_CALIBRATOR_LICENSE_FILES = COPYING
 XAPP_XINPUT_CALIBRATOR_DEPENDENCIES = xlib_libX11 xlib_libXi
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
