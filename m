Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E09CDC433F5
	for <buildroot@archiver.kernel.org>; Thu, 30 Dec 2021 15:58:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 84A3F82786;
	Thu, 30 Dec 2021 15:58:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5RRc_jiHKSfy; Thu, 30 Dec 2021 15:58:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D276581AAC;
	Thu, 30 Dec 2021 15:58:35 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 298571BF403
 for <buildroot@lists.busybox.net>; Thu, 30 Dec 2021 15:58:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 10DBA40574
 for <buildroot@lists.busybox.net>; Thu, 30 Dec 2021 15:58:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4Glb1JiHxtYg for <buildroot@lists.busybox.net>;
 Thu, 30 Dec 2021 15:58:33 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2875640166
 for <buildroot@buildroot.org>; Thu, 30 Dec 2021 15:58:33 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 074CF82DDC; Thu, 30 Dec 2021 15:52:41 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Thu, 30 Dec 2021 16:58:14 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 383f73289ce6b0eaba9e8f2c611f0493959b69fe
X-Git-Newrev: 6dad41b9f47df5226acde820c7d9ad5e28ffeef4
X-Patchwork-Hint: ignore
Message-Id: <20211230155241.074CF82DDC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/arm-gnu-a-toolchain: bump to
 version 10.3-2021.07
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

commit: https://git.buildroot.net/buildroot/commit/?id=6dad41b9f47df5226acde820c7d9ad5e28ffeef4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/arm-gnu-a-toolchain/arm-gnu-a-toolchain.hash | 2 +-
 package/arm-gnu-a-toolchain/arm-gnu-a-toolchain.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/arm-gnu-a-toolchain/arm-gnu-a-toolchain.hash b/package/arm-gnu-a-toolchain/arm-gnu-a-toolchain.hash
index b18e56c151..73c2708fea 100644
--- a/package/arm-gnu-a-toolchain/arm-gnu-a-toolchain.hash
+++ b/package/arm-gnu-a-toolchain/arm-gnu-a-toolchain.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 ac952d89ae0fc3543e81099e7d34917efc621f5def112eee843fd1ce755eca8c  gcc-arm-9.2-2019.12-x86_64-arm-none-eabi.tar.xz
+sha256 45225813f74e0c3f76af2715d30d1fbebb873c1abe7098f9c694e5567cc2279c  gcc-arm-10.3-2021.07-x86_64-arm-none-eabi.tar.xz
diff --git a/package/arm-gnu-a-toolchain/arm-gnu-a-toolchain.mk b/package/arm-gnu-a-toolchain/arm-gnu-a-toolchain.mk
index d7088892ca..97ab89c9eb 100644
--- a/package/arm-gnu-a-toolchain/arm-gnu-a-toolchain.mk
+++ b/package/arm-gnu-a-toolchain/arm-gnu-a-toolchain.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ARM_GNU_A_TOOLCHAIN_VERSION = 9.2-2019.12
+ARM_GNU_A_TOOLCHAIN_VERSION = 10.3-2021.07
 ARM_GNU_A_TOOLCHAIN_SITE = https://developer.arm.com/-/media/Files/downloads/gnu-a/$(ARM_GNU_A_TOOLCHAIN_VERSION)/binrel
 ARM_GNU_A_TOOLCHAIN_SOURCE = gcc-arm-$(ARM_GNU_A_TOOLCHAIN_VERSION)-x86_64-arm-none-eabi.tar.xz
 ARM_GNU_A_TOOLCHAIN_LICENSE = GPL-3.0+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
