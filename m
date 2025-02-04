Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B27DFC02194
	for <buildroot@archiver.kernel.org>; Tue,  4 Feb 2025 15:47:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 553D181FC9;
	Tue,  4 Feb 2025 15:47:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oBbtcS5eLy-P; Tue,  4 Feb 2025 15:47:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7AF1F82128
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7AF1F82128;
	Tue,  4 Feb 2025 15:47:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2C3D112A
 for <buildroot@buildroot.org>; Tue,  4 Feb 2025 15:47:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 277D34035A
 for <buildroot@buildroot.org>; Tue,  4 Feb 2025 15:47:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uPBAW9m0nAXm for <buildroot@buildroot.org>;
 Tue,  4 Feb 2025 15:47:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1EC6440356
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1EC6440356
 for <buildroot@buildroot.org>; Tue,  4 Feb 2025 15:47:44 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 15D5586EB7; Tue,  4 Feb 2025 15:47:44 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 4 Feb 2025 16:45:48 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 55e94504d626f226452caae73ef171927b6ea05d
X-Git-Newrev: 4e1b098212add9a323bbb7d64823f989930d5e09
X-Patchwork-Hint: ignore
Message-Id: <20250204154744.15D5586EB7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mender-connect: bump version to
 2.3.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=4e1b098212add9a323bbb7d64823f989930d5e09
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/mender-connect/mender-connect.hash | 2 +-
 package/mender-connect/mender-connect.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mender-connect/mender-connect.hash b/package/mender-connect/mender-connect.hash
index 5f7e082e1b..4b18a540cf 100644
--- a/package/mender-connect/mender-connect.hash
+++ b/package/mender-connect/mender-connect.hash
@@ -1,5 +1,5 @@
 # Locally computed:
-sha256  7e83c4cabc090ed26088036c6c68fc8e73546fa4a75db817f676dc8b1e8a3c8f  mender-connect-2.2.1-go2.tar.gz
+sha256  c90a5f5e2d7ab4396e04d1914e2cbb2a16cb11c1d6e038b889ba7ff941f1e02a  mender-connect-2.3.0-go2.tar.gz
 sha256  c57e1178f932015d7f08b4d76c4b18e4a55083a6fbc97629cd25ef426bf1db30  LIC_FILES_CHKSUM.sha256
 
 # Vendor licenses
diff --git a/package/mender-connect/mender-connect.mk b/package/mender-connect/mender-connect.mk
index f4f7e0f195..9e6fb87ed5 100644
--- a/package/mender-connect/mender-connect.mk
+++ b/package/mender-connect/mender-connect.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MENDER_CONNECT_VERSION = 2.2.1
+MENDER_CONNECT_VERSION = 2.3.0
 MENDER_CONNECT_SITE = $(call github,mendersoftware,mender-connect,$(MENDER_CONNECT_VERSION))
 MENDER_CONNECT_LICENSE = Apache-2.0, BSD-2-Clause, BSD-3-Clause, ISC, MIT
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
