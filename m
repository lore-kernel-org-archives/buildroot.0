Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A99DECAAD8
	for <buildroot@archiver.kernel.org>; Sun, 18 Sep 2022 21:14:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D7F9240436;
	Sun, 18 Sep 2022 21:14:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D7F9240436
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iXSRb9U4BZZI; Sun, 18 Sep 2022 21:14:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C98DA4019E;
	Sun, 18 Sep 2022 21:14:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C98DA4019E
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8FA9D1BF97F
 for <buildroot@lists.busybox.net>; Sun, 18 Sep 2022 21:13:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6AC244098A
 for <buildroot@lists.busybox.net>; Sun, 18 Sep 2022 21:13:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6AC244098A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bYhfj6sq0EDG for <buildroot@lists.busybox.net>;
 Sun, 18 Sep 2022 21:13:32 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6AB53408F1
 for <buildroot@buildroot.org>; Sun, 18 Sep 2022 21:13:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6AB53408F1
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 59E9185517; Sun, 18 Sep 2022 21:13:32 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 18 Sep 2022 23:09:25 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: b1b932f5f1ead3d4a616b5502e785325cc64f8ca
X-Git-Newrev: f3074146401ebe749a6b93492a107780e0314202
X-Patchwork-Hint: ignore
Message-Id: <20220918211332.59E9185517@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/qlibc: bump to
 version 2.4.6
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

commit: https://git.buildroot.net/buildroot/commit/?id=f3074146401ebe749a6b93492a107780e0314202
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

This is a maintenance release that includes improvements and bug fixes.

https://github.com/wolkykim/qlibc/releases/tag/v2.4.6

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 2de653832029877a7b1d166b86814fcd56e2d329)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/qlibc/qlibc.hash | 2 +-
 package/qlibc/qlibc.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/qlibc/qlibc.hash b/package/qlibc/qlibc.hash
index 6abb16b274..5cd6e1860f 100644
--- a/package/qlibc/qlibc.hash
+++ b/package/qlibc/qlibc.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  e195c97453c260acea4421146ba992d9a4d89732eac345b3765c43cc3326d2ad  qlibc-2.4.5.tar.gz
+sha256  bd98c19f96c0d374adb69c99627c80cf967b5e860c8a4f28c13fa1b0d652a06e  qlibc-2.4.6.tar.gz
 sha256  7c9d03656af4c0acf0a35e29459086498dd64080eac6d2945bc1c064aaf18132  LICENSE
diff --git a/package/qlibc/qlibc.mk b/package/qlibc/qlibc.mk
index 6cce8201bd..3996bb3706 100644
--- a/package/qlibc/qlibc.mk
+++ b/package/qlibc/qlibc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-QLIBC_VERSION = 2.4.5
+QLIBC_VERSION = 2.4.6
 QLIBC_SITE = $(call github,wolkykim,qlibc,v$(QLIBC_VERSION))
 QLIBC_LICENSE = BSD-2-Clause
 QLIBC_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
