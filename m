Return-Path: <SRS0=sxUg=M3=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB192C19F3A
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 14:06:31 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8A9CB60E52
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 14:06:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8A9CB60E52
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 61E7260659;
	Wed,  4 Aug 2021 14:06:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id W4-iQBBD_Yp7; Wed,  4 Aug 2021 14:06:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 16CDB60661;
	Wed,  4 Aug 2021 14:06:27 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7EA4D1BF5E9
 for <buildroot@lists.busybox.net>; Wed,  4 Aug 2021 14:05:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7B7C460659
 for <buildroot@lists.busybox.net>; Wed,  4 Aug 2021 14:05:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dheOHQ0e5Uh7 for <buildroot@lists.busybox.net>;
 Wed,  4 Aug 2021 14:05:27 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9298760626
 for <buildroot@buildroot.org>; Wed,  4 Aug 2021 14:05:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 3ACDE8B545; Wed,  4 Aug 2021 14:05:18 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 4 Aug 2021 16:01:02 +0200
X-Git-Refname: refs/heads/2021.05.x
X-Git-Oldrev: 9c0c721fb005ce33fcf66fbe484eb7a5a2125c5f
X-Git-Newrev: 1b77509ed0b43ad1ad4e6ecd947d4d3c49b93aaf
X-Patchwork-Hint: ignore
Message-Id: <20210804140518.3ACDE8B545@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.05.x] package/hdparm: bump
 version to 9.62
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=1b77509ed0b43ad1ad4e6ecd947d4d3c49b93aaf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.05.x

Updated project site (old site was not updated since 2010) and package
help text.

Removed md5 hash.

Switched _SITE to https.

Release notes:
https://sourceforge.net/p/hdparm/news/2021/04/hdparm-961-is-released/
https://sourceforge.net/p/hdparm/news/2021/05/hdparm-962-is-released/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit ad0267f1a843db38d7d461774efb87a397612e61)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/hdparm/Config.in   | 4 ++--
 package/hdparm/hdparm.hash | 7 +++----
 package/hdparm/hdparm.mk   | 4 ++--
 3 files changed, 7 insertions(+), 8 deletions(-)

diff --git a/package/hdparm/Config.in b/package/hdparm/Config.in
index 52385b18ce..17ecb65ce9 100644
--- a/package/hdparm/Config.in
+++ b/package/hdparm/Config.in
@@ -2,6 +2,6 @@ config BR2_PACKAGE_HDPARM
 	bool "hdparm"
 	depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 	help
-	  hdparm - get/set hard disk parameters for Linux IDE drives.
+	  hdparm - get/set ATA/SATA drive parameters under Linux
 
-	  http://www.ibiblio.org/pub/Linux/system/hardware/
+	  https://sourceforge.net/projects/hdparm/
diff --git a/package/hdparm/hdparm.hash b/package/hdparm/hdparm.hash
index b35da45273..b37826caf2 100644
--- a/package/hdparm/hdparm.hash
+++ b/package/hdparm/hdparm.hash
@@ -1,6 +1,5 @@
-# From http://sourceforge.net/projects/hdparm/files/hdparm/
-md5  25a791d47236c58801f8b27074f3ef93  hdparm-9.60.tar.gz
-sha1  f15378cf533f79dbbc040cd77183137d24292ecc  hdparm-9.60.tar.gz
+# From https://sourceforge.net/projects/hdparm/files/hdparm/
+sha1  100b9a5551b71d87b446b415d56c5d45ac41d131  hdparm-9.62.tar.gz
 # Locally computed
-sha256  8397739c73e44d5ab96c4aef28fa9c0147276d53a1b5657ce04c4565cf6635cc  hdparm-9.60.tar.gz
+sha256  2c0f9d75cdbeda928a25a128cd3d0b7120445ec0910c0b29d4c1038ed1be777f  hdparm-9.62.tar.gz
 sha256  eae572b06d2733f5c65fbe81680ce2b8a109afee2bdd1a161343c772af0e82e1  LICENSE.TXT
diff --git a/package/hdparm/hdparm.mk b/package/hdparm/hdparm.mk
index d9470ef7f5..6a71c14fa7 100644
--- a/package/hdparm/hdparm.mk
+++ b/package/hdparm/hdparm.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-HDPARM_VERSION = 9.60
-HDPARM_SITE = http://downloads.sourceforge.net/project/hdparm/hdparm
+HDPARM_VERSION = 9.62
+HDPARM_SITE = https://downloads.sourceforge.net/project/hdparm/hdparm
 HDPARM_LICENSE = BSD-Style
 HDPARM_LICENSE_FILES = LICENSE.TXT
 
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
