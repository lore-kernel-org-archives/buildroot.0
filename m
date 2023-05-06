Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FB41C77B7F
	for <buildroot@archiver.kernel.org>; Sat,  6 May 2023 17:42:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E86B142A66;
	Sat,  6 May 2023 17:42:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E86B142A66
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JgRr82911q-g; Sat,  6 May 2023 17:42:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8FE0D40C5C;
	Sat,  6 May 2023 17:42:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8FE0D40C5C
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 497891BF369
 for <buildroot@lists.busybox.net>; Sat,  6 May 2023 17:39:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 231E3608A6
 for <buildroot@lists.busybox.net>; Sat,  6 May 2023 17:39:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 231E3608A6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DNrxYKyazpTD for <buildroot@lists.busybox.net>;
 Sat,  6 May 2023 17:39:29 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2E4EA607F7
Received: from mailout03.t-online.de (mailout03.t-online.de [194.25.134.81])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2E4EA607F7
 for <buildroot@buildroot.org>; Sat,  6 May 2023 17:39:29 +0000 (UTC)
Received: from fwd70.dcpf.telekom.de (fwd70.aul.t-online.de [10.223.144.96])
 by mailout03.t-online.de (Postfix) with SMTP id 4EFEF5839
 for <buildroot@buildroot.org>; Sat,  6 May 2023 19:39:27 +0200 (CEST)
Received: from fli4l.lan.fli4l ([79.214.192.80]) by fwd70.t-online.de
 with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
 esmtp id 1pvLsM-0QLfYg0; Sat, 6 May 2023 19:39:18 +0200
Received: from bruckner.lan.fli4l ([192.168.1.1]:36596)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd.kuhls@t-online.de>) id 1pvLsM-0004jT-0Y
 for buildroot@buildroot.org; Sat, 06 May 2023 19:39:18 +0200
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Sat,  6 May 2023 19:39:01 +0200
Message-Id: <20230506173917.1112500-6-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230506173917.1112500-1-bernd.kuhls@t-online.de>
References: <20230506173917.1112500-1-bernd.kuhls@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1683394758-DD540C15-EB8AEA37/0/0 CLEAN NORMAL
X-TOI-MSGID: 13ae0057-6988-40a5-b3a5-84c5fea081c3
Subject: [Buildroot] [PATCH 06/22] package/x11r7/xapp_xdpyinfo: bump version
 to 1.3.4
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
https://lists.x.org/archives/xorg-announce/2023-April/003388.html

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xapp_xdpyinfo/xapp_xdpyinfo.hash | 6 +++---
 package/x11r7/xapp_xdpyinfo/xapp_xdpyinfo.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/x11r7/xapp_xdpyinfo/xapp_xdpyinfo.hash b/package/x11r7/xapp_xdpyinfo/xapp_xdpyinfo.hash
index 07a3eb936c..b0afdc15ac 100644
--- a/package/x11r7/xapp_xdpyinfo/xapp_xdpyinfo.hash
+++ b/package/x11r7/xapp_xdpyinfo/xapp_xdpyinfo.hash
@@ -1,5 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2022-April/003157.html
-sha256  356d5fd62f3e98ee36d6becf1b32d4ab6112d618339fb4b592ccffbd9e0fc206  xdpyinfo-1.3.3.tar.xz
-sha512  47fe0821bc64145876853712ebd7c0af80111c243813615b892429021cc9a53abd38c4684551ae300cb5a4eacdd3d26e2c93e789ed91a948b20e2c37cd2d2442  xdpyinfo-1.3.3.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2023-April/003388.html
+sha256  a8ada581dbd7266440d7c3794fa89edf6b99b8857fc2e8c31042684f3af4822b  xdpyinfo-1.3.4.tar.xz
+sha512  9ef9f5c10e15a40895e8f008896b960fdd438277657c7159d16f05db79cd2374cfaca4af2f4e59335824bfd2f74a045ef89dd99ea4130ed436ea59fbbb1cbe12  xdpyinfo-1.3.4.tar.xz
 # Locally computed
 sha256  49733ead65fdfa1da0d176f9b965cc08dae74d73d66c9606488d52f6fc036abf  COPYING
diff --git a/package/x11r7/xapp_xdpyinfo/xapp_xdpyinfo.mk b/package/x11r7/xapp_xdpyinfo/xapp_xdpyinfo.mk
index c5e2a857e3..a198fc44c3 100644
--- a/package/x11r7/xapp_xdpyinfo/xapp_xdpyinfo.mk
+++ b/package/x11r7/xapp_xdpyinfo/xapp_xdpyinfo.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-XAPP_XDPYINFO_VERSION = 1.3.3
+XAPP_XDPYINFO_VERSION = 1.3.4
 XAPP_XDPYINFO_SOURCE = xdpyinfo-$(XAPP_XDPYINFO_VERSION).tar.xz
-XAPP_XDPYINFO_SITE = http://xorg.freedesktop.org/releases/individual/app
+XAPP_XDPYINFO_SITE = https://xorg.freedesktop.org/archive/individual/app
 XAPP_XDPYINFO_LICENSE = MIT
 XAPP_XDPYINFO_LICENSE_FILES = COPYING
 XAPP_XDPYINFO_CONF_OPTS = --without-xf86misc # not in BR
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
