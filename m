Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47B83C433EF
	for <buildroot@archiver.kernel.org>; Thu, 26 May 2022 21:04:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C557241253;
	Thu, 26 May 2022 21:04:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NtayO4FHIWmw; Thu, 26 May 2022 21:04:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id BBBBE41255;
	Thu, 26 May 2022 21:04:04 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 036001BF9C1
 for <buildroot@lists.busybox.net>; Thu, 26 May 2022 21:03:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E346C400AB
 for <buildroot@lists.busybox.net>; Thu, 26 May 2022 21:03:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tB9p6vJwmONt for <buildroot@lists.busybox.net>;
 Thu, 26 May 2022 21:03:15 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id EB94241238
 for <buildroot@buildroot.org>; Thu, 26 May 2022 21:03:15 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 2AB138655E; Thu, 26 May 2022 20:51:51 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 26 May 2022 21:58:00 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 1067c60c57cff73284eda8676edfbe5c1ae72786
X-Git-Newrev: f5bec810a67023bde7785ff04465b9e13f48ebdd
X-Patchwork-Hint: ignore
Message-Id: <20220526205151.2AB138655E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/libnpupnp: update
 version to 4.2.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=f5bec810a67023bde7785ff04465b9e13f48ebdd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Bugfix release for:
http://autobuild.buildroot.net/results/a87/a8754431aad8808ae2d67e32d4a7973b00eda1c1/

Technical discussion:
https://github.com/MusicPlayerDaemon/MPD/pull/1513

Signed-off-by: Andreas Ziegler <br015@umbiko.net>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit a6e7a8511526687d27d45570171bd9e4dda6bd59)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libnpupnp/libnpupnp.hash | 4 ++--
 package/libnpupnp/libnpupnp.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libnpupnp/libnpupnp.hash b/package/libnpupnp/libnpupnp.hash
index 276bf93c99..15ee26c6d2 100644
--- a/package/libnpupnp/libnpupnp.hash
+++ b/package/libnpupnp/libnpupnp.hash
@@ -1,5 +1,5 @@
-# Hash from: http://www.lesbonscomptes.com/upmpdcli/downloads/libnpupnp-4.2.1.tar.gz.sha256
-sha256  e0e59eb2d3d024e827050428e0e7eb228355912a38c85eb30bfeb2f0926eca4c  libnpupnp-4.2.1.tar.gz
+# Hash from: http://www.lesbonscomptes.com/upmpdcli/downloads/libnpupnp-4.2.2.tar.gz.sha256
+sha256  cb3968773d30e2bfc765547df514fdc8927b9a37ecccca2e260ee8b612e756bc  libnpupnp-4.2.2.tar.gz
 
 # Hash for license file:
 sha256  c8b99423cad48bb44e2cf52a496361404290865eac259a82da6d1e4331ececb3  COPYING
diff --git a/package/libnpupnp/libnpupnp.mk b/package/libnpupnp/libnpupnp.mk
index 09bfa34b87..d7192ec3f1 100644
--- a/package/libnpupnp/libnpupnp.mk
+++ b/package/libnpupnp/libnpupnp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBNPUPNP_VERSION = 4.2.1
+LIBNPUPNP_VERSION = 4.2.2
 LIBNPUPNP_SITE = http://www.lesbonscomptes.com/upmpdcli/downloads
 LIBNPUPNP_LICENSE = BSD-3-Clause
 LIBNPUPNP_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
