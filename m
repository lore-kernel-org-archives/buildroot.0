Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 370A2E71D21
	for <buildroot@archiver.kernel.org>; Fri, 29 Sep 2023 12:23:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6320E42DC3;
	Fri, 29 Sep 2023 12:23:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6320E42DC3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id S7UKNj1r_c_h; Fri, 29 Sep 2023 12:23:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3BC0642DBE;
	Fri, 29 Sep 2023 12:23:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3BC0642DBE
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 369351BF995
 for <buildroot@lists.busybox.net>; Fri, 29 Sep 2023 12:23:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 101F5404C3
 for <buildroot@lists.busybox.net>; Fri, 29 Sep 2023 12:23:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 101F5404C3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qDOvcStN90TH for <buildroot@lists.busybox.net>;
 Fri, 29 Sep 2023 12:23:44 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 219864019E
 for <buildroot@buildroot.org>; Fri, 29 Sep 2023 12:23:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 219864019E
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0E20B8348D; Fri, 29 Sep 2023 12:23:44 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 29 Sep 2023 14:22:42 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 94b2dc586fc96be90cfc02f279f5b14bbabe0c5a
X-Git-Newrev: e4fcdc680155d726c7d23842bb00ebc0c77ffd12
X-Patchwork-Hint: ignore
Message-Id: <20230929122344.0E20B8348D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mmc-utils: bump to version
 2023-09-26
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

commit: https://git.buildroot.net/buildroot/commit/?id=e4fcdc680155d726c7d23842bb00ebc0c77ffd12
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/a53922c5db3e605a5e81e53c034f45017ebb7db7

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mmc-utils/mmc-utils.hash | 2 +-
 package/mmc-utils/mmc-utils.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mmc-utils/mmc-utils.hash b/package/mmc-utils/mmc-utils.hash
index 1bdb545cbc..cd9d13324f 100644
--- a/package/mmc-utils/mmc-utils.hash
+++ b/package/mmc-utils/mmc-utils.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  9ac9718343ffa36ab9ef192728e60cce6504febe29d43fb8003c2e2ef5a7c7d7  mmc-utils-613495ecaca97a19fa7f8f3ea23306472b36453c-br1.tar.gz
+sha256  84be5003ae83b4fdb0279a693f320fd472aebd14908a1ac16bda4f675e92ad40  mmc-utils-80271e9a6fd0db9cb3a85d024664da886e94315c-br1.tar.gz
 sha256  4207d81122a02555f78c5a11b61c83a331ee03dc933e1ef9dd932ef9b434d12d  README
diff --git a/package/mmc-utils/mmc-utils.mk b/package/mmc-utils/mmc-utils.mk
index 7f88c40024..ef4d97c1ca 100644
--- a/package/mmc-utils/mmc-utils.mk
+++ b/package/mmc-utils/mmc-utils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MMC_UTILS_VERSION = 613495ecaca97a19fa7f8f3ea23306472b36453c
+MMC_UTILS_VERSION = 80271e9a6fd0db9cb3a85d024664da886e94315c
 MMC_UTILS_SITE = https://git.kernel.org/pub/scm/utils/mmc/mmc-utils.git
 MMC_UTILS_SITE_METHOD = git
 MMC_UTILS_LICENSE = GPL-2.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
