Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBCCEC433EF
	for <buildroot@archiver.kernel.org>; Thu, 30 Dec 2021 14:08:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9DF2381831;
	Thu, 30 Dec 2021 14:08:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TUutY8uhJZ5o; Thu, 30 Dec 2021 14:08:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id EED77813D2;
	Thu, 30 Dec 2021 14:08:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 321A21BF2BC
 for <buildroot@lists.busybox.net>; Thu, 30 Dec 2021 14:07:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6247A4036F
 for <buildroot@lists.busybox.net>; Thu, 30 Dec 2021 14:07:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id O_2cgbGy4JUA for <buildroot@lists.busybox.net>;
 Thu, 30 Dec 2021 14:07:16 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 98BB340530
 for <buildroot@buildroot.org>; Thu, 30 Dec 2021 14:07:16 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id A433982DB5; Thu, 30 Dec 2021 14:01:24 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Thu, 30 Dec 2021 15:06:03 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2d7a3e48c574c05346b66f79cdb75ecdfa7f074e
X-Git-Newrev: 7f02cdc1917abd99016fbc4d1a26ee825d117321
X-Patchwork-Hint: ignore
Message-Id: <20211230140124.A433982DB5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/enlightenment: bump to version
 0.25.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=7f02cdc1917abd99016fbc4d1a26ee825d117321
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update license file hash due to a tree-wide trailing whitespace removal [1].

Disable optional dependency on libexif [2].

See:
https://www.enlightenment.org/news/2021-12-26-enlightenment-0.25.0

[1] https://git.enlightenment.org/core/enlightenment.git/commit/?id=01fd3da2a33c411b41eea3b175c496c14777b358
[2] https://git.enlightenment.org/core/enlightenment.git/commit/?id=10ac9fb3277e599d1ac4d54c0d59faebc064b186

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/enlightenment/enlightenment.hash | 8 ++++----
 package/enlightenment/enlightenment.mk   | 3 ++-
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/package/enlightenment/enlightenment.hash b/package/enlightenment/enlightenment.hash
index 7f0f3f3e7b..dd4c4d78c0 100644
--- a/package/enlightenment/enlightenment.hash
+++ b/package/enlightenment/enlightenment.hash
@@ -1,4 +1,4 @@
-# From https://www.enlightenment.org/news/e24.2
-sha256  be18e2f18d6c0b058f633e769863d3cbc4c07b629058ae670dec74cd7906dff1  enlightenment-0.24.2.tar.xz
-sha256  17dda7902d3e1a743f91cf2545f474be93f612768a9e9022593d788ecc83935a  COPYING
-sha256  f4ba47ef8f4ff588202e721ab10f0208a3fa678147e7f928e6b2820f2e646e13  src/modules/wl_weekeyboard/themes/default/fonts/LICENSE.txt
+# From https://www.enlightenment.org/news/2021-12-26-enlightenment-0.25.0
+sha256  7d6e72ceed5aca135b7a49c2a1c1eb9d8fde1318613517401d0418e0e5f6df06  enlightenment-0.25.0.tar.xz
+sha256  8d2fbc393e967cd6f5b8559d1744881a6a1ceb3ec6e1c2368c3916809ffccb8d  COPYING
+sha256  cdc77ee1732455b203610f923fe4196046b3f7509038c48dc0b0c7e3492c23f3  src/modules/wl_weekeyboard/themes/default/fonts/LICENSE.txt
diff --git a/package/enlightenment/enlightenment.mk b/package/enlightenment/enlightenment.mk
index 969b391cdc..640d5a62bb 100644
--- a/package/enlightenment/enlightenment.mk
+++ b/package/enlightenment/enlightenment.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ENLIGHTENMENT_VERSION = 0.24.2
+ENLIGHTENMENT_VERSION = 0.25.0
 ENLIGHTENMENT_SOURCE = enlightenment-$(ENLIGHTENMENT_VERSION).tar.xz
 ENLIGHTENMENT_SITE = http://download.enlightenment.org/rel/apps/enlightenment
 ENLIGHTENMENT_LICENSE = BSD-2-Clause, OFL-1.1 (font)
@@ -22,6 +22,7 @@ ENLIGHTENMENT_CONF_OPTS = \
 	-Dedje-cc=$(HOST_DIR)/bin/edje_cc \
 	-Deet=$(HOST_DIR)/bin/eet \
 	-Deldbus-codegen=$(HOST_DIR)/bin/eldbus-codegen \
+	-Dlibexif=false \
 	-Dpam=false \
 	-Dpolkit=false
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
