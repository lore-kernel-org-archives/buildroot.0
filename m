Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35003C433EF
	for <buildroot@archiver.kernel.org>; Tue, 10 May 2022 19:38:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D37AA417AA;
	Tue, 10 May 2022 19:38:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mJS2mPZ4g-QV; Tue, 10 May 2022 19:38:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B626F4179A;
	Tue, 10 May 2022 19:38:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3E0EF1BF9AD
 for <buildroot@lists.busybox.net>; Tue, 10 May 2022 19:38:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2D590417A3
 for <buildroot@lists.busybox.net>; Tue, 10 May 2022 19:38:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id x9Au9mINa591 for <buildroot@lists.busybox.net>;
 Tue, 10 May 2022 19:38:25 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7ED2241794
 for <buildroot@buildroot.org>; Tue, 10 May 2022 19:38:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 4E4AF85CF8; Tue, 10 May 2022 19:27:37 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 10 May 2022 21:37:46 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 76da59d6c541c2fcac73932615d775130b6c0588
X-Git-Newrev: 787b580af42bcf09aa45162abec23b1e35069ed8
X-Patchwork-Hint: ignore
Message-Id: <20220510192737.4E4AF85CF8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/dropwatch: bump to version 1.5.4
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

commit: https://git.buildroot.net/buildroot/commit/?id=787b580af42bcf09aa45162abec23b1e35069ed8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://github.com/nhorman/dropwatch/releases/tag/v1.5.4

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/dropwatch/dropwatch.hash | 2 +-
 package/dropwatch/dropwatch.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/dropwatch/dropwatch.hash b/package/dropwatch/dropwatch.hash
index 867a7f12fb..24fc03097b 100644
--- a/package/dropwatch/dropwatch.hash
+++ b/package/dropwatch/dropwatch.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  b748b66a816c1f94531446c0451da5461a4a31b0949244bb867d741c6ac0148b  dropwatch-1.5.3.tar.gz
+sha256  8c43d0c15d0cb9ce179fa1fb0610611723689a6f551b23c70a7ddc1cf068e8d2  dropwatch-1.5.4.tar.gz
 sha256  e6d6a009505e345fe949e1310334fcb0747f28dae2856759de102ab66b722cb4  COPYING
diff --git a/package/dropwatch/dropwatch.mk b/package/dropwatch/dropwatch.mk
index 36608ad8b3..33775f6c02 100644
--- a/package/dropwatch/dropwatch.mk
+++ b/package/dropwatch/dropwatch.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DROPWATCH_VERSION = 1.5.3
+DROPWATCH_VERSION = 1.5.4
 DROPWATCH_SITE = $(call github,nhorman,dropwatch,v$(DROPWATCH_VERSION))
 DROPWATCH_DEPENDENCIES = libnl readline libpcap host-pkgconf $(TARGET_NLS_DEPENDENCIES)
 DROPWATCH_LICENSE = GPL-2.0+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
