Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C20AFC61DA3
	for <buildroot@archiver.kernel.org>; Tue, 21 Feb 2023 00:51:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6AC394EEF9;
	Tue, 21 Feb 2023 00:51:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6AC394EEF9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JOk2WfBLJXP8; Tue, 21 Feb 2023 00:51:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 319444F614;
	Tue, 21 Feb 2023 00:51:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 319444F614
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BE55A1BF2E3
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 21:00:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 30D16415A6
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:53:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 30D16415A6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zgSE0zg5Sem7 for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:59 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 68A6F41810
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 68A6F41810
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 651AB7FF06; Mon, 20 Feb 2023 20:52:59 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 12 Feb 2023 22:07:18 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 888ac96e55c0c53bf5ada2f3f6d58e9e1179d91b
X-Git-Newrev: 89710c804ede6879db45c8e41aca3607bd2bb051
X-Patchwork-Hint: ignore
Message-Id: <20230220205259.651AB7FF06@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/x11r7/xapp_xvidtune:
 bump version to 1.0.4
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

commit: https://git.buildroot.net/buildroot/commit/?id=89710c804ede6879db45c8e41aca3607bd2bb051
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Release notes:
https://lists.x.org/archives/xorg-announce/2023-February/003319.html

Switched tarball to xz, updated _SITE.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/x11r7/xapp_xvidtune/xapp_xvidtune.hash | 5 +++--
 package/x11r7/xapp_xvidtune/xapp_xvidtune.mk   | 6 +++---
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/package/x11r7/xapp_xvidtune/xapp_xvidtune.hash b/package/x11r7/xapp_xvidtune/xapp_xvidtune.hash
index ecf7d0330b..0e7e231383 100644
--- a/package/x11r7/xapp_xvidtune/xapp_xvidtune.hash
+++ b/package/x11r7/xapp_xvidtune/xapp_xvidtune.hash
@@ -1,4 +1,5 @@
-# From http://lists.x.org/archives/xorg-announce/2013-January/002129.html
-sha256  24e5e103933a04bfb2e1d18562619ed74031ab515e7343eb546bacdbcbeecf01  xvidtune-1.0.3.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2023-February/003319.html
+sha256  0d4eecd54e440cc11f1bdaaa23180fcf890f003444343f533f639086b05b2cc5  xvidtune-1.0.4.tar.xz
+sha512  747d5358f4f7d3d7db508c3f034711ce4b9dd278160d35312e9c4d1604623e84a2438d039b536546fd2df7db8c5ea1907e8a6101985fad2932b6dee5a62c7b80  xvidtune-1.0.4.tar.xz
 # Locally computed
 sha256  f3da8eaed19e27e4f67e6f076d4ebdb8d649e15a8ad33a415fb65a23de1b6689  COPYING
diff --git a/package/x11r7/xapp_xvidtune/xapp_xvidtune.mk b/package/x11r7/xapp_xvidtune/xapp_xvidtune.mk
index d7c4d5bf56..cc40d39098 100644
--- a/package/x11r7/xapp_xvidtune/xapp_xvidtune.mk
+++ b/package/x11r7/xapp_xvidtune/xapp_xvidtune.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-XAPP_XVIDTUNE_VERSION = 1.0.3
-XAPP_XVIDTUNE_SOURCE = xvidtune-$(XAPP_XVIDTUNE_VERSION).tar.bz2
-XAPP_XVIDTUNE_SITE = http://xorg.freedesktop.org/releases/individual/app
+XAPP_XVIDTUNE_VERSION = 1.0.4
+XAPP_XVIDTUNE_SOURCE = xvidtune-$(XAPP_XVIDTUNE_VERSION).tar.xz
+XAPP_XVIDTUNE_SITE = https://xorg.freedesktop.org/archive/individual/app
 XAPP_XVIDTUNE_LICENSE = MIT
 XAPP_XVIDTUNE_LICENSE_FILES = COPYING
 XAPP_XVIDTUNE_DEPENDENCIES = xlib_libXaw xlib_libXxf86vm
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
