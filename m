Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8369EC001DD
	for <buildroot@archiver.kernel.org>; Mon,  3 Jul 2023 18:45:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 30FCA60A9B;
	Mon,  3 Jul 2023 18:45:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 30FCA60A9B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cE_Oy8rvmFZt; Mon,  3 Jul 2023 18:45:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5D79460BCC;
	Mon,  3 Jul 2023 18:45:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5D79460BCC
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 579281BF955
 for <buildroot@lists.busybox.net>; Mon,  3 Jul 2023 18:45:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3D19940914
 for <buildroot@lists.busybox.net>; Mon,  3 Jul 2023 18:45:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3D19940914
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id umypIoZ3sbxP for <buildroot@lists.busybox.net>;
 Mon,  3 Jul 2023 18:45:21 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1B3DB40912
 for <buildroot@buildroot.org>; Mon,  3 Jul 2023 18:45:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1B3DB40912
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 06E8D8643B; Mon,  3 Jul 2023 18:45:21 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 3 Jul 2023 20:43:12 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3b2913552ee4e304d4d86e577b237652a8f0a99f
X-Git-Newrev: 28fe2d493b3f08153b866a3d6656fb7c487dae38
X-Patchwork-Hint: ignore
Message-Id: <20230703184521.06E8D8643B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libks: bump version to 1.8.3
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

commit: https://git.buildroot.net/buildroot/commit/?id=28fe2d493b3f08153b866a3d6656fb7c487dae38
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libks/libks.hash | 2 +-
 package/libks/libks.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libks/libks.hash b/package/libks/libks.hash
index dba442bdd2..998811bc90 100644
--- a/package/libks/libks.hash
+++ b/package/libks/libks.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  131d7896c81a7f3c9bf06860e4f564ca558d4be1614568fec688b3eb66d38107  libks-1.8.2.tar.gz
+sha256  c677c36a0d8ceca2e53e07d1de66b87045ac2784df458d012557e2432692528b  libks-1.8.3.tar.gz
 sha256  1d1327f37b58a4c9ce520fcf9dd3f348c7c639229ee7aed41c47164a8f7836cd  copyright
diff --git a/package/libks/libks.mk b/package/libks/libks.mk
index c4f0cd5c78..b17812619d 100644
--- a/package/libks/libks.mk
+++ b/package/libks/libks.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBKS_VERSION = 1.8.2
+LIBKS_VERSION = 1.8.3
 LIBKS_SITE = $(call github,signalwire,libks,v$(LIBKS_VERSION))
 LIBKS_LICENSE = MIT
 LIBKS_LICENSE_FILES = copyright
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
