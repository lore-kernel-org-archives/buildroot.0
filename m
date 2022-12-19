Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58AA3C61DA3
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 23:11:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 048BD82EBA;
	Mon, 20 Feb 2023 23:11:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 048BD82EBA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jAYM2gVDcq4z; Mon, 20 Feb 2023 23:11:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3F4DC82EDB;
	Mon, 20 Feb 2023 23:11:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3F4DC82EDB
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8965C1BF8C7
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:57:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 36EA5612CF
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 36EA5612CF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AKZiqR1_BrjV for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:13 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4611B612AC
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4611B612AC
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3EA8D828C8; Mon, 20 Feb 2023 20:52:13 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 19 Dec 2022 10:00:57 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: d4386b912db9f9f9a3cf5cbc9165e1609a55309f
X-Git-Newrev: 58bb71089e52323aea8696a5de2d7687422bde74
X-Patchwork-Hint: ignore
Message-Id: <20230220205213.3EA8D828C8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/gtest: bump to version
 1.12.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=58bb71089e52323aea8696a5de2d7687422bde74
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

https://github.com/google/googletest/releases/tag/release-1.12.1

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gtest/gtest.hash | 2 +-
 package/gtest/gtest.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/gtest/gtest.hash b/package/gtest/gtest.hash
index 1a93684aeb..a6dd15a8d2 100644
--- a/package/gtest/gtest.hash
+++ b/package/gtest/gtest.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  2a4f11dce6188b256f3650061525d0fe352069e5c162452818efbbf8d0b5fe1c  gtest-1.12.0.tar.gz
+sha256  81964fe578e9bd7c94dfdb09c8e4d6e6759e19967e397dbea48d1c10e45d0df2  gtest-1.12.1.tar.gz
 sha256  9702de7e4117a8e2b20dafab11ffda58c198aede066406496bef670d40a22138  LICENSE
diff --git a/package/gtest/gtest.mk b/package/gtest/gtest.mk
index 236c8f3730..a53253228e 100644
--- a/package/gtest/gtest.mk
+++ b/package/gtest/gtest.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GTEST_VERSION = 1.12.0
+GTEST_VERSION = 1.12.1
 GTEST_SITE = $(call github,google,googletest,release-$(GTEST_VERSION))
 GTEST_INSTALL_STAGING = YES
 GTEST_INSTALL_TARGET = NO
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
