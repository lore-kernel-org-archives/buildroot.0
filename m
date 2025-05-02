Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAB78C3ABAD
	for <buildroot@archiver.kernel.org>; Fri,  2 May 2025 11:14:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A9DDD70365;
	Fri,  2 May 2025 11:14:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eb8mocXlJVnK; Fri,  2 May 2025 11:14:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DC03E70360
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id DC03E70360;
	Fri,  2 May 2025 11:14:28 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 157A0EE
 for <buildroot@buildroot.org>; Fri,  2 May 2025 11:12:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3441C41A47
 for <buildroot@buildroot.org>; Fri,  2 May 2025 11:11:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KMLvIKBtJOKj for <buildroot@buildroot.org>;
 Fri,  2 May 2025 11:11:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A79C341C11
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id A79C341C11
 for <buildroot@buildroot.org>; Fri,  2 May 2025 11:11:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9CA58863AE; Fri,  2 May 2025 11:11:37 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 2 May 2025 12:14:10 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 7be1f91ea3cee680f7fd7b07ff6ab338179ec9b8
X-Git-Newrev: efa2ace303e36311ae6c3d8841ce1a0e360d80ec
X-Patchwork-Hint: ignore
Message-Id: <20250502111137.9CA58863AE@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/opencsd: bump to
 version 1.5.6
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=efa2ace303e36311ae6c3d8841ce1a0e360d80ec
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

For change log, see:
https://github.com/Linaro/OpenCSD/blob/v1.5.6/README.md?plain=1#L348

Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit ae4bf5a4fedf9b2283719cf024c5f70f76e32684)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/opencsd/opencsd.hash | 2 +-
 package/opencsd/opencsd.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/opencsd/opencsd.hash b/package/opencsd/opencsd.hash
index 865580968b..d33f96af8a 100644
--- a/package/opencsd/opencsd.hash
+++ b/package/opencsd/opencsd.hash
@@ -1,3 +1,3 @@
 # Locally Computed:
-sha256  1df9b61656ac96bc5cca082d8c32a9f25ed07ef684d7d666911280cf162b7d93  opencsd-1.5.5.tar.gz
+sha256  82f584572c4e3f1d8255be135768bea80b48c4fe731cb8c5877a7389dfd445a6  opencsd-1.5.6.tar.gz
 sha256  980eef4b0744e63834e3ec0d50c2a4ff6d81d7ec62dd8ba8c66acae0ec5a2e88  LICENSE
diff --git a/package/opencsd/opencsd.mk b/package/opencsd/opencsd.mk
index 9714bb970a..2e8747df22 100644
--- a/package/opencsd/opencsd.mk
+++ b/package/opencsd/opencsd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPENCSD_VERSION = 1.5.5
+OPENCSD_VERSION = 1.5.6
 OPENCSD_SITE = $(call github,Linaro,OpenCSD,v$(OPENCSD_VERSION))
 OPENCSD_LICENSE = BSD-3-Clause
 OPENCSD_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
