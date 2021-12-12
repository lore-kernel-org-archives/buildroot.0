Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF424C433F5
	for <buildroot@archiver.kernel.org>; Sun, 12 Dec 2021 14:21:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 961674014E;
	Sun, 12 Dec 2021 14:21:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id W1XIF07z3Rm9; Sun, 12 Dec 2021 14:21:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9111240227;
	Sun, 12 Dec 2021 14:21:11 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 07F701BF33B
 for <buildroot@lists.busybox.net>; Sun, 12 Dec 2021 14:20:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AA2F460A8B
 for <buildroot@lists.busybox.net>; Sun, 12 Dec 2021 14:20:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id p4PaXIAluGQf for <buildroot@lists.busybox.net>;
 Sun, 12 Dec 2021 14:20:32 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id E196B60A8F
 for <buildroot@buildroot.org>; Sun, 12 Dec 2021 14:20:32 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 1A84E82DFB; Sun, 12 Dec 2021 14:15:22 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 12 Dec 2021 13:29:12 +0100
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: 76b62c102bfc209de0e0a1fbd573ce13562661b5
X-Git-Newrev: b8dac8c6cb1f53d63c4f4eb61dc8d99ea1ae2ddd
X-Patchwork-Hint: ignore
Message-Id: <20211212141522.1A84E82DFB@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] package/libnss: bump
 version to 3.63
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

commit: https://git.buildroot.net/buildroot/commit/?id=b8dac8c6cb1f53d63c4f4eb61dc8d99ea1ae2ddd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

Note: NSS 3.63 requires NSPR 4.30.
Release Notes:
https://developer.mozilla.org/en-US/docs/Mozilla/Projects/NSS/NSS_3.63_release_notes

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit a0f020f7ae478826c137f90ac43ab415cc7c6425)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libnss/libnss.hash | 4 ++--
 package/libnss/libnss.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libnss/libnss.hash b/package/libnss/libnss.hash
index 85c694bc66..b3e7a2935d 100644
--- a/package/libnss/libnss.hash
+++ b/package/libnss/libnss.hash
@@ -1,4 +1,4 @@
-# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_62_RTM/src/SHA256SUMS
-sha256  86d6df7cece25b8d4efa53e4c19af903c484eb79871163f37b5232bb406a5478  nss-3.62.tar.gz
+# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_63_RTM/src/SHA256SUMS
+sha256  182d2fef629102ae9423aabf2c192242b565cf5098e82c5a26cf70c5e4ea2221  nss-3.63.tar.gz
 # Locally calculated
 sha256  a20c1a32d1f8102432360b42e932869f7c11c7cdbacf9cac554c422132af47f4  nss/COPYING
diff --git a/package/libnss/libnss.mk b/package/libnss/libnss.mk
index 07991ae786..9296bdcc18 100644
--- a/package/libnss/libnss.mk
+++ b/package/libnss/libnss.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBNSS_VERSION = 3.62
+LIBNSS_VERSION = 3.63
 LIBNSS_SOURCE = nss-$(LIBNSS_VERSION).tar.gz
 LIBNSS_SITE = https://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/NSS_$(subst .,_,$(LIBNSS_VERSION))_RTM/src
 LIBNSS_DISTDIR = dist
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
