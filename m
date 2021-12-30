Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60785C433F5
	for <buildroot@archiver.kernel.org>; Thu, 30 Dec 2021 16:01:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0227D40575;
	Thu, 30 Dec 2021 16:01:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xr4OKfT9YE3A; Thu, 30 Dec 2021 16:01:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 13C72404C3;
	Thu, 30 Dec 2021 16:01:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BCACD1BF403
 for <buildroot@lists.busybox.net>; Thu, 30 Dec 2021 16:01:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AAFFB40574
 for <buildroot@lists.busybox.net>; Thu, 30 Dec 2021 16:01:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uTCqetG1SoDq for <buildroot@lists.busybox.net>;
 Thu, 30 Dec 2021 16:01:00 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id A5F80404C3
 for <buildroot@buildroot.org>; Thu, 30 Dec 2021 16:01:00 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 85F5D82DE2; Thu, 30 Dec 2021 15:55:08 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Thu, 30 Dec 2021 17:00:01 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8ec001b467e22904c0a7ec5780d83afd44ad78f3
X-Git-Newrev: 79c5f60ad5738a7f4887ae1a1e35a87d49e48b19
X-Patchwork-Hint: ignore
Message-Id: <20211230155508.85F5D82DE2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/utf8proc: bump version to 2.7.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=79c5f60ad5738a7f4887ae1a1e35a87d49e48b19
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes:
https://github.com/JuliaStrings/utf8proc/releases/tag/v2.7.0

Updated license hash due to copyright year bump:
https://github.com/JuliaStrings/utf8proc/commit/8ca6144c85c165987cb1c5d8395c7314e13d4cd7

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/utf8proc/utf8proc.hash | 4 ++--
 package/utf8proc/utf8proc.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/utf8proc/utf8proc.hash b/package/utf8proc/utf8proc.hash
index 2deff4e0c5..acc73903c8 100644
--- a/package/utf8proc/utf8proc.hash
+++ b/package/utf8proc/utf8proc.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  4c06a9dc4017e8a2438ef80ee371d45868bda2237a98b26554de7a95406b283b  utf8proc-2.6.1.tar.gz
-sha256  fbc720fcc90fb44396985646f67e4d19be03e0c0539f7138ed9dc6efba49dc49  LICENSE.md
+sha256  4bb121e297293c0fd55f08f83afab6d35d48f0af4ecc07523ad8ec99aa2b12a1  utf8proc-2.7.0.tar.gz
+sha256  3b510150d34f248a221bb88e1d811238d6c6c18b51231822c42974c39bb07256  LICENSE.md
diff --git a/package/utf8proc/utf8proc.mk b/package/utf8proc/utf8proc.mk
index bedd38ca53..707e553561 100644
--- a/package/utf8proc/utf8proc.mk
+++ b/package/utf8proc/utf8proc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UTF8PROC_VERSION = 2.6.1
+UTF8PROC_VERSION = 2.7.0
 UTF8PROC_SITE = $(call github,JuliaStrings,utf8proc,v$(UTF8PROC_VERSION))
 UTF8PROC_LICENSE = MIT
 UTF8PROC_LICENSE_FILES = LICENSE.md
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
