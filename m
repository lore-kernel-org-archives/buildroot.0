Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79A9ECAC592
	for <buildroot@archiver.kernel.org>; Mon, 22 Sep 2025 19:53:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2F90C83D82;
	Mon, 22 Sep 2025 19:53:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 97dUGuCeaEn1; Mon, 22 Sep 2025 19:53:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 466FD84731
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 466FD84731;
	Mon, 22 Sep 2025 19:53:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 8629D116C
 for <buildroot@buildroot.org>; Mon, 22 Sep 2025 19:53:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6492B84731
 for <buildroot@buildroot.org>; Mon, 22 Sep 2025 19:53:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9qy45HBF0AET for <buildroot@buildroot.org>;
 Mon, 22 Sep 2025 19:53:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BCBEA83D82
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id BCBEA83D82
 for <buildroot@buildroot.org>; Mon, 22 Sep 2025 19:53:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AD084861DC; Mon, 22 Sep 2025 19:53:50 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 22 Sep 2025 21:44:25 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 817611686a12535aaa15b3e930be0dab95b9b60c
X-Git-Newrev: 34cd1b1d8ebc01d54aa987b9921b1b0923a3dafb
X-Patchwork-Hint: ignore
Message-Id: <20250922195350.AD084861DC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/rtl_433: bump to version 25.02
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=34cd1b1d8ebc01d54aa987b9921b1b0923a3dafb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For details, see the release notes:
https://github.com/merbanan/rtl_433/releases/tag/25.02

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/rtl_433/rtl_433.hash | 2 +-
 package/rtl_433/rtl_433.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rtl_433/rtl_433.hash b/package/rtl_433/rtl_433.hash
index 3a00e0cae7..30f60a82f7 100644
--- a/package/rtl_433/rtl_433.hash
+++ b/package/rtl_433/rtl_433.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  1260c58400bf35832ac1b76cb3cccf3dc1335ffa2416909c63c7d7060c74663b  rtl_433-23.11.tar.gz
+sha256  5a409ea10e6d3d7d4aa5ea91d2d6cc92ebb2d730eb229c7b37ade65458223432  rtl_433-25.02.tar.gz
 # License file, locally calculated
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
diff --git a/package/rtl_433/rtl_433.mk b/package/rtl_433/rtl_433.mk
index 60f90a94c7..08735be850 100644
--- a/package/rtl_433/rtl_433.mk
+++ b/package/rtl_433/rtl_433.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RTL_433_VERSION = 23.11
+RTL_433_VERSION = 25.02
 RTL_433_SITE = $(call github,merbanan,rtl_433,$(RTL_433_VERSION))
 RTL_433_LICENSE = GPL-2.0+
 RTL_433_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
