Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DE4EC282C1
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 16:57:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C388C4F6CA;
	Fri, 28 Feb 2025 16:57:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TlAcj9aTPIqi; Fri, 28 Feb 2025 16:57:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8852250249
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8852250249;
	Fri, 28 Feb 2025 16:57:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 032EA68
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:38:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5622947E1F
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TbbdLp9MWrHh for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:30:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F2D6C42564
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id F2D6C42564
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EC1AD821C6; Fri, 28 Feb 2025 16:30:08 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Mon, 13 Jan 2025 21:17:35 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: db459859fa3c8fb7a2c0c8b8616637644d9c12bf
X-Git-Newrev: 481920a1817fe06d77248000c12562368c95118c
X-Patchwork-Hint: ignore
Message-Id: <20250228163008.EC1AD821C6@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/tbtools: bump to
 version 0.5.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=481920a1817fe06d77248000c12562368c95118c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Update to the latest release of tbtools. For change log, see:
https://github.com/intel/tbtools/compare/v0.4.2...v0.5.0

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/tbtools/tbtools.hash | 2 +-
 package/tbtools/tbtools.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/tbtools/tbtools.hash b/package/tbtools/tbtools.hash
index 25879c2780..58793dee0c 100644
--- a/package/tbtools/tbtools.hash
+++ b/package/tbtools/tbtools.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  6ec94630bc4e1afec1342cfd635d1c7da7d82f6c5f00adac61d164505c2a0717  tbtools-0.4.2-cargo2.tar.gz
+sha256  377d2fab96cf78d24dfd1b16b737afb4e47f0b712e13abb7ac1443fc2aa0931a  tbtools-0.5.0-cargo2.tar.gz
 sha256  9b16a3add311d607af8d9b348a842a37840d0f47dfcc6cf2a7756ee02c24ed69  LICENSE
diff --git a/package/tbtools/tbtools.mk b/package/tbtools/tbtools.mk
index 13b2ee65f9..1200e1c669 100644
--- a/package/tbtools/tbtools.mk
+++ b/package/tbtools/tbtools.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TBTOOLS_VERSION = 0.4.2
+TBTOOLS_VERSION = 0.5.0
 TBTOOLS_SITE = $(call github,intel,tbtools,v$(TBTOOLS_VERSION))
 TBTOOLS_LICENSE = MIT
 TBTOOLS_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
