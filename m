Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AF1DC54EE9
	for <buildroot@archiver.kernel.org>; Sat, 17 Sep 2022 09:53:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 204FC61036;
	Sat, 17 Sep 2022 09:53:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 204FC61036
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iLIv1qKFp9gH; Sat, 17 Sep 2022 09:53:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3FD9D60AF8;
	Sat, 17 Sep 2022 09:53:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3FD9D60AF8
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 887371BF82D
 for <buildroot@lists.busybox.net>; Sat, 17 Sep 2022 09:53:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 71643401CC
 for <buildroot@lists.busybox.net>; Sat, 17 Sep 2022 09:53:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 71643401CC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YwI_sP7q5jlj for <buildroot@lists.busybox.net>;
 Sat, 17 Sep 2022 09:53:44 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 74B8F40121
 for <buildroot@buildroot.org>; Sat, 17 Sep 2022 09:53:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 74B8F40121
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 6095784145; Sat, 17 Sep 2022 09:53:44 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sat, 17 Sep 2022 11:36:05 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 308678e528a382ea4c27c33baf92b25871d47415
X-Git-Newrev: 2ee1bd7bb2e8d01f4ddca3fb1127ec729be1c9bf
X-Patchwork-Hint: ignore
Message-Id: <20220917095344.6095784145@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libqb: bump to version 2.0.6
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

commit: https://git.buildroot.net/buildroot/commit/?id=2ee1bd7bb2e8d01f4ddca3fb1127ec729be1c9bf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://github.com/ClusterLabs/libqb/releases/tag/v2.0.6
https://github.com/ClusterLabs/libqb/releases/tag/v2.0.5
https://github.com/ClusterLabs/libqb/releases/tag/v2.0.4

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libqb/libqb.hash | 4 ++--
 package/libqb/libqb.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libqb/libqb.hash b/package/libqb/libqb.hash
index b2c216f24c..de247c2660 100644
--- a/package/libqb/libqb.hash
+++ b/package/libqb/libqb.hash
@@ -1,5 +1,5 @@
-# From https://github.com/ClusterLabs/libqb/releases/download/v2.0.3/libqb-2.0.3.sha256
-sha256  a74582bc886fa625f5238374c7c8ca98672a2519c8196b91276be55886d84e9c  libqb-2.0.3.tar.xz
+# From https://github.com/ClusterLabs/libqb/releases/download/v2.0.6/libqb-2.0.6.sha256
+sha256  f1e744208e8f69934804c14e05d9707668f99d4867de9cccf2f7a6bf4d48331c  libqb-2.0.6.tar.xz
 
 # Locally calculated
 sha256  00a89b0d18aacd4114decf79122db87bf35bddaf2bc50e383c9c9f4c263390b2  COPYING
diff --git a/package/libqb/libqb.mk b/package/libqb/libqb.mk
index fb132365f1..0f409fd646 100644
--- a/package/libqb/libqb.mk
+++ b/package/libqb/libqb.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBQB_VERSION = 2.0.3
+LIBQB_VERSION = 2.0.6
 LIBQB_SOURCE = libqb-$(LIBQB_VERSION).tar.xz
 LIBQB_SITE = \
 	https://github.com/ClusterLabs/libqb/releases/download/v$(LIBQB_VERSION)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
