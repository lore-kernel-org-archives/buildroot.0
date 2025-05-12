Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C91DC3ABDD
	for <buildroot@archiver.kernel.org>; Mon, 19 May 2025 10:58:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 18BD761775;
	Mon, 19 May 2025 10:58:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9jeysFJp56le; Mon, 19 May 2025 10:58:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BDC3261568
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id BDC3261568;
	Mon, 19 May 2025 10:58:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1E930E4
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:46:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7D23240D44
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:40:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qd0md2naTCY9 for <buildroot@buildroot.org>;
 Mon, 19 May 2025 10:40:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 75FFA414B8
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 75FFA414B8
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:40:01 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 667B6872E7; Mon, 19 May 2025 10:40:01 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 12 May 2025 17:26:43 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 7f5732a9a020df2cd4e5448a73f165a3b2154cf9
X-Git-Newrev: a2e074d023a9182f0dd532d99cbf06e95e0baac4
X-Patchwork-Hint: ignore
Message-Id: <20250519104001.667B6872E7@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/flac: bump to version
 1.5.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=a2e074d023a9182f0dd532d99cbf06e95e0baac4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

For change log, see:
https://github.com/xiph/flac/releases/tag/1.5.0

The license file COPYING.Xiph hash is updated, after a year update in:
https://github.com/xiph/flac/commit/6974998fd499d65d23e8d42a9c12b6ca04d2e10b

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/flac/flac.hash | 4 ++--
 package/flac/flac.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/flac/flac.hash b/package/flac/flac.hash
index 0013a7485a..9ac2d4799e 100644
--- a/package/flac/flac.hash
+++ b/package/flac/flac.hash
@@ -1,6 +1,6 @@
 # From https://ftp.osuosl.org/pub/xiph/releases/flac/SHA256SUMS.txt
-sha256  6c58e69cd22348f441b861092b825e591d0b822e106de6eb0ee4d05d27205b70  flac-1.4.3.tar.xz
+sha256  f2c1c76592a82ffff8413ba3c4a1299b6c7ab06c734dee03fd88630485c2b920  flac-1.5.0.tar.xz
 # Locally computed
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING.GPL
 sha256  5df07007198989c622f5d41de8d703e7bef3d0e79d62e24332ee739a452af62a  COPYING.LGPL
-sha256  12600ea1a7affcbf469bd0d8b2cd725e4167114a2ee834b88f5d2857bfd7ddbf  COPYING.Xiph
+sha256  7866ee98760fc1f0156b4fe6bf530257e02be487ab3fd94e2b63799dd32d6b2c  COPYING.Xiph
diff --git a/package/flac/flac.mk b/package/flac/flac.mk
index 6bac9ef8a7..e3c3da5375 100644
--- a/package/flac/flac.mk
+++ b/package/flac/flac.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FLAC_VERSION = 1.4.3
+FLAC_VERSION = 1.5.0
 FLAC_SITE = https://ftp.osuosl.org/pub/xiph/releases/flac
 FLAC_SOURCE = flac-$(FLAC_VERSION).tar.xz
 FLAC_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
