Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EEC4CAC5BB
	for <buildroot@archiver.kernel.org>; Sun,  5 Oct 2025 13:32:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F2E4741396;
	Sun,  5 Oct 2025 13:32:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8IGSMBDCvhs1; Sun,  5 Oct 2025 13:32:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0B5A9412F7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0B5A9412F7;
	Sun,  5 Oct 2025 13:32:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 13E3C272
 for <buildroot@buildroot.org>; Sun,  5 Oct 2025 13:32:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 054E2409F8
 for <buildroot@buildroot.org>; Sun,  5 Oct 2025 13:32:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Mxox6W4cUCLf for <buildroot@buildroot.org>;
 Sun,  5 Oct 2025 13:32:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 43DF8411BF
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 43DF8411BF
 for <buildroot@buildroot.org>; Sun,  5 Oct 2025 13:32:39 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3288B8683E; Sun,  5 Oct 2025 13:32:39 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 5 Oct 2025 15:31:14 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 15bf67b3af32e3fc09cd8a7e9f3d3c356461b964
X-Git-Newrev: 215133c0fc2819f059fbb35071ab2e0987f5107d
X-Patchwork-Hint: ignore
Message-Id: <20251005133239.3288B8683E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/fio: bump version to 3.41
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

commit: https://git.buildroot.net/buildroot/commit/?id=215133c0fc2819f059fbb35071ab2e0987f5107d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For change log since 3.38, see:
https://git.kernel.dk/cgit/fio/log/?h=fio-3.41

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/fio/fio.hash | 6 +++---
 package/fio/fio.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/fio/fio.hash b/package/fio/fio.hash
index 7bc8b76bc9..015f2e3fbe 100644
--- a/package/fio/fio.hash
+++ b/package/fio/fio.hash
@@ -1,8 +1,8 @@
 # From https://brick.kernel.dk/snaps/MD5SUMS
-md5  2223cf30dc799a838d92193aa5aa41d2  fio-3.38.tar.gz
+md5  3cd7ea766be83b560a14c909cdd35889  fio-3.41.tar.gz
 # Locally computed after checking gpg signature from
-# https://brick.kernel.dk/snaps/fio-3.38.tar.gz.asc
+# https://brick.kernel.dk/snaps/fio-3.41.tar.gz.asc
 # with key C0FC392DCADE26D975FA5E4AF7D358FB2971E0A6
-sha256  a5b63518558004292c7ec60fef90163f59957d7e1dce6f4cb87e9dc75d4dfc48  fio-3.38.tar.gz
+sha256  a40b45112005e30a67bab6be4860b198c35104a628b6ec4d15720d62b5d1bab9  fio-3.41.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
 sha256  8a240c1ad13d1fe3e58588643d81d0695899be4a669fe6d8fafa76ca6a89db2c  MORAL-LICENSE
diff --git a/package/fio/fio.mk b/package/fio/fio.mk
index 57a54dc34a..cb456587b0 100644
--- a/package/fio/fio.mk
+++ b/package/fio/fio.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FIO_VERSION = 3.38
+FIO_VERSION = 3.41
 FIO_SITE = https://brick.kernel.dk/snaps
 FIO_LICENSE = GPL-2.0
 FIO_LICENSE_FILES = COPYING MORAL-LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
