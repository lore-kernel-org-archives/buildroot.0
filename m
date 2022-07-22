Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4CFFC43334
	for <buildroot@archiver.kernel.org>; Fri, 22 Jul 2022 07:43:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 552B760017;
	Fri, 22 Jul 2022 07:43:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 552B760017
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id itv1yzpmk8qf; Fri, 22 Jul 2022 07:43:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 72A7160EF6;
	Fri, 22 Jul 2022 07:43:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 72A7160EF6
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9E8D81BF36D
 for <buildroot@lists.busybox.net>; Fri, 22 Jul 2022 07:43:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8679B40151
 for <buildroot@lists.busybox.net>; Fri, 22 Jul 2022 07:43:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8679B40151
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wczhYKf1KnlU for <buildroot@lists.busybox.net>;
 Fri, 22 Jul 2022 07:43:37 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id B90ED4011A
 for <buildroot@buildroot.org>; Fri, 22 Jul 2022 07:43:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B90ED4011A
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id A0A9C8414C; Fri, 22 Jul 2022 07:30:03 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 22 Jul 2022 09:41:36 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: f948d3b9ea69e67f9dcc4c7ffcf9cd400c8f36c5
X-Git-Newrev: 1e20824fb7e4913fbdc81c0b75ff105cd73d6f94
X-Patchwork-Hint: ignore
Message-Id: <20220722073003.A0A9C8414C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/pure-ftpd: bump
 version to 1.0.51
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

commit: https://git.buildroot.net/buildroot/commit/?id=1e20824fb7e4913fbdc81c0b75ff105cd73d6f94
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Changelog: https://github.com/jedisct1/pure-ftpd/blob/master/ChangeLog

Updated copyright hash due to copyright year bump:
https://github.com/jedisct1/pure-ftpd/commit/cf1a9705c63ebc62735f99d4acf6dba117288abe

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit ad54a80465d7c45827afa2ef20927883ebea6e62)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/pure-ftpd/pure-ftpd.hash | 4 ++--
 package/pure-ftpd/pure-ftpd.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/pure-ftpd/pure-ftpd.hash b/package/pure-ftpd/pure-ftpd.hash
index e8b779c313..4cbbfa15ad 100644
--- a/package/pure-ftpd/pure-ftpd.hash
+++ b/package/pure-ftpd/pure-ftpd.hash
@@ -1,3 +1,3 @@
 # Locally calculated after checking pgp signature
-sha256  6722c7fd09fe3c9ebbd572f3d097087ec7b32aacb3df8fa3400d4c07e4f377d7  pure-ftpd-1.0.50.tar.bz2
-sha256  c1be5d56c28927b05131d7384bd522af4b11c3afea45725f5ca7983c11db61ac  COPYING
+sha256  622360b86c60b563abe0e994f0a86cfe5ccfde597b29a14b0a79b6e5aa05a304  pure-ftpd-1.0.51.tar.bz2
+sha256  88c813191c1a59213c641e322cf4562618ab0116ddd7c8341c419f8863b8b0a9  COPYING
diff --git a/package/pure-ftpd/pure-ftpd.mk b/package/pure-ftpd/pure-ftpd.mk
index 0354949e28..6264b5ed03 100644
--- a/package/pure-ftpd/pure-ftpd.mk
+++ b/package/pure-ftpd/pure-ftpd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PURE_FTPD_VERSION = 1.0.50
+PURE_FTPD_VERSION = 1.0.51
 PURE_FTPD_SITE = https://download.pureftpd.org/pub/pure-ftpd/releases
 PURE_FTPD_SOURCE = pure-ftpd-$(PURE_FTPD_VERSION).tar.bz2
 PURE_FTPD_LICENSE = ISC
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
