Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D85EAC4332F
	for <buildroot@archiver.kernel.org>; Sat, 15 Oct 2022 15:28:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4CCBF414CD;
	Sat, 15 Oct 2022 15:28:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4CCBF414CD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PSy9PzJzjErz; Sat, 15 Oct 2022 15:28:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 27A2D41529;
	Sat, 15 Oct 2022 15:28:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 27A2D41529
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 98B531BF963
 for <buildroot@lists.busybox.net>; Sat, 15 Oct 2022 15:27:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 81D414012B
 for <buildroot@lists.busybox.net>; Sat, 15 Oct 2022 15:27:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 81D414012B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cDJdTRxnGGUJ for <buildroot@lists.busybox.net>;
 Sat, 15 Oct 2022 15:27:40 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id BF86B4061F
 for <buildroot@buildroot.org>; Sat, 15 Oct 2022 15:27:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BF86B4061F
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id ADA3486D94; Sat, 15 Oct 2022 15:27:40 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 15 Oct 2022 17:24:30 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: df640c3461b3dfc517ea56a08ad848b7808210e3
X-Git-Newrev: 7abdabe0efc2a8797dbc6f6db011f6977e89bfe1
X-Patchwork-Hint: ignore
Message-Id: <20221015152740.ADA3486D94@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/lrzip: add CPE
 variables
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

commit: https://git.buildroot.net/buildroot/commit/?id=7abdabe0efc2a8797dbc6f6db011f6977e89bfe1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

cpe:2.3:a:long_range_zip_project:long_range_zip is a valid CPE
identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Along_range_zip_project%3Along_range_zip

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit d09ff6fd1f16e017c0ff55e4fe76d5b0b00ba400)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/lrzip/lrzip.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/lrzip/lrzip.mk b/package/lrzip/lrzip.mk
index 409d9912d8..27d9fde204 100644
--- a/package/lrzip/lrzip.mk
+++ b/package/lrzip/lrzip.mk
@@ -9,6 +9,8 @@ LRZIP_SITE = $(call github,ckolivas,lrzip,v$(LRZIP_VERSION))
 LRZIP_AUTORECONF = YES
 LRZIP_LICENSE = GPL-2.0+
 LRZIP_LICENSE_FILES = COPYING
+LRZIP_CPE_ID_VENDOR = long_range_zip_project
+LRZIP_CPE_ID_PRODUCT = long_range_zip
 LRZIP_DEPENDENCIES = zlib lz4 lzo bzip2
 
 ifeq ($(BR2_i386)$(BR2_x86_64),y)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
