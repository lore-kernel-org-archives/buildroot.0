Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E11DC4332F
	for <buildroot@archiver.kernel.org>; Thu,  8 Dec 2022 22:40:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E107440145;
	Thu,  8 Dec 2022 22:40:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E107440145
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5AnMCNVU6hTL; Thu,  8 Dec 2022 22:40:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DD4F4403A5;
	Thu,  8 Dec 2022 22:40:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DD4F4403A5
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BCEBB1BF35F
 for <buildroot@lists.busybox.net>; Thu,  8 Dec 2022 22:38:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 92A48820EC
 for <buildroot@lists.busybox.net>; Thu,  8 Dec 2022 22:38:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 92A48820EC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qRyZ4VaOP46P for <buildroot@lists.busybox.net>;
 Thu,  8 Dec 2022 22:38:25 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 84D26820D4
Received: from mailout12.t-online.de (mailout12.t-online.de [194.25.134.22])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 84D26820D4
 for <buildroot@buildroot.org>; Thu,  8 Dec 2022 22:38:25 +0000 (UTC)
Received: from fwd83.dcpf.telekom.de (fwd83.aul.t-online.de [10.223.144.109])
 by mailout12.t-online.de (Postfix) with SMTP id 5E3CD18AC5
 for <buildroot@buildroot.org>; Thu,  8 Dec 2022 23:38:23 +0100 (CET)
Received: from fli4l.lan.fli4l ([79.214.203.244]) by fwd83.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1p3PX2-2hBjc30; Thu, 8 Dec 2022 23:38:20 +0100
Received: from bruckner.lan.fli4l ([192.168.1.1]:35946)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd.kuhls@t-online.de>) id 1p3PX1-00048i-1p
 for buildroot@buildroot.org; Thu, 08 Dec 2022 23:38:19 +0100
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Thu,  8 Dec 2022 23:37:40 +0100
Message-Id: <20221208223817.1088619-34-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221208223817.1088619-1-bernd.kuhls@t-online.de>
References: <20221208223817.1088619-1-bernd.kuhls@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1670539100-62A0A2DC-550446C3/0/0 CLEAN NORMAL
X-TOI-MSGID: d9e04257-e871-43e6-9086-7004b0038e95
Subject: [Buildroot] [PATCH 33/70] package/x11r7/xapp_xcompmgr: bump version
 to 1.1.9
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

https://lists.x.org/archives/xorg-announce/2022-November/003254.html
Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xapp_xcompmgr/xapp_xcompmgr.hash | 8 +++-----
 package/x11r7/xapp_xcompmgr/xapp_xcompmgr.mk   | 6 +++---
 2 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/package/x11r7/xapp_xcompmgr/xapp_xcompmgr.hash b/package/x11r7/xapp_xcompmgr/xapp_xcompmgr.hash
index 6f0d755261..b9675a5ecf 100644
--- a/package/x11r7/xapp_xcompmgr/xapp_xcompmgr.hash
+++ b/package/x11r7/xapp_xcompmgr/xapp_xcompmgr.hash
@@ -1,7 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2019-March/002989.html
-md5  ef8c7d4140c11efb8de4141b3968208c  xcompmgr-1.1.8.tar.bz2
-sha1  7bb28329b4bb687763df2d2c1723cb6ecb20945a  xcompmgr-1.1.8.tar.bz2
-sha256  0b89daf4f060fa3fa83cca862c45d531fef7121b5d06552c1d73d396ad9a7243  xcompmgr-1.1.8.tar.bz2
-sha512  ccf29426ffb0797a53653d1ce152de5eee0cec284811fed4b8e634ea0d948180531e4619d96f47e4f9594432c57322624fe0fdaee2c9200efac427fc0904953d  xcompmgr-1.1.8.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2022-November/003254.html
+sha256  4875b6698672d01eb3a5080bde6eac9a989d486a82226a2d5e23624f1527a6f0  xcompmgr-1.1.9.tar.xz
+sha512  699117492af7fd84b36d317dcbf422d5ec86a7f21e29370caa737cd940d8ff866a5c8704ba2e7bd17a64e085d77fd23b628263d619813dead85cd669ff5b860e  xcompmgr-1.1.9.tar.xz
 # Locally computed
 sha256  c843545f72771b3ff95eb88defc2e3ed8f9a1802d9bb6c32c196bb5eec3d3a5d  COPYING
diff --git a/package/x11r7/xapp_xcompmgr/xapp_xcompmgr.mk b/package/x11r7/xapp_xcompmgr/xapp_xcompmgr.mk
index 24ebad7bda..c754ea37b3 100644
--- a/package/x11r7/xapp_xcompmgr/xapp_xcompmgr.mk
+++ b/package/x11r7/xapp_xcompmgr/xapp_xcompmgr.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-XAPP_XCOMPMGR_VERSION = 1.1.8
-XAPP_XCOMPMGR_SOURCE = xcompmgr-$(XAPP_XCOMPMGR_VERSION).tar.bz2
-XAPP_XCOMPMGR_SITE = http://xorg.freedesktop.org/releases/individual/app
+XAPP_XCOMPMGR_VERSION = 1.1.9
+XAPP_XCOMPMGR_SOURCE = xcompmgr-$(XAPP_XCOMPMGR_VERSION).tar.xz
+XAPP_XCOMPMGR_SITE = https://xorg.freedesktop.org/archive/individual/app
 XAPP_XCOMPMGR_LICENSE = MIT
 XAPP_XCOMPMGR_LICENSE_FILES = COPYING
 XAPP_XCOMPMGR_DEPENDENCIES = \
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
