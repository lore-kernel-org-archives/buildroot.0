Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C87A0C00144
	for <buildroot@archiver.kernel.org>; Tue, 26 Jul 2022 21:49:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5ECE84032C;
	Tue, 26 Jul 2022 21:49:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5ECE84032C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id y3OqjbT5-el7; Tue, 26 Jul 2022 21:49:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1AA7E40213;
	Tue, 26 Jul 2022 21:49:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1AA7E40213
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 50D461BF59F
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 21:49:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 382D9606EC
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 21:49:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 382D9606EC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 32_PpAI54vOa for <buildroot@lists.busybox.net>;
 Tue, 26 Jul 2022 21:49:51 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 810E3605A6
 for <buildroot@buildroot.org>; Tue, 26 Jul 2022 21:49:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 810E3605A6
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id DCD1086391; Tue, 26 Jul 2022 21:36:06 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 26 Jul 2022 23:47:32 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 97cd3680a4cc4bc0c71bccccb1459eda4b880159
X-Git-Newrev: 9267b0f14d3d5f4715bad444f44eae47d9d5627c
X-Patchwork-Hint: ignore
Message-Id: <20220726213606.DCD1086391@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/f2fs-tools: bump to version 1.15.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=9267b0f14d3d5f4715bad444f44eae47d9d5627c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update indention in hash file (two spaces)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/f2fs-tools/f2fs-tools.hash | 4 ++--
 package/f2fs-tools/f2fs-tools.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/f2fs-tools/f2fs-tools.hash b/package/f2fs-tools/f2fs-tools.hash
index dedd884957..8d5ff31f0d 100644
--- a/package/f2fs-tools/f2fs-tools.hash
+++ b/package/f2fs-tools/f2fs-tools.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 619263d4e2022152a1472c1d912eaae104f20bd227ce0bb9d41d1d6608094bd1  f2fs-tools-1.14.0.tar.gz
-sha256 662abb3a8a80b36ae7036c289dd1e03b361ee5dd2e6fd5211d0d8d029146449f  COPYING
+sha256  147d471040b44900283ce2c935f1d35d13d7f40008e7cb8fab2b69f54da01a4f  f2fs-tools-1.15.0.tar.gz
+sha256  662abb3a8a80b36ae7036c289dd1e03b361ee5dd2e6fd5211d0d8d029146449f  COPYING
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
