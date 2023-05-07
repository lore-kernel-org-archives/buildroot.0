Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FA40C77B7C
	for <buildroot@archiver.kernel.org>; Sun,  7 May 2023 12:07:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3A27583B13;
	Sun,  7 May 2023 12:07:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3A27583B13
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JEwMQZ5DA2CH; Sun,  7 May 2023 12:07:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 49AA283BCC;
	Sun,  7 May 2023 12:07:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 49AA283BCC
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D06A71BF861
 for <buildroot@lists.busybox.net>; Sun,  7 May 2023 12:04:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C16E9418D7
 for <buildroot@lists.busybox.net>; Sun,  7 May 2023 12:04:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C16E9418D7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OqarDbxBYinH for <buildroot@lists.busybox.net>;
 Sun,  7 May 2023 12:04:38 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id AEB90418B8
 for <buildroot@buildroot.org>; Sun,  7 May 2023 12:04:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AEB90418B8
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9E46885EF1; Sun,  7 May 2023 12:04:38 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 7 May 2023 13:56:51 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6bd350f9bdd4f4358b037d6d873ee915f4dc5ac1
X-Git-Newrev: cb4b592f6654ba15f21b4cead97661e18df2beec
X-Patchwork-Hint: ignore
Message-Id: <20230507120438.9E46885EF1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/x11r7/xdriver_xf86-video-neomagic:
 bump version to 1.3.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=cb4b592f6654ba15f21b4cead97661e18df2beec
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes:
https://lists.x.org/archives/xorg-announce/2023-April/003380.html

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
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
