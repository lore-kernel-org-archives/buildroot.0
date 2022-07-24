Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 490D2C43334
	for <buildroot@archiver.kernel.org>; Sun, 24 Jul 2022 19:57:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id ED2ED40C65;
	Sun, 24 Jul 2022 19:57:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ED2ED40C65
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LvFrVJtRC_82; Sun, 24 Jul 2022 19:57:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 05D2E40441;
	Sun, 24 Jul 2022 19:57:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 05D2E40441
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0099A1BF20B
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 19:55:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D895383F23
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 19:55:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D895383F23
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RNE3s0P-9B20 for <buildroot@lists.busybox.net>;
 Sun, 24 Jul 2022 19:55:32 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id E326E83EB5
 for <buildroot@buildroot.org>; Sun, 24 Jul 2022 19:55:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E326E83EB5
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 1F4BD85CBF; Sun, 24 Jul 2022 19:41:52 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sun, 24 Jul 2022 21:44:30 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: dba2095a821ab1fa518f0b8400eda3b38aa7c8d8
X-Git-Newrev: 62a033a2ad5dbafd002eedbc22b0945140cb2cc9
X-Patchwork-Hint: ignore
Message-Id: <20220724194152.1F4BD85CBF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/x11r7/xapp_xmodmap: bump version
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=62a033a2ad5dbafd002eedbc22b0945140cb2cc9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
