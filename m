Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFAF6C61DA4
	for <buildroot@archiver.kernel.org>; Sat, 11 Feb 2023 18:37:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 40948415E3;
	Sat, 11 Feb 2023 18:37:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 40948415E3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8shjHOgf1oa5; Sat, 11 Feb 2023 18:37:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 354B0415D9;
	Sat, 11 Feb 2023 18:37:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 354B0415D9
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9826E1BF59D
 for <buildroot@lists.busybox.net>; Sat, 11 Feb 2023 18:37:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6FD05403CA
 for <buildroot@lists.busybox.net>; Sat, 11 Feb 2023 18:37:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6FD05403CA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NhANdDOPvZ-o for <buildroot@lists.busybox.net>;
 Sat, 11 Feb 2023 18:37:21 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 36E3440148
Received: from mailout10.t-online.de (mailout10.t-online.de [194.25.134.21])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 36E3440148
 for <buildroot@buildroot.org>; Sat, 11 Feb 2023 18:37:21 +0000 (UTC)
Received: from fwd83.dcpf.telekom.de (fwd83.aul.t-online.de [10.223.144.109])
 by mailout10.t-online.de (Postfix) with SMTP id ACF295A85
 for <buildroot@buildroot.org>; Sat, 11 Feb 2023 19:37:18 +0100 (CET)
Received: from fli4l.lan.fli4l ([79.214.202.51]) by fwd83.t-online.de
 with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
 esmtp id 1pQukO-3PSsr30; Sat, 11 Feb 2023 19:37:16 +0100
Received: from bruckner.lan.fli4l ([192.168.1.1]:60544)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd.kuhls@t-online.de>) id 1pQukO-0000Wt-0C
 for buildroot@buildroot.org; Sat, 11 Feb 2023 19:37:16 +0100
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Sat, 11 Feb 2023 19:37:15 +0100
Message-Id: <20230211183715.432384-1-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1676140636-42AC0378-73429B9F/0/0 CLEAN NORMAL
X-TOI-MSGID: 4dda1a9d-1529-4104-8a37-709539b3b8e1
Subject: [Buildroot] [PATCH 1/1] package/x11r7/xapp_beforelight: bump
 version to 1.0.6
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
https://lists.x.org/archives/xorg-announce/2023-January/003317.html

Updated license hash due to upstream commit:
https://gitlab.freedesktop.org/xorg/app/beforelight/-/commit/fa1e473dd64673a36a73a01a84a8db61eaa425dc

Switched tarball to xz, updated _SITE.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xapp_beforelight/xapp_beforelight.hash | 7 ++++---
 package/x11r7/xapp_beforelight/xapp_beforelight.mk   | 6 +++---
 2 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/package/x11r7/xapp_beforelight/xapp_beforelight.hash b/package/x11r7/xapp_beforelight/xapp_beforelight.hash
index 00aff75779..f5b0cb21a4 100644
--- a/package/x11r7/xapp_beforelight/xapp_beforelight.hash
+++ b/package/x11r7/xapp_beforelight/xapp_beforelight.hash
@@ -1,4 +1,5 @@
-# From http://lists.x.org/archives/xorg-announce/2013-January/002131.html
-sha256  8fcab6f15148ca680c0d3da8de7dcb41f8e6a076f442cf8bdcf272be9e348166  beforelight-1.0.5.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2023-January/003317.html
+sha256  53f0bf085b7272ebbf626d1b9b0ad320d1a07bc1fe7f3ae260c86a71a857ad28  beforelight-1.0.6.tar.xz
+sha512  48a165d151676f6d213883bee98b34007403a77e025253c8649f9a0f5ea258b09381ab523a5e906030ac9fc8245fce2c6beaf9ad0f81116e302d51ad4a0fad5a  beforelight-1.0.6.tar.xz
 # Locally computed
-sha256  27d8cbdcde7a0bd062ce49cdf8c672201452a64e3e6823f09b1beffe2c4b8eff  COPYING
+sha256  3909739fae1ee37c3c7167a91f53d29317965aaf932813e16ef733f033619a7b  COPYING
diff --git a/package/x11r7/xapp_beforelight/xapp_beforelight.mk b/package/x11r7/xapp_beforelight/xapp_beforelight.mk
index 7dcb715ef3..6b753833f7 100644
--- a/package/x11r7/xapp_beforelight/xapp_beforelight.mk
+++ b/package/x11r7/xapp_beforelight/xapp_beforelight.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-XAPP_BEFORELIGHT_VERSION = 1.0.5
-XAPP_BEFORELIGHT_SOURCE = beforelight-$(XAPP_BEFORELIGHT_VERSION).tar.bz2
-XAPP_BEFORELIGHT_SITE = http://xorg.freedesktop.org/releases/individual/app
+XAPP_BEFORELIGHT_VERSION = 1.0.6
+XAPP_BEFORELIGHT_SOURCE = beforelight-$(XAPP_BEFORELIGHT_VERSION).tar.xz
+XAPP_BEFORELIGHT_SITE = https://xorg.freedesktop.org/archive/individual/app
 XAPP_BEFORELIGHT_LICENSE = MIT
 XAPP_BEFORELIGHT_LICENSE_FILES = COPYING
 XAPP_BEFORELIGHT_DEPENDENCIES = xlib_libX11 xlib_libXScrnSaver xlib_libXaw xlib_libXt
-- 
2.39.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
