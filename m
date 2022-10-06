Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DCFCC433FE
	for <buildroot@archiver.kernel.org>; Thu,  6 Oct 2022 19:41:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9A72183FEF;
	Thu,  6 Oct 2022 19:41:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9A72183FEF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TUgeTqVfsovG; Thu,  6 Oct 2022 19:41:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id AEE9B83FE8;
	Thu,  6 Oct 2022 19:41:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AEE9B83FE8
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id DA1321BF3C8
 for <buildroot@lists.busybox.net>; Thu,  6 Oct 2022 19:41:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B1A45419FB
 for <buildroot@lists.busybox.net>; Thu,  6 Oct 2022 19:41:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B1A45419FB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id n5MYql7RP8PG for <buildroot@lists.busybox.net>;
 Thu,  6 Oct 2022 19:41:15 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9F81D419FA
 for <buildroot@buildroot.org>; Thu,  6 Oct 2022 19:41:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9F81D419FA
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8D49586A29; Thu,  6 Oct 2022 19:41:15 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 6 Oct 2022 21:05:30 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 76853089d561c6d2517bfe87d81f7f1ff4b4b7c6
X-Git-Newrev: c90810abea1421c1a1bc8db362662a1e7174767c
X-Patchwork-Hint: ignore
Message-Id: <20221006194115.8D49586A29@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/cups-filters: bump to version
 1.28.16
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=c90810abea1421c1a1bc8db362662a1e7174767c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Handling the newly added libexif configure option.

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/cups-filters/cups-filters.hash |  2 +-
 package/cups-filters/cups-filters.mk   | 10 +++++++++-
 2 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/package/cups-filters/cups-filters.hash b/package/cups-filters/cups-filters.hash
index d05cce3734..b910cdce13 100644
--- a/package/cups-filters/cups-filters.hash
+++ b/package/cups-filters/cups-filters.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  614e053404bb833f78e1edf077f7759d27e475a212eb9a3bd3eac2cfec8bb6c1  cups-filters-1.28.15.tar.gz
+sha256  0ca77bb820719a040ff003ecb478d0c2ceffc94e8bd1cd03ddb5a199444127ba  cups-filters-1.28.16.tar.gz
 sha256  38192ffdaca98b718f78b2d4abc38bb087f0bbcc9a16d212c98b903b985f900f  COPYING
diff --git a/package/cups-filters/cups-filters.mk b/package/cups-filters/cups-filters.mk
index 976549e65e..7a3c894112 100644
--- a/package/cups-filters/cups-filters.mk
+++ b/package/cups-filters/cups-filters.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CUPS_FILTERS_VERSION = 1.28.15
+CUPS_FILTERS_VERSION = 1.28.16
 CUPS_FILTERS_SITE = http://openprinting.org/download/cups-filters
 CUPS_FILTERS_LICENSE = GPL-2.0, GPL-2.0+, GPL-3.0, GPL-3.0+, LGPL-2, LGPL-2.1+, MIT, BSD-4-Clause
 CUPS_FILTERS_LICENSE_FILES = COPYING
@@ -73,6 +73,14 @@ else
 CUPS_FILTERS_CONF_OPTS += --disable-poppler
 endif
 
+ifeq ($(BR2_PACKAGE_LIBEXIF),y)
+CUPS_FILTERS_CONF_OPTS += --enable-exif
+CUPS_FILTERS_DEPENDENCIES += libexif
+else
+CUPS_FILTERS_CONF_OPTS += --disable-exif
+endif
+
+
 define CUPS_FILTERS_INSTALL_INIT_SYSV
 	$(INSTALL) -D -m 0755 package/cups-filters/S82cups-browsed \
 		$(TARGET_DIR)/etc/init.d/S82cups-browsed
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
