Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B138C636D6
	for <buildroot@archiver.kernel.org>; Tue, 21 Feb 2023 01:18:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E068A6FB9A;
	Tue, 21 Feb 2023 01:18:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E068A6FB9A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id A2LtV8IMXKO3; Tue, 21 Feb 2023 01:18:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 25B0C6FB59;
	Tue, 21 Feb 2023 01:18:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 25B0C6FB59
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A91EF1BF2E3
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 21:02:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B74496FBDF
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B74496FBDF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8Oio7c4DDrWz for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:42 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id A3B256FBC4
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A3B256FBC4
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8EC4381979; Mon, 20 Feb 2023 20:52:42 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 28 Jan 2023 22:46:18 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 760894b72ed465f426cf848f561200a4656eda4a
X-Git-Newrev: 9237132895d3a15f18fb563e189146c067c26aec
X-Patchwork-Hint: ignore
Message-Id: <20230220205242.8EC4381979@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next]
 package/x11r7/xdriver_xf86-video-vmware: bump version to 13.4.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=9237132895d3a15f18fb563e189146c067c26aec
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Release notes:
https://lists.x.org/archives/xorg-announce/2023-January/003315.html

Switched tarball to xz and _SITE to https.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../xdriver_xf86-video-vmware/xdriver_xf86-video-vmware.hash      | 8 +++-----
 .../x11r7/xdriver_xf86-video-vmware/xdriver_xf86-video-vmware.mk  | 6 +++---
 2 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/package/x11r7/xdriver_xf86-video-vmware/xdriver_xf86-video-vmware.hash b/package/x11r7/xdriver_xf86-video-vmware/xdriver_xf86-video-vmware.hash
index fc69e01ffe..a6415703be 100644
--- a/package/x11r7/xdriver_xf86-video-vmware/xdriver_xf86-video-vmware.hash
+++ b/package/x11r7/xdriver_xf86-video-vmware/xdriver_xf86-video-vmware.hash
@@ -1,7 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2018-May/002895.html
-md5  08d66d062055080ff699ab4869726ea2  xf86-video-vmware-13.3.0.tar.bz2
-sha1  f01335fe6bdb507e749571bfcd69163aed97312a  xf86-video-vmware-13.3.0.tar.bz2
-sha256  47971924659e51666a757269ad941a059ef5afe7a47b5101c174a6022ac4066c  xf86-video-vmware-13.3.0.tar.bz2
-sha512  c318de893cae7b2b11e11c1b389ee47478b7c8d1f52c27099dbe453efec28f3e9da449217307a8c2251999eada66312f766996be1a6ead413b8b6dedc42c68ca  xf86-video-vmware-13.3.0.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2023-January/003315.html
+sha256  aed31ee5ed5ecc6e2226705383e7ad06f7602c1376a295305f376b17af3eb81a  xf86-video-vmware-13.4.0.tar.xz
+sha512  7cacde21a490501dd9c2e9121040274c1f6ef64e6dc0ef49946b400f6297fab73a6e9548e45fe8930cee9028e65e45aaff9ba489dd69ac75a5133114726bf55d  xf86-video-vmware-13.4.0.tar.xz
 # Locally computed
 sha256  7e59b8ca2a161855a60561f27ada8dfdbb678733eacdb23423fff6d21f9ad43b  COPYING
diff --git a/package/x11r7/xdriver_xf86-video-vmware/xdriver_xf86-video-vmware.mk b/package/x11r7/xdriver_xf86-video-vmware/xdriver_xf86-video-vmware.mk
index 5f0cb77bf8..37c2d67c19 100644
--- a/package/x11r7/xdriver_xf86-video-vmware/xdriver_xf86-video-vmware.mk
+++ b/package/x11r7/xdriver_xf86-video-vmware/xdriver_xf86-video-vmware.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-XDRIVER_XF86_VIDEO_VMWARE_VERSION = 13.3.0
-XDRIVER_XF86_VIDEO_VMWARE_SOURCE = xf86-video-vmware-$(XDRIVER_XF86_VIDEO_VMWARE_VERSION).tar.bz2
-XDRIVER_XF86_VIDEO_VMWARE_SITE = http://xorg.freedesktop.org/releases/individual/driver
+XDRIVER_XF86_VIDEO_VMWARE_VERSION = 13.4.0
+XDRIVER_XF86_VIDEO_VMWARE_SOURCE = xf86-video-vmware-$(XDRIVER_XF86_VIDEO_VMWARE_VERSION).tar.xz
+XDRIVER_XF86_VIDEO_VMWARE_SITE = https://xorg.freedesktop.org/archive/individual/driver
 XDRIVER_XF86_VIDEO_VMWARE_LICENSE = MIT
 XDRIVER_XF86_VIDEO_VMWARE_LICENSE_FILES = COPYING
 XDRIVER_XF86_VIDEO_VMWARE_DEPENDENCIES = mesa3d xserver_xorg-server xorgproto
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
