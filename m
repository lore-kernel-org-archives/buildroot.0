Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21641CCD184
	for <buildroot@archiver.kernel.org>; Sun, 19 Oct 2025 19:31:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CEEA18402F;
	Sun, 19 Oct 2025 19:31:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JzTyvAtRIkMl; Sun, 19 Oct 2025 19:31:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9004B84030
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9004B84030;
	Sun, 19 Oct 2025 19:31:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 289E61CD
 for <buildroot@buildroot.org>; Sun, 19 Oct 2025 19:31:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 19A534134A
 for <buildroot@buildroot.org>; Sun, 19 Oct 2025 19:31:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sow2x2NCdm1f for <buildroot@buildroot.org>;
 Sun, 19 Oct 2025 19:31:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CC4D441346
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id CC4D441346
 for <buildroot@buildroot.org>; Sun, 19 Oct 2025 19:31:02 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BCEB48764B; Sun, 19 Oct 2025 19:31:02 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 19 Oct 2025 21:13:57 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9a31b3d220c81e9dc394db8812c64d8dae44f39d
X-Git-Newrev: 283821fc31c4890f141111cbc5994e36703c91eb
X-Patchwork-Hint: ignore
Message-Id: <20251019193102.BCEB48764B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/jimtcl: bump to version 0.83
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

commit: https://git.buildroot.net/buildroot/commit/?id=283821fc31c4890f141111cbc5994e36703c91eb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes since 0.81:
https://jim.tcl-lang.org/home/doc/www/www/articles/jim-release-0-82/
https://jim.tcl-lang.org/home/doc/www/www/articles/jim-release-0-83/

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/jimtcl/jimtcl.hash | 2 +-
 package/jimtcl/jimtcl.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/jimtcl/jimtcl.hash b/package/jimtcl/jimtcl.hash
index d4174a3da6..906d2ccc23 100644
--- a/package/jimtcl/jimtcl.hash
+++ b/package/jimtcl/jimtcl.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  ab7eb3680ba0d16f4a9eb1e05b7fcbb7d23438e25185462c55cd032a1954a985  jimtcl-0.81.tar.gz
+sha256  6f2df00009f5ac4ad654c1ae1d2f8ed18191de38d1f5a88a54ea99cc16936686  jimtcl-0.83.tar.gz
 sha256  419f1146334e57fb258d6c957d1f94d43455ec0d24b1b54c4447e5f61a353950  LICENSE
diff --git a/package/jimtcl/jimtcl.mk b/package/jimtcl/jimtcl.mk
index 3d68ca8f64..f2d59265ad 100644
--- a/package/jimtcl/jimtcl.mk
+++ b/package/jimtcl/jimtcl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-JIMTCL_VERSION = 0.81
+JIMTCL_VERSION = 0.83
 JIMTCL_SITE = $(call github,msteveb,jimtcl,$(JIMTCL_VERSION))
 JIMTCL_INSTALL_STAGING = YES
 JIMTCL_LICENSE = BSD-2-Clause
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
