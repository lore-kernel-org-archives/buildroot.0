Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31866C433EF
	for <buildroot@archiver.kernel.org>; Wed, 27 Apr 2022 17:19:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DE79783E9F;
	Wed, 27 Apr 2022 17:19:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HW5GcbQG6F4z; Wed, 27 Apr 2022 17:19:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E83E983E7A;
	Wed, 27 Apr 2022 17:19:05 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 237A31BF420
 for <buildroot@lists.busybox.net>; Wed, 27 Apr 2022 17:18:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 11A35408E2
 for <buildroot@lists.busybox.net>; Wed, 27 Apr 2022 17:18:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3MSag2nTCHNp for <buildroot@lists.busybox.net>;
 Wed, 27 Apr 2022 17:18:24 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id EA9BF403FF
 for <buildroot@buildroot.org>; Wed, 27 Apr 2022 17:18:24 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 75E04845FA; Wed, 27 Apr 2022 17:08:06 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Wed, 27 Apr 2022 18:23:26 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b3f42bf1005e3395f03ac4db0a0583306c9467b0
X-Git-Newrev: 80bd1002787815295118355f742f79930bf2974d
X-Patchwork-Hint: ignore
Message-Id: <20220427170806.75E04845FA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ding-libs: bump to version 0.6.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=80bd1002787815295118355f742f79930bf2974d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Update site to get latest release
- Update indentation in hash file (two spaces)

https://github.com/SSSD/ding-libs/releases/tag/0.6.2

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/ding-libs/Config.in      | 2 +-
 package/ding-libs/ding-libs.hash | 8 +++++---
 package/ding-libs/ding-libs.mk   | 5 ++---
 3 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/package/ding-libs/Config.in b/package/ding-libs/Config.in
index 152dca0426..dc87a01bf2 100644
--- a/package/ding-libs/Config.in
+++ b/package/ding-libs/Config.in
@@ -13,4 +13,4 @@ config BR2_PACKAGE_DING_LIBS
 	  initialization format (INI) into a library collection data
 	  structure (libini_config).
 
-	  https://pagure.io/SSSD/ding-libs
+	  https://github.com/SSSD/ding-libs
diff --git a/package/ding-libs/ding-libs.hash b/package/ding-libs/ding-libs.hash
index 2ac5bd8eee..d5d87faccd 100644
--- a/package/ding-libs/ding-libs.hash
+++ b/package/ding-libs/ding-libs.hash
@@ -1,4 +1,6 @@
+# From https://github.com/SSSD/ding-libs/releases/download/0.6.2/ding-libs-0.6.2.tar.gz.sha256sum
+sha256  e5f07f34f5921bcb5ccccfe3751c28497879a6451cd7b395e99e24d9b5728e8d  ding-libs-0.6.2.tar.gz
+
 # Locally computed
-sha256 ad3c573641701f67d4b6bd8a5a71f0b65d45fd39fe961495ef5f5d3c57fc0963 ding-libs-ding_libs-0_6_1.tar.gz
-sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903 COPYING
-sha256 6c57f43c939054fd4b831f271a14c97a488c38f98cdda5e887c5d396e3b3bc58 COPYING.LESSER
+sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
+sha256  6c57f43c939054fd4b831f271a14c97a488c38f98cdda5e887c5d396e3b3bc58  COPYING.LESSER
diff --git a/package/ding-libs/ding-libs.mk b/package/ding-libs/ding-libs.mk
index 1e8fa59d69..a4ee7351b5 100644
--- a/package/ding-libs/ding-libs.mk
+++ b/package/ding-libs/ding-libs.mk
@@ -4,10 +4,9 @@
 #
 ################################################################################
 
-DING_LIBS_VERSION = 0.6.1
-DING_LIBS_SOURCE = ding-libs-ding_libs-$(subst .,_,$(DING_LIBS_VERSION)).tar.gz
+DING_LIBS_VERSION = 0.6.2
 DING_LIBS_SITE = \
-	https://pagure.io/SSSD/ding-libs/archive/ding_libs-$(subst .,_,$(DING_LIBS_VERSION))
+	https://github.com/SSSD/ding-libs/releases/download/$(DING_LIBS_VERSION)
 DING_LIBS_DEPENDENCIES = host-pkgconf \
 	$(TARGET_NLS_DEPENDENCIES) \
 	$(if $(BR2_PACKAGE_LIBICONV),libiconv)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
