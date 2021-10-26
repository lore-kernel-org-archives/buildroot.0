Return-Path: <SRS0=o+05=PO=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A000C433EF
	for <buildroot@archiver.kernel.org>; Tue, 26 Oct 2021 19:38:47 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E9D9460F39
	for <buildroot@archiver.kernel.org>; Tue, 26 Oct 2021 19:38:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E9D9460F39
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BDCA160A3B;
	Tue, 26 Oct 2021 19:38:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Va268t4DKMQC; Tue, 26 Oct 2021 19:38:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4B088606AF;
	Tue, 26 Oct 2021 19:38:45 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D9EDD1BF3CD
 for <buildroot@lists.busybox.net>; Tue, 26 Oct 2021 19:38:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C006940275
 for <buildroot@lists.busybox.net>; Tue, 26 Oct 2021 19:38:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AYL7ogNQeB0X for <buildroot@lists.busybox.net>;
 Tue, 26 Oct 2021 19:38:07 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id D2E7E4011F
 for <buildroot@buildroot.org>; Tue, 26 Oct 2021 19:38:07 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id E145F88F06; Tue, 26 Oct 2021 19:34:44 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Tue, 26 Oct 2021 21:34:15 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 830e5227d4ba0f565a3a9e55a0409854918a0d4a
X-Git-Newrev: ff94c7220477bea2e1c8a287a4a255334a5a5354
X-Patchwork-Hint: ignore
Message-Id: <20211026193444.E145F88F06@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/motion: bump to version 4.4.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=ff94c7220477bea2e1c8a287a4a255334a5a5354
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Use LICENSE file added with
https://github.com/Motion-Project/motion/commit/34091a770c679da79f5be58f392020a8514521ee
instead of doc/COPYING removed with
https://github.com/Motion-Project/motion/commit/13d8fdc37c6ea42ef9c49ddc594e2b96d43cd36f

https://github.com/Motion-Project/motion/releases/tag/release-4.4.0

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/motion/motion.hash | 4 ++--
 package/motion/motion.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/motion/motion.hash b/package/motion/motion.hash
index 96ab1c4338..085ac90449 100644
--- a/package/motion/motion.hash
+++ b/package/motion/motion.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  dafa4264b2d8e4778f8be5871f09b6c0ec710d5a836182c583469c18db944d70  motion-4.3.2.tar.gz
-sha256  91df39d1816bfb17a4dda2d3d2c83b1f6f2d38d53e53e41e8f97ad5ac46a0cad  doc/COPYING
+sha256  3fb0d14fff8a8a143716223b5d2d55c0f52b11badf13a2e485b98bae3cf1b572  motion-4.4.0.tar.gz
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE
diff --git a/package/motion/motion.mk b/package/motion/motion.mk
index 29b70fd85f..dae812b9a4 100644
--- a/package/motion/motion.mk
+++ b/package/motion/motion.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-MOTION_VERSION = 4.3.2
+MOTION_VERSION = 4.4.0
 MOTION_SITE = $(call github,Motion-Project,motion,release-$(MOTION_VERSION))
 MOTION_LICENSE = GPL-2.0
-MOTION_LICENSE_FILES = doc/COPYING
+MOTION_LICENSE_FILES = LICENSE
 MOTION_DEPENDENCIES = host-pkgconf jpeg libmicrohttpd $(TARGET_NLS_DEPENDENCIES)
 # From git
 MOTION_AUTORECONF = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
