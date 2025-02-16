Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50671C02198
	for <buildroot@archiver.kernel.org>; Sun, 16 Feb 2025 13:05:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id ECC7C4145D;
	Sun, 16 Feb 2025 13:05:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Fe6OED4-k4Yj; Sun, 16 Feb 2025 13:05:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B07CC414C6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B07CC414C6;
	Sun, 16 Feb 2025 13:05:10 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 54A04C8
 for <buildroot@buildroot.org>; Sun, 16 Feb 2025 13:05:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4A05A60D80
 for <buildroot@buildroot.org>; Sun, 16 Feb 2025 13:05:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pxbpLCWewt7J for <buildroot@buildroot.org>;
 Sun, 16 Feb 2025 13:05:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 801E360BD3
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 801E360BD3
 for <buildroot@buildroot.org>; Sun, 16 Feb 2025 13:05:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 688B08762C; Sun, 16 Feb 2025 13:05:08 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sun, 16 Feb 2025 13:47:34 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7ba7da8f7d64ffb614d0c61c0e083159f06e4f6f
X-Git-Newrev: 9ee276732a776b540ac495ec46e8c27b28c856ef
X-Patchwork-Hint: ignore
Message-Id: <20250216130508.688B08762C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/erofs-utils: bump to version 1.8.5
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
Content-Type: multipart/mixed; boundary="===============7021396950170585543=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============7021396950170585543==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=9ee276732a776b540ac495ec46e8c27b28c856ef
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bump to latest maintenance release containing various fixes and performance
improvements, for details see the changelog:
https://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs-utils.git/tree/ChangeLog?h=v1.8.5

Signed-off-by: Jan Čermák <sairon@sairon.cz>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/erofs-utils/erofs-utils.hash | 2 +-
 package/erofs-utils/erofs-utils.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/erofs-utils/erofs-utils.hash b/package/erofs-utils/erofs-utils.hash
index 3b8a5dc3da..04bdd557f8 100644
--- a/package/erofs-utils/erofs-utils.hash
+++ b/package/erofs-utils/erofs-utils.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256  3c5cc03603ea08ba9ae5e0420eeaea5ff17ed29e2280685310356cbf25304e85  erofs-utils-1.8.3.tar.gz
+sha256  cd8611270e9c86fe062f647103ca6ada9ed710e4430fdd5960d514777919200d  erofs-utils-1.8.5.tar.gz
 sha256  0df042de29b44887355db86c79708a4489ce6e6666f6e33ad02040293f09e6a2  COPYING
 sha256  a400f85dd06d230f1b308cde4290a53f345b6e320a376b7904b31c51c2fd4b1a  LICENSES/Apache-2.0
 sha256  feee3b3157dcdf78d4f50edefbd5dd7adf8b6d52c11bfaaa746a85a373256713  LICENSES/GPL-2.0
diff --git a/package/erofs-utils/erofs-utils.mk b/package/erofs-utils/erofs-utils.mk
index 930b40f6f1..bfdcfe58eb 100644
--- a/package/erofs-utils/erofs-utils.mk
+++ b/package/erofs-utils/erofs-utils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-EROFS_UTILS_VERSION = 1.8.3
+EROFS_UTILS_VERSION = 1.8.5
 EROFS_UTILS_SITE = https://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs-utils.git/snapshot
 EROFS_UTILS_LICENSE = GPL-2.0+, GPL-2.0+ or Apache-2.0 (liberofs)
 EROFS_UTILS_LICENSE_FILES = COPYING LICENSES/Apache-2.0 LICENSES/GPL-2.0

--===============7021396950170585543==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7021396950170585543==--
