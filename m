Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D002BC61DA3
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 22:00:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 78F2A4DCCE;
	Mon, 20 Feb 2023 22:00:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 78F2A4DCCE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lWl8j5QPdFwZ; Mon, 20 Feb 2023 22:00:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3F2E94EB78;
	Mon, 20 Feb 2023 22:00:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3F2E94EB78
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id ACD8D1BF2E3
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:54:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AA8556113F
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:51:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AA8556113F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 826B60htGcYD for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:51:58 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id BEA7D6112D
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:51:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BEA7D6112D
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BD2B0828C8; Mon, 20 Feb 2023 20:51:58 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Fri, 9 Dec 2022 17:35:54 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 0f18b8dcb4e622f973d73332732d3dd6f548d3a3
X-Git-Newrev: 52264859725c6af2f88b0df6cf59f70b3b6d106d
X-Patchwork-Hint: ignore
Message-Id: <20230220205158.BD2B0828C8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/x11r7/xapp_viewres:
 bump version to 1.0.7
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

commit: https://git.buildroot.net/buildroot/commit/?id=52264859725c6af2f88b0df6cf59f70b3b6d106d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

https://lists.x.org/archives/xorg-announce/2022-October/003219.html
Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/x11r7/xapp_viewres/xapp_viewres.hash | 8 +++-----
 package/x11r7/xapp_viewres/xapp_viewres.mk   | 6 +++---
 2 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/package/x11r7/xapp_viewres/xapp_viewres.hash b/package/x11r7/xapp_viewres/xapp_viewres.hash
index 3e2928dc4e..a662f4ef2e 100644
--- a/package/x11r7/xapp_viewres/xapp_viewres.hash
+++ b/package/x11r7/xapp_viewres/xapp_viewres.hash
@@ -1,7 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2019-August/003020.html
-md5  38e6568271d8098327706c5cf855dbc7  viewres-1.0.6.tar.bz2
-sha1  f1d12e5b4e1180916edb44234599a486b025b480  viewres-1.0.6.tar.bz2
-sha256  11c15db02066c1d5fc3febf9b185d16c1112f87e37c4b101a484dcefffb80934  viewres-1.0.6.tar.bz2
-sha512  3f4cfc61608bc6c9b35ef66ceb473661ca01946d3306d54040d32803e8e0eec506a0ce37ea22bfe514544a6ba9645fd30f39b20c063aff696b3c0fda3fe95dff  viewres-1.0.6.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2022-October/003219.html
+sha256  b15a62085b1a10f55ae1cf17b7ded75b72b21be240c68071685db377c4afc628  viewres-1.0.7.tar.xz
+sha512  75878faee001163891adf8472c79b31273f794e23dd775c80b33acdd1ce76df708eb27a49c20f79b7101ad676e1d50d9c857c2e2e0930c6209eeb7af8a11397c  viewres-1.0.7.tar.xz
 # Locally computed
 sha256  aefb540c54bc95c68702cd2ae668c559e63cc1a84f55ae5c0e78547e7d75d2d5  COPYING
diff --git a/package/x11r7/xapp_viewres/xapp_viewres.mk b/package/x11r7/xapp_viewres/xapp_viewres.mk
index 2e05a6e7d9..49933d7af6 100644
--- a/package/x11r7/xapp_viewres/xapp_viewres.mk
+++ b/package/x11r7/xapp_viewres/xapp_viewres.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-XAPP_VIEWRES_VERSION = 1.0.6
-XAPP_VIEWRES_SOURCE = viewres-$(XAPP_VIEWRES_VERSION).tar.bz2
-XAPP_VIEWRES_SITE = http://xorg.freedesktop.org/releases/individual/app
+XAPP_VIEWRES_VERSION = 1.0.7
+XAPP_VIEWRES_SOURCE = viewres-$(XAPP_VIEWRES_VERSION).tar.xz
+XAPP_VIEWRES_SITE = https://xorg.freedesktop.org/archive/individual/app
 XAPP_VIEWRES_LICENSE = MIT
 XAPP_VIEWRES_LICENSE_FILES = COPYING
 XAPP_VIEWRES_DEPENDENCIES = xlib_libXaw
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
