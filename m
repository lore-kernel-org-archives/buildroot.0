Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C54F2C433EF
	for <buildroot@archiver.kernel.org>; Sun, 24 Jul 2022 16:25:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5413184971;
	Sun, 24 Jul 2022 16:25:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5413184971
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pwdh853FA5AS; Sun, 24 Jul 2022 16:25:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5CAB38494F;
	Sun, 24 Jul 2022 16:25:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5CAB38494F
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id F237E1BF479
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 16:25:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DAC5460AF2
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 16:25:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DAC5460AF2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ijlCFvYkCaHC for <buildroot@lists.busybox.net>;
 Sun, 24 Jul 2022 16:25:07 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CA7D460ADC
Received: from mailout06.t-online.de (mailout06.t-online.de [194.25.134.19])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CA7D460ADC
 for <buildroot@buildroot.org>; Sun, 24 Jul 2022 16:25:06 +0000 (UTC)
Received: from fwd84.dcpf.telekom.de (fwd84.aul.t-online.de [10.223.144.110])
 by mailout06.t-online.de (Postfix) with SMTP id 57EE012DF2
 for <buildroot@buildroot.org>; Sun, 24 Jul 2022 18:25:04 +0200 (CEST)
Received: from fli4l.lan.fli4l ([79.214.202.112]) by fwd84.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1oFePc-3I37590; Sun, 24 Jul 2022 18:25:01 +0200
Received: from bruckner.lan.fli4l ([192.168.1.1]:40906)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd.kuhls@t-online.de>) id 1oFePc-0007mb-1f;
 Sun, 24 Jul 2022 18:25:00 +0200
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Sun, 24 Jul 2022 18:24:45 +0200
Message-Id: <20220724162500.2683871-6-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220724162500.2683871-1-bernd.kuhls@t-online.de>
References: <20220724162500.2683871-1-bernd.kuhls@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1658679901-0144CFA9-FACB350E/0/0 CLEAN NORMAL
X-TOI-MSGID: 76e84482-3f51-466a-8db9-3977445ef5f7
Subject: [Buildroot] [PATCH 05/20] package/x11r7/xapp_xfs: bump version to
 1.2.1
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xapp_xfs/xapp_xfs.hash | 10 ++++------
 package/x11r7/xapp_xfs/xapp_xfs.mk   |  6 +++---
 2 files changed, 7 insertions(+), 9 deletions(-)

diff --git a/package/x11r7/xapp_xfs/xapp_xfs.hash b/package/x11r7/xapp_xfs/xapp_xfs.hash
index 22ec25a1b4..ed802f86a0 100644
--- a/package/x11r7/xapp_xfs/xapp_xfs.hash
+++ b/package/x11r7/xapp_xfs/xapp_xfs.hash
@@ -1,7 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2017-November/002826.html
-md5  b4d2e644bfb35cae8858d2411501b07e  xfs-1.2.0.tar.bz2
-sha1 00848fcc2915ed8b00e75ac311c4727327324f57  xfs-1.2.0.tar.bz2
-sha256 db2212115783498f8eeaaee1349461d6c4e9d2005e142bacd3a984fe57269860  xfs-1.2.0.tar.bz2
-sha512 557b08aa07919239ce345d60b288b886640200bb1a59649fc890c3ccaa8559cc6745189614e696ab1b390ec024b393be5493787b7b0d2b3545b342d743c2e0ef  xfs-1.2.0.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2022-July/003175.html
+sha256  3d8ac3e8add7eeb1dc199dff6c59f90a2dbe7aa4332c1e12192350f2cda1c1e6  xfs-1.2.1.tar.xz
+sha512  0f8b019e0d922b3d859110154e0ec58493f66507f9787cd41a6c03ad7a05b3293f088f1004e4aaa81e017a524c06d23915669f91ed5e1c2679b33c43de15e70d  xfs-1.2.1.tar.xz
 # Locally computed
-sha256 0314ea37f40eff3c9ffe44b3924b2a768422f006a754e8286bfd1c73203d225e  COPYING
+sha256  0314ea37f40eff3c9ffe44b3924b2a768422f006a754e8286bfd1c73203d225e  COPYING
diff --git a/package/x11r7/xapp_xfs/xapp_xfs.mk b/package/x11r7/xapp_xfs/xapp_xfs.mk
index 9177a65b9c..50a0412181 100644
--- a/package/x11r7/xapp_xfs/xapp_xfs.mk
+++ b/package/x11r7/xapp_xfs/xapp_xfs.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-XAPP_XFS_VERSION = 1.2.0
-XAPP_XFS_SOURCE = xfs-$(XAPP_XFS_VERSION).tar.bz2
-XAPP_XFS_SITE = http://xorg.freedesktop.org/releases/individual/app
+XAPP_XFS_VERSION = 1.2.1
+XAPP_XFS_SOURCE = xfs-$(XAPP_XFS_VERSION).tar.xz
+XAPP_XFS_SITE = https://xorg.freedesktop.org/releases/individual/app
 XAPP_XFS_LICENSE = MIT
 XAPP_XFS_LICENSE_FILES = COPYING
 XAPP_XFS_DEPENDENCIES = xlib_libFS xlib_libXfont2 xorgproto
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
