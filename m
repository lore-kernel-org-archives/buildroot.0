Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 844BDC7EE23
	for <buildroot@archiver.kernel.org>; Mon,  5 Jun 2023 11:47:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 315B860F9A;
	Mon,  5 Jun 2023 11:47:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 315B860F9A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Qu3Kc_A14vJL; Mon,  5 Jun 2023 11:47:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4AE2960FDB;
	Mon,  5 Jun 2023 11:47:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4AE2960FDB
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 14E631BF95E
 for <buildroot@lists.busybox.net>; Mon,  5 Jun 2023 11:45:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1E0654042B
 for <buildroot@lists.busybox.net>; Mon,  5 Jun 2023 11:45:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1E0654042B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9OhtCeJ0Aj-w for <buildroot@lists.busybox.net>;
 Mon,  5 Jun 2023 11:45:19 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4F632401E1
 for <buildroot@buildroot.org>; Mon,  5 Jun 2023 11:45:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4F632401E1
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4D2D086C78; Mon,  5 Jun 2023 11:45:19 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 5 Jun 2023 13:17:54 +0200
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: e8f4288e61cf56dbeac2b5afaea4c2c80f5519dd
X-Git-Newrev: 221b7b045ee6b7a294f3bb35a29cc3ab4736451f
X-Patchwork-Hint: ignore
Message-Id: <20230605114519.4D2D086C78@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x]
 package/x11r7/xdata_xbitmaps: bump version to 1.1.3
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

commit: https://git.buildroot.net/buildroot/commit/?id=221b7b045ee6b7a294f3bb35a29cc3ab4736451f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

Release notes:
https://lists.x.org/archives/xorg-announce/2023-February/003333.html

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 1a5d479d6887a241fc6092f1828617e4cb72d93e)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/x11r7/xdata_xbitmaps/xdata_xbitmaps.hash | 8 +++-----
 package/x11r7/xdata_xbitmaps/xdata_xbitmaps.mk   | 6 +++---
 2 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/package/x11r7/xdata_xbitmaps/xdata_xbitmaps.hash b/package/x11r7/xdata_xbitmaps/xdata_xbitmaps.hash
index 7ebc88a0be..c9a3956686 100644
--- a/package/x11r7/xdata_xbitmaps/xdata_xbitmaps.hash
+++ b/package/x11r7/xdata_xbitmaps/xdata_xbitmaps.hash
@@ -1,7 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2018-March/002881.html
-md5  cedeef095918aca86da79a2934e03daf  xbitmaps-1.1.2.tar.bz2
-sha1  1cb0e485a66280e9a64b48426140b8a0de9cf169  xbitmaps-1.1.2.tar.bz2
-sha256  b9f0c71563125937776c8f1f25174ae9685314cbd130fb4c2efce811981e07ee  xbitmaps-1.1.2.tar.bz2
-sha512  eed5e2fce9fc6c532984e6ed1262e440591e311ca6c61a7fe7a5c877df84bfc2d7aff388fb9c894fc098785b8e5352f0bd7c918252247a040cf123874847450d  xbitmaps-1.1.2.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2023-February/003333.html
+sha256  ad6cad54887832a17d86c2ccfc5e52a1dfab090f8307b152c78b0e1529cd0f7a  xbitmaps-1.1.3.tar.xz
+sha512  b9a7340385fcce2dcd0204f14a462685b14b72ff58f3ec53cd76695bef2b02af902bdac809622dcb27fd4075d5ba13587b5d059530aff502cd5288d161352814  xbitmaps-1.1.3.tar.xz
 # Locally computed
 sha256  e121ec6605558ee021674d33b1ab9306e16b9ea7d30453df42286556247be17a  COPYING
diff --git a/package/x11r7/xdata_xbitmaps/xdata_xbitmaps.mk b/package/x11r7/xdata_xbitmaps/xdata_xbitmaps.mk
index e9545abaec..c8b6445829 100644
--- a/package/x11r7/xdata_xbitmaps/xdata_xbitmaps.mk
+++ b/package/x11r7/xdata_xbitmaps/xdata_xbitmaps.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-XDATA_XBITMAPS_VERSION = 1.1.2
-XDATA_XBITMAPS_SOURCE = xbitmaps-$(XDATA_XBITMAPS_VERSION).tar.bz2
-XDATA_XBITMAPS_SITE = http://xorg.freedesktop.org/releases/individual/data
+XDATA_XBITMAPS_VERSION = 1.1.3
+XDATA_XBITMAPS_SOURCE = xbitmaps-$(XDATA_XBITMAPS_VERSION).tar.xz
+XDATA_XBITMAPS_SITE = https://xorg.freedesktop.org/archive/individual/data
 XDATA_XBITMAPS_LICENSE = MIT
 XDATA_XBITMAPS_LICENSE_FILES = COPYING
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
