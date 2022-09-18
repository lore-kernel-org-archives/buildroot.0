Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCC25C6FA82
	for <buildroot@archiver.kernel.org>; Sun, 18 Sep 2022 21:12:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6721A60BFA;
	Sun, 18 Sep 2022 21:12:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6721A60BFA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eX4o70PNOATz; Sun, 18 Sep 2022 21:12:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 943A460AE8;
	Sun, 18 Sep 2022 21:12:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 943A460AE8
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7B9CE1BF3C4
 for <buildroot@lists.busybox.net>; Sun, 18 Sep 2022 21:12:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6483D60AE8
 for <buildroot@lists.busybox.net>; Sun, 18 Sep 2022 21:12:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6483D60AE8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8pTYYfiyKYJP for <buildroot@lists.busybox.net>;
 Sun, 18 Sep 2022 21:12:20 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 96E8C60AE6
 for <buildroot@buildroot.org>; Sun, 18 Sep 2022 21:12:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 96E8C60AE6
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 84DB1854C7; Sun, 18 Sep 2022 21:12:20 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 18 Sep 2022 23:09:17 +0200
X-Git-Refname: refs/heads/2022.05.x
X-Git-Oldrev: fac58c23fc2aee59cbce4cd4a3b65ee642cf8f18
X-Git-Newrev: c867e437e2cdc6ddb4f83c66dcae4b4b46881555
X-Patchwork-Hint: ignore
Message-Id: <20220918211220.84DB1854C7@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.05.x] package/qlibc: bump to
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

commit: https://git.buildroot.net/buildroot/commit/?id=c867e437e2cdc6ddb4f83c66dcae4b4b46881555
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.05.x

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
