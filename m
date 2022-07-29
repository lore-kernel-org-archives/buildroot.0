Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB85CC00144
	for <buildroot@archiver.kernel.org>; Fri, 29 Jul 2022 20:00:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5095441BA5;
	Fri, 29 Jul 2022 20:00:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5095441BA5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Yj-Yhf4EqY42; Fri, 29 Jul 2022 20:00:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D131541B84;
	Fri, 29 Jul 2022 20:00:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D131541B84
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1DEA41BF33A
 for <buildroot@lists.busybox.net>; Fri, 29 Jul 2022 19:59:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id ED6B281991
 for <buildroot@lists.busybox.net>; Fri, 29 Jul 2022 19:59:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ED6B281991
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mjtm_vyBt3MW for <buildroot@lists.busybox.net>;
 Fri, 29 Jul 2022 19:59:49 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 27D0A81970
 for <buildroot@buildroot.org>; Fri, 29 Jul 2022 19:59:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 27D0A81970
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id C6D8286981; Fri, 29 Jul 2022 19:45:57 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 29 Jul 2022 21:59:39 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4900fc717cea67a6e2692c714377d27093a5f76a
X-Git-Newrev: 97d3195a68dcea4e245786182e995788f408614a
X-Patchwork-Hint: ignore
Message-Id: <20220729194557.C6D8286981@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/x11r7/xdriver_xf86-video-nv: bump
 version to 2.1.22
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=97d3195a68dcea4e245786182e995788f408614a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes: https://lists.x.org/archives/xorg-announce/2022-July/003196.html

Switched tarball from bz2 to xz
Switched _SITE to https

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/x11r7/xdriver_xf86-video-nv/xdriver_xf86-video-nv.hash | 5 +++--
 package/x11r7/xdriver_xf86-video-nv/xdriver_xf86-video-nv.mk   | 6 +++---
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/package/x11r7/xdriver_xf86-video-nv/xdriver_xf86-video-nv.hash b/package/x11r7/xdriver_xf86-video-nv/xdriver_xf86-video-nv.hash
index e1835687aa..ec7d198c18 100644
--- a/package/x11r7/xdriver_xf86-video-nv/xdriver_xf86-video-nv.hash
+++ b/package/x11r7/xdriver_xf86-video-nv/xdriver_xf86-video-nv.hash
@@ -1,4 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2017-January/002761.html
-sha256  1f98649e6ff0e8214b9d5dcac661f1d004be8e73823d8247b9c7025fd81db32d  xf86-video-nv-2.1.21.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2022-July/003196.html
+sha256  6218932db5c389878d853b11b8fbb667c321b65276f55aa6842a56fb1a30d288  xf86-video-nv-2.1.22.tar.xz
+sha512  a54767e9060404cafbb028ea36e582e8cfb7431a746cfc1d698c435fa73e41c4dfc12f84e50d002a582ac61e2d4c377f4defdf407250ee9e8656e5ff989b3cda  xf86-video-nv-2.1.22.tar.xz
 # Locally calculated
 sha256  10d10e1ec37594d481c3de8dda22a40b731ebd43be7ccd462baaa7394738a9f3  COPYING
diff --git a/package/x11r7/xdriver_xf86-video-nv/xdriver_xf86-video-nv.mk b/package/x11r7/xdriver_xf86-video-nv/xdriver_xf86-video-nv.mk
index 1e5fc26ddb..2aab60aaf9 100644
--- a/package/x11r7/xdriver_xf86-video-nv/xdriver_xf86-video-nv.mk
+++ b/package/x11r7/xdriver_xf86-video-nv/xdriver_xf86-video-nv.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-XDRIVER_XF86_VIDEO_NV_VERSION = 2.1.21
-XDRIVER_XF86_VIDEO_NV_SOURCE = xf86-video-nv-$(XDRIVER_XF86_VIDEO_NV_VERSION).tar.bz2
-XDRIVER_XF86_VIDEO_NV_SITE = http://xorg.freedesktop.org/releases/individual/driver
+XDRIVER_XF86_VIDEO_NV_VERSION = 2.1.22
+XDRIVER_XF86_VIDEO_NV_SOURCE = xf86-video-nv-$(XDRIVER_XF86_VIDEO_NV_VERSION).tar.xz
+XDRIVER_XF86_VIDEO_NV_SITE = https://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_VIDEO_NV_LICENSE = MIT
 XDRIVER_XF86_VIDEO_NV_LICENSE_FILES = COPYING
 XDRIVER_XF86_VIDEO_NV_DEPENDENCIES = xserver_xorg-server xorgproto
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
