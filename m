Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81A46E82CC6
	for <buildroot@archiver.kernel.org>; Wed, 27 Sep 2023 19:05:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2CA50428E6;
	Wed, 27 Sep 2023 19:05:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2CA50428E6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rfYK-SVrUFrP; Wed, 27 Sep 2023 19:05:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E0F1742C4F;
	Wed, 27 Sep 2023 19:05:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E0F1742C4F
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D545F1BF32A
 for <buildroot@lists.busybox.net>; Wed, 27 Sep 2023 19:05:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BAA79428CC
 for <buildroot@lists.busybox.net>; Wed, 27 Sep 2023 19:05:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BAA79428CC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id e-V9cddIsmMC for <buildroot@lists.busybox.net>;
 Wed, 27 Sep 2023 19:05:33 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id B6E27428CA
 for <buildroot@buildroot.org>; Wed, 27 Sep 2023 19:05:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B6E27428CA
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A685D82641; Wed, 27 Sep 2023 19:05:33 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 27 Sep 2023 21:03:50 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: cf155e0d0480f96746cff0ac84025580d375c237
X-Git-Newrev: 757c81f12690449e290078d9a2b8f8191e057616
X-Patchwork-Hint: ignore
Message-Id: <20230927190533.A685D82641@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/openresolv: bump to version 3.13.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=757c81f12690449e290078d9a2b8f8191e057616
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://github.com/NetworkConfiguration/openresolv/compare/v3.12.0...v3.13.2

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/openresolv/openresolv.hash | 2 +-
 package/openresolv/openresolv.mk   | 5 +++--
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/openresolv/openresolv.hash b/package/openresolv/openresolv.hash
index 7a5fb0e140..c32b856de9 100644
--- a/package/openresolv/openresolv.hash
+++ b/package/openresolv/openresolv.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  96b573e26d145f208d3758c2cd6fbf824b01005fc4cb7cedbdae29b3a3c8cb02  openresolv-3.12.0.tar.gz
+sha256  36b5bcbe257a940c884f0d74321a47407baabab9e265e38859851c8311f6f0b0  openresolv-3.13.2.tar.xz
 sha256  384740bf5e19e7628d20f4dcc22925062fdc6020e9a6f074e567d4d797be57a0  LICENSE
diff --git a/package/openresolv/openresolv.mk b/package/openresolv/openresolv.mk
index 3857ab833d..176f6dab3a 100644
--- a/package/openresolv/openresolv.mk
+++ b/package/openresolv/openresolv.mk
@@ -4,8 +4,9 @@
 #
 ################################################################################
 
-OPENRESOLV_VERSION = 3.12.0
-OPENRESOLV_SITE = $(call github,rsmarples,openresolv,openresolv-$(OPENRESOLV_VERSION))
+OPENRESOLV_VERSION = 3.13.2
+OPENRESOLV_SITE = https://github.com/rsmarples/openresolv/releases/download/v$(OPENRESOLV_VERSION)
+OPENRESOLV_SOURCE = openresolv-$(OPENRESOLV_VERSION).tar.xz
 OPENRESOLV_LICENSE = BSD-2-Clause
 OPENRESOLV_LICENSE_FILES = LICENSE
 OPENRESOLV_CPE_ID_VENDOR = openresolv_project
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
