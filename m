Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B44EECAAD3
	for <buildroot@archiver.kernel.org>; Thu, 15 Sep 2022 08:33:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F401E61015;
	Thu, 15 Sep 2022 08:33:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F401E61015
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9mDFOsR8JUzd; Thu, 15 Sep 2022 08:33:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 06C1160FF1;
	Thu, 15 Sep 2022 08:33:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 06C1160FF1
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 23D4A1BF475
 for <buildroot@lists.busybox.net>; Thu, 15 Sep 2022 08:33:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0BD7F41025
 for <buildroot@lists.busybox.net>; Thu, 15 Sep 2022 08:33:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0BD7F41025
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KuSPEkCTZelG for <buildroot@lists.busybox.net>;
 Thu, 15 Sep 2022 08:33:45 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id E77D040FDE
 for <buildroot@buildroot.org>; Thu, 15 Sep 2022 08:33:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E77D040FDE
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id D59D083567; Thu, 15 Sep 2022 08:33:44 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 15 Sep 2022 10:23:55 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 834648510a8665f11e0d01e505ac605efbe2cd3c
X-Git-Newrev: e28834ad027c096fb19c8903f5426354f27f4970
X-Patchwork-Hint: ignore
Message-Id: <20220915083344.D59D083567@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/sqlite: bump to
 version 3.38.5
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

commit: https://git.buildroot.net/buildroot/commit/?id=e28834ad027c096fb19c8903f5426354f27f4970
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 1183fd1411161f0483960063103377915e84c68e)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/sqlite/sqlite.hash | 2 +-
 package/sqlite/sqlite.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/sqlite/sqlite.hash b/package/sqlite/sqlite.hash
index 12a543f004..69ff5ed690 100644
--- a/package/sqlite/sqlite.hash
+++ b/package/sqlite/sqlite.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  61f2dd93a2e38c33468b7125967c3218bf9f4dd8365def6025e314f905dc942e  sqlite-autoconf-3380300.tar.gz
+sha256  5af07de982ba658fd91a03170c945f99c971f6955bc79df3266544373e39869c  sqlite-autoconf-3380500.tar.gz
 sha256  66e056b6e8687f32af30d5187611b98b12a8f46f07aaf62f43585f276e8f0ac9  tea/license.terms
diff --git a/package/sqlite/sqlite.mk b/package/sqlite/sqlite.mk
index 3ba120df83..667ea1d01d 100644
--- a/package/sqlite/sqlite.mk
+++ b/package/sqlite/sqlite.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-SQLITE_VERSION = 3.38.3
-SQLITE_TAR_VERSION = 3380300
+SQLITE_VERSION = 3.38.5
+SQLITE_TAR_VERSION = 3380500
 SQLITE_SOURCE = sqlite-autoconf-$(SQLITE_TAR_VERSION).tar.gz
 SQLITE_SITE = https://www.sqlite.org/2022
 SQLITE_LICENSE = Public domain
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
