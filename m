Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33B5DC4332F
	for <buildroot@archiver.kernel.org>; Thu,  8 Dec 2022 22:52:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C2088409AE;
	Thu,  8 Dec 2022 22:52:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C2088409AE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ASQTT6f0F6SQ; Thu,  8 Dec 2022 22:52:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8E8D640933;
	Thu,  8 Dec 2022 22:52:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8E8D640933
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 532011BF35F
 for <buildroot@lists.busybox.net>; Thu,  8 Dec 2022 22:38:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 454BD403A5
 for <buildroot@lists.busybox.net>; Thu,  8 Dec 2022 22:38:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 454BD403A5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0_8dtqjYZGu2 for <buildroot@lists.busybox.net>;
 Thu,  8 Dec 2022 22:38:36 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 28693401D2
Received: from mailout04.t-online.de (mailout04.t-online.de [194.25.134.18])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 28693401D2
 for <buildroot@buildroot.org>; Thu,  8 Dec 2022 22:38:36 +0000 (UTC)
Received: from fwd75.dcpf.telekom.de (fwd75.aul.t-online.de [10.223.144.101])
 by mailout04.t-online.de (Postfix) with SMTP id 0A1825A5A
 for <buildroot@buildroot.org>; Thu,  8 Dec 2022 23:38:34 +0100 (CET)
Received: from fli4l.lan.fli4l ([79.214.203.244]) by fwd75.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1p3PX2-3PxxNj0; Thu, 8 Dec 2022 23:38:20 +0100
Received: from bruckner.lan.fli4l ([192.168.1.1]:35946)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd.kuhls@t-online.de>) id 1p3PX1-00048i-34
 for buildroot@buildroot.org; Thu, 08 Dec 2022 23:38:20 +0100
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Thu,  8 Dec 2022 23:37:46 +0100
Message-Id: <20221208223817.1088619-40-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221208223817.1088619-1-bernd.kuhls@t-online.de>
References: <20221208223817.1088619-1-bernd.kuhls@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1670539100-3C882535-9884594A/0/0 CLEAN NORMAL
X-TOI-MSGID: cbd55812-e359-4a04-975b-153cccfaf144
Subject: [Buildroot] [PATCH 39/70] package/x11r7/xapp_x11perf: bump version
 to 1.6.2
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

https://lists.x.org/archives/xorg-announce/2022-October/003242.html
Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xapp_x11perf/xapp_x11perf.hash | 8 +++-----
 package/x11r7/xapp_x11perf/xapp_x11perf.mk   | 6 +++---
 2 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/package/x11r7/xapp_x11perf/xapp_x11perf.hash b/package/x11r7/xapp_x11perf/xapp_x11perf.hash
index 673d3602ba..3370d7df53 100644
--- a/package/x11r7/xapp_x11perf/xapp_x11perf.hash
+++ b/package/x11r7/xapp_x11perf/xapp_x11perf.hash
@@ -1,7 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2019-March/002983.html
-md5  e96b56756990c56c24d2d02c2964456b  x11perf-1.6.1.tar.bz2
-sha1  c54ebef80b6cb565397fe2e3069e0d7470027e5a  x11perf-1.6.1.tar.bz2
-sha256  1c7e0b8ffc2794b4ccf11e04d551823abe0ea47b4f7db0637390db6fbe817c34  x11perf-1.6.1.tar.bz2
-sha512  b386151bfe3d7c04ab9953ae1882f3c5b627d6d1afb9a8cfe87c58236a88883fc11bbadb2226b9aa61df84b4fce625a1c9e3d146a124ac17e8d7d605b35d9c0b  x11perf-1.6.1.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2022-October/003242.html
+sha256  5a0e7cea47716ad07ceca38bbd07ae06459ee4d837b9c9dfc21ccb94e3e24fcc  x11perf-1.6.2.tar.xz
+sha512  5be9e601071a42d103adbab5f30c1900a3779a5b2c06c709df99a85487c9790d36b835d43f5c6d74cc7d950cc3ad06927210d7b1f58939cfd0b4a6f3e5e32112  x11perf-1.6.2.tar.xz
 # Locally computed
 sha256  f467ff659142e2eb4cb7275c48c789d249af398b09a405d3e181dcc339b3b922  COPYING
diff --git a/package/x11r7/xapp_x11perf/xapp_x11perf.mk b/package/x11r7/xapp_x11perf/xapp_x11perf.mk
index ec10590b73..3a1d579939 100644
--- a/package/x11r7/xapp_x11perf/xapp_x11perf.mk
+++ b/package/x11r7/xapp_x11perf/xapp_x11perf.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-XAPP_X11PERF_VERSION = 1.6.1
-XAPP_X11PERF_SOURCE = x11perf-$(XAPP_X11PERF_VERSION).tar.bz2
-XAPP_X11PERF_SITE = http://xorg.freedesktop.org/releases/individual/app
+XAPP_X11PERF_VERSION = 1.6.2
+XAPP_X11PERF_SOURCE = x11perf-$(XAPP_X11PERF_VERSION).tar.xz
+XAPP_X11PERF_SITE = https://xorg.freedesktop.org/archive/individual/test
 XAPP_X11PERF_LICENSE = MIT
 XAPP_X11PERF_LICENSE_FILES = COPYING
 XAPP_X11PERF_DEPENDENCIES = xlib_libX11 xlib_libXmu xlib_libXft
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
