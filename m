Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E326C433F5
	for <buildroot@archiver.kernel.org>; Sun, 13 Feb 2022 15:33:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CD97A60BBF;
	Sun, 13 Feb 2022 15:33:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kDsVWfVndwrM; Sun, 13 Feb 2022 15:33:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1E2FB60B64;
	Sun, 13 Feb 2022 15:33:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D1F341BF95F
 for <buildroot@lists.busybox.net>; Sun, 13 Feb 2022 15:32:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C03B040361
 for <buildroot@lists.busybox.net>; Sun, 13 Feb 2022 15:32:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Zot9PvSSZhXS for <buildroot@lists.busybox.net>;
 Sun, 13 Feb 2022 15:32:49 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 17DED4035D
 for <buildroot@buildroot.org>; Sun, 13 Feb 2022 15:32:49 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 9AF4B827D4; Sun, 13 Feb 2022 15:25:15 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sun, 13 Feb 2022 16:27:26 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ec720d210634b55faf0eb6c060d915b100c5028d
X-Git-Newrev: 039436fca6c06644a16b5cb3ec5a9cd05d43aefa
X-Patchwork-Hint: ignore
Message-Id: <20220213152515.9AF4B827D4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libnss: bump to version 3.75
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

commit: https://git.buildroot.net/buildroot/commit/?id=039436fca6c06644a16b5cb3ec5a9cd05d43aefa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/libnss/libnss.hash | 4 ++--
 package/libnss/libnss.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libnss/libnss.hash b/package/libnss/libnss.hash
index 819c272a30..07fb340c33 100644
--- a/package/libnss/libnss.hash
+++ b/package/libnss/libnss.hash
@@ -1,4 +1,4 @@
-# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_74_RTM/src/SHA256SUMS
-sha256  88928811f9f40f87d42e2eaccdf6e454562e51486067f2ddbe90aa47ea6cd056  nss-3.74.tar.gz
+# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_75_RTM/src/SHA256SUMS
+sha256  fd571507827284644f4dd522a032acda2286835f6683ed22a1c2d3878cc58582  nss-3.75.tar.gz
 # Locally calculated
 sha256  a20c1a32d1f8102432360b42e932869f7c11c7cdbacf9cac554c422132af47f4  nss/COPYING
diff --git a/package/libnss/libnss.mk b/package/libnss/libnss.mk
index 537f6dd9b6..a9549e48dd 100644
--- a/package/libnss/libnss.mk
+++ b/package/libnss/libnss.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBNSS_VERSION = 3.74
+LIBNSS_VERSION = 3.75
 LIBNSS_SOURCE = nss-$(LIBNSS_VERSION).tar.gz
 LIBNSS_SITE = https://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/NSS_$(subst .,_,$(LIBNSS_VERSION))_RTM/src
 LIBNSS_DISTDIR = dist
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
