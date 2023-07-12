Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1DB4EB64DA
	for <buildroot@archiver.kernel.org>; Wed, 12 Jul 2023 19:49:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9FBDB408F6;
	Wed, 12 Jul 2023 19:49:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9FBDB408F6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Vl8vb7ZkMXEH; Wed, 12 Jul 2023 19:49:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9544D408A1;
	Wed, 12 Jul 2023 19:49:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9544D408A1
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C49571BF3BD
 for <buildroot@lists.busybox.net>; Wed, 12 Jul 2023 19:49:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9CA8E40347
 for <buildroot@lists.busybox.net>; Wed, 12 Jul 2023 19:49:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9CA8E40347
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GauiiUYylAz8 for <buildroot@lists.busybox.net>;
 Wed, 12 Jul 2023 19:49:45 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id DDAF94015A
 for <buildroot@buildroot.org>; Wed, 12 Jul 2023 19:49:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DDAF94015A
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CC0C086EFD; Wed, 12 Jul 2023 19:49:45 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 12 Jul 2023 21:49:00 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: fb4cf1cbe8f83df4811b71fb9c5ff567b5c68924
X-Git-Newrev: a3bb5d03060e2a818d8ee7c32490c09a38d41e29
X-Patchwork-Hint: ignore
Message-Id: <20230712194945.CC0C086EFD@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/zxing-cpp: bump to version 2.1.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=a3bb5d03060e2a818d8ee7c32490c09a38d41e29
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/zxing-cpp/zxing-cpp.hash | 2 +-
 package/zxing-cpp/zxing-cpp.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/zxing-cpp/zxing-cpp.hash b/package/zxing-cpp/zxing-cpp.hash
index 4018e95fde..6c6917ed86 100644
--- a/package/zxing-cpp/zxing-cpp.hash
+++ b/package/zxing-cpp/zxing-cpp.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  12b76b7005c30d34265fc20356d340da179b0b4d43d2c1b35bcca86776069f76  zxing-cpp-2.0.0.tar.gz
+sha256  6d54e403592ec7a143791c6526c1baafddf4c0897bb49b1af72b70a0f0c4a3fe  zxing-cpp-2.1.0.tar.gz
 
 # License files
 sha256  c6596eb7be8581c18be736c846fb9173b69eccf6ef94c5135893ec56bd92ba08  LICENSE
diff --git a/package/zxing-cpp/zxing-cpp.mk b/package/zxing-cpp/zxing-cpp.mk
index b11814d114..8256b1a254 100644
--- a/package/zxing-cpp/zxing-cpp.mk
+++ b/package/zxing-cpp/zxing-cpp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ZXING_CPP_VERSION = 2.0.0
+ZXING_CPP_VERSION = 2.1.0
 ZXING_CPP_SITE = $(call github,zxing-cpp,zxing-cpp,v$(ZXING_CPP_VERSION))
 ZXING_CPP_LICENSE = Apache-2.0
 ZXING_CPP_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
