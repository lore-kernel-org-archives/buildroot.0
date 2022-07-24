Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E569C433EF
	for <buildroot@archiver.kernel.org>; Sun, 24 Jul 2022 16:29:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id ABF32404C6;
	Sun, 24 Jul 2022 16:29:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ABF32404C6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id v3FS4GfyItMt; Sun, 24 Jul 2022 16:29:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B4E5040C5A;
	Sun, 24 Jul 2022 16:29:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B4E5040C5A
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C885C1BF479
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 16:25:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6A5AD4160B
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 16:25:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6A5AD4160B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IU5DD7QxVhMy for <buildroot@lists.busybox.net>;
 Sun, 24 Jul 2022 16:25:09 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D865A424BF
Received: from mailout06.t-online.de (mailout06.t-online.de [194.25.134.19])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D865A424BF
 for <buildroot@buildroot.org>; Sun, 24 Jul 2022 16:25:08 +0000 (UTC)
Received: from fwd84.dcpf.telekom.de (fwd84.aul.t-online.de [10.223.144.110])
 by mailout06.t-online.de (Postfix) with SMTP id 8DC76173FD
 for <buildroot@buildroot.org>; Sun, 24 Jul 2022 18:25:04 +0200 (CEST)
Received: from fli4l.lan.fli4l ([79.214.202.112]) by fwd84.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1oFePd-3IU3sL0; Sun, 24 Jul 2022 18:25:01 +0200
Received: from bruckner.lan.fli4l ([192.168.1.1]:40906)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd.kuhls@t-online.de>) id 1oFePd-0007mb-0j;
 Sun, 24 Jul 2022 18:25:01 +0200
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Sun, 24 Jul 2022 18:24:56 +0200
Message-Id: <20220724162500.2683871-17-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220724162500.2683871-1-bernd.kuhls@t-online.de>
References: <20220724162500.2683871-1-bernd.kuhls@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1658679901-0144CFA9-6DCC0318/0/0 CLEAN NORMAL
X-TOI-MSGID: fc1a3c94-0347-4167-8878-8d41d03f15b6
Subject: [Buildroot] [PATCH 16/20] package/x11r7/xfont_font-util: bump
 version to 1.3.3
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
 package/x11r7/xfont_font-util/xfont_font-util.hash | 11 ++++-------
 package/x11r7/xfont_font-util/xfont_font-util.mk   |  6 +++---
 2 files changed, 7 insertions(+), 10 deletions(-)

diff --git a/package/x11r7/xfont_font-util/xfont_font-util.hash b/package/x11r7/xfont_font-util/xfont_font-util.hash
index 55beba89f3..a7664efec2 100644
--- a/package/x11r7/xfont_font-util/xfont_font-util.hash
+++ b/package/x11r7/xfont_font-util/xfont_font-util.hash
@@ -1,8 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2019-August/003019.html
-md5 3d6adb76fdd072db8c8fae41b40855e8  font-util-1.3.2.tar.bz2
-sha1 1b36275c174b64a9c16da5c902c91546789a67ef  font-util-1.3.2.tar.bz2
-sha256 3ad880444123ac06a7238546fa38a2a6ad7f7e0cc3614de7e103863616522282  font-util-1.3.2.tar.bz2
-sha512 7cac529b12ae71185b89c72c1569b9826f52eeaecc1c76010338e7c42c4078ae339f18220b580bbd68fb5dc09df6ecf169a47c32e6104d8ee53bd443fa21d167  font-util-1.3.2.tar.bz2
-
+# From https://lists.x.org/archives/xorg-announce/2022-July/003190.html
+sha256  e791c890779c40056ab63aaed5e031bb6e2890a98418ca09c534e6261a2eebd2  font-util-1.3.3.tar.xz
+sha512  5e1cb8af44fe0bea72b1a6a4e455f50ca49b7531c2f4b605800c0b2b7578b9826ccf17fa195c505ab1d6339fd4ad697c01ba3b9777616f354ab62b23434d47c9  font-util-1.3.3.tar.xz
 # Locally calculated
-sha256	ce16c3ee6f2a38db6870b66bdb54fce9dcf24acd1161840789e321f6faa1251c	COPYING
+sha256  ce16c3ee6f2a38db6870b66bdb54fce9dcf24acd1161840789e321f6faa1251c  COPYING
diff --git a/package/x11r7/xfont_font-util/xfont_font-util.mk b/package/x11r7/xfont_font-util/xfont_font-util.mk
index cd2ae81cc3..b864dce23c 100644
--- a/package/x11r7/xfont_font-util/xfont_font-util.mk
+++ b/package/x11r7/xfont_font-util/xfont_font-util.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-XFONT_FONT_UTIL_VERSION = 1.3.2
-XFONT_FONT_UTIL_SOURCE = font-util-$(XFONT_FONT_UTIL_VERSION).tar.bz2
-XFONT_FONT_UTIL_SITE = http://xorg.freedesktop.org/releases/individual/font
+XFONT_FONT_UTIL_VERSION = 1.3.3
+XFONT_FONT_UTIL_SOURCE = font-util-$(XFONT_FONT_UTIL_VERSION).tar.xz
+XFONT_FONT_UTIL_SITE = https://xorg.freedesktop.org/releases/individual/font
 XFONT_FONT_UTIL_LICENSE = MIT/BSD-2-Clause
 XFONT_FONT_UTIL_LICENSE_FILES = COPYING
 
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
