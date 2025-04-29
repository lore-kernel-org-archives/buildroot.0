Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B4F8C3ABD8
	for <buildroot@archiver.kernel.org>; Mon, 19 May 2025 10:48:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D52E96F67E;
	Mon, 19 May 2025 10:48:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id k_RACJBwzZSr; Mon, 19 May 2025 10:48:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D645661B24
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D645661B24;
	Mon, 19 May 2025 10:48:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 5F281D4
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:41:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2E28A41904
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:40:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xXmpuYMU1JVz for <buildroot@buildroot.org>;
 Mon, 19 May 2025 10:39:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5047241812
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5047241812
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:39:58 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4E587873D4; Mon, 19 May 2025 10:39:58 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Tue, 29 Apr 2025 22:33:45 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 4e271e6dccdd9b712077c12a4aa5aa8d82527531
X-Git-Newrev: 9c0eee07c7107fa2beb7644f4e3612d702b4588c
X-Patchwork-Hint: ignore
Message-Id: <20250519103958.4E587873D4@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/mmc-utils: bump
 version to c515ea2e1ceb
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=9c0eee07c7107fa2beb7644f4e3612d702b4588c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Change log since last version bump:

  c515ea2e1ceb mmc-utils: Doc: new secure write protect commands
  3fc7643ac148 mmc-utils: Secure Write Protect Mode Read
  bd51a271de9d mmc-utils: Enable/Disable write protect
  5d3a04e70b05 mmc-utils: Add secure write-protect mode enable/disable
  05051e40351c mmc-utils: Refactor RPMB key handling into a separate function
  f4247f56085f mmc-utils: Add SECURE_WP_INFO field in ext_csd register
  50a30df1b74d mmc-utils: Add byte offset comments to rpmb_frame structure
  88e956459a79 mmc-utils: Pack rpmb_frame structure to avoid padding bytes
  d4d3eb24f560 mmc-utils: Reduce scope of nargs for RPMB commands
  437d369cd9d9 mmc-utils: Initialize RPMB frame_out structures to zero

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/mmc-utils/mmc-utils.hash | 2 +-
 package/mmc-utils/mmc-utils.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mmc-utils/mmc-utils.hash b/package/mmc-utils/mmc-utils.hash
index 17dedad2b7..685952a615 100644
--- a/package/mmc-utils/mmc-utils.hash
+++ b/package/mmc-utils/mmc-utils.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  e9630d911bcf59e235a349d862700fa7ccea7545eb314da48431dcb4da125023  mmc-utils-2aef4cd9a84ddc76349fc0d7e10d675e7fa596fa-git4.tar.gz
+sha256  e10cd7fded5f248d515fe40e35f73fe491e87e4b608ca857afa40fcb8cda1ae2  mmc-utils-c515ea2e1cebfbf9d81aa6a5c1bf67a79d2a7e58-git4.tar.gz
 sha256  49cd65f67b516078ff7e0dbe639972dad21ed3858246e3969fc8a8fc2a4dca66  README
diff --git a/package/mmc-utils/mmc-utils.mk b/package/mmc-utils/mmc-utils.mk
index 0036a775ee..b439c84d47 100644
--- a/package/mmc-utils/mmc-utils.mk
+++ b/package/mmc-utils/mmc-utils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MMC_UTILS_VERSION = 2aef4cd9a84ddc76349fc0d7e10d675e7fa596fa
+MMC_UTILS_VERSION = c515ea2e1cebfbf9d81aa6a5c1bf67a79d2a7e58
 MMC_UTILS_SITE = https://git.kernel.org/pub/scm/utils/mmc/mmc-utils.git
 MMC_UTILS_SITE_METHOD = git
 MMC_UTILS_LICENSE = GPL-2.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
