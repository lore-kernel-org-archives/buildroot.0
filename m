Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5F44EB64DA
	for <buildroot@archiver.kernel.org>; Mon, 10 Jul 2023 17:45:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4B5B6820B7;
	Mon, 10 Jul 2023 17:45:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4B5B6820B7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 82TE0QKOS_nn; Mon, 10 Jul 2023 17:45:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7FC9481FAA;
	Mon, 10 Jul 2023 17:45:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7FC9481FAA
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4B7C11BF3D4
 for <buildroot@lists.busybox.net>; Mon, 10 Jul 2023 17:45:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 315E44179A
 for <buildroot@lists.busybox.net>; Mon, 10 Jul 2023 17:45:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 315E44179A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Df2eGRnxf48s for <buildroot@lists.busybox.net>;
 Mon, 10 Jul 2023 17:45:25 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 46B8C4177F
 for <buildroot@buildroot.org>; Mon, 10 Jul 2023 17:45:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 46B8C4177F
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1CD7686C78; Mon, 10 Jul 2023 17:45:25 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 10 Jul 2023 19:42:34 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ea7caf9c47fb271d24b8bec6df08d6b60596759a
X-Git-Newrev: c7d1e92b1cbbb67cebea8e43d087fcc1aab657e7
X-Patchwork-Hint: ignore
Message-Id: <20230710174525.1CD7686C78@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libcamera-apps: bump to version
 1.2.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=c7d1e92b1cbbb67cebea8e43d087fcc1aab657e7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libcamera-apps/libcamera-apps.hash | 2 +-
 package/libcamera-apps/libcamera-apps.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libcamera-apps/libcamera-apps.hash b/package/libcamera-apps/libcamera-apps.hash
index 20a06aa8fe..97fcef7ddf 100644
--- a/package/libcamera-apps/libcamera-apps.hash
+++ b/package/libcamera-apps/libcamera-apps.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  a19f3960b97ec1c0d42df8af972868ff0d4c48be6096e7ac02dbaaa4c7c75636  libcamera-apps-1.1.2.tar.gz
+sha256  49ace5382a0a9f8b05d20077fc0900b801fff83dae6ca9e3caa94dae16dbef27  libcamera-apps-1.2.0.tar.gz
 sha256  36dfed86bdef661a0a14ec1a1cc84c771d5a06b6f9b92e9ebb610ba711bd528a  license.txt
diff --git a/package/libcamera-apps/libcamera-apps.mk b/package/libcamera-apps/libcamera-apps.mk
index 592773eec8..022e6055b5 100644
--- a/package/libcamera-apps/libcamera-apps.mk
+++ b/package/libcamera-apps/libcamera-apps.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBCAMERA_APPS_VERSION = 1.1.2
+LIBCAMERA_APPS_VERSION = 1.2.0
 LIBCAMERA_APPS_SITE = $(call github,raspberrypi,libcamera-apps,v$(LIBCAMERA_APPS_VERSION))
 LIBCAMERA_APPS_LICENSE = BSD-2-Clause
 LIBCAMERA_APPS_LICENSE_FILES = license.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
