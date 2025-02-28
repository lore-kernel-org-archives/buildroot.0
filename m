Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01E2CC282C5
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 23:26:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 94600606DC;
	Fri, 28 Feb 2025 23:26:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yx421NVEPx54; Fri, 28 Feb 2025 23:26:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AC85E60B11
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id AC85E60B11;
	Fri, 28 Feb 2025 23:26:56 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id D3A081CB
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 23:26:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C361060B11
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 23:26:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Llk0cSAHo6Sb for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 23:26:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D2879606DC
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id D2879606DC
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 23:26:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B753187D1C; Fri, 28 Feb 2025 23:26:53 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sat, 1 Mar 2025 00:16:01 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: dfd217cdf2360a1241a424e88d532b6e87eb925e
X-Git-Newrev: c5c772ef8036c530763c1c00ac54c97f3e89b0ab
X-Patchwork-Hint: ignore
Message-Id: <20250228232653.B753187D1C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/rtl8192eu: bump to
 2025-02-03 version
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=c5c772ef8036c530763c1c00ac54c97f3e89b0ab
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

This version allows to build with Linux 6.14.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
[Julien: add back new line in hash file to fix check-package error]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/rtl8192eu/rtl8192eu.hash | 2 +-
 package/rtl8192eu/rtl8192eu.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rtl8192eu/rtl8192eu.hash b/package/rtl8192eu/rtl8192eu.hash
index 250cd556b1..de2c55cf4c 100644
--- a/package/rtl8192eu/rtl8192eu.hash
+++ b/package/rtl8192eu/rtl8192eu.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256  dbd565edc8d52a1429d8551795fb4da3ca44cf27867466010e0e6d00c86aef5c  rtl8192eu-6755ce9c15bbcb5dcffbca7f6f08e661ccdaacdb.tar.gz
+sha256  b5568e5a48e99839ec76359e11da29705e80cbfcae210c68eaea4bf433760f6d  rtl8192eu-c56c37f7ce8b8f1fd17c9719a9ea668dc1e45965.tar.gz
diff --git a/package/rtl8192eu/rtl8192eu.mk b/package/rtl8192eu/rtl8192eu.mk
index 9cd88060ce..de54f03bc9 100644
--- a/package/rtl8192eu/rtl8192eu.mk
+++ b/package/rtl8192eu/rtl8192eu.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RTL8192EU_VERSION = 6755ce9c15bbcb5dcffbca7f6f08e661ccdaacdb
+RTL8192EU_VERSION = c56c37f7ce8b8f1fd17c9719a9ea668dc1e45965
 RTL8192EU_SITE = $(call github,clnhub,rtl8192eu-linux,$(RTL8192EU_VERSION))
 RTL8192EU_LICENSE = GPL-2.0
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
