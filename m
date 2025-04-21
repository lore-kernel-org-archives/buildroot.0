Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34061C2D0CD
	for <buildroot@archiver.kernel.org>; Mon, 19 May 2025 10:54:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B621870754;
	Mon, 19 May 2025 10:54:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SdDlG2K2RSba; Mon, 19 May 2025 10:54:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D339D7087D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D339D7087D;
	Mon, 19 May 2025 10:54:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 13E93E4
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:44:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 92BE342407
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:40:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BwySr424kPdC for <buildroot@buildroot.org>;
 Mon, 19 May 2025 10:40:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 403C740C80
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 403C740C80
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:39:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3DF0382A2E; Mon, 19 May 2025 10:39:54 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Mon, 21 Apr 2025 16:24:55 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 104449d0cb8db537fa7d3dc0502e4dd7af7500b3
X-Git-Newrev: d51b4c7fd43bb580a057b17e31ae2080169354f7
X-Patchwork-Hint: ignore
Message-Id: <20250519103954.3DF0382A2E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/ncdu: bump to version
 1.22
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

commit: https://git.buildroot.net/buildroot/commit/?id=d51b4c7fd43bb580a057b17e31ae2080169354f7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

For change log since 1.21, see:
https://dev.yorhel.nl/ncdu/changes

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/ncdu/ncdu.hash | 8 ++++----
 package/ncdu/ncdu.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/ncdu/ncdu.hash b/package/ncdu/ncdu.hash
index 40faf9bd0d..623b7d060b 100644
--- a/package/ncdu/ncdu.hash
+++ b/package/ncdu/ncdu.hash
@@ -1,10 +1,10 @@
 # From https://dev.yorhel.nl/ncdu
 # After checking pgp signature from:
-# https://dev.yorhel.nl/download/ncdu-1.21.tar.gz.asc
+# https://dev.yorhel.nl/download/ncdu-1.22.tar.gz.asc
 # With key 74460D32B80810EBA9AFA2E962394C698C2739FA
-md5  3d5f399a00ca2ac3ba319e8cb99118ab  ncdu-1.21.tar.gz
-sha1  98c365e681f2c42a54d6277bea041d5a7104d934  ncdu-1.21.tar.gz
-sha256  a894d3a9b46bce578a6039bef48f54533ec402fb589b0769bfbb1d1edf9601a6  ncdu-1.21.tar.gz
+md5  46245039bd07a40d7594a2053139e43f  ncdu-1.22.tar.gz
+sha1  6c686e7cc08b20562e46c6bfb306c1e15cbf01aa  ncdu-1.22.tar.gz
+sha256  0ad6c096dc04d5120581104760c01b8f4e97d4191d6c9ef79654fa3c691a176b  ncdu-1.22.tar.gz
 
 # computed locally
 sha256  a324e25fe6af7fa45286b34a516b4c5a11544344bc80efb74fc51033b2e76df4  COPYING
diff --git a/package/ncdu/ncdu.mk b/package/ncdu/ncdu.mk
index c8c691605a..6da9966481 100644
--- a/package/ncdu/ncdu.mk
+++ b/package/ncdu/ncdu.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NCDU_VERSION = 1.21
+NCDU_VERSION = 1.22
 NCDU_SITE = https://dev.yorhel.nl/download
 
 NCDU_DEPENDENCIES = host-pkgconf ncurses
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
