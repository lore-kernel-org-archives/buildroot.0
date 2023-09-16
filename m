Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8CA7CD37BB
	for <buildroot@archiver.kernel.org>; Sat, 16 Sep 2023 13:08:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 22D71832EB;
	Sat, 16 Sep 2023 13:08:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 22D71832EB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uYVFxHUq15f8; Sat, 16 Sep 2023 13:08:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 50BF4832E6;
	Sat, 16 Sep 2023 13:08:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 50BF4832E6
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 59A771BF4E7
 for <buildroot@lists.busybox.net>; Sat, 16 Sep 2023 13:08:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3EF3141B34
 for <buildroot@lists.busybox.net>; Sat, 16 Sep 2023 13:08:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3EF3141B34
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XRNT5U98dQvS for <buildroot@lists.busybox.net>;
 Sat, 16 Sep 2023 13:08:18 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 72F3540325
 for <buildroot@buildroot.org>; Sat, 16 Sep 2023 13:08:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 72F3540325
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5E9A3870CD; Sat, 16 Sep 2023 13:08:18 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 16 Sep 2023 15:04:56 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d3bed8861356a8c1ac3167746b736b9f17840512
X-Git-Newrev: 37fd844c951f01c95a731844213ba1ef02b8e402
X-Patchwork-Hint: ignore
Message-Id: <20230916130818.5E9A3870CD@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/dt-utils: bump to version 2023.08.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=37fd844c951f01c95a731844213ba1ef02b8e402
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
[yann.morin.1998@free.fr:
  - _LICENSE is space-comma separated
  - multi-line assignment for license files
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/dt-utils/dt-utils.hash |  7 +++++--
 package/dt-utils/dt-utils.mk   | 11 ++++++++---
 2 files changed, 13 insertions(+), 5 deletions(-)

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
index d264e2cdc9..198b36d5fe 100644
--- a/package/dt-utils/dt-utils.mk
+++ b/package/dt-utils/dt-utils.mk
@@ -4,11 +4,16 @@
 #
 ################################################################################
 
-DT_UTILS_VERSION = 2021.03.0
+DT_UTILS_VERSION = 2023.08.0
 DT_UTILS_SOURCE = dt-utils-$(DT_UTILS_VERSION).tar.xz
 DT_UTILS_SITE = https://git.pengutronix.de/cgit/tools/dt-utils/snapshot
-DT_UTILS_LICENSE = GPL-2.0
-DT_UTILS_LICENSE_FILES = COPYING
+DT_UTILS_LICENSE = CC0-1.0, GPL-2.0, GPL-2.0+, Zlib
+DT_UTILS_LICENSE_FILES = \
+	LICENSES/CC0-1.0.txt \
+	LICENSES/GPL-2.0-only.txt \
+	LICENSES/GPL-2.0-or-later.txt \
+	LICENSES/Zlib.txt
+
 DT_UTILS_DEPENDENCIES = udev
 DT_UTILS_AUTORECONF = YES
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
