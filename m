Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01C5DC433F5
	for <buildroot@archiver.kernel.org>; Thu, 12 May 2022 18:57:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B6E6F40133;
	Thu, 12 May 2022 18:57:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id U-N7se70_uLp; Thu, 12 May 2022 18:57:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CF0D440169;
	Thu, 12 May 2022 18:57:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 48DBC1BF578
 for <buildroot@lists.busybox.net>; Thu, 12 May 2022 18:54:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7BEB040108
 for <buildroot@lists.busybox.net>; Thu, 12 May 2022 18:54:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dR_ZT1UGvZbD for <buildroot@lists.busybox.net>;
 Thu, 12 May 2022 18:54:02 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mailout05.t-online.de (mailout05.t-online.de [194.25.134.82])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9BDFF400FB
 for <buildroot@buildroot.org>; Thu, 12 May 2022 18:54:02 +0000 (UTC)
Received: from fwd89.dcpf.telekom.de (fwd89.aul.t-online.de [10.223.144.115])
 by mailout05.t-online.de (Postfix) with SMTP id 6C3D019777
 for <buildroot@buildroot.org>; Thu, 12 May 2022 20:54:00 +0200 (CEST)
Received: from fli4l.lan.fli4l ([79.214.203.41]) by fwd89.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1npDwj-0Fmf3x0; Thu, 12 May 2022 20:53:57 +0200
Received: from bruckner.lan.fli4l ([192.168.1.1]:48510)
 by fli4l.lan.fli4l with esmtp (Exim 4.95)
 (envelope-from <bernd.kuhls@t-online.de>) id 1npDwi-0004aZ-Hw
 for buildroot@buildroot.org; Thu, 12 May 2022 20:53:56 +0200
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Thu, 12 May 2022 20:53:46 +0200
Message-Id: <20220512185355.873825-16-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220512185355.873825-1-bernd.kuhls@t-online.de>
References: <20220512185355.873825-1-bernd.kuhls@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1652381637-0000F5B3-94F6E850/0/0 CLEAN NORMAL
X-TOI-MSGID: 6629b11c-e925-42ec-9308-51d4f82cad4e
Subject: [Buildroot] [PATCH 16/25] package/x11r7/xapp_xlsfonts: bump version
 to 1.0.7
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Release notes:
https://lists.x.org/archives/xorg-announce/2022-April/003151.html

Removed md5 and sha1 hashes, not provided by upstream anymore.
Reformatted license hash.
Switched tarball to upstream-provided .xz format.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xapp_xlsfonts/xapp_xlsfonts.hash | 10 ++++------
 package/x11r7/xapp_xlsfonts/xapp_xlsfonts.mk   |  4 ++--
 2 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/package/x11r7/xapp_xlsfonts/xapp_xlsfonts.hash b/package/x11r7/xapp_xlsfonts/xapp_xlsfonts.hash
index f76369f97e..cd8ae4f368 100644
--- a/package/x11r7/xapp_xlsfonts/xapp_xlsfonts.hash
+++ b/package/x11r7/xapp_xlsfonts/xapp_xlsfonts.hash
@@ -1,7 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2018-March/002867.html
-md5 5774fd4f518b3f338f2b28f270e04bfc  xlsfonts-1.0.6.tar.bz2
-sha1 bf95e46e0897dcb9d197ce20d4fa024b8ace5148  xlsfonts-1.0.6.tar.bz2
-sha256 89b80b3a030006ab6cef717be286c12f2477894b227158b1e6133274f6ebd368  xlsfonts-1.0.6.tar.bz2
-sha512 052a3b1dec23cb20fdfacd4500cb836feb3b888bf568a548ea71deb58a4ba10a1ad5392d658e95272c6d4a1832edf1f19c3de2498b78dca82c43ee52800a30c0  xlsfonts-1.0.6.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2022-April/003151.html
+sha256  7b726945a967b44c35cddee5edd74802907a239ce2e2e515730b8a32c8e50465  xlsfonts-1.0.7.tar.xz
+sha512  ec82be0a97500a9e64fb5a6adbbec470b249b1267c3081c2bd44cd3e7148107517d1234c1da2f81b0405230ab03ad2943ea53756c3380f4d561665b38d0cedc0  xlsfonts-1.0.7.tar.xz
 # Locally computed
-sha256 dcdf5fa36a652efbe61a21def1301739b0010334ae3f049f1cff433221a8c7a5 COPYING
+sha256  dcdf5fa36a652efbe61a21def1301739b0010334ae3f049f1cff433221a8c7a5  COPYING
diff --git a/package/x11r7/xapp_xlsfonts/xapp_xlsfonts.mk b/package/x11r7/xapp_xlsfonts/xapp_xlsfonts.mk
index 0ccd4ea6b0..f8a35e5638 100644
--- a/package/x11r7/xapp_xlsfonts/xapp_xlsfonts.mk
+++ b/package/x11r7/xapp_xlsfonts/xapp_xlsfonts.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-XAPP_XLSFONTS_VERSION = 1.0.6
-XAPP_XLSFONTS_SOURCE = xlsfonts-$(XAPP_XLSFONTS_VERSION).tar.bz2
+XAPP_XLSFONTS_VERSION = 1.0.7
+XAPP_XLSFONTS_SOURCE = xlsfonts-$(XAPP_XLSFONTS_VERSION).tar.xz
 XAPP_XLSFONTS_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XLSFONTS_LICENSE = MIT
 XAPP_XLSFONTS_LICENSE_FILES = COPYING
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
