Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2C6DC6379F
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 21:38:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3C34944B8D;
	Mon, 20 Feb 2023 21:38:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3C34944B8D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Kswpze9UwSCH; Mon, 20 Feb 2023 21:38:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 096754BC25;
	Mon, 20 Feb 2023 21:38:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 096754BC25
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7D4861BF2E3
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:53:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D00FA415BA
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:51:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D00FA415BA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zypDBajleTnt for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:51:57 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0C7EB415B0
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:51:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0C7EB415B0
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0700186494; Mon, 20 Feb 2023 20:51:57 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Fri, 9 Dec 2022 17:31:51 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 481860051016bbaab467621e5651500327f4f004
X-Git-Newrev: ea7d4fe0df7154b60f563295de0ce362991ff1d4
X-Patchwork-Hint: ignore
Message-Id: <20230220205157.0700186494@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/x11r7/xapp_xset: bump
 version to 1.2.5
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

commit: https://git.buildroot.net/buildroot/commit/?id=ea7d4fe0df7154b60f563295de0ce362991ff1d4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

https://lists.x.org/archives/xorg-announce/2022-December/003271.html
Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/x11r7/xapp_xset/xapp_xset.hash | 8 +++-----
 package/x11r7/xapp_xset/xapp_xset.mk   | 6 +++---
 2 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/package/x11r7/xapp_xset/xapp_xset.hash b/package/x11r7/xapp_xset/xapp_xset.hash
index a4f19d0273..dea34a1a13 100644
--- a/package/x11r7/xapp_xset/xapp_xset.hash
+++ b/package/x11r7/xapp_xset/xapp_xset.hash
@@ -1,7 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2018-March/002873.html
-md5  70ea7bc7bacf1a124b1692605883f620  xset-1.2.4.tar.bz2
-sha1  41a857f30ff5bb0dfbda1549bb703984344ea228  xset-1.2.4.tar.bz2
-sha256  e4fd95280df52a88e9b0abc1fee11dcf0f34fc24041b9f45a247e52df941c957  xset-1.2.4.tar.bz2
-sha512  f24714c9a82081a09d3054bbad98553de9366992f22eaf3e2bcadbb58fad1d3dad2547fef6fa9898d8a9df064573c29df9d82a5c801fa92248604c95f65dc83d  xset-1.2.4.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2022-December/003271.html
+sha256  9f692d55635b3862cd63633b1222a87680ec283c7a8e8ed6dd698a3147f75e2f  xset-1.2.5.tar.xz
+sha512  12b53d7cd6b7ccf6515c03f68151490fce6b2629e99b8d85ac5d760f4ed93394a457213c3947533809fbbb04acd1ed260aeea1256099a10397660eef3088150d  xset-1.2.5.tar.xz
 # Locally computed
 sha256  6bfc619b6d37dd0e6ca575edcb3a05194136e04d1d9989b8e14e6f7850587382  COPYING
diff --git a/package/x11r7/xapp_xset/xapp_xset.mk b/package/x11r7/xapp_xset/xapp_xset.mk
index 9ead55a20f..498e6a123c 100644
--- a/package/x11r7/xapp_xset/xapp_xset.mk
+++ b/package/x11r7/xapp_xset/xapp_xset.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-XAPP_XSET_VERSION = 1.2.4
-XAPP_XSET_SOURCE = xset-$(XAPP_XSET_VERSION).tar.bz2
-XAPP_XSET_SITE = http://xorg.freedesktop.org/releases/individual/app
+XAPP_XSET_VERSION = 1.2.5
+XAPP_XSET_SOURCE = xset-$(XAPP_XSET_VERSION).tar.xz
+XAPP_XSET_SITE = https://xorg.freedesktop.org/archive/individual/app
 XAPP_XSET_LICENSE = MIT
 XAPP_XSET_LICENSE_FILES = COPYING
 XAPP_XSET_DEPENDENCIES = xlib_libXmu
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
