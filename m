Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D92AEC77B75
	for <buildroot@archiver.kernel.org>; Sun,  7 May 2023 12:08:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 90D3683B65;
	Sun,  7 May 2023 12:08:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 90D3683B65
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AkD5x_IIl-Go; Sun,  7 May 2023 12:08:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9F61D83B5D;
	Sun,  7 May 2023 12:08:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9F61D83B5D
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 70D601BF861
 for <buildroot@lists.busybox.net>; Sun,  7 May 2023 12:04:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E3286418B8
 for <buildroot@lists.busybox.net>; Sun,  7 May 2023 12:04:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E3286418B8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SeBzhSXGDoWY for <buildroot@lists.busybox.net>;
 Sun,  7 May 2023 12:04:39 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id CA47A418C3
 for <buildroot@buildroot.org>; Sun,  7 May 2023 12:04:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CA47A418C3
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C864C85EEF; Sun,  7 May 2023 12:04:38 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 7 May 2023 13:59:25 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 75d404bb2902cf891f76e8b21a913355d117e514
X-Git-Newrev: 1a5d479d6887a241fc6092f1828617e4cb72d93e
X-Patchwork-Hint: ignore
Message-Id: <20230507120438.C864C85EEF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/x11r7/xdata_xbitmaps: bump version
 to 1.1.3
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

commit: https://git.buildroot.net/buildroot/commit/?id=1a5d479d6887a241fc6092f1828617e4cb72d93e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes:
https://lists.x.org/archives/xorg-announce/2023-February/003333.html

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
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
