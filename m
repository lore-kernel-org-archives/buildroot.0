Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E621C433EF
	for <buildroot@archiver.kernel.org>; Sun, 12 Dec 2021 14:22:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EE64785A2D;
	Sun, 12 Dec 2021 14:22:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hJmSHplKQCE7; Sun, 12 Dec 2021 14:22:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 458C385A29;
	Sun, 12 Dec 2021 14:22:39 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 987E51BF33B
 for <buildroot@lists.busybox.net>; Sun, 12 Dec 2021 14:20:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3785960A8B
 for <buildroot@lists.busybox.net>; Sun, 12 Dec 2021 14:20:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CDnt0GzjpeJk for <buildroot@lists.busybox.net>;
 Sun, 12 Dec 2021 14:20:32 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id DC81F60A8D
 for <buildroot@buildroot.org>; Sun, 12 Dec 2021 14:20:32 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 055F882DFB; Sun, 12 Dec 2021 14:15:22 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 12 Dec 2021 13:28:35 +0100
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: 8348f36e943f860a4378b8e2a30bc8a772aa2ace
X-Git-Newrev: 5d8b83334d00f6b33216840947354bb3becb7dcf
X-Patchwork-Hint: ignore
Message-Id: <20211212141522.055F882DFB@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] package/libnss: bump
 version to 3.62
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

commit: https://git.buildroot.net/buildroot/commit/?id=5d8b83334d00f6b33216840947354bb3becb7dcf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

Release Notes:
https://developer.mozilla.org/en-US/docs/Mozilla/Projects/NSS/NSS_3.62_release_notes

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 06d695cd70dfcab7806bf778919744f7847ec1c2)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libnss/libnss.hash | 4 ++--
 package/libnss/libnss.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libnss/libnss.hash b/package/libnss/libnss.hash
index ad632f724a..85c694bc66 100644
--- a/package/libnss/libnss.hash
+++ b/package/libnss/libnss.hash
@@ -1,4 +1,4 @@
-# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_61_RTM/src/SHA256SUMS
-sha256  312e2d804b34ccf0fec70b57cf8cd6ac853f8ced60df53e30ebb0a7bcd0e1370  nss-3.61.tar.gz
+# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_62_RTM/src/SHA256SUMS
+sha256  86d6df7cece25b8d4efa53e4c19af903c484eb79871163f37b5232bb406a5478  nss-3.62.tar.gz
 # Locally calculated
 sha256  a20c1a32d1f8102432360b42e932869f7c11c7cdbacf9cac554c422132af47f4  nss/COPYING
diff --git a/package/libnss/libnss.mk b/package/libnss/libnss.mk
index 3bc3197e34..07991ae786 100644
--- a/package/libnss/libnss.mk
+++ b/package/libnss/libnss.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBNSS_VERSION = 3.61
+LIBNSS_VERSION = 3.62
 LIBNSS_SOURCE = nss-$(LIBNSS_VERSION).tar.gz
 LIBNSS_SITE = https://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/NSS_$(subst .,_,$(LIBNSS_VERSION))_RTM/src
 LIBNSS_DISTDIR = dist
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
