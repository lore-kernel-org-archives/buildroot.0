Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66117C43334
	for <buildroot@archiver.kernel.org>; Thu,  2 Jun 2022 14:10:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1DB5540647;
	Thu,  2 Jun 2022 14:10:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QDtJ4TFjkrZe; Thu,  2 Jun 2022 14:10:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 37135405CB;
	Thu,  2 Jun 2022 14:10:32 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6FFAA1C1135
 for <buildroot@lists.busybox.net>; Thu,  2 Jun 2022 14:10:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5FCF46100A
 for <buildroot@lists.busybox.net>; Thu,  2 Jun 2022 14:10:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jUwIBCwVUJ92 for <buildroot@lists.busybox.net>;
 Thu,  2 Jun 2022 14:10:17 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9BA8061014
 for <buildroot@buildroot.org>; Thu,  2 Jun 2022 14:10:17 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 798E5869FF; Thu,  2 Jun 2022 13:58:37 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 2 Jun 2022 16:04:54 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: d6f2af555fbc595b22fda1c737ab192a57e7b5a6
X-Git-Newrev: 85179d80c349008405f3213cf835f9be7c84de94
X-Patchwork-Hint: ignore
Message-Id: <20220602135837.798E5869FF@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/libnspr: bump to
 version 4.34
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

commit: https://git.buildroot.net/buildroot/commit/?id=85179d80c349008405f3213cf835f9be7c84de94
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Unfortunately local patch is still pending upstream. I've just pinged
them:
https://bugzilla.mozilla.org/show_bug.cgi?id=1765100

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libnspr/libnspr.hash | 4 ++--
 package/libnspr/libnspr.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libnspr/libnspr.hash b/package/libnspr/libnspr.hash
index 0064a9b279..4795b52aaf 100644
--- a/package/libnspr/libnspr.hash
+++ b/package/libnspr/libnspr.hash
@@ -1,4 +1,4 @@
-# From https://ftp.mozilla.org/pub/nspr/releases/v4.33/src/SHA256SUMS
-sha256  b23ee315be0e50c2fb1aa374d17f2d2d9146a835b1a79c1918ea15d075a693d7  nspr-4.33.tar.gz
+# From https://ftp.mozilla.org/pub/nspr/releases/v4.34/src/SHA256SUMS
+sha256  beef011cd15d8f40794984d17014366513cec5719bf1a78f5e8a3e3a1cebf99c  nspr-4.34.tar.gz
 # Locally calculated
 sha256  fab3dd6bdab226f1c08630b1dd917e11fcb4ec5e1e020e2c16f83a0a13863e85  nspr/LICENSE
diff --git a/package/libnspr/libnspr.mk b/package/libnspr/libnspr.mk
index 7491d18884..5d64d110ef 100644
--- a/package/libnspr/libnspr.mk
+++ b/package/libnspr/libnspr.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBNSPR_VERSION = 4.33
+LIBNSPR_VERSION = 4.34
 LIBNSPR_SOURCE = nspr-$(LIBNSPR_VERSION).tar.gz
 LIBNSPR_SITE = https://ftp.mozilla.org/pub/mozilla.org/nspr/releases/v$(LIBNSPR_VERSION)/src
 LIBNSPR_SUBDIR = nspr
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
