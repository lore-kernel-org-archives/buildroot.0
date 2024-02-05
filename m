Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C329C48295
	for <buildroot@archiver.kernel.org>; Mon,  5 Feb 2024 13:29:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 472A260F8B;
	Mon,  5 Feb 2024 13:29:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 472A260F8B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OHKVr4PKchN1; Mon,  5 Feb 2024 13:29:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 98C3E61014;
	Mon,  5 Feb 2024 13:29:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 98C3E61014
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0F8841BF976
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 13:29:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D138E60F2F
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 13:29:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D138E60F2F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id D47vFVweXmx6 for <buildroot@lists.busybox.net>;
 Mon,  5 Feb 2024 13:29:14 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id DA61460E43
 for <buildroot@buildroot.org>; Mon,  5 Feb 2024 13:29:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DA61460E43
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C6DA386C7A; Mon,  5 Feb 2024 13:29:14 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 5 Feb 2024 14:28:11 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e29d91d6ee7513b2a0e4bb49009420c255b9ca5c
X-Git-Newrev: cd3ec6b977a84a324639682f16f82b459382f8e5
X-Patchwork-Hint: ignore
Message-Id: <20240205132914.C6DA386C7A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/openblas: bump to version v0.3.26
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=cd3ec6b977a84a324639682f16f82b459382f8e5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For change log since v0.3.25, see:
https://github.com/OpenMathLib/OpenBLAS/releases/tag/v0.3.26

This commit also update _SITE url to follow download url published on
the homepage https://www.openblas.net/

Also https://github.com/xianyi/OpenBLAS is now redirecting to
https://github.com/OpenMathLib/OpenBLAS

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/openblas/openblas.hash | 6 +++---
 package/openblas/openblas.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/openblas/openblas.hash b/package/openblas/openblas.hash
index d946ae7296..a0f054dab7 100644
--- a/package/openblas/openblas.hash
+++ b/package/openblas/openblas.hash
@@ -1,5 +1,5 @@
-# From https://github.com/xianyi/OpenBLAS/releases/tag/v0.3.25
-md5  48384e324cd1cdcfbdb0d2e16ca55327  openblas-0.3.25.tar.gz
+# From https://github.com/OpenMathLib/OpenBLAS/releases/tag/v0.3.26
+md5  bd496a1c81769ed19a161c1f8f904ccd  openblas-0.3.26.tar.gz
 # Locally calculated
-sha256  4c25cb30c4bb23eddca05d7d0a85997b8db6144f5464ba7f8c09ce91e2f35543  openblas-0.3.25.tar.gz
+sha256  4e6e4f5cb14c209262e33e6816d70221a2fe49eb69eaf0a06f065598ac602c68  openblas-0.3.26.tar.gz
 sha256  190b5a9c8d9723fe958ad33916bd7346d96fab3c5ea90832bb02d854f620fcff  LICENSE
diff --git a/package/openblas/openblas.mk b/package/openblas/openblas.mk
index 76833121a9..2d6cdaa7bb 100644
--- a/package/openblas/openblas.mk
+++ b/package/openblas/openblas.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-OPENBLAS_VERSION = 0.3.25
-OPENBLAS_SITE = https://github.com/xianyi/OpenBLAS/releases/download/v$(OPENBLAS_VERSION)
+OPENBLAS_VERSION = 0.3.26
+OPENBLAS_SITE = https://github.com/OpenMathLib/OpenBLAS/releases/download/v$(OPENBLAS_VERSION)
 OPENBLAS_LICENSE = BSD-3-Clause
 OPENBLAS_LICENSE_FILES = LICENSE
 OPENBLAS_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
