Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B41DC433EF
	for <buildroot@archiver.kernel.org>; Sat, 12 Feb 2022 13:14:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2EE0483E1C;
	Sat, 12 Feb 2022 13:14:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bM6io9RIEPk8; Sat, 12 Feb 2022 13:14:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6B1A981DA3;
	Sat, 12 Feb 2022 13:14:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B6DDF1BF283
 for <buildroot@lists.busybox.net>; Sat, 12 Feb 2022 13:13:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 84A2C80C1E
 for <buildroot@lists.busybox.net>; Sat, 12 Feb 2022 13:13:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TT93HA6zYM_r for <buildroot@lists.busybox.net>;
 Sat, 12 Feb 2022 13:13:33 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id D3F4180C93
 for <buildroot@buildroot.org>; Sat, 12 Feb 2022 13:13:33 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id E98E982AD1; Sat, 12 Feb 2022 13:06:02 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sat, 12 Feb 2022 14:08:46 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1ddced072abefa001a10df56b9820e96db1b2b6f
X-Git-Newrev: c8406392466ecd1591265e24e619202c79f08a39
X-Patchwork-Hint: ignore
Message-Id: <20220212130602.E98E982AD1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/thermald: bump to 2.4.8
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

commit: https://git.buildroot.net/buildroot/commit/?id=c8406392466ecd1591265e24e619202c79f08a39
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Two source files had their header updated to correctly state the licence
is GPL-2.0+, not GPL-2.0. There is no real licensing change to the
project in this bump.

Release 2.4.8
-Fix Ideapad thermal shutdown issue #328

Release 2.4.7
- Fix AC/DC power limit issue in some HP TigerLake systems
- Regression fix for RAPL MSR usage in xml config file
- Added Japer Lake and Alder Lake CPU models
- Debug scripts for log collection to upload

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/thermald/thermald.hash | 2 +-
 package/thermald/thermald.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/thermald/thermald.hash b/package/thermald/thermald.hash
index 0a37f0e413..3a7c0f6952 100644
--- a/package/thermald/thermald.hash
+++ b/package/thermald/thermald.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  80c92902a89b72a9df85c51a8b5fc472cc01b4410600ef1f56d62c4ac23890c1  thermald-2.4.6.tar.gz
+sha256  3e5a5033339c021de41ed4f946dd39e13f79f722fb5bd98d798e83658184c39b  thermald-2.4.8.tar.gz
 sha256  e98be8bc482e038a14bfbc01caf800bbd0024fff275ef14cd999db6560254a8d  COPYING
diff --git a/package/thermald/thermald.mk b/package/thermald/thermald.mk
index 9b303104e3..4e43277128 100644
--- a/package/thermald/thermald.mk
+++ b/package/thermald/thermald.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-THERMALD_VERSION = 2.4.6
+THERMALD_VERSION = 2.4.8
 THERMALD_SITE = $(call github,intel,thermal_daemon,v$(THERMALD_VERSION))
 # fetched from Github, with no configure script
 THERMALD_AUTORECONF = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
