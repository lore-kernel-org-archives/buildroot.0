Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 738F8C001DC
	for <buildroot@archiver.kernel.org>; Fri, 21 Jul 2023 21:28:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2AAC24013C;
	Fri, 21 Jul 2023 21:28:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2AAC24013C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eYVpEQuPbJSc; Fri, 21 Jul 2023 21:28:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5906940482;
	Fri, 21 Jul 2023 21:28:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5906940482
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E3BF21BF983
 for <buildroot@lists.busybox.net>; Fri, 21 Jul 2023 21:28:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BD9A283367
 for <buildroot@lists.busybox.net>; Fri, 21 Jul 2023 21:28:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BD9A283367
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iWjpfET_ij-t for <buildroot@lists.busybox.net>;
 Fri, 21 Jul 2023 21:28:36 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id D34A883330
 for <buildroot@buildroot.org>; Fri, 21 Jul 2023 21:28:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D34A883330
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B96B487541; Fri, 21 Jul 2023 21:28:36 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 21 Jul 2023 23:22:28 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 68d0528ce08ad5a7c779515e04b64e76532a92e8
X-Git-Newrev: c9f59f49727058b26c33665d21d8e51a4fe769aa
X-Patchwork-Hint: ignore
Message-Id: <20230721212836.B96B487541@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/wpebackend-fdo: bump version to
 1.14.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=c9f59f49727058b26c33665d21d8e51a4fe769aa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Removed md5 hash.

Release notes:
https://lists.webkit.org/pipermail/webkit-wpe/2023-March/000590.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
