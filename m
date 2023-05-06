Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60F13C77B73
	for <buildroot@archiver.kernel.org>; Sat,  6 May 2023 14:41:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 070AC60E72;
	Sat,  6 May 2023 14:41:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 070AC60E72
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lX58OIu2r8wT; Sat,  6 May 2023 14:41:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1589461122;
	Sat,  6 May 2023 14:41:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1589461122
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id F005D1BF859
 for <buildroot@lists.busybox.net>; Sat,  6 May 2023 14:41:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C8FE5405C6
 for <buildroot@lists.busybox.net>; Sat,  6 May 2023 14:41:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C8FE5405C6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id go0Dgo08mwzQ for <buildroot@lists.busybox.net>;
 Sat,  6 May 2023 14:41:03 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id E12AB40514
 for <buildroot@buildroot.org>; Sat,  6 May 2023 14:41:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E12AB40514
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D071385DC9; Sat,  6 May 2023 14:41:02 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 6 May 2023 16:28:43 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1e735c48372a40c0c838baf4946022545ed531f1
X-Git-Newrev: a3c50b74275149f03447f311927500c4c5a0d0f5
X-Patchwork-Hint: ignore
Message-Id: <20230506144102.D071385DC9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/cups-filters: bump to version
 1.28.17
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

commit: https://git.buildroot.net/buildroot/commit/?id=a3c50b74275149f03447f311927500c4c5a0d0f5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update also the release url because the OpenPrinting https archive page
is out of sync with the current release archive on the main github
project.

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/cups-filters/cups-filters.hash | 2 +-
 package/cups-filters/cups-filters.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/cups-filters/cups-filters.hash b/package/cups-filters/cups-filters.hash
index b910cdce13..7fb3badf46 100644
--- a/package/cups-filters/cups-filters.hash
+++ b/package/cups-filters/cups-filters.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  0ca77bb820719a040ff003ecb478d0c2ceffc94e8bd1cd03ddb5a199444127ba  cups-filters-1.28.16.tar.gz
+sha256  01a2acbd6bb78f09638047e4e9ce305d7e5ef4cb9ed6949672b5d901b7321dd4  cups-filters-1.28.17.tar.gz
 sha256  38192ffdaca98b718f78b2d4abc38bb087f0bbcc9a16d212c98b903b985f900f  COPYING
diff --git a/package/cups-filters/cups-filters.mk b/package/cups-filters/cups-filters.mk
index 3250649e07..19c859e602 100644
--- a/package/cups-filters/cups-filters.mk
+++ b/package/cups-filters/cups-filters.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-CUPS_FILTERS_VERSION = 1.28.16
-CUPS_FILTERS_SITE = http://openprinting.org/download/cups-filters
+CUPS_FILTERS_VERSION = 1.28.17
+CUPS_FILTERS_SITE = https://github.com/OpenPrinting/cups-filters/releases/download/$(CUPS_FILTERS_VERSION)
 CUPS_FILTERS_LICENSE = GPL-2.0, GPL-2.0+, GPL-3.0, GPL-3.0+, LGPL-2, LGPL-2.1+, MIT, BSD-4-Clause
 CUPS_FILTERS_LICENSE_FILES = COPYING
 CUPS_FILTERS_CPE_ID_VENDOR = linuxfoundation
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
