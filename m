Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93D48C38A2D
	for <buildroot@archiver.kernel.org>; Thu, 27 Oct 2022 06:55:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 37CDA81363;
	Thu, 27 Oct 2022 06:55:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 37CDA81363
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oBdQGHilnQDm; Thu, 27 Oct 2022 06:55:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 70CD58135C;
	Thu, 27 Oct 2022 06:55:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 70CD58135C
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6E7D71BF990
 for <buildroot@lists.busybox.net>; Thu, 27 Oct 2022 06:55:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 57E8560AA7
 for <buildroot@lists.busybox.net>; Thu, 27 Oct 2022 06:55:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 57E8560AA7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1IiKwPIBhCPt for <buildroot@lists.busybox.net>;
 Thu, 27 Oct 2022 06:55:29 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8AC2960073
 for <buildroot@buildroot.org>; Thu, 27 Oct 2022 06:55:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8AC2960073
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 799CA87314; Thu, 27 Oct 2022 06:55:29 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 27 Oct 2022 08:54:08 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 777f8fbec575397e638d5775336cf645a7ad80cf
X-Git-Newrev: 9376ed7bc46ebed9f97899cface0cd9b386292ba
X-Patchwork-Hint: ignore
Message-Id: <20221027065529.799CA87314@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/faad2: bump to version 2.10.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=9376ed7bc46ebed9f97899cface0cd9b386292ba
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://github.com/knik0/faad2/releases/tag/2.10.1

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/faad2/faad2.hash | 2 +-
 package/faad2/faad2.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/faad2/faad2.hash b/package/faad2/faad2.hash
index 2eb11d73aa..3a9c36df00 100644
--- a/package/faad2/faad2.hash
+++ b/package/faad2/faad2.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  0c6d9636c96f95c7d736f097d418829ced8ec6dbd899cc6cc82b728480a84bfb  faad2-2.10.0.tar.gz
+sha256  4c16c71295ca0cbf7c3dfe98eb11d8fa8d0ac3042e41604cfd6cc11a408cf264  faad2-2.10.1.tar.gz
 sha256  d3baf3a54943cf12a994c85867a18dec84f810901b2f2878ddfd77efcc3c150f  COPYING
diff --git a/package/faad2/faad2.mk b/package/faad2/faad2.mk
index d085c814bd..eecab35af8 100644
--- a/package/faad2/faad2.mk
+++ b/package/faad2/faad2.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-FAAD2_VERSION = 2.10.0
-FAAD2_SITE = $(call github,knik0,faad2,$(subst .,_,$(FAAD2_VERSION)))
+FAAD2_VERSION = 2.10.1
+FAAD2_SITE = $(call github,knik0,faad2,$(FAAD2_VERSION))
 FAAD2_LICENSE = GPL-2.0
 FAAD2_LICENSE_FILES = COPYING
 FAAD2_CPE_ID_VENDOR = audiocoding
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
