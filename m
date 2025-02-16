Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB630C282C1
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 17:19:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 70CA8509D7;
	Fri, 28 Feb 2025 17:19:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id svRJTGPSx6TT; Fri, 28 Feb 2025 17:19:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 85FEB509ED
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 85FEB509ED;
	Fri, 28 Feb 2025 17:19:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0AB2B1DD
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:46:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 11F8747B6F
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:32:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PuE4umSqiv3k for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:31:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 33B9D41881
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 33B9D41881
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:41 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 29AED82658; Fri, 28 Feb 2025 16:30:41 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sun, 16 Feb 2025 11:39:13 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 1040a4b714f530cb96589f35db017fcef5448dc8
X-Git-Newrev: 4c98a3ddc3c73da474d54e10f3c369ad9af89db9
X-Patchwork-Hint: ignore
Message-Id: <20250228163041.29AED82658@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/libblockdev: bump to
 version 3.3.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=4c98a3ddc3c73da474d54e10f3c369ad9af89db9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

For change log, see:
https://github.com/storaged-project/libblockdev/blob/3.3.0/NEWS.rst

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/libblockdev/libblockdev.hash | 2 +-
 package/libblockdev/libblockdev.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libblockdev/libblockdev.hash b/package/libblockdev/libblockdev.hash
index 1466c88451..dd6f8b1a27 100644
--- a/package/libblockdev/libblockdev.hash
+++ b/package/libblockdev/libblockdev.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  318b9e2cedfdfe88161f28079fcb63239aeb5592223f4485b861cfc6ef11189a  libblockdev-3.2.1.tar.gz
+sha256  c4738e1abedefffe886521f9f0e7a9306c6f50f7691d88e011438c88608bdfa7  libblockdev-3.3.0.tar.gz
 sha256  97bdc721d875501b6243a456333fdfdb1ab64d31c4da2554de845caf4674b946  LICENSE
diff --git a/package/libblockdev/libblockdev.mk b/package/libblockdev/libblockdev.mk
index 4cac905666..265cee2e28 100644
--- a/package/libblockdev/libblockdev.mk
+++ b/package/libblockdev/libblockdev.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBBLOCKDEV_VERSION = 3.2.1
+LIBBLOCKDEV_VERSION = 3.3.0
 LIBBLOCKDEV_SITE = https://github.com/storaged-project/libblockdev/releases/download/$(LIBBLOCKDEV_VERSION)
 LIBBLOCKDEV_LICENSE = LGPL-2.1
 LIBBLOCKDEV_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
