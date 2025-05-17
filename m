Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C166CC3ABDD
	for <buildroot@archiver.kernel.org>; Mon, 19 May 2025 11:04:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 48A4384956;
	Mon, 19 May 2025 11:04:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1jtp2IGEcumH; Mon, 19 May 2025 11:04:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7898F84948
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7898F84948;
	Mon, 19 May 2025 11:04:22 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1C41AD4
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:48:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D545A40E17
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:40:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Vw8DxrsBWz0l for <buildroot@buildroot.org>;
 Mon, 19 May 2025 10:40:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CFBC341E8D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id CFBC341E8D
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:40:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CD53281E90; Mon, 19 May 2025 10:40:08 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 17 May 2025 22:36:24 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 7bc90fa3eb6b4bb1a1cd713faea14ab27ba61ea0
X-Git-Newrev: cf63f1dc1018621417c6b61f9898c212bb520247
X-Patchwork-Hint: ignore
Message-Id: <20250519104008.CD53281E90@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/libdmtx: bump to
 version 0.7.8
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

commit: https://git.buildroot.net/buildroot/commit/?id=cf63f1dc1018621417c6b61f9898c212bb520247
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

For change log, see:
https://github.com/dmtx/libdmtx/compare/v0.7.7...v0.7.8

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libdmtx/libdmtx.hash | 2 +-
 package/libdmtx/libdmtx.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libdmtx/libdmtx.hash b/package/libdmtx/libdmtx.hash
index 8b176d737a..5ae4557db0 100644
--- a/package/libdmtx/libdmtx.hash
+++ b/package/libdmtx/libdmtx.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  7aa62adcefdd6e24bdabeb82b3ce41a8d35f4a0c95ab0c4438206aecafd6e1a1  libdmtx-0.7.7.tar.gz
+sha256  2394bf1d1d693a5a4ca3cfcc1bb28a4d878bdb831ea9ca8f3d5c995d274bdc39  libdmtx-0.7.8.tar.gz
 sha256  fcc277b7302645322c63de22b9b0bdae2df3dfa7d6cbc0d5bed7a4d3f1a9af79  LICENSE
diff --git a/package/libdmtx/libdmtx.mk b/package/libdmtx/libdmtx.mk
index 00d37fb94e..dd691a4af5 100644
--- a/package/libdmtx/libdmtx.mk
+++ b/package/libdmtx/libdmtx.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBDMTX_VERSION = 0.7.7
+LIBDMTX_VERSION = 0.7.8
 LIBDMTX_SITE = $(call github,dmtx,libdmtx,v$(LIBDMTX_VERSION))
 LIBDMTX_LICENSE = BSD-2-Clause or Special Permission
 LIBDMTX_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
