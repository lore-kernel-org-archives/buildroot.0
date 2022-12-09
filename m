Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2483C4332F
	for <buildroot@archiver.kernel.org>; Fri,  9 Dec 2022 17:07:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5216E41B8C;
	Fri,  9 Dec 2022 17:07:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5216E41B8C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Zed5a3u8cg2A; Fri,  9 Dec 2022 17:07:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3E98641B71;
	Fri,  9 Dec 2022 17:07:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3E98641B71
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3BC901BF976
 for <buildroot@lists.busybox.net>; Fri,  9 Dec 2022 17:01:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 954E5610D2
 for <buildroot@lists.busybox.net>; Fri,  9 Dec 2022 17:01:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 954E5610D2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id p-wUeCoMbm1T for <buildroot@lists.busybox.net>;
 Fri,  9 Dec 2022 17:01:09 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 105BD611B4
 for <buildroot@buildroot.org>; Fri,  9 Dec 2022 17:01:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 105BD611B4
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0033685EA6; Fri,  9 Dec 2022 17:01:04 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Fri, 9 Dec 2022 17:36:16 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2f7d13d9588cf3632a7c73bd81dddb52a4263309
X-Git-Newrev: a49f6567142eee59817d07afa380337260f81634
X-Patchwork-Hint: ignore
Message-Id: <20221209170105.0033685EA6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/x11r7/xapp_xmh: bump version to
 1.0.4
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

commit: https://git.buildroot.net/buildroot/commit/?id=a49f6567142eee59817d07afa380337260f81634
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://lists.x.org/archives/xorg-announce/2022-August/003208.html
Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/x11r7/xapp_xmh/xapp_xmh.hash | 5 +++--
 package/x11r7/xapp_xmh/xapp_xmh.mk   | 6 +++---
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/package/x11r7/xapp_xmh/xapp_xmh.hash b/package/x11r7/xapp_xmh/xapp_xmh.hash
index 1dadc34586..f0c9fa9567 100644
--- a/package/x11r7/xapp_xmh/xapp_xmh.hash
+++ b/package/x11r7/xapp_xmh/xapp_xmh.hash
@@ -1,4 +1,5 @@
-# From http://lists.x.org/archives/xorg-announce/2015-April/002582.html
-sha256  b92f4f912a5fb6346d52cc2b639aea087b347f3b2e4e1a4fc7a165b1345f5689  xmh-1.0.3.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2022-August/003208.html
+sha256  e82c425a4c4156eee2e344d2e952f3fd816e03973005cd656ec1e9acf6f329db  xmh-1.0.4.tar.xz
+sha512  03bba7d3e7c2070b03378335aed0188dd0fd0a488f19dc5ad3f26674a9b38e6599377d082328041dd3ab72123ed60acae32cff19d7149517545b80e1339db26a  xmh-1.0.4.tar.xz
 # Locally computed
 sha256  27d8cbdcde7a0bd062ce49cdf8c672201452a64e3e6823f09b1beffe2c4b8eff  COPYING
diff --git a/package/x11r7/xapp_xmh/xapp_xmh.mk b/package/x11r7/xapp_xmh/xapp_xmh.mk
index c18bbfe5da..db6102eb75 100644
--- a/package/x11r7/xapp_xmh/xapp_xmh.mk
+++ b/package/x11r7/xapp_xmh/xapp_xmh.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-XAPP_XMH_VERSION = 1.0.3
-XAPP_XMH_SOURCE = xmh-$(XAPP_XMH_VERSION).tar.bz2
-XAPP_XMH_SITE = http://xorg.freedesktop.org/releases/individual/app
+XAPP_XMH_VERSION = 1.0.4
+XAPP_XMH_SOURCE = xmh-$(XAPP_XMH_VERSION).tar.xz
+XAPP_XMH_SITE = https://xorg.freedesktop.org/archive/individual/app
 XAPP_XMH_LICENSE = MIT
 XAPP_XMH_LICENSE_FILES = COPYING
 XAPP_XMH_DEPENDENCIES = xlib_libXaw xdata_xbitmaps
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
