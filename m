Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 485DDE77180
	for <buildroot@archiver.kernel.org>; Mon,  9 Dec 2024 08:28:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 134C44068A;
	Mon,  9 Dec 2024 08:28:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9KTd1u8oSPJ7; Mon,  9 Dec 2024 08:28:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DEB0940668
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DEB0940668;
	Mon,  9 Dec 2024 08:28:10 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6F72EED7
 for <buildroot@buildroot.org>; Mon,  9 Dec 2024 08:27:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CA123607DF
 for <buildroot@buildroot.org>; Mon,  9 Dec 2024 08:27:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3-zrpRxhSAya for <buildroot@buildroot.org>;
 Mon,  9 Dec 2024 08:27:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::225;
 helo=relay5-d.mail.gandi.net; envelope-from=peko@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org E760060598
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E760060598
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E760060598
 for <buildroot@buildroot.org>; Mon,  9 Dec 2024 08:27:36 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id EE45C1C0007;
 Mon,  9 Dec 2024 08:27:34 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peko@dell.be.48ers.dk>) id 1tKZ78-00CnSg-1h;
 Mon, 09 Dec 2024 09:27:34 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon,  9 Dec 2024 09:27:20 +0100
Message-Id: <20241209082722.3049825-22-peter@korsgaard.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241209082722.3049825-1-peter@korsgaard.com>
References: <20241209082722.3049825-1-peter@korsgaard.com>
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: [Buildroot] [PATCH 22/23] package/xdriver_xf86-video-qxl: fix
 'appropriate' typo
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

Found by codespell.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/x11r7/xdriver_xf86-video-qxl/xdriver_xf86-video-qxl.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/x11r7/xdriver_xf86-video-qxl/xdriver_xf86-video-qxl.mk b/package/x11r7/xdriver_xf86-video-qxl/xdriver_xf86-video-qxl.mk
index db0bbbaf65..616566f9ab 100644
--- a/package/x11r7/xdriver_xf86-video-qxl/xdriver_xf86-video-qxl.mk
+++ b/package/x11r7/xdriver_xf86-video-qxl/xdriver_xf86-video-qxl.mk
@@ -19,7 +19,7 @@ XDRIVER_XF86_VIDEO_QXL_DEPENDENCIES = \
 	xorgproto \
 	xserver_xorg-server
 
-# configure doesn't look for drm headers in the appropiate place, so help it
+# configure doesn't look for drm headers in the appropriate place, so help it
 # libdrm is only useful with udev for KMS
 ifeq ($(BR2_PACKAGE_HAS_UDEV),y)
 XDRIVER_XF86_VIDEO_QXL_CONF_ENV += REQUIRED_MODULES=libdrm
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
