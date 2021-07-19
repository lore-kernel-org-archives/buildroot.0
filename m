Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39073C4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 23:53:37 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E7AFF61037
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 23:53:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E7AFF61037
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C39FB42371;
	Tue,  3 Aug 2021 23:53:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Yo3P4nBPkBwM; Tue,  3 Aug 2021 23:53:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 140374236D;
	Tue,  3 Aug 2021 23:53:35 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 135541BF349
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:18:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 91A2E40ED5
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gvk3VwuOBgEA for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:10:24 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0499040EDB
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:10:17 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 498CE878D7; Tue,  3 Aug 2021 21:10:10 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Mon, 19 Jul 2021 23:36:02 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: e8085cc813a395b319fc723b10f39db0077f7d77
X-Git-Newrev: ad0267f1a843db38d7d461774efb87a397612e61
X-Patchwork-Hint: ignore
Message-Id: <20210803211010.498CE878D7@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/hdparm: bump version
 to 9.62
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

commit: https://git.buildroot.net/buildroot/commit/?id=ad0267f1a843db38d7d461774efb87a397612e61
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Updated project site (old site was not updated since 2010) and package
help text.

Removed md5 hash.

Switched _SITE to https.

Release notes:
https://sourceforge.net/p/hdparm/news/2021/04/hdparm-961-is-released/
https://sourceforge.net/p/hdparm/news/2021/05/hdparm-962-is-released/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
