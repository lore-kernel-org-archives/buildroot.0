Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1D39C433EF
	for <buildroot@archiver.kernel.org>; Wed, 16 Feb 2022 21:06:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 56DF3404F4;
	Wed, 16 Feb 2022 21:06:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ln4kJJbMGeyI; Wed, 16 Feb 2022 21:06:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 16342409FC;
	Wed, 16 Feb 2022 21:06:24 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 609951BF425
 for <buildroot@lists.busybox.net>; Wed, 16 Feb 2022 21:02:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4EE1E61C3B
 for <buildroot@lists.busybox.net>; Wed, 16 Feb 2022 21:02:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id X1_B2ZUy7DWb for <buildroot@lists.busybox.net>;
 Wed, 16 Feb 2022 21:02:29 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 84F9761C3A
 for <buildroot@buildroot.org>; Wed, 16 Feb 2022 21:02:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id C645B836BD; Wed, 16 Feb 2022 20:54:48 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 16 Feb 2022 22:02:06 +0100
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: 61f8a7e79129ade522c871f10a74cad10e385dca
X-Git-Newrev: 33169da5d5b81da72a4eccd23fa6b1a2b5955895
X-Patchwork-Hint: ignore
Message-Id: <20220216205448.C645B836BD@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] package/tiff: bump to
 version 4.3.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=33169da5d5b81da72a4eccd23fa6b1a2b5955895
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

Update indentation in hash file (two spaces)

https://gitlab.com/libtiff/libtiff/-/blob/v4.3.0/ChangeLog

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit 29b5fe6895dcf38eea51bc68baf7310950c4d401)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/tiff/tiff.hash | 4 ++--
 package/tiff/tiff.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/tiff/tiff.hash b/package/tiff/tiff.hash
index 472ec40e55..ea08a1fc92 100644
--- a/package/tiff/tiff.hash
+++ b/package/tiff/tiff.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 eb0484e568ead8fa23b513e9b0041df7e327f4ee2d22db5a533929dfc19633cb  tiff-4.2.0.tar.gz
-sha256 fbd6fed7938541d2c809c0826225fc85e551fdbfa8732b10f0c87e0847acafd7  COPYRIGHT
+sha256  0e46e5acb087ce7d1ac53cf4f56a09b221537fc86dfc5daaad1c2e89e1b37ac8  tiff-4.3.0.tar.gz
+sha256  fbd6fed7938541d2c809c0826225fc85e551fdbfa8732b10f0c87e0847acafd7  COPYRIGHT
diff --git a/package/tiff/tiff.mk b/package/tiff/tiff.mk
index c3d8045144..f6c6de12c5 100644
--- a/package/tiff/tiff.mk
+++ b/package/tiff/tiff.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TIFF_VERSION = 4.2.0
+TIFF_VERSION = 4.3.0
 TIFF_SITE = http://download.osgeo.org/libtiff
 TIFF_LICENSE = tiff license
 TIFF_LICENSE_FILES = COPYRIGHT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
