Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AE79C433EF
	for <buildroot@archiver.kernel.org>; Sun, 24 Apr 2022 14:23:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A032660F31;
	Sun, 24 Apr 2022 14:23:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3cpmzRE8sKPM; Sun, 24 Apr 2022 14:23:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9D7D160EE5;
	Sun, 24 Apr 2022 14:23:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 735F51BF577
 for <buildroot@lists.busybox.net>; Sun, 24 Apr 2022 14:22:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5B01C60EE5
 for <buildroot@lists.busybox.net>; Sun, 24 Apr 2022 14:22:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1nYP57Lodw0C for <buildroot@lists.busybox.net>;
 Sun, 24 Apr 2022 14:22:58 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7A1D060E06
 for <buildroot@buildroot.org>; Sun, 24 Apr 2022 14:22:58 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 13E9B8374A; Sun, 24 Apr 2022 14:12:47 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 24 Apr 2022 16:22:36 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8c925613dc1d3af6031c9a39bb51b418cfe2b9d8
X-Git-Newrev: a6e7a8511526687d27d45570171bd9e4dda6bd59
X-Patchwork-Hint: ignore
Message-Id: <20220424141247.13E9B8374A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libnpupnp: update version to 4.2.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=a6e7a8511526687d27d45570171bd9e4dda6bd59
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bugfix release for:
http://autobuild.buildroot.net/results/a87/a8754431aad8808ae2d67e32d4a7973b00eda1c1/

Technical discussion:
https://github.com/MusicPlayerDaemon/MPD/pull/1513

Signed-off-by: Andreas Ziegler <br015@umbiko.net>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
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
