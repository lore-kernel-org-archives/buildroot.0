Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72F30C2D0CD
	for <buildroot@archiver.kernel.org>; Sat, 17 May 2025 09:09:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4911F83DC4;
	Sat, 17 May 2025 09:09:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yV0F9J0zR0s4; Sat, 17 May 2025 09:09:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7638C83D63
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7638C83D63;
	Sat, 17 May 2025 09:09:52 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id D788DE4
 for <buildroot@buildroot.org>; Sat, 17 May 2025 09:09:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0E7ED60A89
 for <buildroot@buildroot.org>; Sat, 17 May 2025 09:09:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0D6DV2RlmC10 for <buildroot@buildroot.org>;
 Sat, 17 May 2025 09:09:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5D28760A9B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5D28760A9B
 for <buildroot@buildroot.org>; Sat, 17 May 2025 09:09:36 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 577B486DF4; Sat, 17 May 2025 09:09:36 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 17 May 2025 10:13:23 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9cd495b871ad8c3462294d175e927f00044dc862
X-Git-Newrev: ebf1217a7bd2b7750cde99718348f8f4e823588f
X-Patchwork-Hint: ignore
Message-Id: <20250517090936.577B486DF4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/checkpolicy: bump to version 3.8.1
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
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=ebf1217a7bd2b7750cde99718348f8f4e823588f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 package/checkpolicy/checkpolicy.hash | 2 +-
 package/checkpolicy/checkpolicy.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/checkpolicy/checkpolicy.hash b/package/checkpolicy/checkpolicy.hash
index e768a80cdf..ba33165685 100644
--- a/package/checkpolicy/checkpolicy.hash
+++ b/package/checkpolicy/checkpolicy.hash
@@ -1,5 +1,5 @@
 # https://github.com/SELinuxProject/selinux/wiki/Releases
-sha256  fd3e1925477d49946d1116938661af44c1f86f0d681466fd9f02eaa06002a07f  checkpolicy-3.7.tar.gz
+sha256  7b477c516e2693d8b6c511386323177f1d7db51c2e04eb6d0de8ca2b36120e5d  checkpolicy-3.8.1.tar.gz
 
 # Hash for license file
 sha256  204d8eff92f95aac4df6c8122bc1505f468f3a901e5a4cc08940e0ede1938994  LICENSE
diff --git a/package/checkpolicy/checkpolicy.mk b/package/checkpolicy/checkpolicy.mk
index adf125ebf8..8c094f23a5 100644
--- a/package/checkpolicy/checkpolicy.mk
+++ b/package/checkpolicy/checkpolicy.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CHECKPOLICY_VERSION = 3.7
+CHECKPOLICY_VERSION = 3.8.1
 CHECKPOLICY_SITE = https://github.com/SELinuxProject/selinux/releases/download/$(CHECKPOLICY_VERSION)
 CHECKPOLICY_LICENSE = GPL-2.0
 CHECKPOLICY_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
