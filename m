Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93853C433F5
	for <buildroot@archiver.kernel.org>; Thu, 12 May 2022 18:58:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4F90D823AB;
	Thu, 12 May 2022 18:58:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Jt0nm1Tv_4mY; Thu, 12 May 2022 18:58:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5D11681319;
	Thu, 12 May 2022 18:58:48 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1390C1BF578
 for <buildroot@lists.busybox.net>; Thu, 12 May 2022 18:54:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 521F382628
 for <buildroot@lists.busybox.net>; Thu, 12 May 2022 18:54:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vpyWUfWrnogn for <buildroot@lists.busybox.net>;
 Thu, 12 May 2022 18:54:03 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mailout05.t-online.de (mailout05.t-online.de [194.25.134.82])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5C0DA81BA9
 for <buildroot@buildroot.org>; Thu, 12 May 2022 18:54:03 +0000 (UTC)
Received: from fwd89.dcpf.telekom.de (fwd89.aul.t-online.de [10.223.144.115])
 by mailout05.t-online.de (Postfix) with SMTP id 7037F15D58
 for <buildroot@buildroot.org>; Thu, 12 May 2022 20:54:00 +0200 (CEST)
Received: from fli4l.lan.fli4l ([79.214.203.41]) by fwd89.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1npDwj-0Fvjg00; Thu, 12 May 2022 20:53:57 +0200
Received: from bruckner.lan.fli4l ([192.168.1.1]:48510)
 by fli4l.lan.fli4l with esmtp (Exim 4.95)
 (envelope-from <bernd.kuhls@t-online.de>) id 1npDwi-0004aZ-MQ
 for buildroot@buildroot.org; Thu, 12 May 2022 20:53:56 +0200
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Thu, 12 May 2022 20:53:48 +0200
Message-Id: <20220512185355.873825-18-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220512185355.873825-1-bernd.kuhls@t-online.de>
References: <20220512185355.873825-1-bernd.kuhls@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1652381637-0000F5B3-94645202/0/0 CLEAN NORMAL
X-TOI-MSGID: 364b114e-9530-4439-bfe6-696bc2927539
Subject: [Buildroot] [PATCH 18/25] package/x11r7/xdriver_xf86-video-dummy:
 bump version to 0.4.0
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
https://lists.x.org/archives/xorg-announce/2022-April/003155.html

Reformatted license hash.
Switched tarball to upstream-provided .xz format.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 .../xdriver_xf86-video-dummy/xdriver_xf86-video-dummy.hash | 7 ++++---
 .../xdriver_xf86-video-dummy/xdriver_xf86-video-dummy.mk   | 4 ++--
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/package/x11r7/xdriver_xf86-video-dummy/xdriver_xf86-video-dummy.hash b/package/x11r7/xdriver_xf86-video-dummy/xdriver_xf86-video-dummy.hash
index 3eac3840ef..eed28d3fde 100644
--- a/package/x11r7/xdriver_xf86-video-dummy/xdriver_xf86-video-dummy.hash
+++ b/package/x11r7/xdriver_xf86-video-dummy/xdriver_xf86-video-dummy.hash
@@ -1,4 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2016-December/002751.html
-sha256 3712bb869307233491e4c570732d6073c0dc3d99adfdb9977396a3fdf84e95b9  xf86-video-dummy-0.3.8.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2022-April/003155.html
+sha256  e78ceae5c8c0588c7cb658f2afc3a9fac9ef665b52a75b01f8e9c5449a4e1e5a  xf86-video-dummy-0.4.0.tar.xz
+sha512  1150a84c4f17215b9c579d8ce9399d547a01970bf7b5396653f14beb13a62deefe3008bf3ad6a2c5c0f46da4cbc0b840c18a7dff339e3b882d108183fa1d30d9  xf86-video-dummy-0.4.0.tar.xz
 # Locally calculated
-sha256 e29aa81e74563d14e5633963107c030e74e8352ea7dafee1a9d7e19b7d0e887b  COPYING
+sha256  e29aa81e74563d14e5633963107c030e74e8352ea7dafee1a9d7e19b7d0e887b  COPYING
diff --git a/package/x11r7/xdriver_xf86-video-dummy/xdriver_xf86-video-dummy.mk b/package/x11r7/xdriver_xf86-video-dummy/xdriver_xf86-video-dummy.mk
index 3127f6cb1b..e863b1e506 100644
--- a/package/x11r7/xdriver_xf86-video-dummy/xdriver_xf86-video-dummy.mk
+++ b/package/x11r7/xdriver_xf86-video-dummy/xdriver_xf86-video-dummy.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-XDRIVER_XF86_VIDEO_DUMMY_VERSION = 0.3.8
-XDRIVER_XF86_VIDEO_DUMMY_SOURCE = xf86-video-dummy-$(XDRIVER_XF86_VIDEO_DUMMY_VERSION).tar.bz2
+XDRIVER_XF86_VIDEO_DUMMY_VERSION = 0.4.0
+XDRIVER_XF86_VIDEO_DUMMY_SOURCE = xf86-video-dummy-$(XDRIVER_XF86_VIDEO_DUMMY_VERSION).tar.xz
 XDRIVER_XF86_VIDEO_DUMMY_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_VIDEO_DUMMY_LICENSE = MIT
 XDRIVER_XF86_VIDEO_DUMMY_LICENSE_FILES = COPYING
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
