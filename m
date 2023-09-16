Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CCA0CD37B1
	for <buildroot@archiver.kernel.org>; Sat, 16 Sep 2023 04:45:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BA21D405CA;
	Sat, 16 Sep 2023 04:45:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BA21D405CA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fMVTdYRzRAWE; Sat, 16 Sep 2023 04:45:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 004044057B;
	Sat, 16 Sep 2023 04:45:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 004044057B
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 87D0A1BF352
 for <buildroot@lists.busybox.net>; Sat, 16 Sep 2023 04:45:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6D1CC421D7
 for <buildroot@lists.busybox.net>; Sat, 16 Sep 2023 04:45:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6D1CC421D7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eosw6glt4zIS for <buildroot@lists.busybox.net>;
 Sat, 16 Sep 2023 04:45:00 +0000 (UTC)
X-Greylist: delayed 405 seconds by postgrey-1.37 at util1.osuosl.org;
 Sat, 16 Sep 2023 04:44:59 UTC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E053F421CC
Received: from mail.grinn-global.com (mail.grinn-global.com [77.55.128.204])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E053F421CC
 for <buildroot@buildroot.org>; Sat, 16 Sep 2023 04:44:59 +0000 (UTC)
X-Virus-Scanned: by amavisd-new using ClamAV (12)
Received: from zm.lan (pub-46.182.29.194.multiplay.pl [194.29.182.46])
 by server220076.nazwa.pl (Postfix) with ESMTP id B97E31BBD82;
 Sat, 16 Sep 2023 06:38:10 +0200 (CEST)
From: Marcin Niestroj <m.niestroj@grinn-global.com>
To: buildroot@buildroot.org
Date: Sat, 16 Sep 2023 06:37:57 +0200
Message-ID: <20230916043757.138677-1-m.niestroj@grinn-global.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/dt-utils: bump to version 2023.08.0
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
Cc: Marcin Niestroj <m.niestroj@grinn-global.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

COPYING is now a symlink pointing to LICENSES/GPL-2.0-only.txt. More
license files were added and all source code files were updated with
proper license being used. See [1-4].

List all licenses used in runtime by produced binary (and omit
GPL-3.0-or-later for check-news.sh script).

[1] https://git.pengutronix.de/cgit/tools/dt-utils/commit/?id=893c6c9f628fed614537fd548b7a851d2d9ee868
[2] https://git.pengutronix.de/cgit/tools/dt-utils/commit/?id=c1880166d1e34efcf606297c8189b228aa78f78a
[3] https://git.pengutronix.de/cgit/tools/dt-utils/commit/?id=fa56be74c3bd991a40384e9be4a485f3febea19e
[4] https://git.pengutronix.de/cgit/tools/dt-utils/commit/?id=6c7ccb22ea30ee28d42679a7ba66c0199f135db1

Signed-off-by: Marcin Niestroj <m.niestroj@grinn-global.com>
---
 package/dt-utils/dt-utils.hash | 7 +++++--
 package/dt-utils/dt-utils.mk   | 7 ++++---
 2 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/package/dt-utils/dt-utils.hash b/package/dt-utils/dt-utils.hash
index 9fca594db5..c57145b835 100644
--- a/package/dt-utils/dt-utils.hash
+++ b/package/dt-utils/dt-utils.hash
@@ -1,3 +1,6 @@
 # Locally computed
-sha256  63cf47c70911bb3605bafac38a5a7e19eb753ac1c90de2abceaf2fdefd71be6d  dt-utils-2021.03.0.tar.xz
-sha256  a45932c79317d15116eadbf1c9c6fc59117ec3c4621db3a876066defa723963b  COPYING
+sha256  a6988b889418737324ed3db3785d3a9692e802c1dff4a2323c962008b7b646b1  dt-utils-2023.08.0.tar.xz
+sha256  a2010f343487d3f7618affe54f789f5487602331c0a8d03f49e9a7c547cf0499  LICENSES/CC0-1.0.txt
+sha256  2c9d733cadb50e33cc83f05f1fe7cc4b6c5ff7260fd9eea1b839151c7fa64742  LICENSES/GPL-2.0-only.txt
+sha256  d6e37cb7eff6ef15ae3c4082cf40eae80a94cd59b636991d1149d4a5c9dc3537  LICENSES/GPL-2.0-or-later.txt
+sha256  aa8c4e84680f7653d9a6f9f92b692239e5aa839a48dcdbce6108a3bbde451e30  LICENSES/Zlib.txt
diff --git a/package/dt-utils/dt-utils.mk b/package/dt-utils/dt-utils.mk
index d264e2cdc9..05c2c530e7 100644
--- a/package/dt-utils/dt-utils.mk
+++ b/package/dt-utils/dt-utils.mk
@@ -4,11 +4,12 @@
 #
 ################################################################################
 
-DT_UTILS_VERSION = 2021.03.0
+DT_UTILS_VERSION = 2023.08.0
 DT_UTILS_SOURCE = dt-utils-$(DT_UTILS_VERSION).tar.xz
 DT_UTILS_SITE = https://git.pengutronix.de/cgit/tools/dt-utils/snapshot
-DT_UTILS_LICENSE = GPL-2.0
-DT_UTILS_LICENSE_FILES = COPYING
+DT_UTILS_LICENSE = CC0-1.0 GPL-2.0 GPL-2.0+ Zlib
+DT_UTILS_LICENSE_FILES = LICENSES/CC0-1.0.txt LICENSES/GPL-2.0-only.txt \
+	LICENSES/GPL-2.0-or-later.txt LICENSES/Zlib.txt
 DT_UTILS_DEPENDENCIES = udev
 DT_UTILS_AUTORECONF = YES
 
-- 
2.42.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
