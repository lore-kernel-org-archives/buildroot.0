Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 915EAC83F34
	for <buildroot@archiver.kernel.org>; Thu, 17 Jul 2025 19:21:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4A28083D38;
	Thu, 17 Jul 2025 19:21:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QTQjotkY3aKt; Thu, 17 Jul 2025 19:21:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4B49F83CEE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4B49F83CEE;
	Thu, 17 Jul 2025 19:21:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id ECF03DA
 for <buildroot@buildroot.org>; Thu, 17 Jul 2025 19:21:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DE6D183CEE
 for <buildroot@buildroot.org>; Thu, 17 Jul 2025 19:21:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eqvKzeAusBye for <buildroot@buildroot.org>;
 Thu, 17 Jul 2025 19:21:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 31B1A83CEC
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 31B1A83CEC
 for <buildroot@buildroot.org>; Thu, 17 Jul 2025 19:21:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1F233800B6; Thu, 17 Jul 2025 19:21:37 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 17 Jul 2025 21:19:14 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: fecc337d21f337a30ef7f9f448683d99c01fc245
X-Git-Newrev: 87be5a1e70707c3b4e2a9287d4649e4b48809fff
X-Patchwork-Hint: ignore
Message-Id: <20250717192137.1F233800B6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ufs-utils: bump to version 7.14.12
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

commit: https://git.buildroot.net/buildroot/commit/?id=87be5a1e70707c3b4e2a9287d4649e4b48809fff
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes:
https://github.com/SanDisk-Open-Source/ufs-utils/releases/tag/v7.14.12

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/ufs-utils/ufs-utils.hash | 2 +-
 package/ufs-utils/ufs-utils.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/ufs-utils/ufs-utils.hash b/package/ufs-utils/ufs-utils.hash
index f67534cd1e..89053996ab 100644
--- a/package/ufs-utils/ufs-utils.hash
+++ b/package/ufs-utils/ufs-utils.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  07d80ddd2dcfbe5e844515648c494fab33790be5450d150b88e3612da9b1895b  ufs-utils-7.14.11.tar.gz
+sha256  96cd578722830bc7d8a418d528a3067c0b80ad437f66c3333ebc238fe52436a2  ufs-utils-7.14.12.tar.gz
 sha256  231f7edcc7352d7734a96eef0b8030f77982678c516876fcb81e25b32d68564c  COPYING
diff --git a/package/ufs-utils/ufs-utils.mk b/package/ufs-utils/ufs-utils.mk
index cafc825fab..1de7615a92 100644
--- a/package/ufs-utils/ufs-utils.mk
+++ b/package/ufs-utils/ufs-utils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UFS_UTILS_VERSION = 7.14.11
+UFS_UTILS_VERSION = 7.14.12
 UFS_UTILS_SITE = $(call github,SanDisk-Open-Source,ufs-utils,v$(UFS_UTILS_VERSION))
 UFS_UTILS_LICENSE = GPL-2.0
 UFS_UTILS_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
