Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A4FCC433F5
	for <buildroot@archiver.kernel.org>; Fri, 24 Dec 2021 17:14:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3B0DA83E0A;
	Fri, 24 Dec 2021 17:14:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2_FoJ9WQYrze; Fri, 24 Dec 2021 17:14:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9401083E05;
	Fri, 24 Dec 2021 17:14:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id DA37B1BF2A4
 for <buildroot@lists.busybox.net>; Fri, 24 Dec 2021 17:14:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D7BEC41699
 for <buildroot@lists.busybox.net>; Fri, 24 Dec 2021 17:14:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gHR1ElURpE5H for <buildroot@lists.busybox.net>;
 Fri, 24 Dec 2021 17:14:51 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2FED041653
 for <buildroot@buildroot.org>; Fri, 24 Dec 2021 17:14:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 7BB3B81848; Fri, 24 Dec 2021 17:09:12 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Fri, 24 Dec 2021 18:14:33 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 733bf73e3ff86dd80e68e22c0ccc2f43e4a3d475
X-Git-Newrev: 05ea47d9b008eef722642402964dcfb2a2fbccbd
X-Patchwork-Hint: ignore
Message-Id: <20211224170912.7BB3B81848@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/kodi-pvr-hdhomerun: bump version
 to 19.0.1-Matrix
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

commit: https://git.buildroot.net/buildroot/commit/?id=05ea47d9b008eef722642402964dcfb2a2fbccbd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/kodi-pvr-hdhomerun/kodi-pvr-hdhomerun.hash | 2 +-
 package/kodi-pvr-hdhomerun/kodi-pvr-hdhomerun.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/kodi-pvr-hdhomerun/kodi-pvr-hdhomerun.hash b/package/kodi-pvr-hdhomerun/kodi-pvr-hdhomerun.hash
index 8409c222b1..68e0f9cccd 100644
--- a/package/kodi-pvr-hdhomerun/kodi-pvr-hdhomerun.hash
+++ b/package/kodi-pvr-hdhomerun/kodi-pvr-hdhomerun.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  c3692e70b96f229115f3fc545232885066224a801ada052b8c20633c210e76bc  kodi-pvr-hdhomerun-19.0.0-Matrix.tar.gz
+sha256  5a4b95634c9da13e526e7dab5a20e5ffc1c7361a67357658bf5ba085df4f2541  kodi-pvr-hdhomerun-19.0.1-Matrix.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-pvr-hdhomerun/kodi-pvr-hdhomerun.mk b/package/kodi-pvr-hdhomerun/kodi-pvr-hdhomerun.mk
index 1b5a71d015..1df0d6c108 100644
--- a/package/kodi-pvr-hdhomerun/kodi-pvr-hdhomerun.mk
+++ b/package/kodi-pvr-hdhomerun/kodi-pvr-hdhomerun.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_PVR_HDHOMERUN_VERSION = 19.0.0-Matrix
+KODI_PVR_HDHOMERUN_VERSION = 19.0.1-Matrix
 KODI_PVR_HDHOMERUN_SITE = $(call github,kodi-pvr,pvr.hdhomerun,$(KODI_PVR_HDHOMERUN_VERSION))
 KODI_PVR_HDHOMERUN_LICENSE = GPL-2.0+
 KODI_PVR_HDHOMERUN_LICENSE_FILES = LICENSE.md
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
