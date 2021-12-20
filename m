Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8407C433EF
	for <buildroot@archiver.kernel.org>; Mon, 20 Dec 2021 22:42:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 61C9640286;
	Mon, 20 Dec 2021 22:42:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id viiWYqw6xR6K; Mon, 20 Dec 2021 22:42:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D0EC140281;
	Mon, 20 Dec 2021 22:42:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DE9501BF97F
 for <buildroot@lists.busybox.net>; Mon, 20 Dec 2021 22:42:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CDF0C8175B
 for <buildroot@lists.busybox.net>; Mon, 20 Dec 2021 22:42:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NhJChC3FIKpa for <buildroot@lists.busybox.net>;
 Mon, 20 Dec 2021 22:42:11 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 30E158174C
 for <buildroot@buildroot.org>; Mon, 20 Dec 2021 22:42:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 299DE8289B; Mon, 20 Dec 2021 22:36:41 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Mon, 20 Dec 2021 23:18:48 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f93ea03d0fc940c2f92d8e282e1069a1c54aea50
X-Git-Newrev: 6ff4fa08c4d1dcbfd5a0b62a6a8d3f65af5eaff0
X-Patchwork-Hint: ignore
Message-Id: <20211220223641.299DE8289B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/stm32flash: use official tarball
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

commit: https://git.buildroot.net/buildroot/commit/?id=6ff4fa08c4d1dcbfd5a0b62a6a8d3f65af5eaff0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/stm32flash/stm32flash.hash | 2 +-
 package/stm32flash/stm32flash.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/stm32flash/stm32flash.hash b/package/stm32flash/stm32flash.hash
index 514d71f823..7039f06eec 100644
--- a/package/stm32flash/stm32flash.hash
+++ b/package/stm32flash/stm32flash.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  dec1a81a3ba85a61dfa39ec12e391ea16a8d431470f41d34413f7ab183da46ef  stm32flash-v0.6-br1.tar.gz
+sha256  ee9b40d4d3e5cd28b993e08ae2a2c3c559b6bea8730cd7e1d40727dedb1dda09  stm32flash-0.6.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  gpl-2.0.txt
diff --git a/package/stm32flash/stm32flash.mk b/package/stm32flash/stm32flash.mk
index 1c68a0ffbe..6e38e09d98 100644
--- a/package/stm32flash/stm32flash.mk
+++ b/package/stm32flash/stm32flash.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-STM32FLASH_VERSION = v0.6
-STM32FLASH_SITE = git://git.code.sf.net/p/stm32flash/code
+STM32FLASH_VERSION = 0.6
+STM32FLASH_SITE = http://downloads.sourceforge.net/project/stm32flash
 STM32FLASH_LICENSE = GPL-2.0+
 STM32FLASH_LICENSE_FILES = gpl-2.0.txt
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
