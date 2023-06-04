Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3525C7EE29
	for <buildroot@archiver.kernel.org>; Sun,  4 Jun 2023 10:55:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 66AE941BBA;
	Sun,  4 Jun 2023 10:55:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 66AE941BBA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VlFWspg5iFcK; Sun,  4 Jun 2023 10:55:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 452DD41857;
	Sun,  4 Jun 2023 10:55:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 452DD41857
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D0CD41BF3B5
 for <buildroot@lists.busybox.net>; Sun,  4 Jun 2023 10:54:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9896441BA5
 for <buildroot@lists.busybox.net>; Sun,  4 Jun 2023 10:54:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9896441BA5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VKEDcLKBGo1y for <buildroot@lists.busybox.net>;
 Sun,  4 Jun 2023 10:54:55 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 56EF541742
 for <buildroot@buildroot.org>; Sun,  4 Jun 2023 10:54:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 56EF541742
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4673F86AE6; Sun,  4 Jun 2023 10:54:54 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 4 Jun 2023 12:54:24 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 108bb3395b5ed2abe1c3c5a20fb9205dfc672b54
X-Git-Newrev: fe567a81846b35b17c6989d759c2d893e46bc023
X-Patchwork-Hint: ignore
Message-Id: <20230604105454.4673F86AE6@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/strace: bump to
 version 6.3
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

commit: https://git.buildroot.net/buildroot/commit/?id=fe567a81846b35b17c6989d759c2d893e46bc023
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/strace/strace.hash | 4 ++--
 package/strace/strace.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/strace/strace.hash b/package/strace/strace.hash
index d49abf1f16..555d074c5d 100644
--- a/package/strace/strace.hash
+++ b/package/strace/strace.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking signature with RSA key 0xA8041FA839E16E36
-# https://strace.io/files/6.2/strace-6.2.tar.xz.asc
-sha256  0c7d38a449416268d3004029a220a15a77c2206a03cc88120f37f46e949177e8  strace-6.2.tar.xz
+# https://strace.io/files/6.3/strace-6.3.tar.xz.asc
+sha256  e17878e301506c1cc301611118ad14efee7f8bcef63b27ace5d290acce7bb731  strace-6.3.tar.xz
 sha256  d92f973d08c8466993efff1e500453add0c038c20b4d2cbce3297938a296aea9  COPYING
 sha256  7c379436436a562834aa7d2f5dcae1f80a25230fa74201046ca1fba4367d39aa  LGPL-2.1-or-later
diff --git a/package/strace/strace.mk b/package/strace/strace.mk
index 730a91d277..6514bfe354 100644
--- a/package/strace/strace.mk
+++ b/package/strace/strace.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-STRACE_VERSION = 6.2
+STRACE_VERSION = 6.3
 STRACE_SOURCE = strace-$(STRACE_VERSION).tar.xz
 STRACE_SITE = https://github.com/strace/strace/releases/download/v$(STRACE_VERSION)
 STRACE_LICENSE = LGPL-2.1+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
