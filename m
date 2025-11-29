Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9528CFD2F6
	for <buildroot@archiver.kernel.org>; Sat, 29 Nov 2025 11:59:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 63E2E607FC;
	Sat, 29 Nov 2025 11:59:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id z7TSZmC1KWEE; Sat, 29 Nov 2025 11:59:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7AFF860702
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7AFF860702;
	Sat, 29 Nov 2025 11:59:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 9E839708
 for <buildroot@buildroot.org>; Sat, 29 Nov 2025 11:59:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8506084416
 for <buildroot@buildroot.org>; Sat, 29 Nov 2025 11:59:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0EADsVo52Wj1 for <buildroot@buildroot.org>;
 Sat, 29 Nov 2025 11:59:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C5A6C84410
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id C5A6C84410
 for <buildroot@buildroot.org>; Sat, 29 Nov 2025 11:59:13 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B59C0813AF; Sat, 29 Nov 2025 11:59:13 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 29 Nov 2025 12:53:09 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 382faf08aa595a7b42d96d97fc6d5b6577d84652
X-Git-Newrev: 16528da35a0de376b0403891797bb88e2fe78965
X-Patchwork-Hint: ignore
Message-Id: <20251129115913.B59C0813AF@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/libnss: bump version
 to 3.118.1
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=16528da35a0de376b0403891797bb88e2fe78965
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

For release note since version 3.117, see:
https://hg-edge.mozilla.org/projects/nss/file/tip/doc/rst/releases/nss_3_118.rst
https://hg-edge.mozilla.org/projects/nss/file/tip/doc/rst/releases/nss_3_118_1.rst

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
[Julien: add link to 3.118 release notes]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/libnss/libnss.hash | 4 ++--
 package/libnss/libnss.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libnss/libnss.hash b/package/libnss/libnss.hash
index cf339697ea..d4824bc81d 100644
--- a/package/libnss/libnss.hash
+++ b/package/libnss/libnss.hash
@@ -1,4 +1,4 @@
-# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_117_RTM/src/SHA256SUMS
-sha256  5786b523a2f2e9295ed10d711960d2e33cd620bb80d6288443eda43553a51996  nss-3.117.tar.gz
+# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_118_1_RTM/src/SHA256SUMS
+sha256  8c390a676ea37266fcd3d0cd2fb070e2f69f4d78fa4ed88e07ac0c9eb5aab8d3  nss-3.118.1.tar.gz
 # Locally calculated
 sha256  a20c1a32d1f8102432360b42e932869f7c11c7cdbacf9cac554c422132af47f4  nss/COPYING
diff --git a/package/libnss/libnss.mk b/package/libnss/libnss.mk
index 8ba82dd6e2..dee668118b 100644
--- a/package/libnss/libnss.mk
+++ b/package/libnss/libnss.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBNSS_VERSION = 3.117
+LIBNSS_VERSION = 3.118.1
 LIBNSS_SOURCE = nss-$(LIBNSS_VERSION).tar.gz
 LIBNSS_SITE = https://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/NSS_$(subst .,_,$(LIBNSS_VERSION))_RTM/src
 LIBNSS_DISTDIR = dist
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
