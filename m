Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F8D6C77B7A
	for <buildroot@archiver.kernel.org>; Sun, 11 Jun 2023 14:57:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E946A611BD;
	Sun, 11 Jun 2023 14:57:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E946A611BD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9-3ReSF2MwLd; Sun, 11 Jun 2023 14:57:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1A2A1611B4;
	Sun, 11 Jun 2023 14:57:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1A2A1611B4
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BF7071BF3E8
 for <buildroot@lists.busybox.net>; Sun, 11 Jun 2023 14:56:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 97EDD60A7E
 for <buildroot@lists.busybox.net>; Sun, 11 Jun 2023 14:56:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 97EDD60A7E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id r2_FdZcXKgGi for <buildroot@lists.busybox.net>;
 Sun, 11 Jun 2023 14:56:25 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8E55C60E34
Received: from mailout04.t-online.de (mailout04.t-online.de [194.25.134.18])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8E55C60E34
 for <buildroot@buildroot.org>; Sun, 11 Jun 2023 14:56:25 +0000 (UTC)
Received: from fwd85.dcpf.telekom.de (fwd85.aul.t-online.de [10.223.144.111])
 by mailout04.t-online.de (Postfix) with SMTP id B331B1A95D
 for <buildroot@buildroot.org>; Sun, 11 Jun 2023 16:56:23 +0200 (CEST)
Received: from fli4l.lan.fli4l ([91.58.6.127]) by fwd85.t-online.de
 with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
 esmtp id 1q8MUP-3zPtIY0; Sun, 11 Jun 2023 16:56:21 +0200
Received: from bruckner.lan.fli4l ([192.168.1.1]:34716)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd.kuhls@t-online.de>) id 1q8MUO-0001vD-39
 for buildroot@buildroot.org; Sun, 11 Jun 2023 16:56:21 +0200
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Sun, 11 Jun 2023 16:56:12 +0200
Message-Id: <20230611145617.758070-8-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230611145617.758070-1-bernd.kuhls@t-online.de>
References: <20230611145617.758070-1-bernd.kuhls@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1686495381-AF592DAB-648A3812/0/0 CLEAN NORMAL
X-TOI-MSGID: 87637b74-6b68-40f4-adb3-b7d23ec73085
Subject: [Buildroot] [PATCH 07/12] package/x11r7/xapp_xrdb: bump version to
 1.2.2
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
https://lists.x.org/archives/xorg-announce/2023-June/003401html

Switched tarball to xz.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xapp_xrdb/xapp_xrdb.hash | 6 +++---
 package/x11r7/xapp_xrdb/xapp_xrdb.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/x11r7/xapp_xrdb/xapp_xrdb.hash b/package/x11r7/xapp_xrdb/xapp_xrdb.hash
index 606fd26060..d8b56bf2c8 100644
--- a/package/x11r7/xapp_xrdb/xapp_xrdb.hash
+++ b/package/x11r7/xapp_xrdb/xapp_xrdb.hash
@@ -1,5 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2021-August/003107.html
-sha256  4f5d031c214ffb88a42ae7528492abde1178f5146351ceb3c05f3b8d5abee8b4  xrdb-1.2.1.tar.bz2
-sha512  d88135cdfea8536523dfb986249ee42761d5363c936352f12f55b4d0c849f21236f7d74d39869c5ec5b549019d6ed89d9096cde4b3c2b4816c2778a8e370b5c9  xrdb-1.2.1.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2023-June/003401.html
+sha256  31f5fcab231b38f255b00b066cf7ea3b496df712c9eb2d0d50c670b63e5033f4  xrdb-1.2.2.tar.xz
+sha512  c8a6fc94e270e9cb5602e055150553de103d545298285157ecd8924f163a10ebeb9acfff56d1fafbf48d339809c76340213792478cdf3270012d3cd05486001c  xrdb-1.2.2.tar.xz
 # Locally computed
 sha256  ca1b3e2f9f37c35876b69a9c1c5a7860fae59b7ba87a1d2dc541b722e29b1ecc  COPYING
diff --git a/package/x11r7/xapp_xrdb/xapp_xrdb.mk b/package/x11r7/xapp_xrdb/xapp_xrdb.mk
index 4f9860d25a..769c5a06f4 100644
--- a/package/x11r7/xapp_xrdb/xapp_xrdb.mk
+++ b/package/x11r7/xapp_xrdb/xapp_xrdb.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-XAPP_XRDB_VERSION = 1.2.1
-XAPP_XRDB_SOURCE = xrdb-$(XAPP_XRDB_VERSION).tar.bz2
+XAPP_XRDB_VERSION = 1.2.2
+XAPP_XRDB_SOURCE = xrdb-$(XAPP_XRDB_VERSION).tar.xz
 XAPP_XRDB_SITE = https://xorg.freedesktop.org/archive/individual/app
 XAPP_XRDB_LICENSE = MIT
 XAPP_XRDB_LICENSE_FILES = COPYING
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
