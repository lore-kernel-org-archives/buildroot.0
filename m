Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8C1BC04FFE
	for <buildroot@archiver.kernel.org>; Wed,  8 May 2024 16:36:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B697B60585;
	Wed,  8 May 2024 16:36:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id COP-G2EZ-0w7; Wed,  8 May 2024 16:36:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C80826058C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C80826058C;
	Wed,  8 May 2024 16:36:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 512421BF2B0
 for <buildroot@lists.busybox.net>; Wed,  8 May 2024 16:36:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3B3F082E14
 for <buildroot@lists.busybox.net>; Wed,  8 May 2024 16:36:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JTklKjv5MBGn for <buildroot@lists.busybox.net>;
 Wed,  8 May 2024 16:36:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 78FDA82D57
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 78FDA82D57
 for <buildroot@buildroot.org>; Wed,  8 May 2024 16:36:31 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3674586AE1; Wed,  8 May 2024 16:36:31 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 8 May 2024 18:34:35 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 48badeaa44d68d41f8723b010d905cdfd10f14b8
X-Git-Newrev: a70158eb1cb43e68d5ef6c7517d37d945f2c3a88
X-Patchwork-Hint: ignore
Message-Id: <20240508163631.3674586AE1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/perftest: bump to version
 24.04.0-0.41
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

commit: https://git.buildroot.net/buildroot/commit/?id=a70158eb1cb43e68d5ef6c7517d37d945f2c3a88
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For change log since 23.10.0-0.29, see:
https://github.com/linux-rdma/perftest/releases/tag/24.01.0-0.38
https://github.com/linux-rdma/perftest/releases/tag/24.04.0-0.41

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/perftest/perftest.hash | 2 +-
 package/perftest/perftest.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/perftest/perftest.hash b/package/perftest/perftest.hash
index 2fa8c63493..f40d1d1e96 100644
--- a/package/perftest/perftest.hash
+++ b/package/perftest/perftest.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  79bcbb4a62a578408379e89d73f4ceea8f272a139e8a634611f92b1d9ac911a0  perftest-23.10.0-0.29.tar.gz
+sha256  d398cb7a364735485b5ae033b242d7cf0bedcdb5f4d512e54b18c9a3e7a98b87  perftest-24.04.0-0.41.tar.gz
 sha256  763adb7d5094f2127b026adea8701f042d28d4b1f6fb8b6e828989227a9cf7f5  COPYING
diff --git a/package/perftest/perftest.mk b/package/perftest/perftest.mk
index 9e0424e47e..36cb775254 100644
--- a/package/perftest/perftest.mk
+++ b/package/perftest/perftest.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERFTEST_VERSION = 23.10.0-0.29
+PERFTEST_VERSION = 24.04.0-0.41
 PERFTEST_SITE = $(call github,linux-rdma,perftest,$(PERFTEST_VERSION))
 PERFTEST_LICENSE = GPL-2.0 or BSD-2-Clause
 PERFTEST_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
