Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51955C4332F
	for <buildroot@archiver.kernel.org>; Sat, 15 Oct 2022 15:47:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E3F574157D;
	Sat, 15 Oct 2022 15:47:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E3F574157D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sRuQycgK_GGR; Sat, 15 Oct 2022 15:47:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9782840934;
	Sat, 15 Oct 2022 15:47:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9782840934
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 515A91BF962
 for <buildroot@lists.busybox.net>; Sat, 15 Oct 2022 15:46:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2D48E81B52
 for <buildroot@lists.busybox.net>; Sat, 15 Oct 2022 15:46:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2D48E81B52
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id f1yls1UD-mdp for <buildroot@lists.busybox.net>;
 Sat, 15 Oct 2022 15:46:45 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5F7A481B48
 for <buildroot@buildroot.org>; Sat, 15 Oct 2022 15:46:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5F7A481B48
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4E54086DF8; Sat, 15 Oct 2022 15:46:45 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 15 Oct 2022 17:46:05 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 25f45d54aa0936bac685cb96bf81165d461284f3
X-Git-Newrev: 7131dee4b6d73c434b328b3b6b0e95d3f21ae956
X-Patchwork-Hint: ignore
Message-Id: <20221015154645.4E54086DF8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/hdparm: bump version to 9.65
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

commit: https://git.buildroot.net/buildroot/commit/?id=7131dee4b6d73c434b328b3b6b0e95d3f21ae956
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes: https://sourceforge.net/p/hdparm/news/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/hdparm/hdparm.hash | 4 ++--
 package/hdparm/hdparm.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/hdparm/hdparm.hash b/package/hdparm/hdparm.hash
index b86afc7cfe..1d73585232 100644
--- a/package/hdparm/hdparm.hash
+++ b/package/hdparm/hdparm.hash
@@ -1,5 +1,5 @@
 # From https://sourceforge.net/projects/hdparm/files/hdparm/
-sha1  c8e24233b4d29506907ad2bf0725f793106c3a78  hdparm-9.63.tar.gz
+sha1  3bc0916493f2f485c6371ec0fd16418d0e1fa636  hdparm-9.65.tar.gz
 # Locally computed
-sha256  70785deaebba5877a89c123568b41dee990da55fc51420f13f609a1072899691  hdparm-9.63.tar.gz
+sha256  d14929f910d060932e717e9382425d47c2e7144235a53713d55a94f7de535a4b  hdparm-9.65.tar.gz
 sha256  eae572b06d2733f5c65fbe81680ce2b8a109afee2bdd1a161343c772af0e82e1  LICENSE.TXT
diff --git a/package/hdparm/hdparm.mk b/package/hdparm/hdparm.mk
index 2c3b372deb..3c8b77e5eb 100644
--- a/package/hdparm/hdparm.mk
+++ b/package/hdparm/hdparm.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-HDPARM_VERSION = 9.63
+HDPARM_VERSION = 9.65
 HDPARM_SITE = https://downloads.sourceforge.net/project/hdparm/hdparm
 HDPARM_LICENSE = BSD-Style
 HDPARM_LICENSE_FILES = LICENSE.TXT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
