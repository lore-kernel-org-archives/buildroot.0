Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62523CCD185
	for <buildroot@archiver.kernel.org>; Wed, 15 Oct 2025 20:06:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 29485606B0;
	Wed, 15 Oct 2025 20:06:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vDyfaC_WZa6m; Wed, 15 Oct 2025 20:06:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 58FE46060A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 58FE46060A;
	Wed, 15 Oct 2025 20:06:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id DE4341C9
 for <buildroot@buildroot.org>; Wed, 15 Oct 2025 20:06:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C3B7C41881
 for <buildroot@buildroot.org>; Wed, 15 Oct 2025 20:06:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xt3BazFCaJJT for <buildroot@buildroot.org>;
 Wed, 15 Oct 2025 20:06:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F3CCC413AC
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id F3CCC413AC
 for <buildroot@buildroot.org>; Wed, 15 Oct 2025 20:06:18 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id F09C38713E; Wed, 15 Oct 2025 20:06:18 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 15 Oct 2025 22:04:44 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d05e2f785de6e0e51590160e002d1fd6e143d403
X-Git-Newrev: 6b3c1f1b0fd55031862e5a3d08bc6159a9e1f5a9
X-Patchwork-Hint: ignore
Message-Id: <20251015200618.F09C38713E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libecoli: bump version to 0.8.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=6b3c1f1b0fd55031862e5a3d08bc6159a9e1f5a9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This new version is required to compile grout v0.13.0.

Signed-off-by: Maxime Leroy <maxime@leroys.fr>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 package/libecoli/libecoli.hash | 2 +-
 package/libecoli/libecoli.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libecoli/libecoli.hash b/package/libecoli/libecoli.hash
index f973b6f254..e200b796bf 100644
--- a/package/libecoli/libecoli.hash
+++ b/package/libecoli/libecoli.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  bc9ca742f32dc7787146de4cbc3997b28356adaf219049304bbc3368d25b7395  libecoli-0.5.0.tar.gz
+sha256  ac71cd336d7e19921ed1a0ae35ab14433792c7151d23abe92b247c6e36813246  libecoli-0.8.0.tar.gz
 sha256  e58bf9ec962bee9b3e37abcaa0bc0ec940b05efdc1d1a5a4d9e2fdbcc08b7bdd  LICENSE
diff --git a/package/libecoli/libecoli.mk b/package/libecoli/libecoli.mk
index f989e7b9cd..ad4fa62914 100644
--- a/package/libecoli/libecoli.mk
+++ b/package/libecoli/libecoli.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBECOLI_VERSION = 0.5.0
+LIBECOLI_VERSION = 0.8.0
 LIBECOLI_SITE = $(call github,rjarry,libecoli,v$(LIBECOLI_VERSION))
 LIBECOLI_INSTALL_STAGING = YES
 LIBECOLI_LICENSE = BSD-3-Clause
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
