Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44CE6C433F5
	for <buildroot@archiver.kernel.org>; Sun,  9 Jan 2022 15:00:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E7A5440302;
	Sun,  9 Jan 2022 15:00:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ELLR592nNE-5; Sun,  9 Jan 2022 15:00:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 42B43402C1;
	Sun,  9 Jan 2022 15:00:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 47AB51BF4D6
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 15:00:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 36242607B0
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 15:00:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QldwMrsj7VXA for <buildroot@lists.busybox.net>;
 Sun,  9 Jan 2022 15:00:05 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 82899605E0
 for <buildroot@buildroot.org>; Sun,  9 Jan 2022 15:00:05 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id C1C4E82AA2; Sun,  9 Jan 2022 14:53:50 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 9 Jan 2022 15:57:30 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 99dabffc096c81bcd01198edc81b7ce262091ffb
X-Git-Newrev: 1ed3288e44e12817d1ea8bd56956f1af0a209798
X-Patchwork-Hint: ignore
Message-Id: <20220109145350.C1C4E82AA2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/xapian: bump to version 1.4.19
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

commit: https://git.buildroot.net/buildroot/commit/?id=1ed3288e44e12817d1ea8bd56956f1af0a209798
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/xapian/xapian.hash | 4 ++--
 package/xapian/xapian.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/xapian/xapian.hash b/package/xapian/xapian.hash
index 192032e6db..e570f7e2f2 100644
--- a/package/xapian/xapian.hash
+++ b/package/xapian/xapian.hash
@@ -1,5 +1,5 @@
-# From https://lists.xapian.org/pipermail/xapian-discuss/2021-January/009856.html
-sha256  196ddbb4ad10450100f0991a599e4ed944cbad92e4a6fe813be6dce160244b77  xapian-core-1.4.18.tar.xz
+# From https://lists.xapian.org/pipermail/xapian-discuss/2022-January/009934.html
+sha256  1fca48fca6cc3526cc4ba93dd194fe9c1326857b78edcfb37e68d086d714a9c3  xapian-core-1.4.19.tar.xz
 
 # locally computed
 sha256  c38aee9e3c8c4d5d594ff548a1be05453023016d6286931f6512db215ec1fd42  COPYING
diff --git a/package/xapian/xapian.mk b/package/xapian/xapian.mk
index 4f40babcf9..464e5478df 100644
--- a/package/xapian/xapian.mk
+++ b/package/xapian/xapian.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XAPIAN_VERSION = 1.4.18
+XAPIAN_VERSION = 1.4.19
 XAPIAN_SOURCE = xapian-core-$(XAPIAN_VERSION).tar.xz
 XAPIAN_SITE = https://oligarchy.co.uk/xapian/$(XAPIAN_VERSION)
 XAPIAN_LICENSE = GPL-2.0+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
