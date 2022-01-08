Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09B53C433F5
	for <buildroot@archiver.kernel.org>; Sat,  8 Jan 2022 17:53:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BE6ED607F9;
	Sat,  8 Jan 2022 17:53:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kD3AYBLzn186; Sat,  8 Jan 2022 17:53:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 08EA860804;
	Sat,  8 Jan 2022 17:52:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 54C181BF2C6
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 17:52:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 42F31402EE
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 17:52:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3ZHl67cG-0OJ for <buildroot@lists.busybox.net>;
 Sat,  8 Jan 2022 17:52:56 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 92D2140908
 for <buildroot@buildroot.org>; Sat,  8 Jan 2022 17:52:56 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id D307B8324A; Sat,  8 Jan 2022 17:46:43 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 8 Jan 2022 18:52:44 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 03aa3e6ac71a0fe1ff87fe192c8de0b1acebd0df
X-Git-Newrev: babd5bdadbf249d8e0baa06987e33b042b2b3fe5
X-Patchwork-Hint: ignore
Message-Id: <20220108174643.D307B8324A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/liburcu: bump to version 0.13.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=babd5bdadbf249d8e0baa06987e33b042b2b3fe5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://github.com/urcu/userspace-rcu/blob/v0.13.1/ChangeLog

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/liburcu/liburcu.hash | 4 ++--
 package/liburcu/liburcu.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/liburcu/liburcu.hash b/package/liburcu/liburcu.hash
index 8ff11623d0..1968c3784e 100644
--- a/package/liburcu/liburcu.hash
+++ b/package/liburcu/liburcu.hash
@@ -1,5 +1,5 @@
-# http://www.lttng.org/files/urcu/userspace-rcu-0.13.0.tar.bz2.sha256
-sha256  cbb20dbe1a892c2a4d8898bac4316176e585392693d498766ccbbc68cf20ba20  userspace-rcu-0.13.0.tar.bz2
+# http://www.lttng.org/files/urcu/userspace-rcu-0.13.1.tar.bz2.sha256
+sha256  3213f33d2b8f710eb920eb1abb279ec04bf8ae6361f44f2513c28c20d3363083  userspace-rcu-0.13.1.tar.bz2
 
 # Hash for license files
 sha256  36b6d3fa47916943fd5fec313c584784946047ec1337a78b440e5992cb595f89  lgpl-2.1.txt
diff --git a/package/liburcu/liburcu.mk b/package/liburcu/liburcu.mk
index e29784abe4..895dd6bb66 100644
--- a/package/liburcu/liburcu.mk
+++ b/package/liburcu/liburcu.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBURCU_VERSION = 0.13.0
+LIBURCU_VERSION = 0.13.1
 LIBURCU_SITE = http://lttng.org/files/urcu
 LIBURCU_SOURCE = userspace-rcu-$(LIBURCU_VERSION).tar.bz2
 LIBURCU_LICENSE = LGPL-2.1+ (library), MIT-like (few source files listed in LICENSE), GPL-2.0+ (test), GPL-3.0 (few *.m4 files)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
