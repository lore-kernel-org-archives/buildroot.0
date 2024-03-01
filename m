Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D7ECC5478C
	for <buildroot@archiver.kernel.org>; Fri,  1 Mar 2024 08:34:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5B79E60832;
	Fri,  1 Mar 2024 08:34:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0K7KcECTmfs8; Fri,  1 Mar 2024 08:34:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3EC536079A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3EC536079A;
	Fri,  1 Mar 2024 08:34:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 366371BF377
 for <buildroot@lists.busybox.net>; Fri,  1 Mar 2024 08:34:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 212E282B69
 for <buildroot@lists.busybox.net>; Fri,  1 Mar 2024 08:34:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oAYQJYNiqSL9 for <buildroot@lists.busybox.net>;
 Fri,  1 Mar 2024 08:33:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 61A2E82B8C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 61A2E82B8C
 for <buildroot@buildroot.org>; Fri,  1 Mar 2024 08:33:59 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 47E1887E66; Fri,  1 Mar 2024 08:33:59 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 1 Mar 2024 09:31:10 +0100
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: 3a8d8a65511ba6e53ccadb4b7c7a4a0f787498d6
X-Git-Newrev: 6f9f12165beeef9a0b081468ebf6070740c228f8
X-Patchwork-Hint: ignore
Message-Id: <20240301083359.47E1887E66@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x]
 package/davinci-bootcount: update GitHub URL
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

commit: https://git.buildroot.net/buildroot/commit/?id=6f9f12165beeef9a0b081468ebf6070740c228f8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

The patch updates the GitHub URL, which has recently changed.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit f443c7236d42c21f676cfb2cd3c8deea2423a3c2)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/davinci-bootcount/Config.in            | 2 +-
 package/davinci-bootcount/davinci-bootcount.mk | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/davinci-bootcount/Config.in b/package/davinci-bootcount/Config.in
index e34adde570..0201530f91 100644
--- a/package/davinci-bootcount/Config.in
+++ b/package/davinci-bootcount/Config.in
@@ -8,4 +8,4 @@ config BR2_PACKAGE_DAVINCI_BOOTCOUNT
 	  SCRATCH2 register. This tool allows to read and write this
 	  register from userspace.
 
-	  https://github.com/VoltServer/uboot-davinci-bootcount
+	  https://github.com/VoltServer/uboot-bootcount
diff --git a/package/davinci-bootcount/davinci-bootcount.mk b/package/davinci-bootcount/davinci-bootcount.mk
index 695d39688a..884bf420f3 100644
--- a/package/davinci-bootcount/davinci-bootcount.mk
+++ b/package/davinci-bootcount/davinci-bootcount.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 DAVINCI_BOOTCOUNT_VERSION = 2.0.0
-DAVINCI_BOOTCOUNT_SITE = $(call github,VoltServer,uboot-davinci-bootcount,v$(DAVINCI_BOOTCOUNT_VERSION))
+DAVINCI_BOOTCOUNT_SITE = $(call github,VoltServer,uboot-bootcount,v$(DAVINCI_BOOTCOUNT_VERSION))
 DAVINCI_BOOTCOUNT_LICENSE = GPL-3.0
 DAVINCI_BOOTCOUNT_LICENSE_FILES = COPYING
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
