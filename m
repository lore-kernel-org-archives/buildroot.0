Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EA83C77B73
	for <buildroot@archiver.kernel.org>; Sun, 23 Apr 2023 09:51:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BD196417F7;
	Sun, 23 Apr 2023 09:51:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BD196417F7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id W01cV5ScP52v; Sun, 23 Apr 2023 09:51:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 722584182C;
	Sun, 23 Apr 2023 09:51:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 722584182C
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 16E0E1C2B8E
 for <buildroot@lists.busybox.net>; Sun, 23 Apr 2023 09:50:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E5125402F6
 for <buildroot@lists.busybox.net>; Sun, 23 Apr 2023 09:50:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E5125402F6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iaQEDzbsUVIo for <buildroot@lists.busybox.net>;
 Sun, 23 Apr 2023 09:50:41 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1C128400D9
 for <buildroot@buildroot.org>; Sun, 23 Apr 2023 09:50:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1C128400D9
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0C602843A5; Sun, 23 Apr 2023 09:50:41 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 23 Apr 2023 11:45:41 +0200
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: d2b0ce01ba55cb32c01867aa93110cf5f72a07e1
X-Git-Newrev: cec14f3328bd7ea2d5c6762eb186d5161255084f
X-Patchwork-Hint: ignore
Message-Id: <20230423095041.0C602843A5@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/mali-driver: bump
 to version 2023-04-04
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

commit: https://git.buildroot.net/buildroot/commit/?id=cec14f3328bd7ea2d5c6762eb186d5161255084f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

This versions fixed build failure on Linux 6.1

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit b713a230c54559637baea065b731748201e19c1a)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mali-driver/mali-driver.hash | 2 +-
 package/mali-driver/mali-driver.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mali-driver/mali-driver.hash b/package/mali-driver/mali-driver.hash
index 5d32c1af8a..de3b6e69f0 100644
--- a/package/mali-driver/mali-driver.hash
+++ b/package/mali-driver/mali-driver.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  761e3f000b4c546cbd35baf34f5a0d1090f048dd44ee543773674192fd95f6b3  mali-driver-87c13e6994b20b5068e3a5e4f4c1b64db666a4c8.tar.gz
+sha256  763d3cf76eb03584df6a13986a2877dc0ae5f310fc3d91e8a498fc5f89271dcc  mali-driver-c90627f78d58567a2acb7cbf77d565e03a131294.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE
diff --git a/package/mali-driver/mali-driver.mk b/package/mali-driver/mali-driver.mk
index bdc9fedeb4..8e059fe8bd 100644
--- a/package/mali-driver/mali-driver.mk
+++ b/package/mali-driver/mali-driver.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MALI_DRIVER_VERSION = 87c13e6994b20b5068e3a5e4f4c1b64db666a4c8
+MALI_DRIVER_VERSION = c90627f78d58567a2acb7cbf77d565e03a131294
 MALI_DRIVER_SITE = $(call github,bootlin,mali-driver,$(MALI_DRIVER_VERSION))
 MALI_DRIVER_DEPENDENCIES = linux
 MALI_DRIVER_LICENSE = GPL-2.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
