Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FF47C433F5
	for <buildroot@archiver.kernel.org>; Tue, 11 Jan 2022 20:36:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 06D9183E5D;
	Tue, 11 Jan 2022 20:36:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IK_kgzOT2RLJ; Tue, 11 Jan 2022 20:36:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5591583E57;
	Tue, 11 Jan 2022 20:36:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id F046A1BF239
 for <buildroot@lists.busybox.net>; Tue, 11 Jan 2022 20:35:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DD4A883E57
 for <buildroot@lists.busybox.net>; Tue, 11 Jan 2022 20:35:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wsR0-lseI2eh for <buildroot@lists.busybox.net>;
 Tue, 11 Jan 2022 20:35:59 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4203483E40
 for <buildroot@buildroot.org>; Tue, 11 Jan 2022 20:35:59 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 7D6F58324B; Tue, 11 Jan 2022 20:29:39 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Tue, 11 Jan 2022 21:33:03 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f363bc2958812539cf248f6cf44fe519445adf7a
X-Git-Newrev: 7194084e99676a1792e5ff7b8dfc6469337508e1
X-Patchwork-Hint: ignore
Message-Id: <20220111202939.7D6F58324B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/assimp: bump version to 5.1.6
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

commit: https://git.buildroot.net/buildroot/commit/?id=7194084e99676a1792e5ff7b8dfc6469337508e1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For details see [1].

[1] https://github.com/assimp/assimp/releases/tag/v5.1.6

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/assimp/assimp.hash | 2 +-
 package/assimp/assimp.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/assimp/assimp.hash b/package/assimp/assimp.hash
index 8f6d613bb4..50f0b3e6d6 100644
--- a/package/assimp/assimp.hash
+++ b/package/assimp/assimp.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  d62b58ed3b35c20f89570863a5415df97cb1b301b444d39687140fc883717ced  assimp-5.1.5.tar.gz
+sha256  52ad3a3776ce320c8add531dbcb2d3b93f2e1f10fcff5ac30178b09ba934d084  assimp-5.1.6.tar.gz
 sha256  147874443d242b4e2bae97036e26ec9d6b37f706174c1bd5ecfcc8c1294cef51  LICENSE
diff --git a/package/assimp/assimp.mk b/package/assimp/assimp.mk
index b5f84ef56f..766b2c9b5a 100644
--- a/package/assimp/assimp.mk
+++ b/package/assimp/assimp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ASSIMP_VERSION = 5.1.5
+ASSIMP_VERSION = 5.1.6
 ASSIMP_SITE = $(call github,assimp,assimp,v$(ASSIMP_VERSION))
 ASSIMP_LICENSE = BSD-3-Clause
 ASSIMP_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
