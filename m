Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD16BC433EF
	for <buildroot@archiver.kernel.org>; Sun, 21 Nov 2021 13:53:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 55A9E607BE;
	Sun, 21 Nov 2021 13:53:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FFJogGp2UxMN; Sun, 21 Nov 2021 13:53:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8E8CB607B1;
	Sun, 21 Nov 2021 13:53:45 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0EFC81BF25B
 for <buildroot@lists.busybox.net>; Sun, 21 Nov 2021 13:53:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E636540263
 for <buildroot@lists.busybox.net>; Sun, 21 Nov 2021 13:53:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ThQ2_0lPA3ZZ for <buildroot@lists.busybox.net>;
 Sun, 21 Nov 2021 13:53:07 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2A1DB40265
 for <buildroot@buildroot.org>; Sun, 21 Nov 2021 13:53:07 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id B6D238DC03; Sun, 21 Nov 2021 13:48:44 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sun, 21 Nov 2021 14:52:04 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: c95b9b98b811fcad463890ac6e57ff9eb5008967
X-Git-Newrev: 7d3a43f23f88aab33d645c81dd46a9fc5f23cd80
X-Patchwork-Hint: ignore
Message-Id: <20211121134844.B6D238DC03@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/libdrm: bump version
 to 2.4.108
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

commit: https://git.buildroot.net/buildroot/commit/?id=7d3a43f23f88aab33d645c81dd46a9fc5f23cd80
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Updated license due to upstream commits:
https://cgit.freedesktop.org/mesa/drm/log/xf86drm.c?h=main

Release notes:
https://lists.freedesktop.org/archives/dri-devel/2021-November/330279.html

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libdrm/libdrm.hash | 8 ++++----
 package/libdrm/libdrm.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/libdrm/libdrm.hash b/package/libdrm/libdrm.hash
index d3f35b3de0..ee14d4c124 100644
--- a/package/libdrm/libdrm.hash
+++ b/package/libdrm/libdrm.hash
@@ -1,6 +1,6 @@
-# From https://lists.freedesktop.org/archives/dri-devel/2021-July/313594.html
-sha256  c554cef03b033636a975543eab363cc19081cb464595d3da1ec129f87370f888  libdrm-2.4.107.tar.xz
-sha512  c7542ba15c4c934519a6a1f3cb1ec21effa820a805a030d0175313bb1cc796cd311f39596ead883f9f251679d701e262894c5a297d5cf45093c80a6cd818def0  libdrm-2.4.107.tar.xz
+# From https://lists.freedesktop.org/archives/dri-devel/2021-November/330279.html
+sha256  a1d7948cbc536763fde14b4beb5e4da7867607966d4cf46301087e8b8fe3d6a0  libdrm-2.4.108.tar.xz
+sha512  6a841dc3eb8eae7d75e1d35d23a14d51aff758e5a251dbcf6fc8c28d973d935a4a2f6751b405e956b2777d93c651721199ac80c3cd14b87d021668120d6bc974  libdrm-2.4.108.tar.xz
 
 # Hash for license file
-sha256  7e952c6666ed17c99f91ee7af13c688b8769b0feaf6f4558bf6ad3e07512e1e6  xf86drm.c
+sha256  e64a695d0f18bfba26071afdfe19dd6ff4030d0dc1c47304059b724b23955ddb  xf86drm.c
diff --git a/package/libdrm/libdrm.mk b/package/libdrm/libdrm.mk
index c15be3e671..0e4029fed2 100644
--- a/package/libdrm/libdrm.mk
+++ b/package/libdrm/libdrm.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBDRM_VERSION = 2.4.107
+LIBDRM_VERSION = 2.4.108
 LIBDRM_SOURCE = libdrm-$(LIBDRM_VERSION).tar.xz
 LIBDRM_SITE = https://dri.freedesktop.org/libdrm
 LIBDRM_LICENSE = MIT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
