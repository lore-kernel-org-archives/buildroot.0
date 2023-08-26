Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6894C83F11
	for <buildroot@archiver.kernel.org>; Sat, 26 Aug 2023 19:08:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 44FF340960;
	Sat, 26 Aug 2023 19:08:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 44FF340960
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fQt3z6LRj9TK; Sat, 26 Aug 2023 19:08:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 64496405FA;
	Sat, 26 Aug 2023 19:08:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 64496405FA
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 11FC61BF82C
 for <buildroot@lists.busybox.net>; Sat, 26 Aug 2023 19:08:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DD626417A2
 for <buildroot@lists.busybox.net>; Sat, 26 Aug 2023 19:08:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DD626417A2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mcz-2k0_4tle for <buildroot@lists.busybox.net>;
 Sat, 26 Aug 2023 19:08:38 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9404441769
 for <buildroot@buildroot.org>; Sat, 26 Aug 2023 19:08:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9404441769
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 81F5E86421; Sat, 26 Aug 2023 19:08:38 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 26 Aug 2023 21:05:04 +0200
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: 9d7896b7406ca0c5973c15cf378ca98b35311374
X-Git-Newrev: 35ffaa834987b3aa4881e68ab0464e0406bf837f
X-Patchwork-Hint: ignore
Message-Id: <20230826190838.81F5E86421@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/wpebackend-fdo:
 bump version to 1.14.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=35ffaa834987b3aa4881e68ab0464e0406bf837f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

Removed md5 hash.

Release notes:
https://lists.webkit.org/pipermail/webkit-wpe/2023-March/000590.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit c9f59f49727058b26c33665d21d8e51a4fe769aa)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/wpebackend-fdo/wpebackend-fdo.hash | 7 +++----
 package/wpebackend-fdo/wpebackend-fdo.mk   | 2 +-
 2 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/package/wpebackend-fdo/wpebackend-fdo.hash b/package/wpebackend-fdo/wpebackend-fdo.hash
index d1a344a664..26ba121727 100644
--- a/package/wpebackend-fdo/wpebackend-fdo.hash
+++ b/package/wpebackend-fdo/wpebackend-fdo.hash
@@ -1,7 +1,6 @@
-# From https://wpewebkit.org/releases/wpebackend-fdo-1.14.1.tar.xz.sums
-md5  2b49218cdd16075b028bbaf5a4f57890  wpebackend-fdo-1.14.1.tar.xz
-sha1  a68db2480d29d53d7fa24c69888bacbab6efea11  wpebackend-fdo-1.14.1.tar.xz
-sha256  01938dd93c62b3a47b18dd13c70d50490a8b8a6caec23c8550a3dbdbcc6bbb50  wpebackend-fdo-1.14.1.tar.xz
+# From https://wpewebkit.org/releases/wpebackend-fdo-1.14.2.tar.xz.sums
+sha1  f453f8d77e93f4ac6ac81c1874d4d6bdcb45c253  wpebackend-fdo-1.14.2.tar.xz
+sha256  93c9766ae9864eeaeaee2b0a74f22cbca08df42c1a1bdb55b086f2528e380d38  wpebackend-fdo-1.14.2.tar.xz
 
 # Hashes for license files:
 sha256  c9f6803371047fad3e72200ec6cd226329a5ee08ac61104c8211c2761fb46825  COPYING
diff --git a/package/wpebackend-fdo/wpebackend-fdo.mk b/package/wpebackend-fdo/wpebackend-fdo.mk
index c1e4e05796..7ef347b622 100644
--- a/package/wpebackend-fdo/wpebackend-fdo.mk
+++ b/package/wpebackend-fdo/wpebackend-fdo.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WPEBACKEND_FDO_VERSION = 1.14.1
+WPEBACKEND_FDO_VERSION = 1.14.2
 WPEBACKEND_FDO_SITE = https://wpewebkit.org/releases
 WPEBACKEND_FDO_SOURCE = wpebackend-fdo-$(WPEBACKEND_FDO_VERSION).tar.xz
 WPEBACKEND_FDO_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
