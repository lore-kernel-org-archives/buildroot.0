Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F765C433EF
	for <buildroot@archiver.kernel.org>; Mon, 22 Nov 2021 21:37:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3589A6073C;
	Mon, 22 Nov 2021 21:37:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rIWucMlIfAFz; Mon, 22 Nov 2021 21:37:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 41B8460646;
	Mon, 22 Nov 2021 21:37:51 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B81A61BF82C
 for <buildroot@lists.busybox.net>; Mon, 22 Nov 2021 21:37:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B4813404BD
 for <buildroot@lists.busybox.net>; Mon, 22 Nov 2021 21:37:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CSUIruyIh3rW for <buildroot@lists.busybox.net>;
 Mon, 22 Nov 2021 21:37:44 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 20EE140483
 for <buildroot@buildroot.org>; Mon, 22 Nov 2021 21:37:44 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 9A37E8EEC3; Mon, 22 Nov 2021 21:33:18 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 22 Nov 2021 22:37:05 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a4bf020e8cce72ff94f0368f4eca1695d63738ea
X-Git-Newrev: e49fa6631b1259383406aafceb67b67ae722ae3c
X-Patchwork-Hint: ignore
Message-Id: <20211122213318.9A37E8EEC3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libosmium: bump version to 2.17.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=e49fa6631b1259383406aafceb67b67ae722ae3c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changelog: https://github.com/osmcode/libosmium/releases/tag/v2.17.1

Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libosmium/libosmium.hash | 2 +-
 package/libosmium/libosmium.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libosmium/libosmium.hash b/package/libosmium/libosmium.hash
index 05d898bc7f..ce3c7b6020 100644
--- a/package/libosmium/libosmium.hash
+++ b/package/libosmium/libosmium.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  4a7672d7caf4da3bc68619912b298462370c423c697871a0be6273c6686e10d6  libosmium-2.17.0.tar.gz
+sha256  6faa7952aa1210dcd9ae4ef83e7653a4f8eb880e6a4e5b37f87a5d4835f6327b  libosmium-2.17.1.tar.gz
 sha256  c9bff75738922193e67fa726fa225535870d2aa1059f91452c411736284ad566  LICENSE
diff --git a/package/libosmium/libosmium.mk b/package/libosmium/libosmium.mk
index 3beca73c4a..a969f2c4dc 100644
--- a/package/libosmium/libosmium.mk
+++ b/package/libosmium/libosmium.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBOSMIUM_VERSION = 2.17.0
+LIBOSMIUM_VERSION = 2.17.1
 LIBOSMIUM_SITE = $(call github,osmcode,libosmium,v$(LIBOSMIUM_VERSION))
 LIBOSMIUM_LICENSE = BSL-1.0
 LIBOSMIUM_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
