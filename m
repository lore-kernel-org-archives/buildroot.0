Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57DCFC4167B
	for <buildroot@archiver.kernel.org>; Mon,  4 Dec 2023 20:16:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 10C4A41772;
	Mon,  4 Dec 2023 20:16:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 10C4A41772
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JiahnPdOOL5G; Mon,  4 Dec 2023 20:16:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 407AF417A2;
	Mon,  4 Dec 2023 20:16:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 407AF417A2
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 116201BF977
 for <buildroot@lists.busybox.net>; Mon,  4 Dec 2023 20:13:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 48EA841745
 for <buildroot@lists.busybox.net>; Mon,  4 Dec 2023 20:13:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 48EA841745
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id L2adXcl-3-TT for <buildroot@lists.busybox.net>;
 Mon,  4 Dec 2023 20:13:27 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 94818416C3
 for <buildroot@buildroot.org>; Mon,  4 Dec 2023 20:13:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 94818416C3
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 92772879B6; Mon,  4 Dec 2023 20:13:27 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 18 Nov 2023 15:32:39 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3afe877f52e4571500f11a63d000c540d02c6488
X-Git-Newrev: 6a172ffe6b2aa5c59427696775cfa4c189f99c19
X-Patchwork-Hint: ignore
Message-Id: <20231204201327.92772879B6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/openblas: bump to version v0.3.25
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=6a172ffe6b2aa5c59427696775cfa4c189f99c19
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For change log since v0.3.24, see:
https://github.com/xianyi/OpenBLAS/releases/tag/v0.3.25

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/openblas/openblas.hash | 6 +++---
 package/openblas/openblas.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/openblas/openblas.hash b/package/openblas/openblas.hash
index 8e416f98f6..d946ae7296 100644
--- a/package/openblas/openblas.hash
+++ b/package/openblas/openblas.hash
@@ -1,5 +1,5 @@
-# From https://github.com/xianyi/OpenBLAS/releases/tag/v0.3.24
-md5  23599a30e4ce887590957d94896789c8  openblas-0.3.24.tar.gz
+# From https://github.com/xianyi/OpenBLAS/releases/tag/v0.3.25
+md5  48384e324cd1cdcfbdb0d2e16ca55327  openblas-0.3.25.tar.gz
 # Locally calculated
-sha256  ceadc5065da97bd92404cac7254da66cc6eb192679cf1002098688978d4d5132  openblas-0.3.24.tar.gz
+sha256  4c25cb30c4bb23eddca05d7d0a85997b8db6144f5464ba7f8c09ce91e2f35543  openblas-0.3.25.tar.gz
 sha256  190b5a9c8d9723fe958ad33916bd7346d96fab3c5ea90832bb02d854f620fcff  LICENSE
diff --git a/package/openblas/openblas.mk b/package/openblas/openblas.mk
index aacfc74b53..76833121a9 100644
--- a/package/openblas/openblas.mk
+++ b/package/openblas/openblas.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPENBLAS_VERSION = 0.3.24
+OPENBLAS_VERSION = 0.3.25
 OPENBLAS_SITE = https://github.com/xianyi/OpenBLAS/releases/download/v$(OPENBLAS_VERSION)
 OPENBLAS_LICENSE = BSD-3-Clause
 OPENBLAS_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
