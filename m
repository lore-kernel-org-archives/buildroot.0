Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0F03C7EE23
	for <buildroot@archiver.kernel.org>; Mon,  5 Jun 2023 11:46:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4D5CF60FB8;
	Mon,  5 Jun 2023 11:46:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4D5CF60FB8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dndRF9ZB2ISF; Mon,  5 Jun 2023 11:46:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6122160BF2;
	Mon,  5 Jun 2023 11:46:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6122160BF2
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8FA921BF4DA
 for <buildroot@lists.busybox.net>; Mon,  5 Jun 2023 11:45:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0BCA481FF5
 for <buildroot@lists.busybox.net>; Mon,  5 Jun 2023 11:45:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0BCA481FF5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qZV8Qv3zktP9 for <buildroot@lists.busybox.net>;
 Mon,  5 Jun 2023 11:45:19 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2807582137
 for <buildroot@buildroot.org>; Mon,  5 Jun 2023 11:45:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2807582137
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 260D486C78; Mon,  5 Jun 2023 11:45:19 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 5 Jun 2023 13:14:24 +0200
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: 1e6a4f1fd632a3c9d6d81e5e4322140829009aee
X-Git-Newrev: c9f2fca27619f76ded3b51931912e56c1698a125
X-Patchwork-Hint: ignore
Message-Id: <20230605114519.260D486C78@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x]
 package/x11r7/xdriver_xf86-video-neomagic: bump version to 1.3.1
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=c9f2fca27619f76ded3b51931912e56c1698a125
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

Release notes:
https://lists.x.org/archives/xorg-announce/2023-April/003380.html

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit cb4b592f6654ba15f21b4cead97661e18df2beec)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../xdriver_xf86-video-neomagic/xdriver_xf86-video-neomagic.hash  | 8 +++-----
 .../xdriver_xf86-video-neomagic/xdriver_xf86-video-neomagic.mk    | 6 +++---
 2 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/package/x11r7/xdriver_xf86-video-neomagic/xdriver_xf86-video-neomagic.hash b/package/x11r7/xdriver_xf86-video-neomagic/xdriver_xf86-video-neomagic.hash
index acc65348f7..b5a139fdac 100644
--- a/package/x11r7/xdriver_xf86-video-neomagic/xdriver_xf86-video-neomagic.hash
+++ b/package/x11r7/xdriver_xf86-video-neomagic/xdriver_xf86-video-neomagic.hash
@@ -1,7 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2018-December/002934.html
-md5  349d5254d09eb46f2a1f151cd423b89a  xf86-video-neomagic-1.3.0.tar.bz2
-sha1  6bccfa15ea05d5264120cd96ccf13687642e8f6d  xf86-video-neomagic-1.3.0.tar.bz2
-sha256  93833950fae7757088eb6abb125e15e8c245e5e25681c19c3ad4213ec7319064  xf86-video-neomagic-1.3.0.tar.bz2
-sha512  25d019a2556e52aeb4e25942f444437a921e76d527c10ddd420f16aa7d85bf2b8a51612c382a2a7e3e407bb1e8d610d063101184eea0889c3e1a69bfb3b37735  xf86-video-neomagic-1.3.0.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2023-April/003380.html
+sha256  b61fac7ec32971e92e34cfd51f88fef169e272a210455e0e1a0faa0d30fc7494  xf86-video-neomagic-1.3.1.tar.xz
+sha512  b2425c4e9b8e6e816cbb6fa436da12bd242acf55c3c615352fc80ea072b1822abdb40838c2adcc3c450e429ec6e3b5112d194e739cf5d8ac22d430e273d5378b  xf86-video-neomagic-1.3.1.tar.xz
 # Locally computed
 sha256  95063ce9aa09850025dd317549ce688519079a8d3cf66ceb3d882cb2bafcced9  COPYING
diff --git a/package/x11r7/xdriver_xf86-video-neomagic/xdriver_xf86-video-neomagic.mk b/package/x11r7/xdriver_xf86-video-neomagic/xdriver_xf86-video-neomagic.mk
index 8dd2777ff9..8c7beeed6e 100644
--- a/package/x11r7/xdriver_xf86-video-neomagic/xdriver_xf86-video-neomagic.mk
+++ b/package/x11r7/xdriver_xf86-video-neomagic/xdriver_xf86-video-neomagic.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-XDRIVER_XF86_VIDEO_NEOMAGIC_VERSION = 1.3.0
-XDRIVER_XF86_VIDEO_NEOMAGIC_SOURCE = xf86-video-neomagic-$(XDRIVER_XF86_VIDEO_NEOMAGIC_VERSION).tar.bz2
-XDRIVER_XF86_VIDEO_NEOMAGIC_SITE = http://xorg.freedesktop.org/releases/individual/driver
+XDRIVER_XF86_VIDEO_NEOMAGIC_VERSION = 1.3.1
+XDRIVER_XF86_VIDEO_NEOMAGIC_SOURCE = xf86-video-neomagic-$(XDRIVER_XF86_VIDEO_NEOMAGIC_VERSION).tar.xz
+XDRIVER_XF86_VIDEO_NEOMAGIC_SITE = https://xorg.freedesktop.org/archive/individual/driver
 XDRIVER_XF86_VIDEO_NEOMAGIC_LICENSE = MIT
 XDRIVER_XF86_VIDEO_NEOMAGIC_LICENSE_FILES = COPYING
 XDRIVER_XF86_VIDEO_NEOMAGIC_DEPENDENCIES = xserver_xorg-server xorgproto
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
