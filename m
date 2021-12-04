Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEFD0C433F5
	for <buildroot@archiver.kernel.org>; Mon,  6 Dec 2021 18:22:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6BDF360D62;
	Mon,  6 Dec 2021 18:22:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pZMI5PjoL0ow; Mon,  6 Dec 2021 18:22:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C680660D67;
	Mon,  6 Dec 2021 18:22:09 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3F2B11BF3F2
 for <buildroot@lists.busybox.net>; Mon,  6 Dec 2021 18:12:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 55AC640497
 for <buildroot@lists.busybox.net>; Mon,  6 Dec 2021 18:12:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id R5MFNCzVBNpi for <buildroot@lists.busybox.net>;
 Mon,  6 Dec 2021 18:12:40 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4344840474
 for <buildroot@buildroot.org>; Mon,  6 Dec 2021 18:12:40 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id D283381504; Mon,  6 Dec 2021 18:07:42 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sat, 4 Dec 2021 23:01:44 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3fbc731441225c45dd2c8badfec3ec63c1226828
X-Git-Newrev: eaa442089072ba431e606d4a8332fe414bec4327
X-Patchwork-Hint: ignore
Message-Id: <20211206180742.D283381504@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libdrm: bump version to 2.4.109
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

commit: https://git.buildroot.net/buildroot/commit/?id=eaa442089072ba431e606d4a8332fe414bec4327
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes:
https://lists.freedesktop.org/archives/dri-devel/2021-November/332386.html

Changed _LICENSE_FILES to data/meson.build as it receives less updates
than xf86drm.c and therefore requires less changes of its hash.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libdrm/libdrm.hash | 8 ++++----
 package/libdrm/libdrm.mk   | 4 ++--
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/libdrm/libdrm.hash b/package/libdrm/libdrm.hash
index ee14d4c124..ca7332dd76 100644
--- a/package/libdrm/libdrm.hash
+++ b/package/libdrm/libdrm.hash
@@ -1,6 +1,6 @@
-# From https://lists.freedesktop.org/archives/dri-devel/2021-November/330279.html
-sha256  a1d7948cbc536763fde14b4beb5e4da7867607966d4cf46301087e8b8fe3d6a0  libdrm-2.4.108.tar.xz
-sha512  6a841dc3eb8eae7d75e1d35d23a14d51aff758e5a251dbcf6fc8c28d973d935a4a2f6751b405e956b2777d93c651721199ac80c3cd14b87d021668120d6bc974  libdrm-2.4.108.tar.xz
+# From https://lists.freedesktop.org/archives/dri-devel/2021-November/332386.html
+sha256  629352e08c1fe84862ca046598d8a08ce14d26ab25ee1f4704f993d074cb7f26  libdrm-2.4.109.tar.xz
+sha512  45194bb28207421afcff3e247930d2eeab77a5fea58e6be22f67525f2e0aab2f410a9ae0ab315b55ef56b80c481bba40b1660468b7cda539758b2bbb8e814fd8  libdrm-2.4.109.tar.xz
 
 # Hash for license file
-sha256  e64a695d0f18bfba26071afdfe19dd6ff4030d0dc1c47304059b724b23955ddb  xf86drm.c
+sha256  d0a616a9020dc0271e36e6dd4bad174b4e2c2a42636f13785f8e18dd5f85fd83  data/meson.build
diff --git a/package/libdrm/libdrm.mk b/package/libdrm/libdrm.mk
index 0e4029fed2..9b614bf421 100644
--- a/package/libdrm/libdrm.mk
+++ b/package/libdrm/libdrm.mk
@@ -4,11 +4,11 @@
 #
 ################################################################################
 
-LIBDRM_VERSION = 2.4.108
+LIBDRM_VERSION = 2.4.109
 LIBDRM_SOURCE = libdrm-$(LIBDRM_VERSION).tar.xz
 LIBDRM_SITE = https://dri.freedesktop.org/libdrm
 LIBDRM_LICENSE = MIT
-LIBDRM_LICENSE_FILES = xf86drm.c
+LIBDRM_LICENSE_FILES = data/meson.build
 LIBDRM_INSTALL_STAGING = YES
 
 LIBDRM_DEPENDENCIES = \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
