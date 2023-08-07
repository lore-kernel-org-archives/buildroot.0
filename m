Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE9CCC001DE
	for <buildroot@archiver.kernel.org>; Mon,  7 Aug 2023 21:23:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 69F3B40951;
	Mon,  7 Aug 2023 21:23:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 69F3B40951
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CWt8j3gtrYs0; Mon,  7 Aug 2023 21:23:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0C1A9402BD;
	Mon,  7 Aug 2023 21:23:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0C1A9402BD
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8EA481BF23C
 for <buildroot@lists.busybox.net>; Mon,  7 Aug 2023 21:23:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6756C40290
 for <buildroot@lists.busybox.net>; Mon,  7 Aug 2023 21:23:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6756C40290
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KntCNC0llp29 for <buildroot@lists.busybox.net>;
 Mon,  7 Aug 2023 21:23:17 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 74D2D4008E
 for <buildroot@buildroot.org>; Mon,  7 Aug 2023 21:23:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 74D2D4008E
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6291284712; Mon,  7 Aug 2023 21:23:17 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 7 Aug 2023 23:22:51 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 91fd26eabac2589f42a62a282a07e0f93c2bc58b
X-Git-Newrev: 18c60087c1b0e10bcbe16e405b83901d5be1fb3c
X-Patchwork-Hint: ignore
Message-Id: <20230807212317.6291284712@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/libcamera-apps: bump
 to version 1.2.1
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=18c60087c1b0e10bcbe16e405b83901d5be1fb3c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libcamera-apps/libcamera-apps.hash | 2 +-
 package/libcamera-apps/libcamera-apps.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libcamera-apps/libcamera-apps.hash b/package/libcamera-apps/libcamera-apps.hash
index 97fcef7ddf..1437a0e8fa 100644
--- a/package/libcamera-apps/libcamera-apps.hash
+++ b/package/libcamera-apps/libcamera-apps.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  49ace5382a0a9f8b05d20077fc0900b801fff83dae6ca9e3caa94dae16dbef27  libcamera-apps-1.2.0.tar.gz
+sha256  e6b74a0ba10a962f1930199d7dd828c8d9ee370dfe1fdfd8ae2638df744f1344  libcamera-apps-1.2.1.tar.gz
 sha256  36dfed86bdef661a0a14ec1a1cc84c771d5a06b6f9b92e9ebb610ba711bd528a  license.txt
diff --git a/package/libcamera-apps/libcamera-apps.mk b/package/libcamera-apps/libcamera-apps.mk
index 022e6055b5..2a217f095f 100644
--- a/package/libcamera-apps/libcamera-apps.mk
+++ b/package/libcamera-apps/libcamera-apps.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBCAMERA_APPS_VERSION = 1.2.0
+LIBCAMERA_APPS_VERSION = 1.2.1
 LIBCAMERA_APPS_SITE = $(call github,raspberrypi,libcamera-apps,v$(LIBCAMERA_APPS_VERSION))
 LIBCAMERA_APPS_LICENSE = BSD-2-Clause
 LIBCAMERA_APPS_LICENSE_FILES = license.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
