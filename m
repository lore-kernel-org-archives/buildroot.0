Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B995BC433EF
	for <buildroot@archiver.kernel.org>; Thu, 28 Apr 2022 20:17:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 72A8283EF0;
	Thu, 28 Apr 2022 20:17:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hONaE8zY_b74; Thu, 28 Apr 2022 20:17:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D1FA783E92;
	Thu, 28 Apr 2022 20:17:29 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C384E1BF36D
 for <buildroot@lists.busybox.net>; Thu, 28 Apr 2022 20:17:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B23A14042F
 for <buildroot@lists.busybox.net>; Thu, 28 Apr 2022 20:17:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xoE05cdYG8kW for <buildroot@lists.busybox.net>;
 Thu, 28 Apr 2022 20:17:26 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mailout05.t-online.de (mailout05.t-online.de [194.25.134.82])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CF25640363
 for <buildroot@buildroot.org>; Thu, 28 Apr 2022 20:17:25 +0000 (UTC)
Received: from fwd89.dcpf.telekom.de (fwd89.aul.t-online.de [10.223.144.115])
 by mailout05.t-online.de (Postfix) with SMTP id 157127FBB;
 Thu, 28 Apr 2022 22:17:23 +0200 (CEST)
Received: from fli4l.lan.fli4l ([79.214.204.173]) by fwd89.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1nkAZk-3dSS9p0; Thu, 28 Apr 2022 22:17:20 +0200
Received: from bruckner.lan.fli4l ([192.168.1.1]:55362)
 by fli4l.lan.fli4l with esmtp (Exim 4.95)
 (envelope-from <bernd.kuhls@t-online.de>) id 1nkAZk-0007jl-BO;
 Thu, 28 Apr 2022 22:17:20 +0200
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Thu, 28 Apr 2022 22:17:20 +0200
Message-Id: <20220428201720.3150467-1-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1651177040-0000F5B3-0D44CC37/0/0 CLEAN NORMAL
X-TOI-MSGID: 8f4ff303-4f23-4c29-88dc-ac8adb53b4dd
Subject: [Buildroot] [PATCH 1/1] package/vlc: bump version to 3.0.17.4
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
Cc: Simon Dawson <spdawson@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Release notes: http://www.videolan.org/vlc/releases/3.0.17.html

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/vlc/vlc.hash | 8 ++++----
 package/vlc/vlc.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/vlc/vlc.hash b/package/vlc/vlc.hash
index 468ec7df35..9060097906 100644
--- a/package/vlc/vlc.hash
+++ b/package/vlc/vlc.hash
@@ -1,7 +1,7 @@
-# From https://get.videolan.org/vlc/3.0.16/vlc-3.0.16.tar.xz.sha256
-sha256  ffae35fc64f625c175571d2346bc5f6207be99762517f15423e74f18399410f6  vlc-3.0.16.tar.xz
-# From https://get.videolan.org/vlc/3.0.16/vlc-3.0.16.tar.xz.sha1
-sha1  e22ac839a09b5ead8992ae6aa8ea886364283e6a  vlc-3.0.16.tar.xz
+# From https://get.videolan.org/vlc/3.0.17.4/vlc-3.0.17.4.tar.xz.sha256
+sha256  8c5a62d88a4fb45c1b095cf10befef217dfa87aedcec5184b9e7d590b6dd4133  vlc-3.0.17.4.tar.xz
+# From https://get.videolan.org/vlc/3.0.17.4/vlc-3.0.17.4.tar.xz.sha1
+sha1  ebcd9939103fda141267c5a8f1c603df4533218e  vlc-3.0.17.4.tar.xz
 # Locally computed
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LIB
diff --git a/package/vlc/vlc.mk b/package/vlc/vlc.mk
index b793e0efe0..aee3b735a9 100644
--- a/package/vlc/vlc.mk
+++ b/package/vlc/vlc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-VLC_VERSION = 3.0.16
+VLC_VERSION = 3.0.17.4
 VLC_SITE = https://get.videolan.org/vlc/$(VLC_VERSION)
 VLC_SOURCE = vlc-$(VLC_VERSION).tar.xz
 VLC_LICENSE = GPL-2.0+, LGPL-2.1+
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
