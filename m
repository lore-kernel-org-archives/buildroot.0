Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3721C4332F
	for <buildroot@archiver.kernel.org>; Thu,  8 Dec 2022 22:56:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 817FF41524;
	Thu,  8 Dec 2022 22:56:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 817FF41524
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wHuKrezfMHVA; Thu,  8 Dec 2022 22:56:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0A34E41755;
	Thu,  8 Dec 2022 22:56:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0A34E41755
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1290A1BF35F
 for <buildroot@lists.busybox.net>; Thu,  8 Dec 2022 22:38:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9F8ED401D2
 for <buildroot@lists.busybox.net>; Thu,  8 Dec 2022 22:38:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9F8ED401D2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uD9mm6tJJvJ3 for <buildroot@lists.busybox.net>;
 Thu,  8 Dec 2022 22:38:38 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9781640453
Received: from mailout01.t-online.de (mailout01.t-online.de [194.25.134.80])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9781640453
 for <buildroot@buildroot.org>; Thu,  8 Dec 2022 22:38:38 +0000 (UTC)
Received: from fwd83.dcpf.telekom.de (fwd83.aul.t-online.de [10.223.144.109])
 by mailout01.t-online.de (Postfix) with SMTP id 590B3134FA
 for <buildroot@buildroot.org>; Thu,  8 Dec 2022 23:38:23 +0100 (CET)
Received: from fli4l.lan.fli4l ([79.214.203.244]) by fwd83.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1p3PX0-2btxJa0; Thu, 8 Dec 2022 23:38:18 +0100
Received: from bruckner.lan.fli4l ([192.168.1.1]:35946)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd.kuhls@t-online.de>) id 1p3PX0-00048i-1q
 for buildroot@buildroot.org; Thu, 08 Dec 2022 23:38:18 +0100
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Thu,  8 Dec 2022 23:37:25 +0100
Message-Id: <20221208223817.1088619-19-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221208223817.1088619-1-bernd.kuhls@t-online.de>
References: <20221208223817.1088619-1-bernd.kuhls@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1670539098-62A0A2DC-12BCA6EC/0/0 CLEAN NORMAL
X-TOI-MSGID: 324e3075-11d5-45af-bcfc-a8130dcd2848
Subject: [Buildroot] [PATCH 18/70] package/x11r7/xapp_xrandr: bump version
 to 1.5.2
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

https://lists.x.org/archives/xorg-announce/2022-December/003270.html
Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xapp_xrandr/xapp_xrandr.hash | 8 +++-----
 package/x11r7/xapp_xrandr/xapp_xrandr.mk   | 4 ++--
 2 files changed, 5 insertions(+), 7 deletions(-)

diff --git a/package/x11r7/xapp_xrandr/xapp_xrandr.hash b/package/x11r7/xapp_xrandr/xapp_xrandr.hash
index 4c68dcbb71..a407326bb8 100644
--- a/package/x11r7/xapp_xrandr/xapp_xrandr.hash
+++ b/package/x11r7/xapp_xrandr/xapp_xrandr.hash
@@ -1,7 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2019-August/003018.html
-md5  fe40f7a4fd39dd3a02248d3e0b1972e4  xrandr-1.5.1.tar.xz
-sha1  9f72957e0d2a26ece509336ea7e1529cc9ea881e  xrandr-1.5.1.tar.xz
-sha256  7bc76daf9d72f8aff885efad04ce06b90488a1a169d118dea8a2b661832e8762  xrandr-1.5.1.tar.xz
-sha512  3d0d37e974b9dffb996276ee7fd676327fd0956e5f5f572dd142a651a35d3cdfa2f6dd415cf27bf87f306981957aba4cc014c12baebefcabaa5d66b78a114922  xrandr-1.5.1.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2022-December/003270.html
+sha256  c8bee4790d9058bacc4b6246456c58021db58a87ddda1a9d0139bf5f18f1f240  xrandr-1.5.2.tar.xz
+sha512  b536e8f1e04094894aa52ae496725c58691b043860b3327c41d737b07b642a939733321b62f698032b11ba857208a6177600a3ca3295ff1be6ade4341cdc2747  xrandr-1.5.2.tar.xz
 # Locally computed
 sha256  0dd9a3d62c48dd7b87790029e39fb5e11756d33fded3bc1644e11585c87b2038  COPYING
diff --git a/package/x11r7/xapp_xrandr/xapp_xrandr.mk b/package/x11r7/xapp_xrandr/xapp_xrandr.mk
index 8586c6feb3..d6b39b51d0 100644
--- a/package/x11r7/xapp_xrandr/xapp_xrandr.mk
+++ b/package/x11r7/xapp_xrandr/xapp_xrandr.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-XAPP_XRANDR_VERSION = 1.5.1
+XAPP_XRANDR_VERSION = 1.5.2
 XAPP_XRANDR_SOURCE = xrandr-$(XAPP_XRANDR_VERSION).tar.xz
-XAPP_XRANDR_SITE = http://xorg.freedesktop.org/releases/individual/app
+XAPP_XRANDR_SITE = https://xorg.freedesktop.org/archive/individual/app
 XAPP_XRANDR_LICENSE = MIT
 XAPP_XRANDR_LICENSE_FILES = COPYING
 XAPP_XRANDR_DEPENDENCIES = xlib_libXrandr xlib_libX11
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
