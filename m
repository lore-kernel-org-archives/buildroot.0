Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 932A7C6FD19
	for <buildroot@archiver.kernel.org>; Sun, 12 Mar 2023 22:06:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2596640977;
	Sun, 12 Mar 2023 22:06:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2596640977
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DnnEdjtRvyW3; Sun, 12 Mar 2023 22:06:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1F61440895;
	Sun, 12 Mar 2023 22:06:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1F61440895
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1EC811BF334
 for <buildroot@lists.busybox.net>; Sun, 12 Mar 2023 22:06:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 06C944058B
 for <buildroot@lists.busybox.net>; Sun, 12 Mar 2023 22:06:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 06C944058B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bP2V1Qroq7Nr for <buildroot@lists.busybox.net>;
 Sun, 12 Mar 2023 22:06:25 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2271240106
 for <buildroot@buildroot.org>; Sun, 12 Mar 2023 22:06:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2271240106
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1195387011; Sun, 12 Mar 2023 22:06:25 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 12 Mar 2023 23:05:52 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: df48bcd151988c6691c1b9d5b47b601bfafe11bd
X-Git-Newrev: 4c5ac7e0344ad858642955e571d9be547e7a146a
X-Patchwork-Hint: ignore
Message-Id: <20230312220625.1195387011@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/rauc: bump to version 1.9
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

commit: https://git.buildroot.net/buildroot/commit/?id=4c5ac7e0344ad858642955e571d9be547e7a146a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/rauc/rauc.hash | 2 +-
 package/rauc/rauc.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rauc/rauc.hash b/package/rauc/rauc.hash
index 8351d0266e..1cd5f7f314 100644
--- a/package/rauc/rauc.hash
+++ b/package/rauc/rauc.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  d233247c1763b1c56c851d0adef2094b7aa2fcd72decf524a8ac0419188e0978  rauc-1.8.tar.xz
+sha256  73802ce28d1045c757b547f5b4a222f0e825b5df77bca3464350278fc6fd200e  rauc-1.9.tar.xz
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/rauc/rauc.mk b/package/rauc/rauc.mk
index 0c81a6cc35..2baa25ec9e 100644
--- a/package/rauc/rauc.mk
+++ b/package/rauc/rauc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RAUC_VERSION = 1.8
+RAUC_VERSION = 1.9
 RAUC_SITE = https://github.com/rauc/rauc/releases/download/v$(RAUC_VERSION)
 RAUC_SOURCE = rauc-$(RAUC_VERSION).tar.xz
 RAUC_LICENSE = LGPL-2.1
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
