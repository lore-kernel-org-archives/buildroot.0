Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 773D2C7EE2A
	for <buildroot@archiver.kernel.org>; Wed, 25 Jun 2025 13:56:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4856A41C68;
	Wed, 25 Jun 2025 13:56:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hnBCweKST3mQ; Wed, 25 Jun 2025 13:56:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6597541C25
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6597541C25;
	Wed, 25 Jun 2025 13:56:17 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 4EA67154
 for <buildroot@buildroot.org>; Wed, 25 Jun 2025 13:56:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4B5956150A
 for <buildroot@buildroot.org>; Wed, 25 Jun 2025 13:56:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WPyKo0Ozbcho for <buildroot@buildroot.org>;
 Wed, 25 Jun 2025 13:56:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9C21261473
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9C21261473
 for <buildroot@buildroot.org>; Wed, 25 Jun 2025 13:56:14 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8A07D84349; Wed, 25 Jun 2025 13:56:14 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 25 Jun 2025 15:54:46 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f28f34e200bbadf0aea32110c72f7199e65fb0b9
X-Git-Newrev: e339bef04bd0bfcf70e75de9a097ba4e82785494
X-Patchwork-Hint: ignore
Message-Id: <20250625135614.8A07D84349@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mmc-utils: bump version to 1.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=e339bef04bd0bfcf70e75de9a097ba4e82785494
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This is the first tagged version of the package, so replace commit SHA
with version tag.

Change log since last version bump:

  d8a8358a7207 mmc-utils: Pass key_mac buffer to rpmb_get_key()
  a23ad7875b89 mmc-utils: Start to use the generic print_usage function
  e769d44ecb77 mmc-utils: Introduce a generic print_usage function
  6586fa5535dc mmc-utils: Simplify and streamline print_help function
  ec75d4b3b671 mmc-utils: Remove unused adv_help member from struct Command

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Reviewed-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mmc-utils/mmc-utils.hash | 2 +-
 package/mmc-utils/mmc-utils.mk   | 5 ++---
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/package/mmc-utils/mmc-utils.hash b/package/mmc-utils/mmc-utils.hash
index 685952a615..781bd972d4 100644
--- a/package/mmc-utils/mmc-utils.hash
+++ b/package/mmc-utils/mmc-utils.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  e10cd7fded5f248d515fe40e35f73fe491e87e4b608ca857afa40fcb8cda1ae2  mmc-utils-c515ea2e1cebfbf9d81aa6a5c1bf67a79d2a7e58-git4.tar.gz
+sha256  39e6a89e06b53f99816f110af6743d1adc82220b26c51b0c3fd0a11ccf4206c2  mmc-utils-1.0.tar.gz
 sha256  49cd65f67b516078ff7e0dbe639972dad21ed3858246e3969fc8a8fc2a4dca66  README
diff --git a/package/mmc-utils/mmc-utils.mk b/package/mmc-utils/mmc-utils.mk
index b439c84d47..9696f2a6dc 100644
--- a/package/mmc-utils/mmc-utils.mk
+++ b/package/mmc-utils/mmc-utils.mk
@@ -4,9 +4,8 @@
 #
 ################################################################################
 
-MMC_UTILS_VERSION = c515ea2e1cebfbf9d81aa6a5c1bf67a79d2a7e58
-MMC_UTILS_SITE = https://git.kernel.org/pub/scm/utils/mmc/mmc-utils.git
-MMC_UTILS_SITE_METHOD = git
+MMC_UTILS_VERSION = 1.0
+MMC_UTILS_SITE = https://git.kernel.org/pub/scm/utils/mmc/mmc-utils.git/snapshot
 MMC_UTILS_LICENSE = GPL-2.0
 MMC_UTILS_LICENSE_FILES = README
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
