Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4968C47DDB
	for <buildroot@archiver.kernel.org>; Tue, 23 Jan 2024 21:37:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5E98046E35;
	Tue, 23 Jan 2024 21:37:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5E98046E35
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vRkxU2QW4toT; Tue, 23 Jan 2024 21:37:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8D03D4CF91;
	Tue, 23 Jan 2024 21:37:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8D03D4CF91
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 323401BF362
 for <buildroot@lists.busybox.net>; Tue, 23 Jan 2024 21:37:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BC1E785072
 for <buildroot@lists.busybox.net>; Tue, 23 Jan 2024 21:17:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BC1E785072
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nG4GGSEi0wMd for <buildroot@lists.busybox.net>;
 Tue, 23 Jan 2024 21:17:22 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 94E38834BB
 for <buildroot@buildroot.org>; Tue, 23 Jan 2024 21:17:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 94E38834BB
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8101786454; Tue, 23 Jan 2024 21:17:22 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Tue, 23 Jan 2024 22:11:55 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b4625a19fa976a39c846263c86ad6a18c5537089
X-Git-Newrev: 8c7118cea4d9b780e1f6f838a70c5b8a0b96eaec
X-Patchwork-Hint: ignore
Message-Id: <20240123211722.8101786454@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/dust: bump version to 0.9.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=8c7118cea4d9b780e1f6f838a70c5b8a0b96eaec
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The licence have been updated between versions v0.8.3 and v0.8.4.
see:
https://github.com/bootandy/dust/commit/520c439edcba7fd8e8884e19d98f448553e6a42d

Signed-off-by: Antoine Coutant <antoine.coutant@smile.fr>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/dust/dust.hash | 4 ++--
 package/dust/dust.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/dust/dust.hash b/package/dust/dust.hash
index d4f6bff4e4..8f202d4870 100644
--- a/package/dust/dust.hash
+++ b/package/dust/dust.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  271cc0f1978049b2dbfece633b85d4dd0184df346bd93720062c13e4332f2549  dust-0.8.1.tar.gz
-sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  LICENSE
+sha256  b1712d3bcb7443e892019b0dcfa378d97e8e35f4b21e7ab62523cc30fb974c19  dust-0.9.0.tar.gz
+sha256  aee6e2d13d3a55c7881630c09b41ca7b3b44bb1437b5d36695d22decc3655160  LICENSE
diff --git a/package/dust/dust.mk b/package/dust/dust.mk
index 2cffc336a9..c566723c1c 100644
--- a/package/dust/dust.mk
+++ b/package/dust/dust.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DUST_VERSION = 0.8.1
+DUST_VERSION = 0.9.0
 DUST_SITE = $(call github,bootandy,dust,v$(DUST_VERSION))
 DUST_LICENSE = APACHE-2.0
 DUST_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
