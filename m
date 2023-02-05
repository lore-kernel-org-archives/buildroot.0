Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDA57C61DA3
	for <buildroot@archiver.kernel.org>; Tue, 21 Feb 2023 00:04:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7CC474EF0D;
	Tue, 21 Feb 2023 00:04:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7CC474EF0D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5YilITFV2f5Y; Tue, 21 Feb 2023 00:04:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 43B494EF08;
	Tue, 21 Feb 2023 00:04:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 43B494EF08
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 44ADF1BF2E3
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:58:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9966D417A6
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9966D417A6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LGZszF3N6bAo for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:46 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id DB90941788
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DB90941788
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D869D81979; Mon, 20 Feb 2023 20:52:46 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 5 Feb 2023 13:32:48 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 8f291a384388a4d48c118b68fb25affb868fb280
X-Git-Newrev: 9b439a721e0e74e3e97ee10a89853ab6a4b8a627
X-Patchwork-Hint: ignore
Message-Id: <20230220205246.D869D81979@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/libfuse3: bump to
 version 3.13.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=9b439a721e0e74e3e97ee10a89853ab6a4b8a627
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Fixes:
http://autobuild.buildroot.net/results/a98/a984d275d949e8dc989870d2d2b6f6c7168d52bb/

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/libfuse3/libfuse3.hash | 2 +-
 package/libfuse3/libfuse3.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libfuse3/libfuse3.hash b/package/libfuse3/libfuse3.hash
index 691bfbc9d6..f697f4ad3f 100644
--- a/package/libfuse3/libfuse3.hash
+++ b/package/libfuse3/libfuse3.hash
@@ -1,3 +1,3 @@
 # Locally calculated sha256 checksums
-sha256  224544214204eb348b548d6faa7a9bc91b053aacfc92e8b5da3f478c76ae4a03  libfuse3-3.13.0.tar.gz
+sha256  96399b09b91bc717a9e96ffea660d611e6a342547c1abd4d0e858b3dca9d5a13  libfuse3-3.13.1.tar.gz
 sha256  b8832d9caaa075bbbd2aef24efa09f8b7ab66a832812d88c602da0c7b4397fad  LICENSE
diff --git a/package/libfuse3/libfuse3.mk b/package/libfuse3/libfuse3.mk
index d94f7d3d3a..a2e9775868 100644
--- a/package/libfuse3/libfuse3.mk
+++ b/package/libfuse3/libfuse3.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBFUSE3_VERSION = 3.13.0
+LIBFUSE3_VERSION = 3.13.1
 LIBFUSE3_SITE = $(call github,libfuse,libfuse,fuse-$(LIBFUSE3_VERSION))
 LIBFUSE3_LICENSE = LGPL-2.1
 LIBFUSE3_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
