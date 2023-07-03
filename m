Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73C71C30654
	for <buildroot@archiver.kernel.org>; Mon,  3 Jul 2023 18:52:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E679960AAD;
	Mon,  3 Jul 2023 18:52:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E679960AAD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EwIeLcRF7zRE; Mon,  3 Jul 2023 18:52:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B021960F18;
	Mon,  3 Jul 2023 18:52:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B021960F18
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5850F1BF39A
 for <buildroot@lists.busybox.net>; Mon,  3 Jul 2023 18:52:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 328FD60EB3
 for <buildroot@lists.busybox.net>; Mon,  3 Jul 2023 18:52:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 328FD60EB3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZR7aAO8oUQWU for <buildroot@lists.busybox.net>;
 Mon,  3 Jul 2023 18:52:04 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9EEC460A9D
 for <buildroot@buildroot.org>; Mon,  3 Jul 2023 18:52:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9EEC460A9D
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8751286462; Mon,  3 Jul 2023 18:52:04 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 3 Jul 2023 20:47:50 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 211acb1e3b2bf8c6d24d8c43accb79224b99d72c
X-Git-Newrev: 200d371d5ec65a087ecb7ec2a75a25938fee73da
X-Patchwork-Hint: ignore
Message-Id: <20230703185204.8751286462@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libcodec2: bump version to 1.1.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=200d371d5ec65a087ecb7ec2a75a25938fee73da
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes: https://github.com/drowe67/codec2/releases/tag/v1.1.1

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libcodec2/libcodec2.hash | 2 +-
 package/libcodec2/libcodec2.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libcodec2/libcodec2.hash b/package/libcodec2/libcodec2.hash
index b2de750c34..edaa275bbc 100644
--- a/package/libcodec2/libcodec2.hash
+++ b/package/libcodec2/libcodec2.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  d56ba661008a780b823d576a5a2742c94d0b0507574643a7d4f54c76134826a3  libcodec2-1.1.0.tar.gz
+sha256  44015b071968d98ee326012c498db6a8308bed1a7a914ecb6d4d8e2a354a4611  libcodec2-1.1.1.tar.gz
 sha256  9ebb6f82b7380a62ac74c5f0322c88e6744dedf2ebe1f54d6f088282b39844bf  COPYING
diff --git a/package/libcodec2/libcodec2.mk b/package/libcodec2/libcodec2.mk
index 66758a1697..295dd8983f 100644
--- a/package/libcodec2/libcodec2.mk
+++ b/package/libcodec2/libcodec2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBCODEC2_VERSION = 1.1.0
+LIBCODEC2_VERSION = 1.1.1
 LIBCODEC2_SITE = $(call github,drowe67,codec2,v$(LIBCODEC2_VERSION))
 LIBCODEC2_LICENSE = LGPL-2.1
 LIBCODEC2_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
