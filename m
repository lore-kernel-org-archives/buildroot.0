Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 252B7C61DA3
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 23:07:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D13DE8257D;
	Mon, 20 Feb 2023 23:07:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D13DE8257D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id F-_S98NNJjKF; Mon, 20 Feb 2023 23:07:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 09661828F7;
	Mon, 20 Feb 2023 23:07:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 09661828F7
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5EF921BF2E3
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:56:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3001A612D5
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3001A612D5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wGqXim0ojwdE for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:12 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 53D656129D
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 53D656129D
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 51D9C828C8; Mon, 20 Feb 2023 20:52:12 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 18 Dec 2022 14:55:35 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: af9454f8c1ca7f9dd02daaeb81a52690fac79a22
X-Git-Newrev: 6081a48f0f6a238236091fb1b302848997e96f72
X-Patchwork-Hint: ignore
Message-Id: <20230220205212.51D9C828C8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/motion: bump to
 version 4.5.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=6081a48f0f6a238236091fb1b302848997e96f72
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

https://github.com/Motion-Project/motion/releases/tag/release-4.5.1

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/motion/motion.hash | 2 +-
 package/motion/motion.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/motion/motion.hash b/package/motion/motion.hash
index 9b99256864..21f74b481f 100644
--- a/package/motion/motion.hash
+++ b/package/motion/motion.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  42320a1c7b54a3f0b5a49cecf34a5d752760b28383bc573b3ca1240581786fe5  motion-4.5.0.tar.gz
+sha256  0c824276bb23565b7cf10409ebdcb46b85fb1f6abca957252e52290bb1fe473e  motion-4.5.1.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE
diff --git a/package/motion/motion.mk b/package/motion/motion.mk
index 18fe0eb630..4e9ccdc3f7 100644
--- a/package/motion/motion.mk
+++ b/package/motion/motion.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MOTION_VERSION = 4.5.0
+MOTION_VERSION = 4.5.1
 MOTION_SITE = $(call github,Motion-Project,motion,release-$(MOTION_VERSION))
 MOTION_LICENSE = GPL-2.0
 MOTION_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
