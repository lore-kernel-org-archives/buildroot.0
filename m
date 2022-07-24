Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3936DC433EF
	for <buildroot@archiver.kernel.org>; Sun, 24 Jul 2022 16:25:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BE3CB4052E;
	Sun, 24 Jul 2022 16:25:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BE3CB4052E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FtJk0OdCEvtm; Sun, 24 Jul 2022 16:25:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B1F5440C4F;
	Sun, 24 Jul 2022 16:25:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B1F5440C4F
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id AD9F31BF479
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 16:25:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 957648496E
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 16:25:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 957648496E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hdQdJ_hRHEw7 for <buildroot@lists.busybox.net>;
 Sun, 24 Jul 2022 16:25:06 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A8C228494F
Received: from mailout06.t-online.de (mailout06.t-online.de [194.25.134.19])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A8C228494F
 for <buildroot@buildroot.org>; Sun, 24 Jul 2022 16:25:06 +0000 (UTC)
Received: from fwd84.dcpf.telekom.de (fwd84.aul.t-online.de [10.223.144.110])
 by mailout06.t-online.de (Postfix) with SMTP id 5CF1212DF4
 for <buildroot@buildroot.org>; Sun, 24 Jul 2022 18:25:04 +0200 (CEST)
Received: from fli4l.lan.fli4l ([79.214.202.112]) by fwd84.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1oFePc-3IU3sH0; Sun, 24 Jul 2022 18:25:00 +0200
Received: from bruckner.lan.fli4l ([192.168.1.1]:40906)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd.kuhls@t-online.de>) id 1oFePc-0007mb-15;
 Sun, 24 Jul 2022 18:25:00 +0200
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Sun, 24 Jul 2022 18:24:42 +0200
Message-Id: <20220724162500.2683871-3-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220724162500.2683871-1-bernd.kuhls@t-online.de>
References: <20220724162500.2683871-1-bernd.kuhls@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1658679900-0144CFA9-C55B2239/0/0 CLEAN NORMAL
X-TOI-MSGID: 77ac9dcf-9366-45e5-93b1-42a2e0ec604a
Subject: [Buildroot] [PATCH 02/20] package/x11r7/xapp_xcmsdb: bump version
 to 1.0.6
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
 package/x11r7/xapp_xcmsdb/xapp_xcmsdb.hash | 5 +++--
 package/x11r7/xapp_xcmsdb/xapp_xcmsdb.mk   | 6 +++---
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/package/x11r7/xapp_xcmsdb/xapp_xcmsdb.hash b/package/x11r7/xapp_xcmsdb/xapp_xcmsdb.hash
index 75a07f36ab..7590580d88 100644
--- a/package/x11r7/xapp_xcmsdb/xapp_xcmsdb.hash
+++ b/package/x11r7/xapp_xcmsdb/xapp_xcmsdb.hash
@@ -1,4 +1,5 @@
-# From http://lists.x.org/archives/xorg-announce/2015-April/002567.html
-sha256  e5585361bb8b6a05bb814a8d0e444ee93e0f00180881d3070aff4571e97f67c6  xcmsdb-1.0.5.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2022-July/003172.html
+sha256  3c77eec4537d5942bb0966973b787bfdaf7121f3125ffa81bb1c9708d4cf4f55  xcmsdb-1.0.6.tar.xz
+sha512  e47d9498ce496effbc44a66e70af91d9fe65c344a17916fd4990a4c84fa8879aa09b6695aeb6ef595f475c16a13c7c31d4c48449234564de7de38d7436764fae  xcmsdb-1.0.6.tar.xz
 # Locally computed
 sha256  c3bd4ac91beb08fee5272b17a3ddee8d2791cc5eaee5bce5271042a45fa4fa6a  COPYING
diff --git a/package/x11r7/xapp_xcmsdb/xapp_xcmsdb.mk b/package/x11r7/xapp_xcmsdb/xapp_xcmsdb.mk
index 3cccacc0b4..4af341a027 100644
--- a/package/x11r7/xapp_xcmsdb/xapp_xcmsdb.mk
+++ b/package/x11r7/xapp_xcmsdb/xapp_xcmsdb.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-XAPP_XCMSDB_VERSION = 1.0.5
-XAPP_XCMSDB_SOURCE = xcmsdb-$(XAPP_XCMSDB_VERSION).tar.bz2
-XAPP_XCMSDB_SITE = http://xorg.freedesktop.org/releases/individual/app
+XAPP_XCMSDB_VERSION = 1.0.6
+XAPP_XCMSDB_SOURCE = xcmsdb-$(XAPP_XCMSDB_VERSION).tar.xz
+XAPP_XCMSDB_SITE = https://xorg.freedesktop.org/releases/individual/app
 XAPP_XCMSDB_LICENSE = MIT
 XAPP_XCMSDB_LICENSE_FILES = COPYING
 XAPP_XCMSDB_DEPENDENCIES = xlib_libX11
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
