Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CF37C71135
	for <buildroot@archiver.kernel.org>; Sun, 15 Jun 2025 21:52:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 53BE580819;
	Sun, 15 Jun 2025 21:52:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id a-BvyAWls3Re; Sun, 15 Jun 2025 21:52:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5FA958080D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5FA958080D;
	Sun, 15 Jun 2025 21:52:56 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id E4B6C231
 for <buildroot@buildroot.org>; Sun, 15 Jun 2025 21:52:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C75896066B
 for <buildroot@buildroot.org>; Sun, 15 Jun 2025 21:52:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cKbeX-lV4nlv for <buildroot@buildroot.org>;
 Sun, 15 Jun 2025 21:52:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 218F6605EF
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 218F6605EF
 for <buildroot@buildroot.org>; Sun, 15 Jun 2025 21:52:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0CC2D83B35; Sun, 15 Jun 2025 21:52:53 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sun, 15 Jun 2025 23:40:09 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c1a87ee62cb3e0a20d00600f663c48abd45ec926
X-Git-Newrev: c967602d27f5c2368d63966a5253fc7b0b17cda9
X-Patchwork-Hint: ignore
Message-Id: <20250615215253.0CC2D83B35@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ltp-testsuite: bump version to
 20250530
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

commit: https://git.buildroot.net/buildroot/commit/?id=c967602d27f5c2368d63966a5253fc7b0b17cda9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changelog: https://github.com/linux-test-project/ltp/releases/tag/20250530

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
[Julien: add link to change log]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/ltp-testsuite/ltp-testsuite.hash | 4 ++--
 package/ltp-testsuite/ltp-testsuite.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/ltp-testsuite/ltp-testsuite.hash b/package/ltp-testsuite/ltp-testsuite.hash
index 688346fef2..8ffde75e37 100644
--- a/package/ltp-testsuite/ltp-testsuite.hash
+++ b/package/ltp-testsuite/ltp-testsuite.hash
@@ -1,4 +1,4 @@
-# From: https://github.com/linux-test-project/ltp/releases/download/20250130/ltp-full-20250130.tar.xz.sha256
-sha256  02e4ec326be54c3fd92968229a468c02c665d168a8a673edc38a891f7395ae10  ltp-full-20250130.tar.xz
+# From: https://github.com/linux-test-project/ltp/releases/download/20250530/ltp-full-20250530.tar.xz.sha256
+sha256  27586ba78eac1e40cd422add2842f1ad70f09fea55da3bd6a25e10feb786d4f2  ltp-full-20250530.tar.xz
 # Locally computed
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/ltp-testsuite/ltp-testsuite.mk b/package/ltp-testsuite/ltp-testsuite.mk
index f5d577e444..1a401c0421 100644
--- a/package/ltp-testsuite/ltp-testsuite.mk
+++ b/package/ltp-testsuite/ltp-testsuite.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LTP_TESTSUITE_VERSION = 20250130
+LTP_TESTSUITE_VERSION = 20250530
 LTP_TESTSUITE_SOURCE = ltp-full-$(LTP_TESTSUITE_VERSION).tar.xz
 LTP_TESTSUITE_SITE = https://github.com/linux-test-project/ltp/releases/download/$(LTP_TESTSUITE_VERSION)
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
