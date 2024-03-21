Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E2DFC6FD1F
	for <buildroot@archiver.kernel.org>; Thu, 21 Mar 2024 21:03:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 035E381239;
	Thu, 21 Mar 2024 21:03:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iJQrFicSxZ-x; Thu, 21 Mar 2024 21:03:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D172481242
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D172481242;
	Thu, 21 Mar 2024 21:03:41 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 71D7F1BF2BD
 for <buildroot@lists.busybox.net>; Thu, 21 Mar 2024 21:02:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 83D476081D
 for <buildroot@lists.busybox.net>; Thu, 21 Mar 2024 21:02:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id su3L3Zv8RqKj for <buildroot@lists.busybox.net>;
 Thu, 21 Mar 2024 21:02:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CA31760686
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id CA31760686
 for <buildroot@buildroot.org>; Thu, 21 Mar 2024 21:02:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C6B7283751; Thu, 21 Mar 2024 21:02:26 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 21 Mar 2024 21:37:30 +0100
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: a2c2c6a52150dfb39458f492e3696e756b3889d6
X-Git-Newrev: a9d2eb834e871bd91f1f15fa9d5cffb6ac585712
X-Patchwork-Hint: ignore
Message-Id: <20240321210226.C6B7283751@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/mmc-utils: bump
 version to 2024-03-05
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

commit: https://git.buildroot.net/buildroot/commit/?id=a9d2eb834e871bd91f1f15fa9d5cffb6ac585712
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

Fixes:
http://autobuild.buildroot.net/results/06f972f95f4f2e0e7504b1fa069b89695b7377ef

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 7ee7b1ba6d5031405533193ec7c6edfd5dbde175)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mmc-utils/mmc-utils.hash | 2 +-
 package/mmc-utils/mmc-utils.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mmc-utils/mmc-utils.hash b/package/mmc-utils/mmc-utils.hash
index cd9d13324f..2c1bb86066 100644
--- a/package/mmc-utils/mmc-utils.hash
+++ b/package/mmc-utils/mmc-utils.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  84be5003ae83b4fdb0279a693f320fd472aebd14908a1ac16bda4f675e92ad40  mmc-utils-80271e9a6fd0db9cb3a85d024664da886e94315c-br1.tar.gz
+sha256  83b1bd7602b0c8d05a8ff2f842d80fa7c9a0b084b7159bb9eed796b0075b94d1  mmc-utils-e1281d4de9166b7254ba30bb58f9191fc2c9e7fb-br1.tar.gz
 sha256  4207d81122a02555f78c5a11b61c83a331ee03dc933e1ef9dd932ef9b434d12d  README
diff --git a/package/mmc-utils/mmc-utils.mk b/package/mmc-utils/mmc-utils.mk
index ef4d97c1ca..48c347d846 100644
--- a/package/mmc-utils/mmc-utils.mk
+++ b/package/mmc-utils/mmc-utils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MMC_UTILS_VERSION = 80271e9a6fd0db9cb3a85d024664da886e94315c
+MMC_UTILS_VERSION = e1281d4de9166b7254ba30bb58f9191fc2c9e7fb
 MMC_UTILS_SITE = https://git.kernel.org/pub/scm/utils/mmc/mmc-utils.git
 MMC_UTILS_SITE_METHOD = git
 MMC_UTILS_LICENSE = GPL-2.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
