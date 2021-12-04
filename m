Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AFF6C433EF
	for <buildroot@archiver.kernel.org>; Sat,  4 Dec 2021 22:09:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EE808401AF;
	Sat,  4 Dec 2021 22:09:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0VQxw-6I3IMc; Sat,  4 Dec 2021 22:09:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3C313400E9;
	Sat,  4 Dec 2021 22:09:06 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 76ABD1BF3F7
 for <buildroot@lists.busybox.net>; Sat,  4 Dec 2021 22:09:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 62DAE605B7
 for <buildroot@lists.busybox.net>; Sat,  4 Dec 2021 22:09:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id F4cWkeim1v4S for <buildroot@lists.busybox.net>;
 Sat,  4 Dec 2021 22:09:04 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id AC6D6605B5
 for <buildroot@buildroot.org>; Sat,  4 Dec 2021 22:09:04 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 78C1D935CE; Sat,  4 Dec 2021 22:04:11 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sat, 4 Dec 2021 23:04:50 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: d3904da8ba3d620700f39867f6a1c4c391624b9e
X-Git-Newrev: 570b6deff906c24e6609c46ce69e00d9e8be04fc
X-Patchwork-Hint: ignore
Message-Id: <20211204220411.78C1D935CE@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/fswebcam: bump to
 release 20200725
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

commit: https://git.buildroot.net/buildroot/commit/?id=570b6deff906c24e6609c46ce69e00d9e8be04fc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Bump to latest release.

Signed-off-by: Eugen Hristev <eugen.hristev@microchip.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/fswebcam/fswebcam.hash | 2 +-
 package/fswebcam/fswebcam.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/fswebcam/fswebcam.hash b/package/fswebcam/fswebcam.hash
index bac1626785..6ecb0d9794 100644
--- a/package/fswebcam/fswebcam.hash
+++ b/package/fswebcam/fswebcam.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  5702771cee6e3fa0f2bbbb72ecf3e5a253ff458c1f648f7e7c0d477e39f0ec80  fswebcam-e9f8094b6a3d1a49f99b2abec4e6ab4df33e2e33.tar.gz
+sha256  d5439b2bf49bb634100d7e42ed9854f84bfd355c1d40bc3d4d81593eeadd8aee  fswebcam-20200725.tar.gz
 sha256  204d8eff92f95aac4df6c8122bc1505f468f3a901e5a4cc08940e0ede1938994  LICENSE
diff --git a/package/fswebcam/fswebcam.mk b/package/fswebcam/fswebcam.mk
index 3a5b8c9eef..12e7860e7b 100644
--- a/package/fswebcam/fswebcam.mk
+++ b/package/fswebcam/fswebcam.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FSWEBCAM_VERSION = e9f8094b6a3d1a49f99b2abec4e6ab4df33e2e33
+FSWEBCAM_VERSION = 20200725
 FSWEBCAM_SITE = $(call github,fsphil,fswebcam,$(FSWEBCAM_VERSION))
 FSWEBCAM_LICENSE = GPL-2.0
 FSWEBCAM_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
