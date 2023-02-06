Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 063F3C61DA4
	for <buildroot@archiver.kernel.org>; Mon,  6 Feb 2023 10:04:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A6CB581492;
	Mon,  6 Feb 2023 10:04:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A6CB581492
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7Jv3VNChe3Qq; Mon,  6 Feb 2023 10:04:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E82848148F;
	Mon,  6 Feb 2023 10:04:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E82848148F
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5E7FC1BF2CF
 for <buildroot@lists.busybox.net>; Mon,  6 Feb 2023 10:04:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 386888148F
 for <buildroot@lists.busybox.net>; Mon,  6 Feb 2023 10:04:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 386888148F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zYqKMBL1o6cU for <buildroot@lists.busybox.net>;
 Mon,  6 Feb 2023 10:04:34 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 71F42813FF
 for <buildroot@buildroot.org>; Mon,  6 Feb 2023 10:04:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 71F42813FF
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5DF8283A2B; Mon,  6 Feb 2023 10:04:34 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 6 Feb 2023 11:03:19 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5be76a39d3a0c21d6f3ceeab0889edc3cec9f2f3
X-Git-Newrev: 11d98385f56e61e2928707f056c001ceec5d06e9
X-Patchwork-Hint: ignore
Message-Id: <20230206100434.5DF8283A2B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/thermald: bump to 2.5.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=11d98385f56e61e2928707f056c001ceec5d06e9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

README.txt states only these changes:
- Static analysis fixes
- Missing init, which causes skipping of conditions in a Dell system

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/thermald/thermald.hash | 2 +-
 package/thermald/thermald.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/thermald/thermald.hash b/package/thermald/thermald.hash
index eceff77d37..9693813ca9 100644
--- a/package/thermald/thermald.hash
+++ b/package/thermald/thermald.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  e6515678ce8ff37978a453e1617a087a40ba3a31809a42c1768b6f816e564cc9  thermald-2.5.tar.gz
+sha256  75c165df45b3d09c904d314c8c19789158e9538f46e3d2b606457dc631eb3af5  thermald-2.5.1.tar.gz
 sha256  e98be8bc482e038a14bfbc01caf800bbd0024fff275ef14cd999db6560254a8d  COPYING
diff --git a/package/thermald/thermald.mk b/package/thermald/thermald.mk
index 38f6b5a00f..fd0246745f 100644
--- a/package/thermald/thermald.mk
+++ b/package/thermald/thermald.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-THERMALD_VERSION = 2.5
+THERMALD_VERSION = 2.5.1
 THERMALD_SITE = $(call github,intel,thermal_daemon,v$(THERMALD_VERSION))
 # fetched from Github, with no configure script
 THERMALD_AUTORECONF = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
