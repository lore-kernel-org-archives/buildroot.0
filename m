Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 270AFC433F5
	for <buildroot@archiver.kernel.org>; Sun, 26 Dec 2021 15:05:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C4D628175C;
	Sun, 26 Dec 2021 15:05:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id F1pRPj5uSceH; Sun, 26 Dec 2021 15:05:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2F6EF81464;
	Sun, 26 Dec 2021 15:05:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B16151BF973
 for <buildroot@lists.busybox.net>; Sun, 26 Dec 2021 15:05:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9F41940582
 for <buildroot@lists.busybox.net>; Sun, 26 Dec 2021 15:05:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qYVZFLFg0UpW for <buildroot@lists.busybox.net>;
 Sun, 26 Dec 2021 15:05:04 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id AFE5140108
 for <buildroot@buildroot.org>; Sun, 26 Dec 2021 15:05:04 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id A367C8145D; Sun, 26 Dec 2021 14:59:21 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sun, 26 Dec 2021 16:02:59 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6c5173be6eebe47b5b198ad6dc56b8d360156e74
X-Git-Newrev: 8246b0cba02e7de751ecc9d7cc3dcb6c2546a2fc
X-Patchwork-Hint: ignore
Message-Id: <20211226145921.A367C8145D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libnpupnp: bump to version 4.1.5
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

commit: https://git.buildroot.net/buildroot/commit/?id=8246b0cba02e7de751ecc9d7cc3dcb6c2546a2fc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libnpupnp/libnpupnp.hash | 4 ++--
 package/libnpupnp/libnpupnp.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libnpupnp/libnpupnp.hash b/package/libnpupnp/libnpupnp.hash
index 8451812eb7..9ebfd13379 100644
--- a/package/libnpupnp/libnpupnp.hash
+++ b/package/libnpupnp/libnpupnp.hash
@@ -1,5 +1,5 @@
-# Hash from: http://www.lesbonscomptes.com/upmpdcli/downloads/libnpupnp-4.1.4.tar.gz.sha256
-sha256  03506f02546e3b3d31b389e046c4691f020b82d315426ce79f1e2b1eb7958656  libnpupnp-4.1.4.tar.gz
+# Hash from: http://www.lesbonscomptes.com/upmpdcli/downloads/libnpupnp-4.1.5.tar.gz.sha256
+sha256  566f5895376a14aa87997de7ce3454595646613d1d0af34d05c31f6d9fe884a9  libnpupnp-4.1.5.tar.gz
 
 # Hash for license file:
 sha256  c8b99423cad48bb44e2cf52a496361404290865eac259a82da6d1e4331ececb3  COPYING
diff --git a/package/libnpupnp/libnpupnp.mk b/package/libnpupnp/libnpupnp.mk
index 6c6fa2f149..03ac01c915 100644
--- a/package/libnpupnp/libnpupnp.mk
+++ b/package/libnpupnp/libnpupnp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBNPUPNP_VERSION = 4.1.4
+LIBNPUPNP_VERSION = 4.1.5
 LIBNPUPNP_SITE = http://www.lesbonscomptes.com/upmpdcli/downloads
 LIBNPUPNP_LICENSE = BSD-3-Clause
 LIBNPUPNP_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
