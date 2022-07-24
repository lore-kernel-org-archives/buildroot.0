Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27BB6C433EF
	for <buildroot@archiver.kernel.org>; Sun, 24 Jul 2022 16:27:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C61AB84970;
	Sun, 24 Jul 2022 16:27:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C61AB84970
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fELufBPQoYSJ; Sun, 24 Jul 2022 16:27:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D09328496E;
	Sun, 24 Jul 2022 16:27:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D09328496E
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C42731BF479
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 16:25:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2BF118496E
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 16:25:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2BF118496E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tfD5ukut4aGB for <buildroot@lists.busybox.net>;
 Sun, 24 Jul 2022 16:25:08 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0C0388494F
Received: from mailout01.t-online.de (mailout01.t-online.de [194.25.134.80])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0C0388494F
 for <buildroot@buildroot.org>; Sun, 24 Jul 2022 16:25:07 +0000 (UTC)
Received: from fwd73.dcpf.telekom.de (fwd73.aul.t-online.de [10.223.144.99])
 by mailout01.t-online.de (Postfix) with SMTP id C701A50C
 for <buildroot@buildroot.org>; Sun, 24 Jul 2022 18:25:05 +0200 (CEST)
Received: from fli4l.lan.fli4l ([79.214.202.112]) by fwd73.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1oFePc-0f12IM0; Sun, 24 Jul 2022 18:25:00 +0200
Received: from bruckner.lan.fli4l ([192.168.1.1]:40906)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd.kuhls@t-online.de>) id 1oFePc-0007mb-1s;
 Sun, 24 Jul 2022 18:25:00 +0200
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Sun, 24 Jul 2022 18:24:46 +0200
Message-Id: <20220724162500.2683871-7-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220724162500.2683871-1-bernd.kuhls@t-online.de>
References: <20220724162500.2683871-1-bernd.kuhls@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1658679900-0144F70D-22D26CA0/0/0 CLEAN NORMAL
X-TOI-MSGID: eb5d397a-45d8-4117-a0bf-9545b2cbe431
Subject: [Buildroot] [PATCH 06/20] package/x11r7/xapp_xmodmap: bump version
 to 1.0.11
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xapp_xmodmap/xapp_xmodmap.hash | 10 ++++------
 package/x11r7/xapp_xmodmap/xapp_xmodmap.mk   |  6 +++---
 2 files changed, 7 insertions(+), 9 deletions(-)

diff --git a/package/x11r7/xapp_xmodmap/xapp_xmodmap.hash b/package/x11r7/xapp_xmodmap/xapp_xmodmap.hash
index 4925ec00a3..db3d8f33cd 100644
--- a/package/x11r7/xapp_xmodmap/xapp_xmodmap.hash
+++ b/package/x11r7/xapp_xmodmap/xapp_xmodmap.hash
@@ -1,7 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2019-February/002952.html
-md5 51f1d30a525e9903280ffeea2744b1f6  xmodmap-1.0.10.tar.bz2
-sha1 69e041f8a8c501bd1feb68805a0880633a685bc8  xmodmap-1.0.10.tar.bz2
-sha256 473f0941d7439d501bb895ff358832b936ec34c749b9704c37a15e11c318487c  xmodmap-1.0.10.tar.bz2
-sha512 324c7dcef843186088f16b3bc47485eb3c9b4331e56ce43b692deb4bb3d4f4f27512480e91a379cceac8383df920dc5e37cd825246b50b6343291cec48134c04  xmodmap-1.0.10.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2022-July/003176.html
+sha256  9a2f8168f7b0bc382828847403902cb6bf175e17658b36189eac87edda877e81  xmodmap-1.0.11.tar.xz
+sha512  a78f916f048d2017f079733becc99232c087c360ece61ec6c4fa4b5b130b96a1b10c4ce1b64a15bdcab7ea05de3c7f16035503d5be6f8ce1a7612ce71d558510  xmodmap-1.0.11.tar.xz
 # Locally computed
-sha256 c149563cf2cb0ecfb1148b6eb8f604c62bed43452a0d0fbafb97286a97840f5c  COPYING
+sha256  c149563cf2cb0ecfb1148b6eb8f604c62bed43452a0d0fbafb97286a97840f5c  COPYING
diff --git a/package/x11r7/xapp_xmodmap/xapp_xmodmap.mk b/package/x11r7/xapp_xmodmap/xapp_xmodmap.mk
index f3a458b7b5..8fcb4716a8 100644
--- a/package/x11r7/xapp_xmodmap/xapp_xmodmap.mk
+++ b/package/x11r7/xapp_xmodmap/xapp_xmodmap.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-XAPP_XMODMAP_VERSION = 1.0.10
-XAPP_XMODMAP_SOURCE = xmodmap-$(XAPP_XMODMAP_VERSION).tar.bz2
-XAPP_XMODMAP_SITE = http://xorg.freedesktop.org/releases/individual/app
+XAPP_XMODMAP_VERSION = 1.0.11
+XAPP_XMODMAP_SOURCE = xmodmap-$(XAPP_XMODMAP_VERSION).tar.xz
+XAPP_XMODMAP_SITE = https://xorg.freedesktop.org/releases/individual/app
 XAPP_XMODMAP_LICENSE = MIT
 XAPP_XMODMAP_LICENSE_FILES = COPYING
 XAPP_XMODMAP_DEPENDENCIES = xlib_libX11
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
