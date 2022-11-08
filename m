Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E60FC433FE
	for <buildroot@archiver.kernel.org>; Tue,  8 Nov 2022 20:27:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 14A3C60E3A;
	Tue,  8 Nov 2022 20:27:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 14A3C60E3A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aeGzz69j8TV3; Tue,  8 Nov 2022 20:27:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DECC260D93;
	Tue,  8 Nov 2022 20:27:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DECC260D93
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 782F01BF3C6
 for <buildroot@lists.busybox.net>; Tue,  8 Nov 2022 20:27:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 51BDB404C1
 for <buildroot@lists.busybox.net>; Tue,  8 Nov 2022 20:27:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 51BDB404C1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XFAMdML0_DM4 for <buildroot@lists.busybox.net>;
 Tue,  8 Nov 2022 20:27:17 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4E8D2403B7
 for <buildroot@buildroot.org>; Tue,  8 Nov 2022 20:27:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4E8D2403B7
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3B45E81192; Tue,  8 Nov 2022 20:27:17 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 8 Nov 2022 21:16:40 +0100
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 3497886980ab00336449fdcb4334b4a2ab3a958e
X-Git-Newrev: 9ceed7b07737e77f4cd1fa91952bdca5c24bfd22
X-Patchwork-Hint: ignore
Message-Id: <20221108202717.3B45E81192@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/f2fs-tools: bump
 to version 1.15.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=9ceed7b07737e77f4cd1fa91952bdca5c24bfd22
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Update indention in hash file (two spaces)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 9267b0f14d3d5f4715bad444f44eae47d9d5627c)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/f2fs-tools/f2fs-tools.hash | 2 +-
 package/f2fs-tools/f2fs-tools.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/f2fs-tools/f2fs-tools.hash b/package/f2fs-tools/f2fs-tools.hash
index 8fc0242269..8d5ff31f0d 100644
--- a/package/f2fs-tools/f2fs-tools.hash
+++ b/package/f2fs-tools/f2fs-tools.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  619263d4e2022152a1472c1d912eaae104f20bd227ce0bb9d41d1d6608094bd1  f2fs-tools-1.14.0.tar.gz
+sha256  147d471040b44900283ce2c935f1d35d13d7f40008e7cb8fab2b69f54da01a4f  f2fs-tools-1.15.0.tar.gz
 sha256  662abb3a8a80b36ae7036c289dd1e03b361ee5dd2e6fd5211d0d8d029146449f  COPYING
diff --git a/package/f2fs-tools/f2fs-tools.mk b/package/f2fs-tools/f2fs-tools.mk
index ced283d25d..2c4ee9185b 100644
--- a/package/f2fs-tools/f2fs-tools.mk
+++ b/package/f2fs-tools/f2fs-tools.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-F2FS_TOOLS_VERSION = 1.14.0
+F2FS_TOOLS_VERSION = 1.15.0
 F2FS_TOOLS_SITE = https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs-tools.git/snapshot
 F2FS_TOOLS_CONF_ENV = ac_cv_file__git=no
 F2FS_TOOLS_DEPENDENCIES = host-pkgconf util-linux
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
