Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D36FC433EF
	for <buildroot@archiver.kernel.org>; Mon, 27 Dec 2021 20:00:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1EBA4813EE;
	Mon, 27 Dec 2021 20:00:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id t7K4Fx4fspFZ; Mon, 27 Dec 2021 20:00:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 828DF81765;
	Mon, 27 Dec 2021 20:00:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 495651BF8B4
 for <buildroot@lists.busybox.net>; Mon, 27 Dec 2021 20:00:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7A48C813CF
 for <buildroot@lists.busybox.net>; Mon, 27 Dec 2021 20:00:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OSoYyIGVvYGC for <buildroot@lists.busybox.net>;
 Mon, 27 Dec 2021 20:00:18 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id D0B53813BD
 for <buildroot@buildroot.org>; Mon, 27 Dec 2021 20:00:18 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 175ED82BA8; Mon, 27 Dec 2021 19:54:33 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Mon, 27 Dec 2021 20:59:19 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: cc28c7aa6df7798ce5ca79d6d1c7c2eb115ba220
X-Git-Newrev: 288f2faae38a12342f8df0d372ff3ff371b18dde
X-Patchwork-Hint: ignore
Message-Id: <20211227195433.175ED82BA8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/enchant: bump to 2.3.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=288f2faae38a12342f8df0d372ff3ff371b18dde
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/enchant/enchant.hash | 2 +-
 package/enchant/enchant.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/enchant/enchant.hash b/package/enchant/enchant.hash
index 9cee2d78e1..9df5316aac 100644
--- a/package/enchant/enchant.hash
+++ b/package/enchant/enchant.hash
@@ -1,3 +1,3 @@
 # locally computed
-sha256  3b0f2215578115f28e2a6aa549b35128600394304bd79d6f28b0d3b3d6f46c03  enchant-2.2.15.tar.gz
+sha256  ce9ba47fd4d34031bd69445598a698a6611602b2b0e91d705e91a6f5099ead6e  enchant-2.3.2.tar.gz
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LIB
diff --git a/package/enchant/enchant.mk b/package/enchant/enchant.mk
index 3135550f73..e00fcb25e1 100644
--- a/package/enchant/enchant.mk
+++ b/package/enchant/enchant.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ENCHANT_VERSION = 2.2.15
+ENCHANT_VERSION = 2.3.2
 ENCHANT_SITE = \
 	https://github.com/AbiWord/enchant/releases/download/v$(ENCHANT_VERSION)
 ENCHANT_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
