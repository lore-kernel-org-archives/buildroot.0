Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84F91CCA476
	for <buildroot@archiver.kernel.org>; Tue,  7 Oct 2025 19:27:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5180E60A46;
	Tue,  7 Oct 2025 19:27:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DYMEos0D2WS5; Tue,  7 Oct 2025 19:27:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8200960A5C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8200960A5C;
	Tue,  7 Oct 2025 19:27:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 89B6C226
 for <buildroot@buildroot.org>; Tue,  7 Oct 2025 19:27:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 70E5860A5C
 for <buildroot@buildroot.org>; Tue,  7 Oct 2025 19:27:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id N31itoBrCVku for <buildroot@buildroot.org>;
 Tue,  7 Oct 2025 19:27:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B7BD560A46
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id B7BD560A46
 for <buildroot@buildroot.org>; Tue,  7 Oct 2025 19:27:44 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A642486A2D; Tue,  7 Oct 2025 19:27:44 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 7 Oct 2025 21:24:07 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: fd4221092f76f84ace9b2f9dae0dbe47dd9fda53
X-Git-Newrev: 2827cddd1692c14c4d8c7d5f297293cdfb08e73e
X-Patchwork-Hint: ignore
Message-Id: <20251007192744.A642486A2D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libnss: bump version to 3.117
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

commit: https://git.buildroot.net/buildroot/commit/?id=2827cddd1692c14c4d8c7d5f297293cdfb08e73e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For release note, see:
https://hg-edge.mozilla.org/projects/nss/file/tip/doc/rst/releases/nss_3_117.rst

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/libnss/libnss.hash | 4 ++--
 package/libnss/libnss.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libnss/libnss.hash b/package/libnss/libnss.hash
index c839d58b80..cf339697ea 100644
--- a/package/libnss/libnss.hash
+++ b/package/libnss/libnss.hash
@@ -1,4 +1,4 @@
-# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_116_RTM/src/SHA256SUMS
-sha256  3938611de4ad1e3b71f27f3cd5ea717a5b5f83bffc9cd427e6d929dc67f2bb73  nss-3.116.tar.gz
+# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_117_RTM/src/SHA256SUMS
+sha256  5786b523a2f2e9295ed10d711960d2e33cd620bb80d6288443eda43553a51996  nss-3.117.tar.gz
 # Locally calculated
 sha256  a20c1a32d1f8102432360b42e932869f7c11c7cdbacf9cac554c422132af47f4  nss/COPYING
diff --git a/package/libnss/libnss.mk b/package/libnss/libnss.mk
index 419cf4a5f6..8ba82dd6e2 100644
--- a/package/libnss/libnss.mk
+++ b/package/libnss/libnss.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBNSS_VERSION = 3.116
+LIBNSS_VERSION = 3.117
 LIBNSS_SOURCE = nss-$(LIBNSS_VERSION).tar.gz
 LIBNSS_SITE = https://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/NSS_$(subst .,_,$(LIBNSS_VERSION))_RTM/src
 LIBNSS_DISTDIR = dist
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
