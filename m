Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7048C433F5
	for <buildroot@archiver.kernel.org>; Sat,  8 Jan 2022 09:50:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7C00A817EB;
	Sat,  8 Jan 2022 09:50:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id X8lo_qHpGso5; Sat,  8 Jan 2022 09:50:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9023B81460;
	Sat,  8 Jan 2022 09:50:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BE13C1BF343
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 09:49:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AC9588145B
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 09:49:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id N9fPKobmBNe2 for <buildroot@lists.busybox.net>;
 Sat,  8 Jan 2022 09:49:49 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 94C7C81460
 for <buildroot@buildroot.org>; Sat,  8 Jan 2022 09:49:49 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 99D0E82AB6; Sat,  8 Jan 2022 09:43:37 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 8 Jan 2022 10:49:21 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a4206de33e0dee3044fa36c555c48b439c3eeb0c
X-Git-Newrev: 1b636c507c64792d91df336eb5c379b0bff17977
X-Patchwork-Hint: ignore
Message-Id: <20220108094337.99D0E82AB6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/exfatprogs: bump version to 1.1.3
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

commit: https://git.buildroot.net/buildroot/commit/?id=1b636c507c64792d91df336eb5c379b0bff17977
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Updated license hash due to whitespace changes in upstream commit
https://github.com/exfatprogs/exfatprogs/commit/7e30487e6d92f98e1ab91b037f5285453359ec9a

Release notes: https://github.com/exfatprogs/exfatprogs/blob/master/NEWS

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/exfatprogs/exfatprogs.hash | 6 +++---
 package/exfatprogs/exfatprogs.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/exfatprogs/exfatprogs.hash b/package/exfatprogs/exfatprogs.hash
index 4dc18cd4b6..99f57c9deb 100644
--- a/package/exfatprogs/exfatprogs.hash
+++ b/package/exfatprogs/exfatprogs.hash
@@ -1,5 +1,5 @@
-# From https://github.com/exfatprogs/exfatprogs/releases/download/1.1.0/exfatprogs-1.1.0.tar.xz.sha256
-sha256  69e2cf6430fc1d083c6ae0aea5eb80bf1b8e9775ed833bcd8331aef0fcacaf85  exfatprogs-1.1.0.tar.xz
+# From https://github.com/exfatprogs/exfatprogs/releases/download/1.1.3/exfatprogs-1.1.3.tar.xz.sha256
+sha256  3dbd74b60eec18d2c68d57be4a872d7baa4f7d848e669e31159452ef5245b809  exfatprogs-1.1.3.tar.xz
 
 # Hash for license file
-sha256  576540abf5e95029ad4ad90e32071385a5e95b2c30708c706116f3eb87b9a3de  COPYING
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/exfatprogs/exfatprogs.mk b/package/exfatprogs/exfatprogs.mk
index e10acc9e5f..2911d21f4f 100644
--- a/package/exfatprogs/exfatprogs.mk
+++ b/package/exfatprogs/exfatprogs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-EXFATPROGS_VERSION = 1.1.0
+EXFATPROGS_VERSION = 1.1.3
 EXFATPROGS_SOURCE = exfatprogs-$(EXFATPROGS_VERSION).tar.xz
 EXFATPROGS_SITE = https://github.com/exfatprogs/exfatprogs/releases/download/$(EXFATPROGS_VERSION)
 EXFATPROGS_LICENSE = GPL-2.0+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
