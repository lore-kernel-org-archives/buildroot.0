Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48FB8C4332F
	for <buildroot@archiver.kernel.org>; Fri,  9 Dec 2022 17:11:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E825940CE2;
	Fri,  9 Dec 2022 17:11:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E825940CE2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iFpk60DOhCWo; Fri,  9 Dec 2022 17:11:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 304C6401DD;
	Fri,  9 Dec 2022 17:11:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 304C6401DD
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 740381BF973
 for <buildroot@lists.busybox.net>; Fri,  9 Dec 2022 17:01:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3D57E41A69
 for <buildroot@lists.busybox.net>; Fri,  9 Dec 2022 17:01:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3D57E41A69
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hRpvBWC-k66E for <buildroot@lists.busybox.net>;
 Fri,  9 Dec 2022 17:01:06 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id D5A8341A66
 for <buildroot@buildroot.org>; Fri,  9 Dec 2022 17:01:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D5A8341A66
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D37DD85EA6; Fri,  9 Dec 2022 17:01:03 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Fri, 9 Dec 2022 17:32:39 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: fefd30f06c88f36cc75b52b767293586e1770af1
X-Git-Newrev: 07f7d434a438421eb382a27349e67cffd97d8a3f
X-Patchwork-Hint: ignore
Message-Id: <20221209170103.D37DD85EA6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/x11r7/xapp_xkbevd: bump version to
 1.1.5
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

commit: https://git.buildroot.net/buildroot/commit/?id=07f7d434a438421eb382a27349e67cffd97d8a3f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://lists.x.org/archives/xorg-announce/2022-November/003255.html
Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/x11r7/xapp_xkbevd/xapp_xkbevd.hash | 5 +++--
 package/x11r7/xapp_xkbevd/xapp_xkbevd.mk   | 6 +++---
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/package/x11r7/xapp_xkbevd/xapp_xkbevd.hash b/package/x11r7/xapp_xkbevd/xapp_xkbevd.hash
index c3cf2f32b2..40b813fcf2 100644
--- a/package/x11r7/xapp_xkbevd/xapp_xkbevd.hash
+++ b/package/x11r7/xapp_xkbevd/xapp_xkbevd.hash
@@ -1,4 +1,5 @@
-# From http://lists.x.org/archives/xorg-announce/2015-April/002577.html
-sha256  2430a2e5302a4cb4a5530c1df8cb3721a149bbf8eb377a2898921a145197f96a  xkbevd-1.1.4.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2022-November/003255.html
+sha256  38357b702de9d3457c4ff75053390f457b84c4accc7f088101255c37c684926b  xkbevd-1.1.5.tar.xz
+sha512  9e4a56484771e5eb5444fbd11e7d0bb952a2746eea79b84298e2000ada96896d501b886727c4ef08c120b5dcce550fca2d3e3dd762f4ca0327c38d9609961c5b  xkbevd-1.1.5.tar.xz
 # Locally computed
 sha256  38c6dbf8f88b1c920561ff3a4d1ffdb85c069c664f5f8b64a9adb477ef347b7c  COPYING
diff --git a/package/x11r7/xapp_xkbevd/xapp_xkbevd.mk b/package/x11r7/xapp_xkbevd/xapp_xkbevd.mk
index 7a9a8fb18f..5b99e6967f 100644
--- a/package/x11r7/xapp_xkbevd/xapp_xkbevd.mk
+++ b/package/x11r7/xapp_xkbevd/xapp_xkbevd.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-XAPP_XKBEVD_VERSION = 1.1.4
-XAPP_XKBEVD_SOURCE = xkbevd-$(XAPP_XKBEVD_VERSION).tar.bz2
-XAPP_XKBEVD_SITE = http://xorg.freedesktop.org/releases/individual/app
+XAPP_XKBEVD_VERSION = 1.1.5
+XAPP_XKBEVD_SOURCE = xkbevd-$(XAPP_XKBEVD_VERSION).tar.xz
+XAPP_XKBEVD_SITE = https://xorg.freedesktop.org/archive/individual/app
 XAPP_XKBEVD_LICENSE = MIT
 XAPP_XKBEVD_LICENSE_FILES = COPYING
 XAPP_XKBEVD_DEPENDENCIES = xlib_libxkbfile
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
