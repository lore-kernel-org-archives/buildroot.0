Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2308CC4332F
	for <buildroot@archiver.kernel.org>; Sat,  4 Nov 2023 20:44:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CD63B608A6;
	Sat,  4 Nov 2023 20:44:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CD63B608A6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id djeRCcx5aErO; Sat,  4 Nov 2023 20:44:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1FAE3607E3;
	Sat,  4 Nov 2023 20:44:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1FAE3607E3
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E13391BF584
 for <buildroot@lists.busybox.net>; Sat,  4 Nov 2023 20:44:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BAE2F81FEC
 for <buildroot@lists.busybox.net>; Sat,  4 Nov 2023 20:44:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BAE2F81FEC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id A5JntnQLz7kA for <buildroot@lists.busybox.net>;
 Sat,  4 Nov 2023 20:44:17 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id F218281FE8
 for <buildroot@buildroot.org>; Sat,  4 Nov 2023 20:44:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F218281FE8
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E022581EAD; Sat,  4 Nov 2023 20:44:16 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 4 Nov 2023 21:42:46 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5b139e2a8ded312e3b4a0939b35e6888a3d73076
X-Git-Newrev: a29c3144a49758f7c9cd9ff5cbb8e446bfc605f1
X-Patchwork-Hint: ignore
Message-Id: <20231104204416.E022581EAD@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/petitboot: bump to version 1.14
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

commit: https://git.buildroot.net/buildroot/commit/?id=a29c3144a49758f7c9cd9ff5cbb8e446bfc605f1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Laurent Vivier <laurent@vivier.eu>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/petitboot/petitboot.hash | 2 +-
 package/petitboot/petitboot.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/petitboot/petitboot.hash b/package/petitboot/petitboot.hash
index bf7bf56a67..a9a21f2c1b 100644
--- a/package/petitboot/petitboot.hash
+++ b/package/petitboot/petitboot.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  b42ae4fb2a81e9cf68f727c3f54c6312788c654bd97628ec9ba61b19a68990e6  petitboot-v1.13.tar.gz
+sha256  fa2367370d3ce5dd9910ab08a0832071e2508c8bf75cfec6d3b9807fbefc507a  petitboot-v1.14.tar.gz
 sha256  204d8eff92f95aac4df6c8122bc1505f468f3a901e5a4cc08940e0ede1938994  COPYING
diff --git a/package/petitboot/petitboot.mk b/package/petitboot/petitboot.mk
index 8d220f88f4..0992111cb1 100644
--- a/package/petitboot/petitboot.mk
+++ b/package/petitboot/petitboot.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PETITBOOT_VERSION = 1.13
+PETITBOOT_VERSION = 1.14
 PETITBOOT_SOURCE = petitboot-v$(PETITBOOT_VERSION).tar.gz
 PETITBOOT_SITE = https://github.com/open-power/petitboot/releases/download/v$(PETITBOOT_VERSION)
 PETITBOOT_DEPENDENCIES = elfutils ncurses udev host-bison host-flex lvm2
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
