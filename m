Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FC67C61DA4
	for <buildroot@archiver.kernel.org>; Sat, 11 Feb 2023 18:28:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CCC88408F6;
	Sat, 11 Feb 2023 18:28:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CCC88408F6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mYax45KOROEA; Sat, 11 Feb 2023 18:28:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BA858409AE;
	Sat, 11 Feb 2023 18:28:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BA858409AE
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BF8B31BF59D
 for <buildroot@lists.busybox.net>; Sat, 11 Feb 2023 18:28:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A70DB60595
 for <buildroot@lists.busybox.net>; Sat, 11 Feb 2023 18:28:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A70DB60595
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Y3Svahw0-rO8 for <buildroot@lists.busybox.net>;
 Sat, 11 Feb 2023 18:28:46 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A30C260592
Received: from mailout12.t-online.de (mailout12.t-online.de [194.25.134.22])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A30C260592
 for <buildroot@buildroot.org>; Sat, 11 Feb 2023 18:28:46 +0000 (UTC)
Received: from fwd77.dcpf.telekom.de (fwd77.aul.t-online.de [10.223.144.103])
 by mailout12.t-online.de (Postfix) with SMTP id 1E01324EF
 for <buildroot@buildroot.org>; Sat, 11 Feb 2023 19:28:44 +0100 (CET)
Received: from fli4l.lan.fli4l ([79.214.202.51]) by fwd77.t-online.de
 with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
 esmtp id 1pQuc3-0KmI890; Sat, 11 Feb 2023 19:28:39 +0100
Received: from bruckner.lan.fli4l ([192.168.1.1]:59522)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd.kuhls@t-online.de>) id 1pQuc2-0007N2-2J
 for buildroot@buildroot.org; Sat, 11 Feb 2023 19:28:38 +0100
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Sat, 11 Feb 2023 19:28:38 +0100
Message-Id: <20230211182838.272469-1-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1676140119-EAD5337F-057B677F/0/0 CLEAN NORMAL
X-TOI-MSGID: 9e0cf9eb-0f80-4677-b798-94bc17098246
Subject: [Buildroot] [PATCH 1/1] package/x11r7/xapp_xvidtune: bump version
 to 1.0.4
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
https://lists.x.org/archives/xorg-announce/2023-February/003319.html

Switched tarball to xz, updated _SITE.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xapp_xvidtune/xapp_xvidtune.hash | 5 +++--
 package/x11r7/xapp_xvidtune/xapp_xvidtune.mk   | 6 +++---
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/package/x11r7/xapp_xvidtune/xapp_xvidtune.hash b/package/x11r7/xapp_xvidtune/xapp_xvidtune.hash
index ecf7d0330b..0e7e231383 100644
--- a/package/x11r7/xapp_xvidtune/xapp_xvidtune.hash
+++ b/package/x11r7/xapp_xvidtune/xapp_xvidtune.hash
@@ -1,4 +1,5 @@
-# From http://lists.x.org/archives/xorg-announce/2013-January/002129.html
-sha256  24e5e103933a04bfb2e1d18562619ed74031ab515e7343eb546bacdbcbeecf01  xvidtune-1.0.3.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2023-February/003319.html
+sha256  0d4eecd54e440cc11f1bdaaa23180fcf890f003444343f533f639086b05b2cc5  xvidtune-1.0.4.tar.xz
+sha512  747d5358f4f7d3d7db508c3f034711ce4b9dd278160d35312e9c4d1604623e84a2438d039b536546fd2df7db8c5ea1907e8a6101985fad2932b6dee5a62c7b80  xvidtune-1.0.4.tar.xz
 # Locally computed
 sha256  f3da8eaed19e27e4f67e6f076d4ebdb8d649e15a8ad33a415fb65a23de1b6689  COPYING
diff --git a/package/x11r7/xapp_xvidtune/xapp_xvidtune.mk b/package/x11r7/xapp_xvidtune/xapp_xvidtune.mk
index d7c4d5bf56..cc40d39098 100644
--- a/package/x11r7/xapp_xvidtune/xapp_xvidtune.mk
+++ b/package/x11r7/xapp_xvidtune/xapp_xvidtune.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-XAPP_XVIDTUNE_VERSION = 1.0.3
-XAPP_XVIDTUNE_SOURCE = xvidtune-$(XAPP_XVIDTUNE_VERSION).tar.bz2
-XAPP_XVIDTUNE_SITE = http://xorg.freedesktop.org/releases/individual/app
+XAPP_XVIDTUNE_VERSION = 1.0.4
+XAPP_XVIDTUNE_SOURCE = xvidtune-$(XAPP_XVIDTUNE_VERSION).tar.xz
+XAPP_XVIDTUNE_SITE = https://xorg.freedesktop.org/archive/individual/app
 XAPP_XVIDTUNE_LICENSE = MIT
 XAPP_XVIDTUNE_LICENSE_FILES = COPYING
 XAPP_XVIDTUNE_DEPENDENCIES = xlib_libXaw xlib_libXxf86vm
-- 
2.39.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
