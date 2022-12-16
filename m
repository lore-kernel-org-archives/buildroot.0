Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 881F1C4332F
	for <buildroot@archiver.kernel.org>; Fri, 16 Dec 2022 06:35:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C27D141A64;
	Fri, 16 Dec 2022 06:35:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C27D141A64
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EcAiYjQ5GgBZ; Fri, 16 Dec 2022 06:35:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B875C41B73;
	Fri, 16 Dec 2022 06:35:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B875C41B73
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 32EFF1BF39C
 for <buildroot@lists.busybox.net>; Fri, 16 Dec 2022 06:35:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1BC9E60ABE
 for <buildroot@lists.busybox.net>; Fri, 16 Dec 2022 06:35:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1BC9E60ABE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Xqx1cV2wIIQj for <buildroot@lists.busybox.net>;
 Fri, 16 Dec 2022 06:35:49 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B69B160AD6
Received: from mailout05.t-online.de (mailout05.t-online.de [194.25.134.82])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B69B160AD6
 for <buildroot@buildroot.org>; Fri, 16 Dec 2022 06:35:49 +0000 (UTC)
Received: from fwd75.dcpf.telekom.de (fwd75.aul.t-online.de [10.223.144.101])
 by mailout05.t-online.de (Postfix) with SMTP id A271F153E3
 for <buildroot@buildroot.org>; Fri, 16 Dec 2022 07:34:58 +0100 (CET)
Received: from fli4l.lan.fli4l ([79.214.202.93]) by fwd75.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1p64J6-1VvZlB0; Fri, 16 Dec 2022 07:34:56 +0100
Received: from bruckner.lan.fli4l ([192.168.1.1]:56574)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd.kuhls@t-online.de>) id 1p64J6-00071O-0b
 for buildroot@buildroot.org; Fri, 16 Dec 2022 07:34:56 +0100
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Fri, 16 Dec 2022 07:34:56 +0100
Message-Id: <20221216063456.397742-1-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1671172496-2EFF8535-F7EDA109/0/0 CLEAN NORMAL
X-TOI-MSGID: 363601e7-469a-4b21-926d-b68ae5c82b04
Subject: [Buildroot] [PATCH 1/1] package/x11r7/xlib_libX11: bump version to
 1.8.3
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
https://lists.x.org/archives/xorg-announce/2022-December/003305.html

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xlib_libX11/xlib_libX11.hash | 6 +++---
 package/x11r7/xlib_libX11/xlib_libX11.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/x11r7/xlib_libX11/xlib_libX11.hash b/package/x11r7/xlib_libX11/xlib_libX11.hash
index 4f5027d62d..62b67ad544 100644
--- a/package/x11r7/xlib_libX11/xlib_libX11.hash
+++ b/package/x11r7/xlib_libX11/xlib_libX11.hash
@@ -1,5 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2022-November/003253.html
-sha256  ed91d573d570db83b8ae546f4890dccfcd0b9dfe1e50a1b401b63a74c152ed04  libX11-1.8.2.tar.xz
-sha512  662ee8043d9ba27df82f647515b701d6f302a52715f21afdaba391f3b70691753e3649e7ff8322e07858be4297df9cbb19227958d676ed6dea198cce64330d1d  libX11-1.8.2.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2022-December/003305.html
+sha256  e31565c84006b6b8e01dc9399c806085739710bc2db2e0930f1511ed9d6585bd  libX11-1.8.3.tar.xz
+sha512  bc862338fed855986659e9ffa641db6b36c3ac9abced590d1b164e3cc24446671936e3688cdca18393129c4ea41777977eeb37e87d8edc14d6cc5d194a9c0325  libX11-1.8.3.tar.xz
 # Locally computed
 sha256  2e7012a140f000735a7172674a2d314398d79622444fba65d108b029b29ab283  COPYING
diff --git a/package/x11r7/xlib_libX11/xlib_libX11.mk b/package/x11r7/xlib_libX11/xlib_libX11.mk
index 26d4b4d306..3bb3fffce0 100644
--- a/package/x11r7/xlib_libX11/xlib_libX11.mk
+++ b/package/x11r7/xlib_libX11/xlib_libX11.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XLIB_LIBX11_VERSION = 1.8.2
+XLIB_LIBX11_VERSION = 1.8.3
 XLIB_LIBX11_SOURCE = libX11-$(XLIB_LIBX11_VERSION).tar.xz
 XLIB_LIBX11_SITE = https://xorg.freedesktop.org/archive/individual/lib
 XLIB_LIBX11_LICENSE = MIT
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
